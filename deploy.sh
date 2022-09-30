#!/usr/bin/env bash
set -o errexit #abort if any command fails
me=$(basename "$0")

help_message="\
Usage: $me [-c FILE] [<options>]
Deploy generated files to a git branch.

Options:

  -h, --help               Show this help information.
  -v, --verbose            Increase verbosity. Useful for debugging.
  -e, --allow-empty        Allow deployment of an empty directory.
  -m, --message MESSAGE    Specify the message used when committing on the
                           deploy branch.
  -n, --no-hash            Don't append the source commit's hash to the deploy
                           commit's message.
      --source-only        Only build but not push
      --push-only          Only push but not build
"


run_build() {
  if [[ $version = dm ]]; then
    build_dir=$build_directory/dm/v1/$language
  elif [[ $version = coin ]]; then
    build_dir=$build_directory/coin_margined_swap/v1/$language
  elif [[ $version = usdt ]]; then
    build_dir=$build_directory/usdt_swap/v1/$language
#  elif [[ $version = option ]]; then
#    build_dir=$build_directory/option/v1/$language
  else
    version="v"${version}
    build_dir=$build_directory/spot/$version/$language
  fi
  echo "build_dir="$build_dir
  bundle exec middleman build --clean --build-dir $build_dir

  incremental_deploy
}

parse_args() {
  # Set args from a local environment file.
  if [ -e ".env" ]; then
    source .env
  fi
  #
  #check_version_lang
  # Parse arg flags
  # If something is exposed as an environment variable, set/overwrite it
  # here. Otherwise, set/overwrite the internal variable instead.
  while : ; do
    if [[ $1 = "-h" || $1 = "--help" ]]; then
      echo "$help_message"
      return 0
    elif [[ $1 = "-v" || $1 = "--verbose" ]]; then
      verbose=true
      shift
    elif [[ $1 = "-e" || $1 = "--allow-empty" ]]; then
      allow_empty=true
      shift
    elif [[ ( $1 = "-m" || $1 = "--message" ) && -n $2 ]]; then
      commit_message=$2
      shift 2
    elif [[ $1 = "-n" || $1 = "--no-hash" ]]; then
      GIT_DEPLOY_APPEND_HASH=false
      shift
    elif [[ $1 = "--source-only" ]]; then
      source_only=true
      shift
    elif [[ $1 = "--push-only" ]]; then
      push_only=true
      shift
    else
      break
    fi
  done

  # Set internal option vars from the environment and arg flags. All internal
  # vars should be declared here, with sane defaults if applicable.
  # Source directory & target branch.
  build_directory=build
  gh_pages_directory=gh-pages
  deploy_branch=gh-pages

  #if no user identity is already set in the current git environment, use this:
  default_username=${GIT_DEPLOY_USERNAME:-deploy.sh}
  default_email=${GIT_DEPLOY_EMAIL:-}

  #repository to deploy to. must be readable and writable.
  repo=origin

  #append commit hash to the end of message by default
  append_hash=${GIT_DEPLOY_APPEND_HASH:-true}
}

check_version_lang() {
  #
  branch=$(git describe --contains --all HEAD)
  echo "branch="$branch""
  #
  language=$(echo $branch | rev | cut -d '_' -f 1 | rev)
  version=$(echo $branch | cut -d '_' -f 1)

  if [[ $version =~ ^v[0-9]$ ]] ; then
    version=${version:1}
  else
    version=${version}
  fi
  #
  echo "language="$language""
  echo "version="$version""

}

main() {
  enable_expanded_output

  if ! git diff --exit-code --quiet --cached; then
    echo Aborting due to uncommitted changes in the index >&2
    return 1
  fi

  commit_title=`git log -n 1 --format="%s" HEAD`
  commit_hash=` git log -n 1 --format="%H" HEAD`

  #default commit message uses last title if a custom one is not supplied
  if [[ -z $commit_message ]]; then
    commit_message="publish: $commit_title"
  fi

  #append hash to commit message unless no hash flag was found
  if [ $append_hash = true ]; then
    commit_message="$commit_message"$'\n\n'"generated from commit $commit_hash"
  fi

  previous_branch=`git rev-parse --abbrev-ref HEAD`

  if [ ! -d "$build_directory" ]; then
    echo "Build directory '$build_directory' does not exist. Aborting." >&2
    return 1
  fi

  # must use short form of flag in ls for compatibility with macOS and BSD
  if [[ -z `ls -A "$build_directory" 2> /dev/null` && -z $allow_empty ]]; then
    echo "Build directory '$build_directory' is empty. Aborting. If you're sure you want to deploy an empty tree, use the --allow-empty / -e flag." >&2
    return 1
  fi

  if [ ! -d $gh_pages_directory ]; then
      echo "./gh-pages doesn't exist. Creating now"
      mkdir ./$gh_pages_directory
      echo "./gh-pages created"
  else
      echo "./gh-pages exists"
  fi

  # if git ls-remote --exit-code $repo "refs/heads/$deploy_branch" ; then
  #   # deploy_branch exists in $repo; make sure we have the latest version

  #   disable_expanded_output
  #   git fetch --force $repo $deploy_branch:$deploy_branch
  #   enable_expanded_output
  # fi

  # check if deploy_branch exists locally
  if git show-ref --verify --quiet "refs/heads/$deploy_branch"; then
    if git ls-remote --exit-code $repo "refs/heads/$deploy_branch" ; then
      # deploy_branch exists in $repo; make sure we have the latest version

      disable_expanded_output
      git fetch --force $repo $deploy_branch:$deploy_branch
      enable_expanded_output
    fi
    incremental_deploy
  else initial_deploy
  fi

  restore_head
}

handle_deploy_files() {
  if [ -d "$gh_pages_directory/$version/$language" ]; then
    rm -rf $gh_pages_directory/$version/$language
  fi
  cp -r $build_directory/* $gh_pages_directory
}

check_diff() {
  set +o errexit
  diff=$(git --work-tree "$gh_pages_directory" diff --exit-code --quiet HEAD --)$?
  set -o errexit
  case $diff in
    0) echo No changes to files in $build_directory. Skipping commit.;;
    1) commit+push;;
    *)
      echo git diff exited with code $diff. Aborting. Staying on branch $deploy_branch so you can debug. To switch back to master, use: git symbolic-ref HEAD refs/heads/master && git reset --mixed >&2
      return $diff
      ;;
  esac
}

initial_deploy() {
  echo "initial_deploy..."
  git fetch origin $deploy_branch
  git --work-tree "$gh_pages_directory" fetch --force $repo $deploy_branch:$deploy_branch
  git --work-tree "$gh_pages_directory" checkout $deploy_branch
  handle_deploy_files
  git --work-tree "$gh_pages_directory" add --all
  check_diff
}

incremental_deploy() {
  echo "incremental_deploy..."
  #make deploy_branch the current branch
  git symbolic-ref HEAD refs/heads/$deploy_branch
  #put the previously committed contents of deploy_branch into the index
  git --work-tree "$gh_pages_directory" reset --mixed --quiet
  handle_deploy_files
  #git --work-tree "$gh_pages_directory" add --all
  #check_diff
}

commit+push() {
  set_user_id
  git --work-tree "$gh_pages_directory" commit -m "$commit_message"

  disable_expanded_output
  #--quiet is important here to avoid outputting the repo URL, which may contain a secret token
  if [ $GH_TOKEN ]; then
    # deploy by Travis CI
    # add github token
    repo="https://"$GH_TOKEN"@github.com/huobiapi/docs.git"
    git remote add origin-pages $repo
    git push --quiet origin-pages $deploy_branch
  else
    # manual deploy
    git push --quiet $repo $deploy_branch
  fi
  enable_expanded_output
}

#echo expanded commands as they are executed (for debugging)
enable_expanded_output() {
  if [ $verbose ]; then
    set -o xtrace
    set +o verbose
  fi
}

#this is used to avoid outputting the repo URL, which may contain a secret token
disable_expanded_output() {
  if [ $verbose ]; then
    set +o xtrace
    set -o verbose
  fi
}

set_user_id() {
  if [[ -z `git config user.name` ]]; then
    git config user.name "$default_username"
  fi
  if [[ -z `git config user.email` ]]; then
    git config user.email "$default_email"
  fi
}

restore_head() {
  if [[ $previous_branch = "HEAD" ]]; then
    #we weren't on any branch before, so just set HEAD back to the commit it was on
    git update-ref --no-deref HEAD $commit_hash $deploy_branch
  else
    git symbolic-ref HEAD refs/heads/$previous_branch
  fi

  git reset --mixed
}

filter() {
  sed -e "s|$repo|\$repo|g"
}

sanitize() {
  "$@" 2> >(filter 1>&2) | filter
}

parse_args "$@"

if [[ -n "$source_only" ]]; then
  echo "source only"
  run_build
elif [[ -n "$push_only" ]]; then
  echo "push only"
  main
else
  echo "source and push"
  run_build
  main
fi


