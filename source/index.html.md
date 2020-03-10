---
title: Huobi API Reference v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Change Log

| Release Time (Singapore Time UTC +8) | API | New / Update | Description |
|-----|-----|-----|-----|
|2020.3.5 19:00|`GET /v1/fee/fee-rate/get`|Delete|Removed the endpoint|
| 2020.3.2 11:00 | `GET https://status.huobigroup.com/api/v2/summary.json` | New | Added "Get system status" endpoint |
| 2020.2.28 11:00 | `GET /v1/cross-margin/loan-orders`,<br>`GET /v1/cross-margin/accounts/balance` | Update | Added new optional request parameter |
| 2020.2.28 11:00 | `GET /v1/subuser/aggregate-balance`,<br>`GET /v1/account/accounts/{sub-uid}` | Update | Added new enum value to account type |
| 2020.2.28 11:00 | `POST /v1/cross-margin/transfer-in`,<br>`POST /v1/cross-margin/transfer-out`,<br>`GET /v1/cross-margin/loan-info`,<br>`POST /v1/cross-margin/orders`,<br>`POST /v1/cross-margin/orders/{order-id}/repay`,<br>`GET /v1/cross-margin/loan-orders`,<br>`GET /v1/cross-margin/accounts/balance`| Update |  Authorised sub user's access is allowed |
| 2020.2.5 19:00 | `GET /v1/order/orders/{order-id}`,<br>`GET /v1/order/orders/getClientOrder`,<br>`GET /v1/order/openOrders`,<br>`GET /v1/order/orders`,<br>`GET /v1/order/history` | Update | Added new field "client-order-id" in response message |
| 2020.2.5 19:00 | `GET /v1/order/orders` | Update | Added new request field "start-time"/"end-time". |
| 2020.2.3 19:00 | `GET /v2/reference/transact-fee-rate` | New | Added new endpoint for transaction fee rate querying |
| 2020.2.3 19:00 | `GET /v2/reference/currencies` | Update | Added new field for base chain information |
| 2020.2.3 19:00 | `GET /v1/margin/loan-info` | Update | Added new field for actual interest rate post deduction |
| 2020.1.10 19:00 | `GET /v1/cross-margin/loan-info` | Update | Added new field for actual interest rate post deduction |
| 2020.1.7 19:00 | `GET /v1/account/history` | Update | Allowed sub user to call this endpoint |
| 2019.12.27 19:00 | `POST /v2/sub-user/management` | New | Added "Lock/Unlock Sub User" endpoint |
| 2019.12.27 19:00 | `POST /v1/order/orders/batchcancel` | Update | Support cancel based on client order id |
| 2019.12.27 19:00 | `POST /v1/order/batch-orders` | New | Added creating batch orders endpoint |
|2019.12.23 15:00| `market.$symbol.mbp.$levels` |New|Added MBP subscription topic|
|2019.12.05 11:00| `trade.clearing#${symbol}` & `accounts.update#${mode}`  |New|Added new subscription topic for trade updates and account change updates|
| 2019.11.22 15:00 | `GET /v1/order/orders`<br />`GET /v1/order/history` | Update | The query time range of canceled order is shortened to the last 1 day |
| 2019.11.13 19:00 | `GET /v1/margin/loan-info`<br />`GET /v1/cross-margin/loan-info` | New | Added loan interest and amount query |
|2019.11.08 19:45| `GET /v1/order/orders/{order-id}/matchresult`<br />`GET /v1/order/matchresults` |New|Added response field `trade-id`|
|2019.10.18 19:00| `GET /v1/account/history` |New|Added account history querying|
|2019.10.12 11:00| `POST /v1/dw/withdraw/api/create` |Update|Adjusted ERC20 as default chain for USDT|
|2019.10.11 10:00| Cross margin related |New|Added cross margin trading|
|2019.10.09 20:00| `GET /market/trade`<br />`GET /market/history/trade`<br />`market.$symbol.trade.detail` |Update|Added new response field "trade id"|
|2019.09.25 20:00| `GET /v2/account/withdraw/quota` |New|Added withdraw quota querying|
|2019.09.23 15:00| `POST /v1/order/orders/{order-id}/submitcancel`<br />`POST /v1/order/orders/batchcancel` |Update|Optimized error message|
|2019.09.20 10:00| `GET /v2/reference/currencies` |New|Added querying reference information of currency and chains|
|2019.09.19 16:00| `market.$symbol.bbo` |New|Added  best bid/offer update in tick by tick mode|
|2019.09.18 20:00| `GET /v1/subuser/aggregate-balance`<br />`GET /v1/account/accounts/{sub-uid}`<br />`GET /v1/margin/loan-orders`<br />`GET /v1/margin/accounts/balance` |New|Added sub account isolated margin trading|
|2019.09.16 15:00| `GET /v2/account/deposit/address` |New|Added deposit address querying|
|2019.09.11 17:00| `GET v1/stable-coin/quote`<br />`POST v1/stable-coin/exchange` |New|Added stable coin exchange|
|2019.09.11 16:00| N/A |Delete|Removed part of code demo.|
|2019.09.10 10:00| Order related API Except `POST /v1/order/orders/submitCancelClientOrder` & `GET /v1/order/openOrders` |Update|Removed order state values `submitting` and `cancelling`|
|2019.09.09 11:00| `POST /v1/order/orders/submitCancelClientOrder` |Update|Revised response message detail|
|2019.09.09 10:00| `GET /v1/order/orders`<br />`GET /v1/order/matchresults` |Update|Revised description of default value and value range for "start-date" and "end-date"|
|2019.09.02 18:00| `POST /v1/order/orders/batchCancelOpenOrders` |Update|Revised description of request field `symbol` |
|2019.09.02 16:00|"Stable Coin Exchange" related |Delete|Deleted "Stable Coin Exchange" relavant API|
|2019.08.29 21:00| Order related|New|Add stop-limit order classification|
|2019.08.21 18:00| `GET /v1/order/openOrders` |Update|Corrected query parameters|
|2019.08.05 18:00| `orders.$symbol.update` |New|Added new fileds "client-order-id" and "order-type"。|
|2019.08.02 18:00| `orders.$symbol.update` |Update|Revised the description of field "unfilled-amount"|
|2019.07.23 21:00| `GET /v1/order/orders/{order-id}/matchresult`<br />`GET /v1/order/matchresults` |New|Added transaction fee deduction details|
|2019.07.23 20:00| `GET /v1/fee/fee-rate/get` |New|Added transaction fee rate |
|2019.07.22 12:00| `GET /v1/order/orders/{order-id}/matchresults`<br />`GET /v1/order/matchresults` |New|Added new fields `role` to indicate the order was "taker" or "maker"|
|2019.07.11 20:00| `POST /v1/order/orders/place`<br />`POST /v1/order/orders/submitCancelClientOrder`<br />`GET /v1/order/orders/getClientOrder` |Update<br />New|Support client order ID。|
|2019.07.08 12:00| Websocket Asset and order topics|Update|Enhanced Websocket heartbeat and rate limit|
|2019.06.14 16:00| `POST /v1/dw/withdraw/api/create` |Update|support 'fast withdraw' |
|2019.06.17 16:00| `GET /v1/stable_coin/exchange_rate`<br />`POST /v1/stable_coin/exchange` |New| Support user query Stable Coin exchange rate, and perform exchange |
|2019.06.12 16:00| `GET /v1/common/symbols` |Update|Add more reference information of a symbol|
|2019.06.06 18:00| `GET /v1/query/deposit-withdraw` |Update|Ehanced the request parameters|
|2019.06.05 20:00| All APIs that need authentication|Update|Set up 3 permission for API Key: Read, Trade and Withdraw|
|2019.06.10 00:00| `GET /v1/order/orders`<br />`GET /v1/order/matchresults` |Update|Adjusted query window as 48 hours|
|2019.05.15 10:00| `POST /v1/futures/transfer` |New|Allow a user to tranfer fund between spot account and future contract account.|
|2019.04.29 19:00| `GET /v1/order/history` |New|Support historical order querying within 48 hours. With the launching of this new endpoint, the existing REST endpoint “v1/order/orders” will be kept in service. However, the new endpoint “/v1/order/history” will have better service level than the “/v1/order/orders”, especially when the service loading exceeds the threshold of our system, which means in some extremely cases, “v1/order/orders” would become unavailable, but “/v1/order/history” would be kept alive. Meanwhile, Huobi is planning to have a delegated data service to support users’ demands on long-term history data. Once this new service become available, the “v1/order/orders” will be deprecated. We will keep you informed promptly once the timeline determined.|
|2019.04.17 10:00| `GET /v1/order/orders` |Update|Add clarification on the value range for start-date in documents|
| 2019.04.16 10:00 | `GET /v1/order/openOrders` |Update| Correct the documents error. Both account-id and symbol are required |
| 2019.01.17 07:00 | Websocket accounts           |Update| Add subscription parameter model<br>Subscription does not return frozen balance of sub-user anymore |
| 2018.07.10 11:00 | `GET /market/history/kline`  |Update| The size parameter value range changes from [1-1000] to [1-2000]|
| 2018.07.06 16:00 | `POST /v1/order/orders/place` |Update| Added buy-limit-maker and sell-limit-maker order types|
| 2018.07.06 16:00 | `GET /v1/order/openOrders`<br>`POST /v1/order/orders/batchCancelOpenOrders` | New | Added open orders query<br />Added batch cancel open orders |
| 2018.07.02 16:00 | ETF related | New | Support transfer in/out of HB10.|
| 2018.06.20 16:00 | `GET /market/tickers` | New | Added tickers query |

# Introduction

## API Introduction

Welcome to Huobi API！  

This is the official Huobi API document, and will be continue updating, please follow us to get latest news.

You can switch to different API business in the top menu, and switch to different language by clicking the button in the top right.

The example of request and response is showing in the right hand side.

## Market Maker Program

It is very welcome for market maker who has good market making strategy and large trading volume. If your Huobi Spot account or Contract account has at least 10 BTC, you can send your email to:

- [MM_service@huobi.com](mailto:MM_service@huobi.com) for Huobi Global (spot / leverage) market maker
- [dm_mm@huobi.com](mailto:dm_mm@huobi.com) for Huobi Contract market maker

And provide below details:

1. UID (not linked to any rebate program in any accounts)
2. Screenshot of trading volume in other transaction platform (such as trading volume within 30 days, or VIP status)
3. A brief description of your market-making strategy 

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotion.
</aside>

## Subscription

Huobi will publish API announcement in advance for any API change, please subscribe our announcements so that you can get latest update. 

You can click <a href='https://huobiglobal.zendesk.com/hc/en-us/sections/360000070201-API-Announcements'>Here</a> to subscribe the announcements. 

How to subscribe: Login to API Announcements page, click "Follow" button in the top right of the page, then choose the type you want to follow. After you subscribe, the button will changed to "Following". If you don't have any account, you need to register first. 

## Contact Us

If you have any other questions on API, you can contact us by below ways:

- Join official QQ group (火币网API交流群a, 1045069901). Please tell your UID and programming language in your join request, and you can join the group after the group administrator has approved it.
- Send email to api_service@huobi.com.

# Quick Start

## Preparation

Before you use API, you need to login the website to create API Key with proper permissions.

You can manage your API Key <a href='https://www.hbg.com/zh-cn/apikey/'>here</a>.

Every user can create at most 5 API Key, each of them has three permissions:

- Read permission: It is used to query the data, such as order query, trade query.
- Trade permission: It is used to create order, cancel order and transfer, etc.
- Withdraw permission: It is used to create withdraw order, cancel withdraw order, etc.

Please remember below information after creation:

- `Access Key`  It is used in API request
  
- `Secret Key`  It is used to generate the signature (only visible once after creation)

<aside class="notice">
The API Key can bind one or more IP addresses, we strongly suggest you bind IP address for security purpose. The API Key without IP binding will be expired after 90 days.
</aside>
<aside class="warning">
<red><b>Warning</b></red>: These two keys are important to your account safety, please don't share <b>both</b> of them together to anyone else. If you find your API Key is disposed, please remove it immediately.
</aside> 

## SDK and Demo

**SDK (Suggested)**

[Java](https://github.com/huobiapi/huobi_Java) | [Python3](https://github.com/huobiapi/huobi_Python) | [C++](https://github.com/huobiapi/huobi_Cpp) | [C#](https://github.com/HuobiRDCenter/huobi_CSharp)

**其它代码示例**

[https://github.com/huobiapi?tab=repositories](https://github.com/huobiapi?tab=repositories)

## Huobi Testnet

Since the effective day of this notification, Huobi Global will launch a new test environment dedicated for external user’s testing – Huobi Testnet.

API users will be able to practice Huobi API there, before stepping into real trading. API users should be also able to trial some new features before they going live, through Huobi Testnet.

At this stage, only spot market trading is available on Huobi Testnet. Isolated margin, cross margin, stable coin exchange, and ETF trading are gradually opening.

Based on customer needs and necessities, some new API features would be possibly made available on Huobi Testnet first before going live. API users could be notified with the new feature details, trail period, and official launch date, etc., by subscribing to <a href='https://huobiglobal.zendesk.com/hc/en-us/sections/360000070201-API-Announcements'>Huobi API announcement</a>.

Huobi Testnet Access URLs

Restful

`http://api.testnet.huobi.pro`

Websocket

`wss://api.testnet.huobi.pro/ws/v1`

User registration and API key creation can be achieved via <a href='https://www.testnet.huobi.pro/en-us/'>www.testnet.huobi.pro</a>, And at this stage, sub user creation is not allowed yet.

For the test coins required by the test environment exchange, you need to register an account and send an email to `api_service@hoobi.com` for application. Let you independently apply for the test coins through the page, which is under development and about to go online, please look forward to it.

For detailed registration and application process at this stage, you may refer to <a href='https://github.com/huobiapi/testnet/blob/master/User%20Guide/Huobi%20Testnet%20API%20user%20manual.pdf.zip'>here</a>.

All public APIs (including reference information and market feeds) are accessible on Huobi Testnet, but only following private APIs are currently available there -

|API|Description
|----------------------|---------------------
|[GET /v1/account/accounts](#get-all-accounts-of-the-current-user)  |Get all Accounts of the Current User|
|[GET /v1/account/accounts/{account-id}/balance](#get-account-balance-of-a-specific-account)  |Get Account Balance of a Specific Account|
|[GET /v1/account/history](#get-account-history)  |Get Account History|
|[POST /v1/order/orders/place](#place-a-new-order)  |Place a New Order|
|[POST /v1/order/batch-orders](#place-a-batch-of-orders)  |Place a Batch of Orders|
|[POST /v1/order/orders/{order-id}/submitcancel](#submit-cancel-for-an-order)  |Submit Cancel for an Order|
|[POST /v1/order/orders/submitCancelClientOrder](#submit-cancel-for-an-order-based-on-client-order-id)   |Submit Cancel for an Order (based on client order ID)|
|[POST /v1/order/orders/batchcancel](#submit-cancel-for-multiple-orders-by-ids)  |Submit Cancel for Multiple Orders by IDs|
|[POST /v1/order/orders/batchCancelOpenOrders](#submit-cancel-for-multiple-orders-by-criteria)  |Submit Cancel for Multiple Orders by Criteria|
|[GET /v1/order/openOrders](#get-all-open-orders)  |Get All Open Orders|
|[GET /v1/order/orders/{order-id}](#get-the-order-detail-of-an-order)  |Get the Order Detail of an Order|
|[GET /v1/order/orders/getClientOrder](#get-the-order-detail-of-an-order-based-on-client-order-id)  |Get the Order Detail of an Order (based on client order ID)|
|[GET /v1/order/orders/{order-id}/matchresults](#get-the-match-result-of-an-order)|Get the Match Result of an Order|
|[GET /v1/order/orders](#search-past-orders)  |Search Past Orders|
|[GET /v1/order/history](#search-historical-orders-within-48-hours)  |Search Historical Orders within 48 Hours|
|[GET /v1/order/matchresults](#search-match-results)  |Search Match Results|
|[accounts](#subscribe-to-account-updates)|Subscribe to Account Updates|
|[orders.$symbol](#subscribe-to-order-updates)|Subscribe to Order Updates|
|[orders.$symbol.update](#subscribe-to-order-updates-new)|Subscribe to Order Updates (NEW)|
|[accounts.list](#request-account-details)|Request Account Details|
|[order.list](#search-past-orders-2)|Search Past Orders|
|[orders.detail](#query-order-by-order-id)|Query Order by Order ID|
|[trade.clearing#${symbol}](#subscribe-trade-details-post-clearing)|Subscribe Trade Details post Clearing|
|[accounts.update#${mode}](#subscribe-account-change)|Subscribe Account Change|

<aside class="notice">
All other APIs are inaccessible on Huobi Testnet and will return “error-code 403” if requested.。
</aside>

## Interface Type

There are two types of interface, you can choose the proper one according to your scenario and preferences.

### REST API

REST (Representational State Transfer) is one of the most popular communication mechanism under HTTP, each URL represents a type of resource.

It is suggested to use Rest API for one-off operation, like trading and withdraw.

### WebSocket API

WebSocket is a new protocol in HTML5. It is full-duplex between client and server. The connection can be established by a single handshake, and then server can push the notification to client actively.

It is suggest to use WebSocket API to get data update, like market data and order update.

**Authentication**

Both API has two levels of authentication:

Public API: It is for basic information and market data. It doesn't need authentication.

Private API: It is for account related operation like trading and account management. Each private API must be authenticated with API Key.

## Access URLs
You can compare the network latency between two domain <u>api.huobi.pro</u> and <u>api-aws.huobi.pro</u>, and then choose the better one for you.

In general, the domain <u>api-aws.huobi.pro</u> is optimized for AWS client, the latency will be lower.

**REST API**

**`https://api.huobi.pro`**  

**`https://api-aws.huobi.pro`**  

**Websocket Feed (market)**

**`wss://api.huobi.pro/ws`**  

**`wss://api-aws.huobi.pro/ws`**  

**Websocket Feed (account and order)**

**`wss://api.huobi.pro/ws/v1`**  

**`wss://api-aws.huobi.pro/ws/v1`**     

<aside class="notice">
Please initiate API calls with non-China IP.
</aside>
<aside class="notice">
It is not recommended to use proxy to access Huobi API because it will introduce high latency and low stability.
</aside>
<aside class="notice">
It is recommended to access Huobi API from AWS Japan for better stability. If your server is in China mainland, it may be not stable.
</aside> 

## Authentication

### Overview

The API request may be tampered during internet, therefore all private API must be signed by your API Key (Secrete Key).

Each API Key has permission property, please check the API permission, and make sure your API key has proper permission.

A valid request consists of below parts:

- API Path: for example <u>api.huobi.pro/v1/order/orders</u>
- API Access Key: The 'Access Key' in your API Key
- Signature Method: The Hash method that is used to sign, it uses **HmacSHA256**
- Signature Version: The version for the signature protocol, it uses **2**
- Timestamp: The UTC time when the request is sent, e.g. 2017-05-11T16:22:06. It is useful to prevent the request to be intercepted by third-party.
- Parameters: Each API Method has a group of parameters, you can refer to detailed document for each of them. 
  - For GET request, all the parameters must be signed.
  - For POST request, the parameters needn't be signed and they should be put in request body.
- Signature: The value after signed, it is guarantee the signature is valid and the request is not be tempered.

### Signature Method

The signature may be different if the request text is different, therefore the request should be normalized before signing. Below signing steps take the order query as an example:

This is a full URL to query one order:

`https://api.huobi.pro/v1/order/orders?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

#### 1. The request Method (GET or POST), append line break “\n”


`GET\n`

#### 2. The host with lower case, append line break “\n”

`
api.huobi.pro\n
`

#### 3. The path, append line break “\n”

`
/v1/order/orders\n
`

#### 4. The parameters are URL encoded, and ordered based on ASCII

For example below is the original parameters:

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
Use UTF-8 encoding and URL encoded, the hex must be upper case. For example, The semicolon ':' should be encoded as '%3A', The space should be encoded as '%20'.
</aside>
<aside class="notice">
The 'timestamp' should be formated as 'YYYY-MM-DDThh:mm:ss' and URL encoded.
</aside>

Then above parameter should be ordered like below:


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

#### 5. Use char  “&” to concatenate all parameters


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`

#### 6. Assemble the pre-signed text

`GET\n`

`api.huobi.pro\n`

`/v1/order/orders\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`


#### 7. Use the pre-signed text and your Secret Key to generate a signature

- Use the pre-signed text in above step and your API Secret Key to generate hash code by HmacSHA256 hash function.
- Encode the hash code with base-64 to generate the signature.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

#### 8. Put the signature into request URL

- Put all the parameters in the URL
- Append the signature in the URL, with parameter name “Signature”.

Finally, the request sent to API should be:

`https://api.huobi.pro/v1/order/orders?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

## Sub User

Sub user can be used to isolate the assets and trade, the assets can be transferred between parent and sub users. Sub user can only trade with the sub user. The assets can not be transferred between sub users, only parent user has the transfer permission.  

Sub user has independent login password and API Key, they are managed under parent user in website.

Each parent user can create **200** sub user, each sub user can create at most **5** API Key, each API key can have two permissions: **read** and **trade**.

The sub user API Key can also bind IP address, the expiry policy is the same with parent user.

You can access <a href='https://account.hbg.com/en-us/subaccount/management'>here</a> to create and manage sub user.

The sub user can access all public API (including basic information and market data), below are the private APIs that sub user can access:

API|Description
----------------------|---------------------
[POST /v1/order/orders/place](#fd6ce2a756)	|Create and execute an order
[POST /v1/order/orders/{order-id}/submitcancel](#4e53c0fccd)	|Cancel an order
[POST /v1/order/orders/submitCancelClientOrder](#submit-cancel-for-an-order-based-on-client-order-id)	| Cancel an Order based on client order ID
[POST /v1/order/orders/batchcancel](#ad00632ed5)	|Cancel multiple orders
[POST /v1/order/orders/batchCancelOpenOrders](#open-orders)	|Cancel the open orders
[GET /v1/order/orders/{order-id}](#92d59b6aad)	|Query a specific order
[GET /v1/order/orders](#d72a5b49e7)	|Query orders with criteria
[GET /v1/order/openOrders](#95f2078356)	|Query open orders
[GET /v1/order/matchresults](#0fa6055598)	|Query the order matching result
[GET /v1/order/orders/{order-id}/matchresults](#56c6c47284)	|Query a specific order matching result
[GET /v1/account/accounts](#bd9157656f)	|Query all accounts in current user
[GET /v1/account/accounts/{account-id}/balance](#870c0ab88b)	|Query the specific account balance
[POST /v1/futures/transfer](#e227a2a3e8)	|Transfer with future account
[POST /v1/dw/transfer-in/margin](#0d3c2e7382)|Transfer from spot to margin account
[POST /v1/dw/transfer-out/margin](#0d3c2e7382)|Transfer from margin to spot account
[POST /v1/margin/orders](#48cca1ce88)|Request margin loan
[POST /v1/margin/orders/{order-id}/repay](#48aa7c8199)|Repay the debit for specific order
[GET /v1/margin/loan-orders](#e52396720a)|Query history loan orders
[GET /v1/margin/accounts/balance](#6e79ba8e80)|Query margin account balance
[GET /v1/account/history](#84f1b5486d)|Query account ledger
[POST /v1/cross-margin/transfer-in](#transfer-asset-from-spot-trading-account-to-cross-margin-account)|Transfer Asset from Spot Trading Account to Cross Margin Account|
[POST /v1/cross-margin/transfer-out](#transfer-asset-from-cross-margin-account-to-spot-trading-account)|Transfer Asset from Cross Margin Account to Spot Trading Account|
[GET /v1/cross-margin/loan-info](#get-loan-interest-rate-and-quota-2)|Get Loan Interest Rate and Quota|
[POST /v1/cross-margin/orders](#request-a-margin-loan-2)|Request a Margin Loan|
[POST /v1/cross-margin/orders/{order-id}/repay](#repay-margin-loan-2)|Repay Margin Loan|
[GET /v1/cross-margin/loan-orders](#search-past-margin-orders-2)|Search Past Margin Orders|
[GET /v1/cross-margin/accounts/balance](#get-the-balance-of-the-margin-loan-account-2)|Get the Balance of the Margin Loan Account|

<aside class="notice">
All other APIs couldn't be accessed by sub user, otherwise the API will return “error-code 403”。
</aside>

## Glossary

### Trading symbols

The trading symbols are consist of base currency and quote currency. Take the symbol `BTC/USDT` as an example, `BTC` is the base currency, and `USDT` is the quote currency.  

### Account

The `account-id` defines the Identity for different business type, it can be retrieved from API `/v1/account/accounts` , where the `account-type` is the business types.
The types include:

* spot: Spot account
* otc: OTC account
* margin: Isolated margin account, the detailed currency type is defined in `subType`
* super-margin / cross-margin:  Cross-margin account
* point: Point card account
* minepool: Minepool account
* etf: ETF account

### Identity

The frequently used Identities are listed below:

* order-id: The unique identity for order.
* client-order-id: The identity that defined by client. This id is included in order creation request, and will be returned as order-id. This id is valid within 24 hours.
* match-id : The identity for order matching.
* trade-id : The unique identity for the trade.

### Order Type
The order type is consist of trade direction and order classification. Take `buy-market` as an example, the trade direction is `buy`, the operation type is `market`.  

Trade direction includes:

* buy
* sell  

Order classification includes:

* limit: Both of the price and amount should be specified in order creation request.
* market : The price is not required in order creation request, you only need to specify either money or amount. The matching and trade will happen automatically according to the request.
* limit-maker: The price is specified in order creation request as market maker. It will not be matched in the matching queue.
* ioc: ioc stands for "immediately or cancel", it means the order will be canceled if it couldn't be matched. If the order is partially traded, the remaining part will be canceled.
* stop-limit: The price in order creation request is the trigger price. The order will be put into matching queue only when the market price reaches the trigger price.

### Order Status

* submitted: The order is submitted, and already in the matching queue, waiting for deal.
* partial-filled: The order is already in the matching queue and partially traded, and is waiting for further matching and trade.
* filled: The order is already traded and not in the matching queue any more.
* partial-canceled: The order is not in the matching queue any more. The status is transferred from 'partial-filled', the order is partially trade, but remaining is canceled.
* canceled: The order is not in the matching queue any more, and completely canceled. There is no trade associated with this order.
* canceling: The order is under canceling, but haven't been removed from matching queue yet.

You can refer to <a href='https://www.huobi.com/en-us/guide/'>Huobi Course</a> to get detailed information

# API Access

## Overview

Category| URL Path | Description 
--------- | --------- | -----------
Common |/v1/common/* | Common interface, including currency, currency pair, timestamp, etc 
Market Data |/market/*| Market data interface, including trading, depth, quotation, etc 
Account |/v1/account/*  /v1/subuser/* | Account interface, including account information, sub-user ,etc 
Order |/v1/order/* | Order interface, including order creation, cancellation, query, etc 
Margin|/v1/margin/* | Margin interface, including debit, payment, query, etc 
Cross Margin| /v1/cross-margin/* | Cross margin interface, including debit, payment, query, etc 

Above is a general category, it doesn't cover all API, you can refer to detailed API document according to your requirement.

## Rate Limiting Rule

* Each API Key is limited to 10 times per second
* If API Key is empty in request, then each IP is limited to 10 times per second

For example

* Order interface is limited by API Key: no more than 10 times within 1 sec
* Market data interface is limited by IP: no more than 10 times within 1 sec

## Request Format

The API is restful and there are two method: GET and POST.

* GET request: All parameters are included in URL
* POST request: All parameters are formatted as JSON and put int the request body

## Response Format

The response is JSON format.There are four fields in the top level: `status`, `ch`, `ts` and `data`. The first three fields indicate the general status, the business data is is under `data` field.

Below is an example of response:

```json
{
  "status": "ok",
  "ch": "market.btcusdt.kline.1day",
  "ts": 1499223904680,
  "data": // per API response data in nested JSON object
}
```

Field| Data Type | Description 
--------- | --------- | -----------
status    | string    | Status of API response 
ch        | string    | The data stream. It may be empty as some API doesn't have data stream 
ts        | int       | The UTC timestamp when API respond, the unit is millisecond 
data      | object    | The body data in response 

## Error Message

### Market Data  API Error Message

| Error Message | Description |
|-----|-----|
| bad-request | The request is wrong |
| invalid-parameter | The parameter is invalid |
| invalid-command | The command is invalid |
### Order API Error Message

| Error Message | Description |
|-----|-----|
| base-symbol-error | Trade pair doesn't exist |
| base-currency-error | Currency doesn't exist |
| base-date-error | The date format is wrong |
| account for id `12,345` and user id `6,543,210` does not exist| The`account-id` is wrong, please use GET `/v1/account/accounts` to get account |
| account-frozen-balance-insufficient-error | Can not froze due to insufficient balance |
| account-transfer-balance-insufficient-error | Can not transfer due to insufficient balance |
| bad-argument | The arugment is wrong |
| api-signature-not-valid | The API signature is wrong |
| gateway-internal-error | System is too busy |
| ad-ethereum-addresss| The Ethereum address is required |
| order-accountbalance-error| Insufficient balance in account |
| order-limitorder-price-error|The limited order price exceeds limitation |
|order-limitorder-amount-error|The limited order amount exceeds limitation |
|order-orderprice-precision-error|The limited order price exceeds precision limitation |
|order-orderamount-precision-error|The limited order amount exceeds precision limitation|
|order-marketorder-amount-error|The order amount exceeds limitation|
|order-queryorder-invalid|Can not query the order|
|order-orderstate-error|The order status is wrong|
|order-datelimit-error|The query exceeds date limitation|
|order-update-error|The order fail to update|

## Suggestions

1. To get market data: Use WebSocket to subscribe the real time data and cache the data for further usage
2. To get latest trade price: Use `/market/trade` or WebSocket to subscribe `market.$symbol.trade.detail`.
3. To get successful transaction: Use WebSocket to subscribe `orders.$symbol.update`, it has better performance and time-ordered.
4. To change account assents: Use WebSocket to subscribe accounts topic, and regularly call API to get latest data.

# Frequently Asked Questions

## API Announcements
Huobi will publish API announcement in advance for any API change, please subscribe our announcements so that you can get latest update. 

How to subscribe: Login to [API Announcements page](https://huobiglobal.zendesk.com/hc/en-us/sections/360000070201-API-Announcements), click "Follow" button in the top right of the page, then choose the type you want to follow. After you subscribe, the button will changed to "Following". If you don't have any account, you need to register first. 

## Access and Authentication

### Q1：How many API Keys one user can apply?
A:  Every user can create 5 API Keys, and each API Key can be granted with 3 permissions: **read**, **trade** and **withdraw**.
Each user could create up to 200 sub users, and each sub user could create 5 API Keys, each API key can be granted with 2 permissions: **read** and **trade**.

Below are the explanation for permissions:

1、Read permission: It is used to query data, for example, **query orders**, **query trades**. 

2、Trade permission: it is used to **place order**, **cancel order** and **transfer**.

3、Withdraw permission: it is used to **withdraw**, **cancel withdraw**.

### Q2：Why APIs are always disconnected or timeout?
A：Please follow below suggestions:

1、It is unstable if the client's server locates in China mainland, it is suggested to invoke API from a server at AWS Japan.

2、It is suggested to invoke API only to host <u>api.huobi.pro</u> or <u>api-was.huobi.pro</u>.

### Q3：Why the WebSocket is often disconnected?
A：Please check below possible reasons:

1、The client didn't respond 'Pong'. It is requird to respond 'Pong' after receive 'Ping' from server.

2、The server didn't receive 'Pong' successfully due to network issue.

3、The connection is broken due to network issue.

4、It is suggested to implement WebSocket re-connect mechanism. If Ping/Pong works well but the connection is broken, the application should be able to re-connect automatically.

### Q4：What is the difference between <u>api.huobi.pro</u> and <u>api-aws.huobi.pro</u>?
A：The host <u>api-aws.huobi.pro</u> is optimized for AWS client, the latency is lower.

### Q5：Why the signature authentication always fail?
A：Please compare  your signature text with below example: 

`GET\n`

`api.huobi.pro\n`

`/v1/account/accounts\n`

`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-10-28T07%3A28%3A38`

Please check whether you follow below rules:

1、The parameter in signature text should be ordered by ASCII, for example below is the original parameters:

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

They should be ordered like below:

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2、The signature text should be URL encoded, for example

- The semicolon `:`should be encoded as `%3A`, The space should be encoded as `%20`.
- The timestamp should be formatted as `YYYY-MM-DDThh:mm:ss` and after encoded it should be like `2017-05-11T15%3A19%3A30`  

3、The signature should be base64 encoded.

4、The parameter for Get request should be included in signature request.

5、The Timestamp should be UTC time and the format should be YYYY-MM-DDTHH:mm:ss.

6、The time difference between your timestamp and standard should be less than 1 minute.

7、The message body doesn't need URL encoded if you are using WebSocket for authentication.

8、The host in signature text should be the same as the host in your API request.

9、The hidden text in API Key and Secret Key may have impact on the signature.

Right now the official SDK supports 3 language: Java, Python3 and C++, you can choose the one that suitable for you. 

<a href='https://github.com/HuobiRDCenter'>Download SDK </a>    

<a href='https://github.com/HuobiRDCenter/huobi_Python/blob/master/example/python_signature_demo.md'>Python signature example</a>   

<a href='https://github.com/HuobiRDCenter/huobi_Java/blob/master/java_signature_demo.md'>JAVA signature example</a>   

<a href='https://github.com/HuobiRDCenter/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++ signature example</a>   

### Q6：Why the API return 'gateway-internal-error'?
A：Please check below possible reasons:

1、Check the `account-id`, it could be returned from `GET /v1/account/accounts`.

2、It may be due to network issue, please try again later.

3、The data format should be correct (standard JSON).

4、The `Content-Type` in POST header should be `application/json` .

### Q7：Why the API return 'login-required'?
A：Please check below possible reasons:

1、The parameter should include `AccessKeyId`.

2、Check the `account-id` it could be returned from `GET /v1/account/accounts`.

3、The request body in POST request should NOT be included in signature text.

4、The request parameter in GET request should be ordered by ASCII.

## Market Data

### Q1：What is the update frequency of market depth?
A：The data is updated **once per second**. But, the BBO (Best Bid/Offer) feed upon WebSocket subscription to `market.$symbol.bbo` is updating in tick by tick mode.

### Q2：Could the total volume of Last 24h Market Summary (GET /v1/market/detail) decrease?
A：Yes, it is possible that the accumulated volume and the accumulated value counted for current 24h window is smaller than previous.

### Q3：How to retrieve the last trade price in market?
A：It is suggested to request to `GET /v1/market/trade` to get last market price, or to subscribe WebSocket topic `market.$symbol.trade.detail` for getting the same.

### Q4：Which timezone the start time of candlesticks falls into?
A： The start time for candlesticks is based on Singapore time (GMT+8), for example, the duration for daily candlesticks is from 00:00:00 to 23:59:59 Singapore time.

## Order and Trade

### Q1：What is account-id?
A： The `account-id` defines the Identity for different business type, it can be retrieved from API `/v1/account/accounts` , where the `account-type` is the business types.

The types include:

- spot: Spot account
- otc: OTC account
- margin: Isolated margin account, the detailed currency type is defined in `subType`
- super-margin / cross-margin:  Cross-margin account
- point: Point card account
- minepool: Minepool account
- etf: ETF account

### Q2：What is client-order-id?
A： The `client-order-id` is an optional request parameter while placing order. It's string type which maximum length is 64. The client order id is generated by client, and is only valid within 24 hours.

### Q3：How to get the order size, price and decimal precision?
A： You can call API `GET /v1/common/symbols` to get the currency pair information, pay attention to the difference between the minimum amount and the minimum price.   

Below are common errors:

- order-value-min-error: The order price is less than minimum price
- order-orderprice-precision-error : The precision for limited order price is wrong 
- order-orderamount-precision-error : The precision for limited order amount is wrong
- order-limitorder-price-max-error : The limited order price is higher than the threshold
- order-limitorder-price-min-error : The limited order price is lower than the threshold
- order-limitorder-amount-max-error : The limited order amount is larger than the threshold
- order-limitorder-amount-min-error : The limited order amount is smaller than the threshold  

### Q4：What is the difference between two WebSocket topic 'orders.\$symbol' and 'orders.\$symbol.update'?
A： Below are the difference:

1、The topic `order.$symbol` is the legacy version, which will be no longer supported in the near future. It is strongly recommended to subscribe topic `orders.$symbol.update` instead for getting order updates.

2、The update message sequence of `orders.$symbol.update` strictly follows transaction time, with lower latency.

3、In order to reduce latency, the topic `orders.$symbol.update` doesn't include original order details and transaction fee etc. If you require the original order information or transaction fee details, you may query to corresponding REST API endpoint.

### Q5：Why I got insufficient balance error while placing an order just after a successful order matching?
A：The time order matching update being sent down, the clearing service of that order may be still in progress at backend. Suggest to follow either of below to ensure a successful order submission:

1、Subscribe to WebSocket topic `accounts` for getting account balance moves to ensure the completion of asset clearing.

2、Check account balance from REST endpoint to ensure sufficient available balance for the next order submission.

3、Leave sufficient balance in your account.

### Q6: What is the difference between 'filled-fees' and 'filled-points' in match result?
A: Transaction fee can be paid from either of below.

1、filled-fees: Filled-fee is also called transaction fee. It's charged from your income currency from the transaction. For example, if your purchase order of BTC/USDT got matched，the transaction fee will be based on BTC.

2、filled-points: If user enabled transaction fee deduction, the fee should be charged from either HT or Point. User could refer to field `fee-deduct-currency` to get the exact deduction type of the transaction.

### Q7: What is the difference between 'match-id' and 'trade-id' in matching result?
A: The `match-id` is the identity for order matching, while the `trade-id` is the unique identifier for each trade. One `match-id` may be correlated with multiple `trade-id`, or no `trade-id`(if the order is cancelled). For example, if a taker's order got matched with 3 maker's orders at the same time, it generates 3 trade IDs but only one match ID.

### Q8: Why the order submission could be rejected even though the order price is set as same as current best bid (or best ask)?
A: For some extreme illiquid trading symbols, the best quote price at particular time might be far away from last trade price. But the price limit is actually based on last trade price which could possibly exclude best quote price from valid range for any new order.

### Q9: How to retrieve the trading symbols for margin trade

A: You can get details from Rest API ` GET /v1/common/symbols`. The `leverage-ratio` represents the isolated-margin ratio. The `super-margin-leverage-ratio` represents the cross-margin.

The value `0` indicates that the trading symbols doesn't support margin trading.

## Margin and Loan

### Q1: I can see I have loanable amount in my margin account, why the API returns no sufficient amount error when I apply margin loan?
A: The available amount depends on not only account available amount, but also the system available amount. Due to risk control, the system has a max available amount everyday. If the total loan amount reaches the max value, user will fail to apply loan, unless someone repays the loan in the same day. Right now we are implementing a more friendly solution that tries to provide more accurate information to API users.

## Deposit and Withdraw

### Q1：Why the API returns error 'api-not-support-temp-addr' when withdrawing?
A：User has to include the address into the pre-defined address table on Huobi official website before withdrawing through API.

### Q2：Why the API returns error 'Invaild-Address' when withdraw USDT?
A：USDT locates on multiple chains, therefore the withdraw order should clearly specify which chain the withdrawal goes to. See the table below:

| Chain           | Field Value |
| --------------- | --------------- |
| ERC20 (default) | `usdterc20`     |
| OMNI            | `usdt`          |
| TRX             | `trc20usdt`     |

If leaving the field empty, default target chain is `ERC20`, or you can explicitly set the chain to `usdterc20`.

If the target chain is `OMNI` or `TRX`, the field value should be `usdt` or `trc20usdt`.

The full chain name list for all currencies can be retrieved from endpoint `GET /v2/reference/currencies`.

### Q3：How to specify 'fee' when creating a withdraw request?

A：Please refer to the response from endpoint `GET /v2/reference/currencies`, where the field `withdrawFeeType` defining different fee types below: 

- transactFeeWithdraw : The withdraw fee per request (only applicable when withdrawFeeType=fixed).    	
- minTransactFeeWithdraw : The minimum withdraw fee per request (only applicable when withdrawFeeType=circulated or ratio).
- maxTransactFeeWithdraw : The maximum withdraw fee per request (only applicable when withdrawFeeType=circulated or ratio).
- transactFeeRateWithdraw : The withdraw fee rate per request (only applicable when withdrawFeeType=ratio).

### Q4：How to query my withdraw quota?
A：Please refer to the response from endpoint `GET /v2/account/withdraw/quota`, where quota per request, daily quota, annual quota, overall quota are available.

Note: If you need to withdraw large amount which breaking the limitation, you can contact our official support (support@huobi.pro) for assistance.

## API Technical Support
If you have any other questions on API, you can contact us by below ways:

1、Join official QQ group (火币网API交流群(8), 595882031), please tell your UID and programming language in your join request.

2、Send email to api_service@huobi.com
In order to better understand your question and respond you quickly, please use below template in your email:

`1. UID`  
`2. AccessKey`  
`3. Full URL request`  
`4. Request parameters`  
`5. Request time`  
`6. Original response`  
`7. Problem description: (such as steps, field question, frequency)`  
`8. Signature text (mandatory if you have signature authentication issue)`  

Below is an example：

`1. UID：123456`  
`2. AccessKey:rfhxxxxx-950000847-boooooo3-432c0`  
`3. Full URL request: https://api.huobi.pro/v1/account/accounts?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`  
`4. Request parameters: N/A`  
`5. Request time: 2019-11-06 11:26:14`  
`6. Original response：{"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key错误]","data":null}`  
`7. Problem description: API returns error`  
`8. Signature text:`  
`GET\n`  
`api.huobi.pro\n`  
`/v1/account/accounts\n`    
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`

Note：It is safe to share your Access Key, which is to prove your identity, and it will not affect your account safety. Remember do **not** share your `Secret Key` to any one. If you expose your `Secret Key` by accident, please [remove](https://www.hbg.com/zh-cn/apikey/) the related API Key immediately.

# Reference Data

## Get system status

This endpoint allows users to get system status, Incidents and planned maintenance.

The system status can also be obtained through email, SMS, webhook, RSS/Atom feed. Users can You can click <a href='https://status.huobigroup.com/'>here</a> to subscribe. The subscription function depends on Google services. Before you subscribe, please ensure that you can access Google services normally. 

```shell
curl "https://status.huobigroup.com/api/v2/summary.json"
```

### HTTP Request

- GET `https://status.huobigroup.com/api/v2/summary.json`

### Request Parameters

No parameter is available for this endpoint.

> Response:

```json
{
  "page": {  // Basic information of huobi spot status page
    "id": "p0qjfl24znv5",  // page id
    "name": "Huobi",  // page name
    "url": "https://status.huobigroup.com", // page url
    "time_zone": "Etc/UTC", // time zone
    "updated_at": "2020-02-07T10:25:14.717Z" // page update time
  },
  "components": [  // System components and their status
    {
      "id": "h028tnzw1n5l",  // component id
      "name": "Deposit", // component name
      "status": "operational", // component status
      "created_at": "2019-12-05T02:07:12.372Z",  // component create time
      "updated_at": "2020-02-07T09:27:15.563Z", // component update time
      "position": 1,
      "description": null,
      "showcase": true,
      "group_id": "gtd0nyr3pf0k",  
      "page_id": "p0qjfl24znv5", 
      "group": false,
      "only_show_if_degraded": false
    }
  ],
  "incidents": [ // System fault incidents and their status
        {
            "id": "rclfxz2g21ly",  // incident id
            "name": "Market data is delayed",  // incident name
            "status": "investigating",  // incident stutus
            "created_at": "2020-02-11T03:15:01.913Z",  // incident create time
            "updated_at": "2020-02-11T03:15:02.003Z",   // incident update time
            "monitoring_at": null,
            "resolved_at": null,
            "impact": "minor",  // incident impact
            "shortlink": "http://stspg.io/pkvbwp8jppf9",
            "started_at": "2020-02-11T03:15:01.906Z",
            "page_id": "p0qjfl24znv5",
            "incident_updates": [ 
                {
                    "id": "dwfsk5ttyvtb",   
                    "status": "investigating",   
                    "body": "Market data is delayed", 
                    "incident_id": "rclfxz2g21ly",   
                    "created_at": "2020-02-11T03:15:02.000Z",    
                    "updated_at": "2020-02-11T03:15:02.000Z",  
                    "display_at": "2020-02-11T03:15:02.000Z",   
                    "affected_components": [  
                        {
                            "code": "nctwm9tghxh6",  
                            "name": "Market data",  
                            "old_status": "operational",  
                            "new_status": "degraded_performance"  
                        }
                    ],
                    "deliver_notifications": true,
                    "custom_tweet": null,
                    "tweet_id": null
                }
            ],
            "components": [  
                {
                    "id": "nctwm9tghxh6",   
                    "name": "Market data",  
                    "status": "degraded_performance", 
                    "created_at": "2020-01-13T09:34:48.284Z", 
                    "updated_at": "2020-02-11T03:15:01.951Z", 
                    "position": 8,
                    "description": null,
                    "showcase": false,
                    "group_id": null,
                    "page_id": "p0qjfl24znv5",
                    "group": false,
                    "only_show_if_degraded": false
                }
            ]
        }
    ],
      "scheduled_maintenances": [  // System scheduled maintenance events and their status
        {
            "id": "k7g299zl765l", // incident id
            "name": "Schedule maintenance", // incident name
            "status": "scheduled", // incident status
            "created_at": "2020-02-11T03:16:31.481Z",  // incident create time
            "updated_at": "2020-02-11T03:16:31.530Z",  // incident update time
            "monitoring_at": null,
            "resolved_at": null,
            "impact": "maintenance",  // incident impact
            "shortlink": "http://stspg.io/md4t4ym7nytd",
            "started_at": "2020-02-11T03:16:31.474Z",
            "page_id": "p0qjfl24znv5",
            "incident_updates": [  
                {
                    "id": "8whgr3rlbld8",  
                    "status": "scheduled", 
                    "body": "We will be undergoing scheduled maintenance during this time.", 
                    "incident_id": "k7g299zl765l",  
                    "created_at": "2020-02-11T03:16:31.527Z",  
                    "updated_at": "2020-02-11T03:16:31.527Z",  
                    "display_at": "2020-02-11T03:16:31.527Z",  
                    "affected_components": [  
                        {
                            "code": "h028tnzw1n5l",  
                            "name": "Deposit And Withdraw - Deposit",  
                            "old_status": "operational",  
                            "new_status": "operational" 
                        }
                    ],
                    "deliver_notifications": true,
                    "custom_tweet": null,
                    "tweet_id": null
                }
            ],
            "components": [  
                {
                    "id": "h028tnzw1n5l",  
                    "name": "Deposit", 
                    "status": "operational", 
                    "created_at": "2019-12-05T02:07:12.372Z",  
                    "updated_at": "2020-02-10T12:34:52.970Z",  
                    "position": 1,
                    "description": null,
                    "showcase": false,
                    "group_id": "gtd0nyr3pf0k",
                    "page_id": "p0qjfl24znv5",
                    "group": false,
                    "only_show_if_degraded": false
                }
            ],
            "scheduled_for": "2020-02-15T00:00:00.000Z",  // scheduled maintenance start time
            "scheduled_until": "2020-02-15T01:00:00.000Z"  // scheduled maintenance end time
        }
    ],
    "status": {  // The overall current status of the system
        "indicator": "minor",   // system indicator
        "description": "Partially Degraded Service"  // system description
    }
}
```

### Response Content

|Field | Data Type | Description
|--------- |  -----------|  -----------
|page    |                     | basic information of huobi spot status page
|{id        |  string                   | page id
|name      |      string                | page name
|url     |    string                  | page url
|time_zone     |     string                 | time zone
|updated_at}     |    string                  | page update time
|components  |                      | System components and their status
|[{id        |  string                    | component id
|name        |    string                  | component name, including Order submission, Order cancellation, Deposit etc.
|status        |    string                  | component status, value range: operational, degraded_performance, partial_outage, major_outage, under maintenance
|created_at        |    string                  | component create time
|updated_at        |    string                  | component update time
|.......}]        |                     | for details of other fields, please refer to the return example
|incidents  |           | System fault incident and their status. If there is no fault at present, it will return to null
|[{id        |       string               | incident id
|name        |      string                | incident name
|status        |     string                 | incident staus, value range: investigating, identified, monitoring, resolved
|created_at        |       string               | incident creat time
|updated_at        |      string                | incident update time
|.......}]        |                     | for details of other fields, please refer to the return example
|scheduled_maintenances|                     | System scheduled maintenance incident and status. If there is no scheduled maintenance at present, it will return to null
|[{id        |     string                 |  incident id
|name        |      string                | incident name
|status        |       string               | incident staus, value range: scheduled, in progress, verifying, completed
|created_at        |     string                 | incident creat time
|updated_at        |     string                 | incident update time
|scheduled_for       |      string                | scheduled maintenance start time
|scheduled_until       |     string                 | scheduled maintenance end time
|.......}]        |                     | for details of other fields, please refer to the return example
|status   |                       | The overall current status of the system
|{indicator        |    string                  | system indicator, value range: none, minor, major, critical, maintenance
|description}     |      string                | system description, value range: All Systems Operational, Minor Service Outager, Partial System Outage, Partially Degraded Service, Service Under Maintenance

## Get all Supported Trading Symbol

This endpoint returns all Huobi's supported trading symbol.

```shell
curl "https://api.huobi.pro/v1/common/symbols"
```

### HTTP Request

`GET /v1/common/symbols`

### Request Parameters

No parameter is needed for this endpoint.

> Responds:

```json
  "data": [
   {"base-currency":"etc",
    "quote-currency":"usdt",
    "price-precision":6,
    "amount-precision":4,
    "symbol-partition":"default",
    "symbol":"etcusdt",
    "state":"online",
    "value-precision":8,
    "min-order-amt":0.001,
    "max-order-amt":10000,
    "min-order-value":0.0001
    },
    {
    "base-currency":"ltc",
    "quote-currency":"usdt",
    "price-precision":6,
    "amount-precision":4,
    "symbol-partition":"main",
    "symbol":"ltcusdt",
    "state":"online",
    "value-precision":8,
    "min-order-amt":0.001,
    "max-order-amt":10000,
    "min-order-value":100,
    "leverage-ratio":4
    }
  ]
```

### Response Content

Field           | Data Type | Description
---------       | --------- | -----------
base-currency   | string    | Base currency in a trading symbol
quote-currency  | string    | Quote currency in a trading symbol
price-precision | integer   | Quote currency precision when quote price(decimal places)
amount-precision| integer   | Base currency precision when quote amount(decimal places)
symbol-partition| string    | Trading section, possible values: [main，innovation]
symbol          | string    | 
state           | string    | The status of the symbol；Allowable values: [online，offline,suspend]. "online" - Listed, available for trading, "offline" - de-listed, not available for trading， "suspend"-suspended for trading
value-precision | integer   | Precision of value in quote currency (value = price * amount)
min-order-amt   | float  | Minimum order amount (order amount is the ‘amount’ defined in ‘v1/order/orders/place’ when it’s a limit order or sell-market order)
max-order-amt   | float | Max order amount
min-order-value | float | Minimum order value (order value refers to ‘amount’ * ‘price’ defined in ‘v1/order/orders/place’ when it’s a limit order or ‘amount’ when it’s a buy-market order)
leverage-ratio  | float  | The applicable leverage ratio


## Get all Supported Currencies

This endpoint returns all Huobi's supported trading currencies.

```shell
curl "https://api.huobi.pro/v1/common/currencys"
```

### HTTP Request

`GET /v1/common/currencys`

### Request Parameters

No parameter is needed for this endpoint.

> Response:

```json
  "data": [
    "usdt",
    "eth",
    "etc"
  ]
```

### Response Content

<aside class="notice">The returned "data" field contains a list of string with each string represents a suppported currency.</aside>
## APIv2 - Currency & Chains

API user could query static reference information for each currency, as well as its corresponding chain(s). (Public Endpoint)

### HTTP Request

`GET https://api.huobi.pro/v2/reference/currencies`

```shell
curl "https://api.huobi.pro/v2/reference/currencies?currency=usdt"
```

### Request Parameters

| Field Name       | Mandatory | Data Type     | Description     |Value Range |
| ---------- | ---- | ------ | ------ | ---- |
| currency | false | string | Currency   |  btc, ltc, bch, eth, etc ...(available currencies in Huobi Global) |
| authorizedUser | false | boolean | Authorized user   |  true or false (if not filled, default value is true) |

> Response:

```json
{
    "code":200,
    "data":[
        {
            "chains":[
                {
                    "chain":"trc20usdt",
                    "baseChain": "TRX",
                    "baseChainProtocol": "TRC20",
                    "isDynamic": false,
                    "depositStatus":"allowed",
                    "maxTransactFeeWithdraw":"1.00000000",
                    "maxWithdrawAmt":"280000.00000000",
                    "minDepositAmt":"100",
                    "minTransactFeeWithdraw":"0.10000000",
                    "minWithdrawAmt":"0.01",
                    "numOfConfi
