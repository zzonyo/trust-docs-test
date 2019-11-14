---
title: Huobi API Reference v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Introduction

## Documentation Summary

Welcome to the HuobiDM API! You can use our API to access all market data, trading, and account management endpoints.

We have code example in Shell! You can view code examples in the dark area to the right.

You can use the drop down list above to change the API version. You can also use the language option at the top right to switch documentation language.

## Market Maker Program

Market maker program gives clients with good market making strategy an opportunity to access customized trading fee structure.

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotion.
</aside>

### Eligibility Criteria as a Market Maker on HuobiDM

1. You should possess good market strategy
2. You must have at least 3 BTC or equivalent assets, not including rebates in your account with HuobiDM

### Application Process as Market Maker on Huobidm

If you satisfied our eligibility criteria and is interested to participate in our market-making project, please email to MM_service@huobi.com with following information:

1. UIDs (not linked to any rebate program in any accounts)
2. Provide screenshot of trading volume for the past 30 days or VIP/corporate status with other Exchanges
3. A brief description in writing of your market-making strategy

# Changelog

## 1.0.8 API Upgrade: Added the order_id_str field 

- To solve the problem that the userOrderId of node.js and javascript is too long, the order_id_str field will be added to the following interface, the type is String, which is expected to go online today: 

api/v1/contract_order

api/v1/contract_batchorder

api/v1/contract_matchresults

api/v1/contract_hisorders

api/v1/contract_openorders

api/v1/lightning_close_position 

api/v1/contract_order_info

- WebSocket added the order_id_str field  

## 1.0.7 

<aside class="warning">
The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. 
Because the Json.parse in nodejs and JavaScript is int by default. 
so the number over 18 bits need be parsed by jaso-bigint package.
Refer to the <a href='https://github.com/huobiapi/Futures-Node.js-demo/tree/master/REST-Node.js-demo'>demo</a> of nodejs for details. 
For <a href='https://github.com/huobiapi/Futures-Node.js-demo/blob/master/Nodejs-DEMO.docx?raw=true'>details</a>, please check.
</aside>

### 1、 Modified rest interface:  User’s Account Information 
	
  Added return string “margin_static”in rest interface User’s Account Information (URL: api/v1/contract_account_info). The newly added return string “margin_static” in data array means account static equity.

### 2、 Added string “ID “in three interfaces;	

  Added string“ID”in rest interface Order details acquisition (URL: api/v1/contract_order_detail) , rest interface Acquire History Match Results (URL: api/v1/contract_matchresults) as well as the match result on Order Push in WebSocket Subscription.

### 3、Added “IOC”and “FOK order types for order placement

  Added order_price_type “ioc”(ioc:Immediate Or Cancel) and “fok”(fok:Fill Or Kill)under Request Parameter  in rest interface Place an Order(URL: api/v1/contract_order) and rest interface Place a Batch of Orders(URL: api/v1/contract_batchorder)

### 4、Modified interface: Query contract information on order limit
	
  Added “fok”:FOK Order(fok:Fill Or Kill),“ioc”:IOC Order(ioc:Immediate Or Cancel) into string of“ order_price_type” in Returning Parameter under rest interface Query contract information on order limit (URL: api/v1/contract_order_limit)

  The“ order_price_type” means Order Type here.

### 5、Added rest API interface: Query information on system status

  Interface URL: api/v1/contract_api_state

### 6、 Added rest interface: Top Trader Sentiment Index Function-Account

  Interface URL: api/v1/contract_elite_account_ratio

### 7、Added rest interface: Top Trader Sentiment Index Function-Position

  Interface URL: api/v1/contract_elite_position_ratio

### 8、Added Liquidation order query function in API and WS subscription.
	
  Added rest interface: Request Liquidation Order Information

  Interface URL: rest interface api/v1/contract_liquidation_orders

  Liquidation order push is added also into WebSocket Subscription.

## 1.0.6 API Upgrade: Added rest interface

### Added rest interface

  Request access to address: https://www.hbdm.com/heartbeat
  
  Note: To query whether the system is available or not, request https://www.hbdm.com/heartbeat. When Heartbeat is 1, system is available; when Heartbeat is 0, system is unavailable.

## 1.0.5 API Upgrade: New Features of Query and Order Placing

### Newly Added API Restful Interface

  Newly added Interface: query user’s order limit information
  
  Newly added Interface: query user’s trading fee information
  
  Newly added Interface: query user’s transfer limit information
  
  Newly added Interface: query users’ position limit information
  
  Newly added Interface: query platform information on insurance fund and estimated clawback rate
  
  Newly added Interface: query platform information on open interest information
  
  Newly added Interface: query history records information on insurance fund
  
  Newly added Interface: query platform information on Tiered Adjustment Factor
  
  Newly added Interface: place Flash Close order

### Modified API Interface

  Restful interface: add “return to users’ adjustment factor” on Query Users’ Account Information Interface;
  
  Restful interface: add “return to users’ adjustment factor” on Query a Single Sub-Account’s Assets Information Interface.
  
  WebSocket Interface: add “return to users’ adjustment factor” on WebSoket Portfolio Push Interface;
  
  Restful Interface: add Optimal price set with optimal top 5, optimal 10 and optimal top 20 on Order Place Interface and Place a Batch of Orders Interface
  
  Restful Interface: add “query according contract code” on Acquire History of Match Results Interface.

## 1.0.4 API Upgrade:Restful interface

### Query assets information of all sub-accounts under the master account

  URL：api/v1/contract_sub_account_list

  Notice: Only return data for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission).

### Query a single sub-account's assets information

  URL：api/v1/contract_sub_account_info

  Notice: Only query account information for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission); No data return for sub-accounts which has logged in hbdm but have not gained trading permission/activated.

### Query a single sub-account's position information

  URL：api/v1/contract_sub_position_info

### Query account financial records

  URL：api/v1/contract_financial_record
 
## 1.0.3 API Upgrade: WebSocket Portfolio Push 


### WebSoket balance push is available: 

  users could subscribe the interface to get information of their balances automatically.

### WebSoket position push is available: 

  users could subscribe the interface to get information of their positions automatically.

### Acuqire positions information via Restful interface: 

  api/v1/contract_position_info.
  
  The string of “latest price”is added into response

## 1.0.2  API Upgrade: Transfer margin between Spot account and Future account

### URL /v1/futures/transfer

  This interface is used to transfer assets between Spot account and Future account.
  
  The type is “pro-to-futures” when transferring assets from Spot account to Future; “futures-to-pro” when transferring from Future account to Spot account.

  API rate limit for this interface is up to 10 times per minute.

### API rate limit

  Private interface rate limit has been increased from 10 times/second to 30 times every 3 seconds, which means users could send up to 30 requests within 3 seconds.
  
  The rate limit of other non-market public interface has been increased from 20 times/second to 60 times every 3 seconds, which means users could send up to 60 requests within 3 seconds.
 
## 1.0.1 API Upgrade: Post_only and more

### Cancel all interface: URL api/v1/contract_cancelall 

  Send symbol to cancel all the contracts of that kind of symbol, e.g. send “BTC” to cancel all BTC weekly, biweekly and quarterly contracts.
  
  Send contract_code to cancel the contracts of that code.
  
  Send symbol+contract_type to cancel the certain contracts under the symbol of that contract_type, e.g. send “BTC” and “this week”, then the BTC weekly contracts will be cancelled.

### Order place interface: URL api/v1/contract_order

  Post_only is added into the string of order_price_type.
  
  Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.
  
  Position limit will be applied to post_only while order limit will not.

### Place a batch of orders: URL /v1/contract_batchorder

  Post_only is added into the string of order_price_type.
  
  Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.
  
  Position limit will be applied to post_only while order limit will not.

### Will response following string for "header" via api

  ratelimit-limit: the upper limit of requests per time, unit: time
  
  ratelimit-interval: reset interval (reset the number of request), unit: ms
  
  ratelimit-remaining: the left available request number for this round, unit: time
  
  ratelimit-reset: upper limit of reset time used to reset request number, unit: ms

### Order details acquisition: URL api/v1/contract_order_detail

  The string of “role” (i.e. taker or maker) is added into “trades”

### Acquire history of match results: URL api/v1/contract_matchresults

  The string of “role” (i.e. taker or maker) is added into “trades

### WebSoket, the private order push interface, requires API KEY Verification

  Each UID can build at most create 10 WS connections for private order push at the same time. For each account, contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS order push connection for BTC Contract which will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly contracts.
  
  Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

## 1.0.0 has launched on December 10, 2018
 
# Huobi Derivative Market (HBDM) API Access Illustration

##  API List

permission type  |  Content Type  |   Context                                      |   Request Type   |   Desc                                        | Signature Required   |
--------- | ---------------- | ------------------------------------------------ | ---------------- | ---------------------------------------------- | ---------------------- |
Read  | Market Data      | api/v1/contract_contract_info      |  GET              | Get Contracts Information                      | No                     |
Read  | Market Data      | api/v1/contract_index             |  GET              | Get contract Index Price Information           | No                     |
Read  | Market Data      |  api/v1/contract_price_limit       |  GET              | Get Contract Price Limits                      | No                     |
Read  | Market Data      |  api/v1/contract_open_interest     |  GET              | Get Contract Open Interest Information         | No                     |
Read  | Market Data      |  api/v1/contract_delivery_price     |  GET              |  Get the estimated delivery price         | No                     |
Read  | Market Data      |  https://www.hbdm.com/heartbeat     |  GET              |  Query whether the system is available         | No                     |
Read     |  Market Data           |   api/v1/contract_api_state   |                  GET        |  Query information on system status    |  No  |
Read  | Market Data      |  /market/depth                  |  GET              | Get Market Depth                               | No                     |
Read  | Market Data      | /market/history/kline          |  GET              | Get K-Line Data                                | No                     |
Read  | Market Data      |  /market/detail/merged         |  GET              | Get Market Data Overview                       | No                     |
Read  | Market Data      |  /market/trade                  |  GET              | The Last Trade of a Contract                   | No                     |
Read  | Market Data      | /market/history/trade           |  GET              | Request a Batch of Trade Records of a Contract | No                     |
Read    |  Market Data           |  api/v1/contract_risk_info |     GET       |  Query information on contract insurance fund balance and estimated clawback rate |  No  |
Read    |  Market Data           |  api/v1/contract_insurance_fund |   GET       |  Query history records of insurance fund balance            |  No  |
Read    |  Market Data           |  api/v1/contract_adjustfactor |    GET       |  Query information on Tiered Adjustment Factor            |  No  |
Read    |  Market Data           |  api/v1/contract_his_open_interest |    GET       |  Query information on open interest            |  No  |
Read     |   Market Data           |  api/v1/contract_elite_account_ratio |   GET       |  Top Trader Sentiment Index Function-Account            |  No  |
Read     |   Market Data           |  api/v1/contract_elite_position_ratio |   GET       |  Top Trader Sentiment Index Function-Position            |  No  |
Read     |   Market Data           |  api/v1/api/v1/contract_liquidation_orders |   GET       |  Request Liquidation Order Information            |  No  |
Read  | Account          | api/v1/contract_account_info   |  POST             | User’s Account Information                     | Yes                    |
Read  | Account          | api/v1/contract_position_info  |  POST             | User’s position Information                    | Yes                    |
Read   | Account | api/v1/contract_sub_account_list    | POST             |     Query assets information of all sub-accounts under the master account (Query by coins)     | Yes   |
Read   | Account | api/v1/contract_sub_account_info     | POST             |  Query a single sub-account's assets information   | Yes   |
Read   |  Account  | api/v1/contract_sub_position_info    | POST             | Query a single sub-account's position information    | Yes   |
Read   | Account  | api/v1/contract_financial_record    | POST             | Query account financial records  | Yes   |
Read     |  User Account           |  api/v1/contract_order_limit |  POST       |  Query contract information on order limit            |  Yes  |
Read     |  User Account           |  api/v1/contract_fee |       POST       | Query information on contract trading fee            |  Yes  |       
Read     |  User Account           |  api/v1/contract_transfer_limit |     POST       |  Query information on Transfer Limit            |  Yes  |
Read     |  User Account           |  api/v1/contract_position_limit |     POST       |  Query information on position limit            |  Yes  |
Trade  | Trade            |  api/v1/contract_order          |  POST             | Place an Order                                 | Yes                    |
Trade | Trade            | api/v1/contract_batchorder       |  POST             | Place a Batch of Orders                        | Yes                    |
Trade | Trade            | api/v1/contract_cancel           |  POST             | Cancel an Order                                | Yes                    |
Trade | Trade            | api/v1/contract_cancelall        |  POST             | Cancel All Orders                              | Yes                    |
Trade     |  Trade           |  api/v1/lightning_close_position |   POST       |  Place Flash Close Order            |  Yes  |
Read  | User Order Info  | api/v1/contract_order_info       |  POST             | Get Information of an Order                    | Yes                    |
Read  | User Order Info  |  api/v1/contract_order_detail   |  POST             | Get Trade Details of an Order                  | Yes                    |
Read  | User Order Info  |  api/v1/contract_openorders     |  POST             | Get Current Orders                             | Yes                    |
Read  | User Order Info  |  api/v1/contract_hisorders      |  POST             | Get History Orders                             | Yes                    |
Read  | User Order Info  |  api/v1/contract_matchresults       |  POST             | Acquire History Match Results                             | Yes   |
Trade | User Account|  v1/futures/transfer       | POST             |  Transfer margin between Spot account and Future account                          | Yes  |

##  Address

Address | Applicable sites | Applicable functions | Applicable trading pairs |
------ | ---- | ---- | ------ |
https://api.hbdm.com  | Huobi DM |    Market     | Trading pairs provided by Huobi DM  |

### Notice

 If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro".

## Signature Authentication & Verification

### Signature Illustration

Considering that API requests may get tampered in the process of transmission, to keep the transmission secure, you have to use your API Key to do Signature Authentication for all private interface except for public interface (used for acuqiring basic information and market data), in this way to verify whether the parameters/ parameter value get tampered or not in the process of transmission

A legitimate request consists of following parts：

- Request address of method, i.e. visit server address--api.hbdm.com, e.g.:  api.hbdm.com/api/v1/contract_order

- API Access Key ID (AccessKeyId): Access Key of the API Key that you apply.

- Method of Signature (SignatureMethod): Based on the Hash Aggrement, users calculate the signature via HmacSHA256.

- aSignature Version (SignatureVersion): It adopts version 2 in terms of Signature Version.

- Timestamp (Timestamp): The time when you send the request (UTC time zone) : (UTC time zone) : (UTC time zone), e.g.: 2017-05-11T16:22:06

- Must-fill parameters & optional parameters: For each method, there are a group of must-fill parameters and optional parameters used to address the API request, which can be found in the illustration of each method as well as their meaning. Please note that, in terms of "Get" requests, it needs to do Signature calculation for all the original parameters in each method ; In terms of "Post" requests, no need to do Signature calculation for the original parameters in each method, which means only four parameters need to do Signature calculation in "Post" requests, i.e. AccessKeyId, SignatureMethod, SignatureVersion, Timestamp with other parameters placed in "body".

- Signature: The result of Signature calculation which is used to verify if signature is valid and not tampered.


### Create API Key

<a href='https://www.hbg.com/zh-cn/apikey/'>You could  create API Key at</a>

API Key consists of the following two parts.

- "Access Key", the Key used to visit API.
  
- "Secret Key", the Key used to do Signature authentication and verification (visible during application period).

<aside class="notice">
When create API Key, users could bind IP address, as the validity of unbond IP address is only 90 days.
</aside>
<aside class="notice">
API Key has operation authorization of trading, borrowing, deposit and withdrawal etc..
</aside>
<aside class="warning">
Both Access Key and Secret Key are closely related with account security, please do not disclose them to others for any reasons anytime.
</aside>


### Steps for Signature

Normative request for Signature calculation     Different contents will get totally different results when use HMAC to calculate Signature, therefore, please normalize the requests before doing Signature calculation. Take the request of inquering order details as an example:

query details of one order 

`https://api.hbdm.com/api/v1/contract_order?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

#### 1. Request methods (GET/POST): add line breaker "\n".


`POST\n`

#### 2. Text the visit address in lowercase, adding line breake "\n"

`
api.hbdm.com\n
`

#### 3. Visit the path of methods, adding line breaker "\n"

`
/api/v1/contract_order\n
`

#### 4. Rank the parameter names according to the sequence of ASCII codes, for example, below is the parameters in original sequence and the new sequence:


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
Use UTF-8 to encode when it has already been encoded by URI with hexadecimals in Uppercase, e.g., ":" wiil be encoded to "%3A" while space to "%20".
</aside>
<aside class="notice">
Timestamp should be written in the form of YYYY-MM-DDThh:mm:ss and encoded with URI.
</aside>


#### 5. After ranking

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

#### 6.  Following the sequence above, link parameters with "&"


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`

#### 7. Form the final character strings that need to do Signature calculation as following:

`POST\n`

`api.hbdm.com\n`

`/api/v1/contract_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. Use the "request character strings" formed in the last step and your Secret Key to create a digital Signature.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. Take the request character string formed in the last step and API Secret Key as two parameters, encoding them with the Hash Function HmacSHA256 to get corresponding Hash value.

2. Encoding the Hash value with base-64 code, the result will be the digital Signature of this request.

#### 9. Add the digital Signature into the parameters of request path.

The final request sent to Server via API should be like:

`https://api.hbdm.com/api/v1/contract_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. Add all the must authentication parameters into the parameters of request path;

2. Add the digital Signature encoded with URL code into the path parameters with the parameter name of "Signature".

## API Rate Limit Illustration

Please note that, for both public interface and private interface, there are rate limits, more details are as below:

* Generally, the private interface rate limit of API key is at most 30 times every 3 second for each UID (this 30 times every 3 second rate limit is shared by all the altcoins contracts delivered by different date).

* For public interface used to get information of index, price limit, settlement, delivery, open positions and so on, the rate limit is 60 times every 3 second at most for each IP (this 60 times every 3 second public interface rate limit is shared by all the requests from that IP of non-marketing information, like above).

* In terms of public interface used to get candle chart data, the latest transaction record and information of aggregate market, order book and so on, the rate limit is as below:

    （1） For restful interface: 200 times/second for one IP at most.

    （2）For websocket: The rate limit for “req” request is 50 times at once. No limit for “sub” request as the data will be pushed by sever voluntarily.

* WebSoket, the private order push interface, requires API KEY Verification:

    Each UID can build at most create 10 WS connections for private order push at the same time. For each account, 
    contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS 
    order push connection for BTC Contract which will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly
    contracts. Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

* Will response following string for "header" via api 

    ratelimit-limit: the upper limit of requests per time, unit: time

    ratelimit-interval: reset interval (reset the number of request), unit: ms

    ratelimit-remaining: the left available request number for this round, unit: time

    ratelimit-reset: upper limit of reset time used to reset request number, unit: ms 

## Query whether the system is available  

- Interface `https://www.hbdm.com/heartbeat`

> Response:

```json

  {
  "status": "ok",
  "data": {"heartbeat": 1},
  "ts": 1557714418033
  }
```

- Notice: Heartbeat is 1 is available, 0 is not available. 

## Details of Each Error Code

Error Code | Error Details Description|
----- | ---------------------- |
403	|	invalid ID                |
1000|	system exception                |
1001|	system not on deck             |
1002|	query exception               |
1003|	redis operation exception           |
1010|	user not existing              |
1011|	user session not exists            |
1012|	user account not exists             |
1013|	contract type not exists             |
1014|	contract not exists               |
1015|	index price not exists            |
1016|	BBO price not exists             |
1017|	query order not exists             |
1030|	input error                |
1031|	illegal order source             |
1032|	beyond visit limits            |
1033|	wrong field value of contract period       |
1034|	wrong field value of order type          |
1035|	wrong field value of order direction           |
1036|	wrong closing/opening field value of  orders          |
1037|	invalid leverage ratio          |
1038|	order price beyond the requirement of minimum variable price        |
1039|	order price beyond the limits            |
1040|	illegal order quantity             |
1041|	order quantity beyond limits            |
1042|	long positions beyond limits            |
1043|	short positions beyond limits            |
1044|	beyond position limits            |
1045|	leverage ratio not in accordance with the leverage ratio of open positions    |
1046|	uninitialized open positions              |
1047|	lack of available margin             |
1048|	lack of open positions               |
1050|	repeated order id              |
1051|	no orders could be withdrawed               |
1052|	beyond the limits of bacth order quantity             |
1053|	cannot acquire contracts' latest price range      |
1054|	cannot acquire contracts' latest           |
1055|	cannot close positions for lack of equity             |
1056|	cannot place or withdraw orders during settlement       |
1057|	cannot place or withdraw orders during trading pause        |
1058|	cannot place or withdraw orders when trading suspended           |
1059|	cannot place or withdraw orders during delivery          |
1060|	cannot place or withdraw orders under no-trading status  |
1061|	cannot withdraw not existed orders          |
1062|	cannot repeatedly withdraw orders when in withdrawing status          |
1063|	cannot withdraw filled orders          |
1064|	order primary key duplication              |
1065|	user's order id is not integer           |
1066|	do not leave the field blank               |
1067|	illegal fields               |
1068|	output error                |
1069|	illegal order price             |
1100|	users do not have rights to open positions            |
1101|	users do not have rights to close positions            |
1102|	users do not have rights to deposit            |
1103|	users do not have rights to withdraw            |
1104|	without contract trading permission, you are banned to trade       |
1105|	with current contract trading permission, you are only allowed to close positions       |
1200|	login error                |
1220|	user has not onboarded Huobi DM or activate the account          |
1221|	lack of margin to open account              |
1222|	insufficient account opening days             |
1223|	account VIP level not high enough          |
1224|	account registration place restricted               |
1225|	unsuccessful account opening               |
1250|	token cannot acquire HT_token        |
1251|	cannot acquire BTC equivalent assets         |
1252|	cannot acquire spot assets            |
1071|	The order has been cancelled, please do not cancel orders repeatedly    |
1077|	failed query of current contract assets during settlement and delivery    |
1078|	failed query of partial contracts' assets during settlement and delivery    |
1079|	failed query of current contract open positions during settlement and delivery    |
1080|	failed query of partial contract assets during settlement and delivery    |
1083|	Error detected, Order closing failed.    |

## Code Demo

**REST**

- <a href='https://github.com/huobiapi/Futures-Java-demo'>Java</a>

- <a href='https://github.com/huobiapi/Futures-Python-demo'>Python</a>

- <a href='https://github.com/huobiapi/Futures-Go-demo'>Golang</a>

- <a href='https://github.com/huobiapi/Futures-CSharp-demo'>CSharp</a>

- <a href='https://github.com/huobiapi/Futures-PHP-demo'>PHP</a>

- <a href='https://github.com/huobiapi/Futures-Node.js-demo'>Node.js</a>

**Websocket**

- <a href='https://github.com/huobiapi/Futures-Java-demo/tree/master/WebSocket-JAVA-demo'>Java</a>

- <a href='https://github.com/huobiapi/Futures-Python-demo/tree/master/Websocket-Python3-demo'>Python</a>

- <a href='https://github.com/huobiapi/Futures-Node.js-demo/tree/master/WebSocket-Node.js-demo'>Node.js</a>

**Contract sdk**

- <a href='https://github.com/huobiapi/Futures-Java-demo/tree/master/hbdm-java-sdk'>Contract sdk</a>

# HuobiDM Market Data interface

## Get Contract Info 

### Example              
                                   
- GET  `api/v1/contract_contract_info`

```shell
curl "https://api.hbdm.com/api/v1/contract_contract_info"      
```
                                                           
### Request Parameter

  Parameter Name   |   Type   |   Mandatory   |   Description   |
------------------ | -------- | ------------- | --------------- |
symbol             | string   | false         | "BTC","ETH"...  |
contract_type | string   | false      | "this_week","next_week", "quarter" |
contract_code | string   | false      | BTC180914|

### Note：

Note：If there is a number in the Contract Code row，inquiry with Contract_Code. If there is no number，inquiry by Symbol + Contract Type. One of the query conditions must be chosen.

> Response

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC180914",
      "contract_type": "this_week",
      "contract_size": 100,
      "price_tick": 0.001,
      "delivery_date": "20180704",
      "create_date": "20180604",
      "contract_status": 1
     }
    ],
  "ts":158797866555
}
```

### Returning Parameter

Parameter Name               |   Mandatory   |   Type   |   Description                                |   Value Range                                                |
------------------------------ | ------------- | -------- | --------------------------------------------- | ------------------------------------------------------------ |
status                         | true          | string   | Request Processing Result                     | "ok" , "error"                                               |
\<list\>(Attribute Name: data) |               |          |                                               |                                                              |
symbol                         | true          | string   | Product Code                                  | "BTC","ETH"...                                               |
contract_code                  | true          | string   | Contract Code                                 | "BTC180914" ...                                              |
contract_type                  | true          | string   | Contract Type                                 | "this_week","next_week", "quarter"                           |
contract_size                  | true          | decimal  | Contract Value (USD of one contract)          | 10, 100...                                                   |
price_tick                     | true          | decimal  | Minimum Variation of Contract Price           | 0.001, 0.01...                                               |
delivery_date                  | true          | string   | Contract Delivery Date                        | eg "20180720"                                                |
create_date                    | true          | string   | Contract Listing Date                         | eg "20180706"                                                |
contract_status                | true          | int      | Contract Status                               | 0: Delisting,1: Listing,2: Pending Listing,3: Suspension,4: Suspending of Listing,5: In Settlement,6: Delivering,7: Settlement Completed,8: Delivered,9: Suspended Listing |
\</list\>                      |               |          |                                               |                                                              |
ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                                                              |


## Get Contract Index Price Information 

### Example                                                
                                                            
- GET `api/v1/contract_index` 

```shell
curl "https://api.hbdm.com/api/v1/contract_index?symbol=BTC" 
```

### Request Parameter

| Parameter Name | Parameter Type | Mandatory   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| symbol             | string             | false          | "BTC","ETH"... |

> Response

```json
{
  "status":"ok",
  "data": [
     {
       "symbol": "BTC",
       "index_price":471.0817
      }
    ],
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  |
| \<list\>(Attribute Name: data) |               |          |                                               |                 |
| symbol                         | true          | string   | symbol                                        | "BTC","ETH"...  |
| index_price                    | true          | decimal  | Index Price                                   |                 |
| \</list\>                      |               |          |                                               |                 |
| ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                 |

  
## Contract Price Limitation

###  Example      
                                                                          
- GET `api/v1/contract_price_limit` 
 
```shell
curl "https://api.hbdm.com/api/v1/contract_price_limit?symbol=BTC&contract_type=this_week"
```

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| symbol             | string             | false         | "BTC","ETH"...                                    |
| contract_type      | string             | false         | Contract Type ("this_week","next_week","quarter") |
| contract_code      | string             | false         | BTC180914  ...                                    |

###  Note  ：

If there is a number in the Contract Code row，inquiry with Contract_Code. 
If there is no number，inquiry by Symbol + Contract Type. 
One of the query conditions must be chosen.

> Response

```json
{
  "status":"ok",
  "data": 
    {
      "symbol":"BTC",
      "high_limit":443.07,
      "low_limit":417.09,
      "contract_code":"BTC180914",
      "contract_type":"this_week"
     },
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" ,"error"                     |
| \<list\>(Attribute Name: data) |               |          |                                               |                                   |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH" ...                   |
| high_limit                     | true          | decimal  | Highest Buying Price                          |                                   |
| low_limit                      | true          | decimal  | Lowest Selling Price                          |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC180914"  ...               |
| contract_type                  | true          | string   | Contract Type                                 | "this_week","next_week","quarter" |
| \<list\>                       |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## Get Contract Open Interest Information

###  Example   
                                                                                 
- GET `api/v1/contract_open_interest` 

```shell
curl "https://api.hbdm.com/api/v1/contract_open_interest?symbol=BTC&contract_type=this_week"
```

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| symbol             | string             | false         | "BTC","ETH"...                                    |
| contract_type      | string             | false         | Contract Type ("this_week","next_week","quarter") |
| contract_code      | string             | false         | BTC180914                                         |

> Response:

```json
{
  "status":"ok",
  "data":
    [{
      "symbol":"BTC",
      "contract_type": "this_week",
      "volume":123,
      "amount":106,
      "contract_code": "BTC180914"
     }],
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                    |
| \<list\>(Attribute Name: data) |               |          |                                               |                                   |
| symbol                         | true          | string   | Variety code                                  | "BTC", "ETH" ...                  |
| contract_type                  | true          | string   | Contract Type                                 | "this_week","next_week","quarter" |
| volume                         | true          | decimal  | Position quantity(amount)                     |                                   |
| amount                         | true          | decimal  | Position quantity(Currency)                   |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC180914"   ...              |
| \</list\>                      |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## Get the estimated delivery price 

###  Example   
                                                                                 
- GET `api/v1/contract_delivery_price` 

```shell
curl "https://api.hbdm.com/api/v1/contract_delivery_price?symbol=BTC"
```

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| symbol             | string             | true         | "BTC","ETH"...                                    |

> Response:

> Response:

```json
    {
      "status":"ok",
      "data":
        {
          "delivery_price": 3806.4615259197324414715719     
         },
      "ts": 1490759594752
    }
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                    |
| \<list\>(Attribute Name: data) |               |          |                                               |                                   |
| delivery_price                |  true  |  string  |  estimated delivery price   |   |
| \</list\>                      |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## Get Market Depth

###  Example            
                                            
- GET `/market/depth` 

```shell
curl "https://api.hbdm.com/market/depth?symbol=BTC_CQ&type=step5"
```  

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ----------------------------------------------------------------- |
| symbol             | string             | true          | e.g. "BTC_CQ" represents BTC “This Week”，"BTC_CQ" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| type               | string             | true          | ( 150 depth data)step0, step1, step2, step3, step4, step5（merged deep data 0-5）；when step is 0，deep data will not be merged; (20 depth data) step6, step7, step8, step9, step10, step11(merged deep data 7-11); when step is 6, deep data will not be merged. |

>tick illustration:

```
"tick": {
    "id": Message id.
    "ts": Time of Message Generation, unit: millisecond
    "bids": Buying, [price(hanging unit price), vol(this price represent single contract)], According to the descending order of Price
    "asks": Selling, [price(hanging unit Price), vol(this price represent single contract)], According to the ascending order of Price  
    }

```

> Response:

```json
{
  "ch":"market.BTC_CQ.depth.step5",
  "status":"ok",
    "tick":{
      "asks":[
        [6580,3000],
        [70000,100]
        ],
      "bids":[
        [10,3],
        [2,1]
        ],
      "ch":"market.BTC_CQ.depth.step5",
      "id":1536980854,
      "mrid":6903717,
      "ts":1536980854171,
      "version":1536980854
    },
  "ts":1536980854585
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period                |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| asks               | true          | object        | Selling, [price(hanging unit Price), vol(this price represent single contract)], According to the ascending order of Price |                 |
| bids               | true          | object        | Buying, [price(hanging unit price), vol(this price represent single contract)], According to the descending order of Price |                 |
| ts                 | true          | number        | Time of Respond Generation，Unit：Millisecond                |                 |


## Get K-Line Data

###  Example     
                                                                   
- GET `/market/history/kline` 

```shell
curl "https://api.hbdm.com/market/history/kline?period=1min&size=200&symbol=BTC_CQ"
```

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc               |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | -------------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string   | Contract Name        |             | e.g. "BTC_CQ" represents BTC “This Week”，"BTC_CQ" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| period             | true          | string   | K-Line Type          |             | 1min, 5min, 15min, 30min, 60min, 1hour,4hour,1day, 1mon      |
| size               | false         | integer  | Acquisition Quantity | 150         | [1,2000]                                                     |

> Data Illustration：

```
"data": [
  {
        "id": K-Line id,
        "vol": Transaction Volume(amount),
        "count": transaction count
        "open": opening Price
        "close": Closing Price, when the K-line is the latest one，it means the latest price
        "low": Lowest price
        "high": highest price
        "amount": transaction volume(currency), sum(every transaction volume(amount)*every contract value/transaction price for this contract)
   }
]
```

> Response:

```json
{
  "ch": "market.BTC_CQ.kline.1min",
  "data": [
    {
      "vol": 2446,
      "close": 5000,
      "count": 2446,
      "high": 5000,
      "id": 1529898120,
      "low": 5000,
      "open": 5000,
      "amount": 48.92
     },
    {
      "vol": 0,
      "close": 5000,
      "count": 0,
      "high": 5000,
      "id": 1529898780,
      "low": 5000,
      "open": 5000,
      "amount": 0
     }
   ],
  "status": "ok",
  "ts": 1529908345313
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                        |   Value Range   |
| ------------------ | ------------- | ------------- | --------------------------------------------- | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period |                 |
| data               | true          | object        | KLine Data                                    |                 |
| status             | true          | string        | Request Processing Result                     | "ok" , "error"  |
| ts                 | true          | number        | Time of Respond Generation, Unit: Millisecond |                 |


##  Get Market Data Overview

###  Example            
                                         
- GET `/market/detail/merged`
   
```shell
curl "https://api.hbdm.com/market/detail/merged?symbol=BTC_CQ"
```


###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | ------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string   | Contract Name |             | e.g. "BTC_CQ" represents BTC “This Week”，"BTC_CQ" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |

> tick Illustration:

```
"tick": {
    "id": K-Line id,
    "vol": transaction volume（contract）,
    "count": transaction count
    "open": opening price,
    "close": Closing Price, when the K-line is the latest one，it means the latest price
        "low": Lowest price
        "high": highest price
        "amount": transaction volume(currency), sum(every transaction volume(amount)*every contract value/transaction price for this contract)
    "bid": [price of buying one (amount)],
    "ask": [price of selling one (amount)]

  }
```

> Response:

```json
{
  "ch": "market.BTC_CQ.detail.merged",
  "status": "ok",
  "tick": 
    {
      "vol":"13305",
      "ask": [5001, 2],
      "bid": [5000, 1],
      "close": "5000",
      "count": "13305",
      "high": "5000",
      "id": 1529387841,
      "low": "5000",
      "open": "5000",
      "ts": 1529387842137,
      "amount": "266.1"
     },
  "ts": 1529387842137
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，format： market.$symbol.detail.merged |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| tick               | true          | object        | K-Line Data                                                  |                 |
| ts                 | true          | number        | Time of Respond Generation, Unit: Millisecond                |                 |


## The Last Trade of a Contract

###  Example   
                                          
- GET `/market/trade`   

```shell
curl "https://api.hbdm.com/market/trade?symbol=BTC_CQ"
```
 
###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | ------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string   | Contract Name |             | e.g. "BTC_CQ" represents BTC “This Week”，"BTC_CQ" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |

> Tick Illustration：

```
"tick": {
  "id": Message id,
  "ts": Latest Transaction time,
  "data": [
    {
      "id": Transaction id,
      "price": Transaction price,
      "amount": transaction amount,
      "direction": Active transaction direction,
      "ts": transaction time

    }
  ]
}
```

> Response:

```json
{
  "ch": "market.BTC_CQ.trade.detail",
  "status": "ok",
  "tick": {
    "data": [
      {
        "amount": "1",
        "direction": "sell",
        "id": 6010881529486944176,
        "price": "5000",
        "ts": 1529386945343
       }
     ],
    "id": 1529388202797,
    "ts": 1529388202797
    },
  "ts": 1529388202797
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | ----------------------------------------------------------- | ----------- | --------------- |
| ch                 | true          | string   | Data belonged channel，Format： market.$symbol.trade.detail |             |                 |
| status             | true          | string   |                                                             |             | "ok","error"    |
| tick               | true          | object   | Trade Data                                                  |             |                 |
| ts                 | true          | number   | Sending time                                                |             |                 |


## Request a Batch of Trade Records of a Contract

###  Example  
                                                            
- GET `/market/history/trade`
   
```shell 
curl "https://api.hbdm.com/market/history/trade?symbol=BTC_CQ&size=100"
```

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                |   Default   |   Value Range                                                |
| ------------------ | ------------- | ------------- | ------------------------------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string        | Contract Name                         |             | e.g. "BTC_CQ" represents BTC “This Week”，"BTC_CQ" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| size               | false         | number        | Number of Trading Records Acquisition | 1           | [1, 2000]                                                    |

> data Illustration：

```
"data": {
  "id": Message id,
  "ts": Latest transaction time,
  "data": [
    {
      "id": Transaction id,
      "price": transaction price,
      "amount": transaction (amount),
      "direction": active transaction direction
      "ts": transaction time
      }
}
```

> Response:

```json
{
  "ch": "market.BTC_CQ.trade.detail",
  "status": "ok",
  "ts": 1529388050915,
  "data": [
    {
      "id": 601088,
      "ts": 1529386945343,
      "data": [
        {
         "amount": 1,
         "direction": "sell",
         "id": 6010881529486944176,
         "price": 5000,
         "ts": 1529386945343
         }
       ]
    }
   ]
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                      |   Value Range   |
| ------------------ | ------------- | ------------- | ----------------------------------------------------------- | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.$symbol.trade.detail |                 |
| data               | true          | object        | Trade Data                                                  |                 |
| status             | true          | string        |                                                             | "ok"，"error"   |
| ts                 | true          | number        | Time of Respond Generation, Unit: Millisecond               |                 |

## Query information on contract insurance fund balance and estimated clawback rate

- GET `api/v1/contract_risk_info`

```shell
curl "https://api.hbdm.com/api/v1/contract_risk_info"
```
 
###  Request Parameter 

|  Parameter Name                 |   Mandatory  |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Type	 | "BTC","ETH"...，If no data detected, system will return to all contracts by default. |


> Response:

```json
{
  "status": "ok",
  "ts": 158797866555,
  "data": [
    {
      "symbol": "ETH",
      "insurance_fund": 3806.4615259197324414715719,
      "estimated_clawback": 0.0023
    }
  ]
}
```

### Returning Parameter 

|   Parameter Name                |  Mandatory   |  Type   |   Desc              |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| estimated_clawback | true  | decimal | Estimated Clawback Rate |  |
| \</data\> |  |  |  |  |

## Query history records of insurance fund balance

- GET `api/v1/contract_insurance_fund`

```shell
curl "https://api.hbdm.com/api/v1/contract_insurance_fund?symbol=ETH"
```
 
### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type  |     Desc             |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string |Contract Code	 | "BTC","ETH"... |

> Response:

```json

{
  "status": "ok",
  "ts": 158797866555,
  "data":   {
      "symbol": "ETH",
      "tick": [
        {
          "insurance_fund": 3806.4615259197324414715719,
          "ts": 158797866555
         }
       ]
  }
}

```

### Returning Parameter

|    Parameter Name                |    Mandatory	  |   Type  |   Desc              |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| \<data\> |  |  |  | Dictionary Data |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| \<tick\> |  |  |  |  |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| ts | true  | long | Timestamp, Unit: Milesecond |  |
| \</tick\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Query information on Tiered Adjustment Factor

- GET `api/v1/contract_adjustfactor`

```shell
curl "https://api.hbdm.com/api/v1/contract_adjustfactor"
```
 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |    Desc             |    Data Value       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Code	 | "BTC","ETH"...，If no data detected, system will return to all contracts by default. |


> Response:

```json

{
  "status": "ok",
  "data": [
   {
      "symbol": "BTC",
      "list": [
       {
          "lever_rate": 10,
          "ladders": [
           {
             "ladder": 1,
             "min_size": 0,
             "max_size": 100,
             "adjust_factor": 0.1
           },
           {
             "ladder": 2,
             "min_size": 101,
             "max_size": 500,
             "adjust_factor": 0.2
           }
           ]
       }
       ]
   }
   ],
   "ts": 158797866555
}

```

### Returning Parameter 

|    Parameter Name                 |    Mandatory    |    Type    |    Desc            |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| lever_rate   | true     | decimal  | Leverage               |                |
| \<ladderDetail\> |  |  |  |  |
| min_size | true | decimal | Min net position limit |  |
| max_size | true | decimal | Max net position limit |  |
| ladder | true | int | Tier |  |
| adjust_factor | true | decimal | Adjustment Factor |  |
| \</ladderDetail\> |  |  |  |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Query information on open interest

- GET `api/v1/contract_his_open_interest`

```shell
curl "https://api.hbdm.com/api/v1/contract_his_open_interest?symbol=BTC&contract_type=this_week&period=60min&amount_type=1"
```

### Request Parameter 

|   Parameter Name                |   Mandatory   |   Type    |    Desc             |    Data Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | Contract Code   | "BTC","ETH"... |
| contract_type| true | string | Contract Type | Weekly:"this_week", Bi-weekly:"next_week", -Quarterly:"quarter" |
| period | true | string | Period Type | 1 hour:"60min"，4 hours:"4hour"，12 hours:"12hour"，1 day:"1day" |
| size | false | int | Request Amount | Default：48，Data Range [1,200]  |
| amount_type | true | int | Open interest unit | 1:-cont，2:-cryptocurrenty |

> Response:

```json
{
  "status": "ok",
  "data": 
    {
    "symbol": "BTC",
    "contract_type": "this_week",
    "tick": [{
      "volume": 1,
      "amount_type": 1,
      "ts": 1529387842137
      }]
    },
    "ts": 158797866555
}

```

### Returning Parameter 

|  Parameter Name                |   Mandatory 	 |   Type    |    Desc              |   Data Range        |
| ----------------------- | -------- | ------- | ------------------------ | --------------------- |
| status | true | string | Request Processing Result   | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| \<data\> |  |  | Dictionary Data |  |
| symbol | true | string | Contract Code   | "BTC","ETH"... |
| contract_type| true | string | Contract Type  | Weekly:"this_week", Bi-weekly:"next_week", -Quarterly:"quarter"  |
| \<tick\> |  |  |  |  |   
| volume | true | decimal | Open Interest |  |
| amount_type | true | int | Open Interest Unit | 1:-cont，2:- cryptocurrency  |
| ts | true | long | Recording Time |  |
| \</tick\> |  |  |  |  |
| \</data\>|  |  |  |  |

### Notice

- tick field：Tick data is arranged in reverse chronological order；

- data field：Dictionary database.

##  Query information on system status

- GET `api/v1/contract_api_state`

```shell
curl "https://api.hbdm.com/api/v1/contract_api_state"
```

### Request Parameter 

|  Parameter Name                |   Mandatory   |   Type  |   Desc              |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | symbol	 | "BTC","ETH"... If no data detected, system will return to all symbols by default |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "open": 1,
      "close": 1,
      "cancel": 1,
      "transfer_in": 1,
      "transfer_out": 1
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                |    Mandatory   |    Type   |    Desc             |    Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| open | true | int | open order access：when “1”, then access available; when “0”, access unavailable"1" |  |
| close | true | int | close order access：when “1”, then access available; when “0”, access unavailable "1" |  |
| cancel | true | int | order cancellation access：when “1”, then access available; when “0”, access unavailable "1" |  |
| transfer_in | true | int |  deposit access：when “1”, then access available; when “0”, access unavailable "1" |  |
| transfer_out | true | int | withdraw access： when “1”, then access available; when “0”, access unavailable "1" |  |
| \</data\>  |  |  |  |  |

### Notice

- “open” is one of the trading access in “API-Open-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “close” is one of the trading access in “API-Close-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “cancel” is one of the trading access in “API-Cancel-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “transfer_in” is one of the trading access in “Others-Transfer-Deposit”. “On” stands for opening this access; “Off” stands for closing this access；

- transfer_out，”transfer_out” is one of the trading access in “Others-Transfer-Withdraw”. “On” stands for opening this access; “Off” stands for closing this access；

## Top Trader Sentiment Index Function-Account

- GET `api/v1/contract_elite_account_ratio`

```shell
curl "https://api.hbdm.com/api/v1/contract_elite_account_ratio?symbol=BTC&period=60min"
```

### Request Parameter 

|  Parameter Name                 |   Mandatory    |    Type     |    Desc             |   Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | symbol	 | "BTC","ETH"... |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "list": [
        {
         "buy_ratio": 0.2323,
         "sell_ratio": 0.4645,
         "locked_ratio": 0.4142,
         "ts": 158797866555
       }
       ]
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                 |  Mandatory  |   Type   |   Desc              |   Vaue Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | net long accounts ratio |  |
| sell_ratio | true | decimal | net short accounts ratio |  |
| locked_ratio | true | decimal | locked accounts ratio |  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Top Trader Sentiment Index Function-Position

- GET `api/v1/contract_elite_position_ratio`


```shell
curl "https://api.hbdm.com/api/v1/contract_elite_position_ratio?symbol=BTC&period=60min"
```

### Request Parameter 

|  Parameter Name                |    Mandatory   |   Type  |       Desc             |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | symbol	 | "BTC","ETH"... |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "list": [
        {
         "buy_ratio": 0.2323,
         "sell_ratio": 0.4645,
         "ts": 158797866555
       }
       ]
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|  Parameter Name                |    Mandatory   |    Type    |    Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond|  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | Net long position ratio |  |
| sell_ratio | true | decimal | Net short position ratio  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

##  Request Liquidation Order Information

- GET `api/v1/contract_liquidation_orders`

```shell
curl "https://api.hbdm.com/api/v1/contract_liquidation_orders?symbol=BTC&trade_type=0&create_date=7"
```

### Request Parameter 

|   Parameter Name    |  Mandatory  |  Type   |    Desc          |    Default   |    Value Range                                |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | symbol        |         | "BTC","ETH"...                           |
| trade_type      | true     | int  | trading types       |               | when “0”, request fully filled liquidated orders; when “5’, request liquidated close orders; when “6”, request liquidated open orders |
| create_date | true     | int    | date        |         | 7，90（ 7 days or 90 days）        |
| page_index | false     | int    | page, system sets page 1 by default without further instruction           |         |         |
| page_size | false     | int    | system sets page 20 by default without further instruction. Max page size is 50.        |         |        |

> Response:

```json

{
  "status": "ok",
  "data":{
    "orders":[
      {
        "symbol": "BTC",
        "contract_code": "BTC180914",    
        "direction": "buy",
        "offset": "close",
        "volume": 111,
        "price": 1111,
        "created_at": 1408076414000
      }
     ],
    "total_page":15,
    "current_page":3,
    "total_size":3
    },
  "ts": 1490759594752
}

```

### Returning Parameter 

|   Parameter Name               |   Mandatory   |    Type   |     Desc             |   Value Range     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status                 | true     | string | Request Processing Result             |              |
| \<object\>(object name: data) |          |         |                    |              |
| \<list\>( object name: orders) |          |         |                    |              |
| symbol                 | true     | string  | symbol             |              |
| contract_code          | true     | string  | contract code         |"BTC180914" ...  |
| direction              | true     | string  | "buy":buy"sell": sell     |              |
| offset              | true     | string  | "open":open "close":  close      |              
| volume           | true     | decimal | liquidated order quantity            |              |
| price      | true     | decimal | bankruptcy price            |              |
| created_at            | true     | long    | liquidation time            |              |
| \</list\>              |          |         |                    |              |
| total_page             | true     | int     | total page              |              |
| current_page           | true     | int     |   current page           |              |
| total_size             | true     | int     |   total size             |              |
| \</object\>            |          |         |                    |              |
| ts                     | true     | long    |   timestamp             |              |

# HuobiDM Account Interface

## User’s Account Information

###  Example          
                                      
- POST `api/v1/contract_account_info`  

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |   Default   |   Value Range                                           |
| ------------------ | ------------- | -------- | ------------ | ----------- | ------------------------------------------------------- |
| symbol             | false         | string   | Variety code |             | "BTC","ETH"...if default, return to all types defaulted |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "margin_balance": 1,
      "margin_position": 0,
      "margin_frozen": 3.33,
      "margin_available": 0.34,
      "profit_real": 3.45,
      "profit_unreal": 7.45,
      "withdraw_available":4.0989898,
      "risk_rate": 100,
      "liquidation_price": 100,
      "adjust_factor": 0.1,
      "lever_rate": 10,
      "margin_static": 1
     },
    {
      "symbol": "ETH",
      "margin_balance": 1,
      "margin_position": 0,
      "margin_frozen": 3.33,
      "margin_available": 0.34,
      "profit_real": 3.45,
      "profit_unreal": 7.45,
      "withdraw_available":4.7389859,
      "risk_rate": 100,
      "liquidation_price": 100,
      "adjust_factor": 0.1,
      "lever_rate": 10,
      "margin_static": 1
     }
   ],
  "ts":158797866555
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  |
| \<list\>(Attribute Name: data) |               |          |                                               |                 |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...  |
| margin_balance                 | true          | decimal  | Account rights                                |                 |
| margin_position                | true          | decimal  | Position Margin                               |                 |
| margin_frozen                  | true          | decimal  | Freeze margin                                 |                 |
| margin_available               | true          | decimal  | Available margin                              |                 |
| profit_real                    | true          | decimal  | Realized profit                               |                 |
| profit_unreal                  | true          | decimal  | Unrealized profit                             |                 |
| risk_rate                      | true          | decimal  | risk rate                                     |                 |
| liquidation_price              | true          | decimal  | Estimated liquidation price                   |                 |
| withdraw_available             | true          | decimal  | Available withdrawal                          |                 |
| lever_rate                     | true          | decimal  | Leverage Rate                                 |                 |
| adjust_factor                | true     | decimal  |  Adjustment Factor               |                |  
| margin_static                | true     | decimal  | Static Margin                |                |
| \</list\>                      |               |          |                                               |                 |
| ts                             | number        | long     | Time of Respond Generation, Unit: Millisecond |                 |


## User’s Position Information

###  Example                           
                     
- POST  `api/v1/contract_position_info` 

### Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |   Default   |   Value Range                                           |
| ------------------ | ------------- | -------- | ------------ | ----------- | ------------------------------------------------------- |
| symbol             | false         | string   | Variety code |             | "BTC","ETH"...if default, return to all types defaulted |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC180914",
      "contract_type": "this_week",
      "volume": 1,
      "available": 0,
      "frozen": 0.3,
      "cost_open": 422.78,
      "cost_hold": 422.78,
      "profit_unreal": 0.00007096,
      "profit_rate": 0.07,
      "profit": 0.97,
      "position_margin": 3.4,
      "lever_rate": 10,
      "direction":"buy",
      "last_price":7900.17
     }
    ],
 "ts": 158797866555
}
```

### Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                       |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | ----------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                      |
| \<list\>(Attribute Name: data) |               |          |                                               |                                     |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...                      |
| contract_code                  | true          | string   | Contract Code                                 | "BTC180914" ...                     |
| contract_type                  | true          | string   | Contract Type                                 | "this_week", "next_week", "quarter" |
| volume                         | true          | decimal  | Position quantity                             |                                     |
| available                      | true          | decimal  | Available position can be closed              |                                     |
| frozen                         | true          | decimal  | frozen                                        |                                     |
| cost_open                      | true          | decimal  | Opening average price                         |                                     |
| cost_hold                      | true          | decimal  | Average price of position                     |                                     |
| profit_unreal                  | true          | decimal  | Unrealized profit and loss                    |                                     |
| profit_rate                    | true          | decimal  | Profit rate                                   |                                     |
| profit                         | true          | decimal  | profit                                        |                                     |
| position_margin                | true          | decimal  | Position margin                               |                                     |
| lever_rate                     | true          | int      | Leverage rate                                 |                                     |
| direction                      | true          | string   | Transaction direction                         |                                     |
| last_price                     | true          | decimal  | Latest price                                  |                                     |
| \</list\>                      |               |          |                                               |                                     |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                     |


## Query assets information of all sub-accounts under the master account

- POST `api/v1/contract_sub_account_list`

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**        | **Default value** | **Value range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | false     | string | type code          |         | "BTC","ETH"...  ,if blank, it will return all contract types by default                          |

> Response:

```json

{
	"status": "ok",
	"ts": 1499223904680,
	"data": [{
			"sub_uid": 9910049,
			"list": [{
					"symbol": "BTC",
					"margin_balance": 1,
					"liquidation_price": 100,
					"risk_rate": 100
				},
				{
					"symbol": "ETH",
					"margin_balance": 1,
					"liquidation_price": 100,
					"risk_rate": 100
				}
			]
		},
		{
			"sub_uid": 9910048,
			"list": [{
					"symbol": "BTC",
					"margin_balance": 1,
					"liquidation_price": 100,
					"risk_rate": 100
				},
				{
					"symbol": "ETH",
					"margin_balance": 1,
					"liquidation_price": 100,
					"risk_rate": 100
				}
			]
		}
	]
}

```

### Return parameters
 
| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts | true  | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| sub_uid | true  | long | sub-account UID |  |
| \<list\> |  |  |  |  |
| symbol | true | string | type code | "BTC","ETH"... |
| margin_balance | true | decimal | account equity |  |
| liquidation_price | true | decimal | estimated liquidation price |  |
| risk_rate | true | decimal | margin rate |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |


- Notice

 Only return data for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission). 


## Query a single sub-account's assets information

- POST `api/v1/contract_sub_account_info`

### Request Parameters


| **Parameter name**    | **Must fill or not** | **Type** | **Description**        | **Default value** | **Value range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol | false | string | type code	 | "BTC","ETH"...，if blank, it will return all contract types by default  |
| sub_uid | true | long | sub-account UID	 |  |

> Response:

```json
{
  "status": "ok",
  "data":  [ 
     {
        "symbol": "BTC",
        "margin_balance": 1,
        "margin_position": 0,
        "margin_frozen": 3.33,
        "margin_available": 0.34,
        "profit_real": 3.45,
        "profit_unreal": 7.45,
        "withdraw_available":4.0989898,
        "risk_rate": 100,
        "lever_rate": 3,
        "liquidation_price": 100,
        "adjust_factor": 0.1,
        "margin_static": 3
      }
    ],
  "ts":158797866555
}
```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts                       | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"...when the$symbol value is "*", it will subscribe all contract types |
| margin_balance                  | true     | decimal  | account equity               |                |
| margin_position                 | true     | decimal  | position margin (the margin used by current positions)               |                |
| margin_frozen                 | true     | decimal  | frozen margin               |                |
| margin_available                 | true     | decimal  | available margin               |                |
| profit_real                 | true     | decimal  | realized profits and losses               |                |
| profit_unreal                 | true     | decimal  | unrealized profits and losses               |                |
| risk_rate                 | true     | decimal  | margin rate               |                |
| liquidation_price                | true     | decimal  | estimated liquidation price               |                |
| withdraw_available                | true     | decimal  | available transfer amount               |                |
| lever_rate                | true     | decimal  | leverage ratios               |                |
| adjust_factor                | true     | decimal  |  Adjustment Factor               |                |  
| margin_static                | true     | decimal  | Static Margin                |                |
| \</data\> |  |  |  |  |


- Notice

   Only query account information for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission);
  
   No data return for sub-accounts which has logged in hbdm but have not gained trading permission/activated.

## Query a single sub-account's position information

- POST `api/v1/contract_sub_position_info`

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**        | **Default value** | **Value range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol | false | string | type code	 | "BTC","ETH"...，if blank, it will return all contract types by default  |
| sub_uid | true | long | sub-account UID	 |  |

> Response:

```json
{
  "status": "ok",
  "ts": 158797866555,
  "data":[ 
     {
         "symbol": "BTC",
         "contract_code": "BTC180914",
         "contract_type": "this_week",
         "volume": 1,
         "available": 0,
         "frozen": 0.3,
         "cost_open": 422.78,
         "cost_hold": 422.78,
         "profit_unreal": 0.00007096,
         "profit_rate": 0.07,
         "profit": 0.97,
         "position_margin": 3.4,
         "lever_rate": 10,
         "direction":"buy",
         "last_price":6000 
     }
   ]
}
```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts                       | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"... |
| contract_code                | true     | string  |  contract code             | "BTC180914" ... |
| contract_type                | true     | string  | contract type              | Weekly:"this_week", Biweekly:"next_week", Quarterly:"quarter" |
| volume                | true     | decimal	  |  open interest             |  |
| available               | true     | decimal	  | available positions to close              |  |
| frozen               | true     | decimal	  |  amount of frozen positions             |  |
| cost_open               | true     | decimal	  |  average price of open positions             |  |
| cost_hold               | true     | decimal	  | average price of positions              |  |
| profit_unreal               | true     | decimal	  | unrealized profits and losses              |  |
| profit_rate               | true     | decimal	  | profit rate              |  |
| profit               | true     | decimal	  | profits              |  |
| position_margin               | true     | decimal	  | position margin              |  |
| lever_rate               | true     | int	  | leverage ratios              |  |
| direction               | true     | string	  |   transaction direction of positions           |  "buy":long "sell":short |
| last_price                     | true          | decimal  | Latest price                                  |                                     |
| \</data\> |  |  |  |  |


## Query account financial records

- POST `api/v1/contract_financial_record`
 
### Request Parameters

| **Parameter name**                | **Must fill or not** | **Type**  | **Description**             | **Value range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | contract type code   | "BTC","ETH"... |
| type | false | string | if not fill this parameter, it will query all types 【please use "," to seperate multiple types】 | close long：3，close short：4，fees for open positions-taker：5，fees for open positions-maker：6，fees for close positions-taker：7，fees for close positions-maker：8，close long for delivery：9，close short for delivery：10，delivery fee：11，close long for liquidation：12，lose short for liquidation：13，transfer from spot exchange to contract exchange：14，tranfer from contract exchange to spot exchange：15，settle unrealized PnL-long positions：16，settle unrealized PnL-short positions：17，clawback：19，system：26，activity prize rewards：28，rebate：29 |
| create_date | false | int | 7，90 (7days ，90days) ，default value is 7 when not fill this parameter|  |
| page_index | false | int | which page, default value is "1st page" when not fill this parameter |  |
| page_size | false | int | the default value is "20" when not fill this parameter, should ≤50 |  |

> Response:

```json
{
      "status": "ok",
  "data":{
    "financial_record" : [
      {
      "id": 192838272,
      "ts": 1408076414000,
      "symbol":"BTC",
      "type":1, 
      "amount":1
      },
      {
        .........
      }
    ],
         "total_page":15,
         "current_page":3,
         "total_size":3
        },
  "ts": 1490759594752
}
```


### Return parameters

| **Parameter name**                | **Must fill or not** | **Type**  | **Description**             | **Value range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | processing result of requests    | "ok" , "error" |
| ts | true  | long | response create time point，unit：ms |  |
| \<data\> |  |  | dicitionary type |  |
| \<financial_record\> |  |  |  |  |
| id | true  | long |  |  |
| ts | true  | long | create time |  |
| symbol | true  | string | contract type code | "BTC","ETH"... |
| type | true  | int | transaction type | close long：3，close short：4，fees for open positions-taker：5，fees for open positions-maker：6，fees for close positions-taker：7，fees for close positions-maker：8，close long for delivery：9，close short for delivery：10，delivery fee：11，close long for liquidation：12，lose short for liquidation：13，transfer from spot exchange to contract exchange：14，tranfer from contract exchange to spot exchange：15，settle unrealized PnL-long positions：16，settle unrealized PnL-short positions：17，clawback：19，system：26，activity prize rewards：28，rebate：29 |
| amount | true  | decimal | amount |  |
| \</financial_record\> |  |  |  |  |
| total_page | true  | int | total page |  |
| current_page | true  | int | current page |  |
| total_size | true  | int | total size |  |
| \</data\> |  |  |  |  |

## Query contract information on order limit

- POST `api/v1/contract_order_limit`
 
### Request Parameter

|   Parameter Name                |   Mandatory  |   Type   |    Description             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | contract code	 | "BTC","ETH"...，If no data detected, system will return to all contracts by default |
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Flash Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order |

> Response:

```json
{
  "status": "ok",
  "data":  {
      "order_price_type": "limit",
      "list":[
      {
          "symbol": "BTC",
          "types": [
             {
              "contract_type": "this_week",
              "open_limit": 3000,
              "close_limit": 3000
             },
             {
              "contract_type": "next_week",
              "open_limit": 3000,
              "close_limit": 3000
             },     
             {
              "contract_type": "quarter",
              "open_limit": 3000,
              "close_limit": 3000
             }
           ]
      }
      ]
   },
 "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                |   Mandatory  |    Type   |    Desc              |    Value Range Í      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> | |  |  |  |    
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Flash Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order |
| \<list\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| \<types\> |  |  |  |  |
| contract_type| true | string | Contract Type | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| open_limit | true | long | Max open order limit | |
| close_limit | true | long | Max close order limit |  |
| \</types\> |  |  |  |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Query information on contract trading fee
 
- POST `api/v1/contract_fee`
 
### Request Parameter 

|   Parameter Name                 |   Mandatory   |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Code	 | "BTC","ETH"...，If no data detected, system will return to all contract by default|

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "open_maker_fee": "-0.00025",
      "open_taker_fee": "0.00075",
      "close_maker_fee": "-0.00025",
      "close_taker_fee": "0.00075",
      "delivery_fee": "0.0005"
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|  Parameter Name                |   Mandatory  |   Type  |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| open_maker_fee | true | string | Open maker order fee, decimal | |
| open_taker_fee | true | string | Open taker order fee, decimal | |
| close_maker_fee | true | string | Close maker order fee, decimal  | |
| close_taker_fee | true | string | Close taker order fee, decimal  | |
| delivery_fee | true | string | delivery fee, decimal  | |
| \</data\> |  |  |  |  |

## Query information on Transfer Limit

- POST `api/v1/contract_transfer_limit`
 
 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Code	 | "BTC","ETH"...，If no data detected, system will return to all contracts by default. |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "transfer_in_max_each": 5000,
      "transfer_in_min_each": 5000,
      "transfer_out_max_each": 5000,
      "transfer_out_min_each": 5000,
      "transfer_in_max_daily": 5000,
      "transfer_out_max_daily": 5000,
      "net_transfer_in_max_daily": 5000,
      "net_transfer_out_max_daily": 5000
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                |   Mandatory   |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| transfer_in_max_each | true | decimal | Max limit of a single deposit |  |
| transfer_in_min_each | true | decimal | Min limit of a single deposit |  |
| transfer_out_max_each | true | decimal | Max limit of a single withdrawal |  |
| transfer_out_min_each | true | decimal | Min limit of a single withdrawal |  |
| transfer_in_max_daily | true | decimal | Max daily limit of total deposits |  |
| transfer_out_max_daily | true | decimal | Max daily limit of totally withdrawals |  |
| net_transfer_in_max_daily | true | decimal | Max daily limit of net total deposits |  |
| net_transfer_out_max_daily | true | decimal | Max daily limit of net total withdrawals |  |
| \</data\> |  |  |  |  |

##  Query information on position limit

- POST `api/v1/contract_position_limit`
  
### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type   |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Code	 | "BTC","ETH"...，If no data detected, system will return to all contracts by default. |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "list": [
        {
         "contract_type": "all",
         "buy_limit": 5000,
         "sell_limit": 5000
       },
        {
         "contract_type": "this_week",
         "buy_limit": 3000,
         "sell_limit": 3000
       },
        {
         "contract_type": "next_week",
         "buy_limit": 3000,
         "sell_limit": 3000
       },     
        {
         "contract_type": "quarter",
         "buy_limit": 3000,
         "sell_limit": 3000
       }
       ]
    }
 ],
 "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Responding Generation, Unit: milesecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| contract_type| true | string | Contract Type | Weekly :"this_week", Bi-weekly:"next_week", Quarterly:"quarter"，All contracts:“all” |
| buy_limit | true | decimal | Max long position limit, Unit: Cont |  |
| sell_limit | true | decimal | Max short position limit, Unit: Cont |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |


# HuobiDM Trade Interface

##  Place an Order 

###  Example  

- POST `api/v1/contract_order`

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ------------------------------------------------------------ |
| symbol             | string             | false         | "BTC","ETH"...                                               |
| contract_type      | string             | false         | Contract Type ("this_week": "next_week": "quarter":)         |
| contract_code      | string             | false         | BTC180914                                                    |
| client_order_id    | long               | false         | Clients fill and maintain themselves |
| price              | decimal            | false          | Price                                                        |
| volume             | long               | true          | Numbers of orders (amount)                                   |
| direction          | string             | true          | Transaction direction                                        |
| offset             | string             | true          | "open", "close"                                              |
| lever_rate         | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate |
| order_price_type   | string             | true     | "limit": Limit Order，"opponent":BBO，"lightning": Flash Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order |

###  Note ： 

If there is a number in the Contract Code row，inquiry with Contract_Code. 

If there is no number，inquiry by Symbol + Contract Type.

Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.

open long: direction - buy、offset - open

close long: direction -sell、offset - close

open short: direction -sell、offset - open

close short: direction -buy、offset - close

No need to transfer BBO order price(ask 1and bid 1) parameter, optimal_5: top 5 optimal BBO price, optimal_10：top 10 optimal BBO price, optimal_20：top 20 optimal BBO price (No need to transfer price data) ，limit": limit order, "post_only": maker order only (price data transfer is needed),IOC :Immediate-Or-Cancel Order,FOK:Fill-Or-Kill Order.

> Response:

```json
{
  "status": "ok",
  "order_id": 633766664829804544,
  "order_id_str": "633766664829804544",
  "client_order_id": 9086,
  "ts": 158797866555
}
```


###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status             | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| order_id           | true          | bigint     | Order ID                                                     |                 |
| order_id_str           | true          | string     | Order ID                                                     |                 |
| client_order_id    | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| ts                 | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

##  Place a Batch of Orders

###  Example  

- POST `/v1/contract_batchorder`

###  Request Parameter  

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
| \<list\>(Attribute Name: orders_data) |                    |               |                                                              |
| symbol                                | string             | false         | "BTC","ETH"...                                               |
| contract_type                         | string             | false         | Contract Type: "this_week": "next_week": "quarter":          |
| contract_code                         | string             | false         | BTC180914                                                     |
| client_order_id                       | long               | false          | Clients fill and maintain themselves |
| price                                 | decimal            | false          | Price                                                        |
| volume                                | long               | true          | Numbers of orders (amount)                                   |
| direction                             | string             | true          | Transaction direction                                        |
| offset                                | string             | true          | "open": "close"                                              |
| leverRate                            | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate |
| orderPriceType   | string             | true     | "limit": Limit Order，"opponent":BBO，"lightning": Flash Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order |
| \</list\>                             |                    |               |                                                              |

###  Note  ：

If there is a number in the Contract Code row,inquiry with Contract_Code. 

If there is no number,inquiry by Symbol + Contract Type.

Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.

No need to transfer BBO order price(ask 1and bid 1) parameter, optimal_5: top 5 optimal BBO price, optimal_10：top 10 optimal BBO price, optimal_20：top 20 optimal BBO price (No need to transfer price data) ，limit": limit order, "post_only": maker order only (price data transfer is needed),IOC :Immediate-Or-Cancel Order,FOK:Fill-Or-Kill Order

> Response:

```json
{
  "status": "ok",
  "data": {
    "errors":[
      {
        "index":0,
        "err_code": 200417,
        "err_msg": "invalid symbol"
       },
      {
        "index":3,
        "err_code": 200415,
        "err_msg": "invalid symbol"
       }
     ],
    "success":[
      {
        "index":1,
        "order_id":633766664829804544,
        "order_id_str": "633766664829804544",
        "client_order_id":1344567
       },
      {
        "index":2,
        "order_id":633766664829804544,
        "order_id_str": "633766664829804544",
        "client_order_id":1344569
       }
     ]
   },
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status                            | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| \<list\>(Attribute Name: errors)  |               |          |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| err_code                          | true          | int      | Error code                                                   |                 |
| err_msg                           | true          | string   | Error information                                            |                 |
| \</list\>                         |               |          |                                                              |                 |
| \<list\>(Attribute Name: success) |               |          |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| order_id                          | true          | bigint     | Order ID                                                     |                 |
| order_id_str                          | true          | string     | Order ID                                                     |                 |
| client_order_id                   | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| \</list\>                         |               |          |                                                              |                 |
| ts                                | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

## Cancel an Order 

###  Example   

- POST  `api/v1/contract_cancel`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 20 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID (different IDs are separated by ",", maximum 20 orders can be withdrew at one time) |
| symbol             | true          | string   | "BTC","ETH"...                                               |

###  Note  ：

Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

The return data from Cancel An Order Interface only means that order cancelation designation is executed successfully. To check cancelation result, please check your order status at Get Information Of An Order interface.

> Response: result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)

```json
{
  "status": "ok",
  "errors":[
    {
      "order_id":"633766664829804544",
      "err_code": "1002",
      "err_msg": "order doesn’t exist"
     },
    {
      "order_id":"633766664829804544",
      "err_code": "1002",
      "err_msg": "order doesn’t exist"
     }
   ],
  "success":"161256,1344567",
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                    |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                                 | "ok" , "error"  |
| \<list\>(Attribute Name: errors) |               |          |                                                           |                 |
| order_id                         | true          | string   | Order ID                                                  |                 |
| err_code                         | true          | int      | Error code                                                |                 |
| err_msg                          | true          | string   | Error information                                         |                 |
| \</list\>                        |               |          |                                                           |                 |
| successes                        | true          | string   | Successfully withdrew list of order_id or client_order_id |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond             |                 |


## Cancel All Orders 

###  Example  

- POST `api/v1/contract_cancelall`

> Request:
```json
{
 "symbol": "BTC"
}
```

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                          |
| ------------------ | ------------- | -------- | ------------------------------- |
| symbol             | true          | string   | Variety code，eg "BTC","ETH"... |
| contract_code             | false         | string   | contract_code            |
| contract_type             | false         | string   | contract_type           |

### Note

1.  Send symbol to cancel all the contracts of that kind of symbol, e.g. send “BTC” to cancel all BTC weekly, biweekly and quarterly contracts.

2.  Send contract_code to cancel the contracts of that code.

3.  Send symbol+contract_type to cancel the certain contracts under the symbol of that contract_type, e.g. send “BTC” and “this week”, then the BTC weekly contracts will be cancelled.

> Response:result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)
 
```json
{
  "status": "ok",
  "data": {
    "errors":[
      {
        "order_id":"633766664829804544",
        "err_code": 200417,
        "err_msg": "invalid symbol"
       },
      {
        "order_id":"633766664829804544",
        "err_code": 200415,
        "err_msg": "invalid symbol"
       }
      ],
    "successes":"161256,1344567"
   },
  "ts": 1490759594752
}
```

> Error：

```json
{
  "status": "error",
  "err_code": 20012,
  "err_msg": "invalid symbol",
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                     | "ok" , "error"  |
| successes                        | true          | string   | Successful order                              |                 |
| \<list\>(Attribute Name: errors) |               |          |                                               |                 |
| order_id                         | true          | String   | Order ID                                      |                 |
| err_code                         | true          | int      | failed order error messageError code          |                 |
| err_msg                          | true          | int      | failed order information                      |                 |
| \</list\>                        |               |          |                                               |                 |
| successes                        | true          | string   | Successful order                              |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond |                 |

## Place Flash Close Order

- POST ` api/v1/lightning_close_position`

 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | String | Contract Code	 | "BTC","ETH"... |
| contract_type | false | String | Contract Type | “this_week”:Weekly，“next_week”:Bi-weekly，“quarter”:Quarterly|
| contract_code | false | String | Contract Code | BTC190903 |
| volume | true | Number | Order Quantity(Cont) |  |
| direction | true | String | “buy”:Open，“sell”:Close |  |
| client_order_id | false | Number | Client needs to provide unique API and have to maintain the API themselves afterwards |  |

> Response:

```json
{
  "status": "ok",
  "data": {
    "order_id": 633766664829804544,
    "order_id_str": "633766664829804544",
    "client_order_id": 9086
  },
     "ts": 158797866555
}

```

### Returning Parameter 

|   Parameter Name                 |   Mandatory  |   Type   |   Desc              |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" :Order placed successfully, "error"：Order failed |
| ts | true  | long | Time of Respond Generation, Unit: Milesecond |  |
| <data> |  |  |  | Dictionary |
| order_id | true  | bigint | Order ID [Different users may share the same order ID] |  |
| order_id_str | true  | string | Order ID |  |
| client_order_id | false | Number | user’s own order ID |  |
| </data> |  |  |  |  |

> Error：

```json
{
    "status": "error",
    "err_code": 20012,
    "err_msg": "invalid symbol",
    "ts": 1490759594752
}

```


## Get Information of an Order

###  Example   

- POST `api/v1/contract_order_info`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time) |
| symbol             | true          | string   | "BTC","ETH"...                                               |

###  Note  ：

Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

client_order_id，order status query is available for orders placed within 24 hours; Otherwise, clients cannot check orders placed beyond 24 hours.

> Response:

```json
{
  "status": "ok",
  "data":[
    {
      "symbol": "BTC",
      "contract_type": "this_week",
      "contract_code": "BTC180914",
      "volume": 111,
      "price": 1111,
      "order_price_type": "limit",
      "direction": "buy",
      "offset": "open",
      "lever_rate": 10,
      "order_id": 633766664829804544,
      "order_id_str": "633766664829804544",
      "client_order_id": 10683,
      "order_source": "web",
      "created_at": 1408076414000,
      "trade_volume": 1,
      "trade_turnover": 1200,
      "fee": 0,
      "trade_avg_price": 10,
      "margin_frozen": 10,
      "profit ": 10,
      "status": 0
     },
    {
      "symbol": "ETH",
      "contract_type": "this_week",
      "contract_code": "ETH180921",
      "volume": 111,
      "price": 1111,
      "order_price_type": "limit",
      "direction": "buy",
      "offset": "open",
      "lever_rate": 10,
      "order_id": 633766664829804544,
      "order_id_str": "633766664829804544",
      "client_order_id": 10683,
      "order_source": "web",
      "created_at": 1408076414000,
      "trade_volume": 1,
      "trade_turnover": 1200,
      "fee": 0,
      "trade_avg_price": 10,
      "margin_frozen": 10,
      "profit ": 10,
      "status": 0
     }
    ],
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                       |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | ----------------------------------- |
| status                         | true          | string   | Request Processing Result                                    | "ok" , "error"                      |
| \<list\>(Attribute Name: data) |               |          |                                                              |                                     |
| symbol                         | true          | string   | Variety code                                                 |                                     |
| contract_type                  | true          | string   | Contract Type                                                | "this_week", "next_week", "quarter" |
| contract_code                  | true          | string   | Contract Code                                                | "BTC180914" ...                     |
| volume                         | true          | decimal  | Numbers of order                                             |                                     |
| price                          | true          | decimal  | Price committed                                              |                                     |
| order_price_type               | true          | string   | "limit", "opponent","post_only" Position limit will be applied to post_only while order limit will not. |                                     |
| direction                      | true          | string   | Transaction direction                                        |                                     |
| offset                         | true          | string   | "open": "close"                                              |                                     |
| lever_rate                     | true          | int      | Leverage rate                                                | 1\\5\\10\\20                        |
| order_id                       | true          | bigint     | Order ID                                                     |                                     |
| order_id_str                       | true          | string     | Order ID                                                     |                                     |
| client_order_id                | true          | long     | Client order ID                                              |                                     |
| created_at                     | true          | long     | Creation time                                             |                                     |
| trade_volume                   | true          | decimal  | Transaction quantity                                         |                                     |
| trade_turnover                 | true          | decimal  | Transaction aggregate amount                                 |                                     |
| fee                            | true          | decimal  | Servicefee                                                   |                                     |
| trade_avg_price                | true          | decimal  | Transaction average price                                    |                                     |
| margin_frozen                  | true          | decimal  | Freeze margin                                                |                                     |
| profit                         | true          | decimal  | profit                                                       |                                     |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling. |                                     |
| order_source                   | true          | string   | Order source（system、web、api、m 、risk、settlement） |                                     |
| \</list\>                      |               |          |                                                              |                                     |
| ts                             | true          | long     | Timestamp                                                    |                                     |



## Order details acquisition

###  Example   

- POST `api/v1/contract_order_detail`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                        |
| ------------------ | ------------- | -------- | ---------------------------------- |
| symbol             | true          | string   | "BTC","ETH"...                |
| order_id           | true          | bigint     | Order ID                      |
| created_at           | true          | long     | Timestamp                     |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| page_index         | false         | int      | Page number, default 1st page |
| page_size          | false         | int      | Default 20，no more than 50   |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

created_at should use timestamp of long type as 13 bits (include Millisecond), if send the accurate timestamp for "created_at", query performance will be improved.

eg. the timestamp "2019/10/18 10:26:22" can be changed：1571365582123.It can also directly obtain the timestamp（ts) from the returned ordering interface(contract_order) to query the corresponding orders.

Please note that created_at can't send "0"

> Response:

```json
{
  "status": "ok",
  "data":{
    "symbol": "BTC",
    "contract_type": "this_week",
    "contract_code": "BTC180914",
    "volume": 111,
    "price": 1111,
    "order_price_type": "limit",
    "direction": "buy",
    "offset": "open",
    "lever_rate": 10,
    "margin_frozen": 10,
    "profit": 10,
    "order_source": "web",
    "created_at": 1408076414000,
    "contract_order_detail": 10000,
    "final_interest": 0,
    "adjust_value": 1,
    "trades":[
      {
        "id":"21315414825-6141291349-1",
        "trade_id":112,
        "trade_volume":1,
        "trade_price":123.4555,
        "trade_fee":0.234,
        "trade_turnover":34.123,
        "role": "maker",
        "created_at": 1490759594752
       }
      ],
    "total_page":15,
    "total_size":3,
    "current_page":3
    },
  "ts": 1490759594752
}
```

> Error:

```json
{
 "status":"error",
 "err_code":20029,
 "err_msg": "invalid symbol",
 "ts": 1490759594752
}
```

###  Returning Parameter 

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                            | true          | string   | Request Processing Result                                    | "ok" , "error"                    |
| \<object\> (Attribute Name: data) |               |          |                                                              |                                   |
| symbol                            | true          | string   | Variety code                                                 |                                   |
| contract_type                     | true          | string   | Contract Type                                                | "this_week","next_week","quarter" |
| contract_code                     | true          | string   | Contract Code                                                | "BTC180914" ...                   |
| lever_rate                        | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| direction                         | true          | string   | Transaction direction                                        |                                   |
| offset                            | true          | string   | "open": "close"                                              |                                   |
| volume                            | true          | decimal  | Number of Order                                              |                                   |
| price                             | true          | decimal  | Price committed                                              |                                   |
| created_at                        | true          | long     | Creation time                                             |                                   |
| order_source                      | true          | string   | Order Source                                                 |                                   |
| order_price_type                  | true          | string   | "limit", "opponent","post_only" Position limit will be applied to post_only while order limit will not. |                                   |
| margin_frozen                     | true          | decimal  | Freeze margin                                                |                                   |
| profit                            | true          | decimal  | profit                                                       |                                   |
| total_page                        | true          | int      | Page in total                                                |                                   |
| current_page                      | true          | int      | Current Page                                                 |                                   |
| total_size                        | true          | int      | Total Size                                                   |                                   |
| instrument_price                        | true          | decimal      | Liquidation price                                                  |                                   |
| final_interest                        | true          | decimal      | Account Balance After Liquidation                                                   |                                   |
| adjust_value                        | true          | decimal      | Adjustment Factor of Liquidating Order                                                 |                                   |
| \<list\> (Attribute Name: trades) |               |          |                                                              |                                   |
| id                          | true          | string     |  Id, You can use trade_id and the new field "id" to combine a unique trade ID.                                         |                                   |
| trade_id                          | true          | long     | Match Result id , You can use trade_id and the new field "id" to combine a unique trade ID.                                             |                                   |
| trade_price                       | true          | decimal  | Match Price                                                  |                                   |
| trade_volume                      | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                    | true          | decimal  | Transaction price                                            |                                   |
| trade_fee                         | true          | decimal  | Transaction Service fee                                      |                                   |
| role                        | true          | string  |   taker or maker                              |                                                         |
| created_at                        | true          | long     | Creation time                                                |                                   |
| \</list\>                         |               |          |                                                              |                                   |
| \</object \>                      |               |          |                                                              |                                   |
| ts                                | true          | long     | Timestamp                                                    |                                   |


## Current unfilled commission acquisition

###  Example  

- POST  `api/v1/contract_openorders`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | --------------- |
| symbol             | true         | string   | Variety code                |             | "BTC","ETH"...  |
| page_index         | false         | int      | Page, default 1st page      | 1           |                 |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                 |

> Response:

```json
{
  "status": "ok",
  "data":{
    "orders":[
      {
         "symbol": "BTC",
         "contract_type": "this_week",
         "contract_code": "BTC180914",
         "volume": 111,
         "price": 1111,
         "order_price_type": "limit",
         "order_type": 1,
         "direction": "buy",
         "offset": "open",
         "lever_rate": 10,
         "order_id": 633766664829804544,
         "order_id_str": "633766664829804544",
         "client_order_id": 10683,
         "order_source": "web",
         "created_at": 1408076414000,
         "trade_volume": 1,
         "trade_turnover": 1200,
         "fee": 0,
         "trade_avg_price": 10,
         "margin_frozen": 10, 
         "profit": 0,
         "status": 1
        }
       ],
    "total_page":15,
    "current_page":3,
    "total_size":3
   },
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                         | true          | string   | Request Processing Result                                    |                                   |
| \<list\>(Attribute Name: data) |               |          |                                                              |                                   |
| symbol                         | true          | string   | Variety code                                                 |                                   |
| contract_type                  | true          | string   | Contract Type                                                | "this_week","next_week","quarter" |
| contract_code                  | true          | string   | Contract Code                                                | "BTC180914" ...                   |
| volume                         | true          | decimal  | Number of Order                                              |                                   |
| price                          | true          | decimal  | Price committed                                              |                                   |
| order_price_type               | true          | string   | "limit", "opponent","post_only" Position limit will be applied to post_only while order limit will not. |                                   |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| direction                      | true          | string   | Transaction direction                                        |                                   |
| offset                         | true          | string   | "open": "close"                                              |                                   |
| lever_rate                     | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| order_id                       | true          | bigint     | Order ID                                                     |                                   |
| order_id_str                       | true          | string     | Order ID                                                     |                                   |
| client_order_id                | true          | long     | Client order ID                                              |                                   |
| created_at                     | true          | long     | Order Creation time                                          |                                   |
| trade_volume                   | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                 | true          | decimal  | Transaction aggregate amount                                 |                                   |
| fee                            | true          | decimal  | Servicefee                                                   |                                   |
| trade_avg_price                | true          | decimal  | Transaction average price                                    |                                   |
| margin_frozen                  | true          | decimal  | Freeze margin                                                |                                   |
| profit                         | true          | decimal  | profit                                                       |                                   |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling. |                                   |
| order_source                   | true          | string   | Order Source                                                 |                                   |
| \</list\>                      |               |          |                                                              |                                   |
| total_page                     | true          | int      | Total Pages                                                  |                                   |
| current_page                   | true          | int      | Current Page                                                 |                                   |
| total_size                     | true          | int      | Total Size                                                   |                                   |
| ts                             | true          | long     | Timestamp                                                    |                                   |

## Get History Orders

###  Example  

- POST `api/v1/contract_hisorders`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string   | Variety code                |             | "BTC","ETH"...                                               |
| trade_type         | true          | int      | Transaction type            |             | 0:all,1: buy long,2: sell short,3: buy short,4: sell  long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short |
| type               | true          | int      | Type                        |             | 1:All Orders,2:Order in Finished Status                      |
| status             | true          | int      | Order Status                |             | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.  |
| create_date        | true          | int      | Date                        |             | 7，90（7days or 90 days）                                    |
| page_index         | false         | int      | Page, default 1st page      | 1           |                                                              |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                                                              |
| contract_code          | false         | string      | Contract Code  |           |     "BTC180914" ...         |                                                 |
| order_type          | false         | string      | Order Type |           |     1:"limit"，3:"opponent"，4:"lightning",5:"Trigger Order",6:"pst_only",7:"optimal_5"，8:"optimal_10"，9:"optimal_20",10:"fok":FOK order,11:"ioc":ioc order      |                                                      |

> Response:

```json
{
  "status": "ok",
  "data":{
    "orders":[
      {
        "symbol": "BTC",
        "contract_type": "this_week",
        "contract_code": "BTC180914",
        "volume": 111,
        "price": 1111,
        "order_price_type": "limit",
        "direction": "buy",
        "offset": "open",
        "lever_rate": 10,
        "order_id": 633766664829804544,
        "order_id_str": "633766664829804544",
        "order_source": "web",
        "create_date": 1408076414000,
        "trade_volume": 1,
        "trade_turnover": 1200,
        "fee": 0,
        "trade_avg_price": 10,
        "margin_frozen": 10,
        "profit": 10,
        "status": 1,
        "order_type": 1
      }
     ],
    "total_page":15,
    "current_page":3,
    "total_size":3
    },
  "ts": 1490759594752
}
```


###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| -------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                           | true          | string   | Request Processing Result                                    |                                   |
| \<object\>(Attribute Name: data) |               |          |                                                              |                                   |
| \<list\>(Attribute Name: orders) |               |          |                                                              |                                   |
| order_id                         | true          | bigint     | Order ID                                                     |                                   |
| order_id_str                         | true          | string     | Order ID                                                     |                                   |
| symbol                           | true          | string   | Variety code                                                 |                                   |
| contract_type                    | true          | string   | Contract Type                                                | "this_week","next_week","quarter" |
| contract_code                    | true          | string   | Contract Code                                                | "BTC180914" ...                   |
| lever_rate                       | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| direction                        | true          | string   | Transaction direction                                        |                                   |
| offset                           | true          | string   | "open": "close"                                              |                                   |
| volume                           | true          | decimal  | Number of Order                                              |                                   |
| price                            | true          | decimal  | Price committed                                              |                                   |
| create_date                      | true          | long     | Creation time                                                |                                   |
| order_source                     | true          | string   | Order Source                                                 |                                   |
| order_price_type                 | true          | string   | 1. Limit price order; 3. BBO price order (opponent price); 4. Flash close; 5. Trigger order; 6. Post_only order |                                   |
| margin_frozen                    | true          | decimal  | Freeze margin                                                |                                   |
| profit                           | true          | decimal  | profit                                                       |                                   |
| trade_volume                     | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                   | true          | decimal  | Transaction aggregate amount                                 |                                   |
| fee                              | true          | decimal  | Servicefee                                                   |                                   |
| trade_avg_price                  | true          | decimal  | Transaction average price                                    |                                   |
| status                           | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.  |                                   |
| \</list\>                        |               |          |                                                              |                                   |
| \</object\>                      |               |          |                                                              |                                   |
| total_page                       | true          | int      | Total Pages                                                  |                                   |
| current_page                     | true          | int      | Current Page                                                 |                                   |
| total_size                       | true          | int      | Total Size                                                   |                                   |
| ts                               | true          | long     | Timestamp                                                    |                                   |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

## Acquire History Match Results

###  Example 

- POST `api/v1/contract_matchresults`

### Request Parameter

Parameter Name |  Mandatory  |  Type  |  Desc                    |  Default  |  Value Range   
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
symbol      | true     | string | contract types code          |         | "BTC","ETH"...                           |
trade_type  | true     | int    | trasanction types          |         |  0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
create_date | true     | int    | date            |         | 7, 90 (7 or 90 days)                            |
contract_code      | false     | string | contract code          |         |                          |
page_index  | false    | int    | page; if not enter, it will be the default value of the 1st page.  | 1       |                                          |
page_size   | false    | int    | if not enter, it will be the default value of 20; the number should ≤50 | 20      |                                          |

> Response:

```json
    {
     "data": {
		"current_page": 1,
		"total_page": 1,
		"total_size": 2,
		"trades": [{
			"id": "21315414825-6141291349-1",
			"contract_code": "EOS190419",
			"contract_type": "this_week",
			"create_date": 1555553626736,
			"direction": "sell",
			"match_id": 3635853382,
			"offset": "close",
			"offset_profitloss": 0.15646398812252696,
			"order_id": 633766664829804544,
			"order_id_str": "633766664829804544",
			"symbol": "EOS",
			"order_source": "android",
			"trade_fee": -0.002897500905469032,
			"trade_price": 5.522,
			"trade_turnover": 80,
			"trade_volume": 8,
			"role": "maker"
		}]
	},
	"status": "ok",
	"ts": 1555654870867
    }
```

### Returning Parameter

 Parameter Name                |  Mandatory   |  Type  |  Desc                                                      |   Value Range                  |
---------------------- | -------- | ------- | ------------------ | ------------ |
status                 | true     | string  | request handling result            |              |
\<object\>(attribute name: data: data) |          |         |                    |              |
\<list\>(attribute name: data: trades) |          |         |                    |              |
id               | true     | string    | traded ID, You can use match_id and the new field "id" to combine a unique trade ID.               |              |
match_id               | true     | long    | match ID, You can use match_id and the new field "id" to combine a unique trade ID.             |              |
order_id               | true     | bigint    | order ID              |              |
order_id_str               | true     | string    | order ID              |              |
symbol                 | true     | string  | contract type code               |              |
order_source                 | true     | string  | Order Source               |              |
contract_type          | true     | string  | contract type               |  deliver on this Friday then "this_week"; deliver on next Friday then "next_week"; for quarterly contract then "quarter"  |
contract_code          | true     | string  | contract code              |  "BTC180914" ...       |
direction              | true     | string  | "buy": to bid/ go long; "sell": to ask/ go short.         |              |
offset                 | true     | string  | "open": open positions; "close": close positions           |              |
trade_volume           | true     | decimal | the number of traded contract with unit of lot               |              |
trade_price                  | true     | decimal | the price at which orders get filled               |              |
trade_turnover                  | true     | decimal | the number of total traded amout with number of USD               |              |
create_date            | true     | long    | the time when orders get filled               |              |
offset_profitloss                 | true     | decimal | profits and losses generated from closing positions                 |              |
traded_fee                    | true     | decimal | fees charged by platform                |              |
 role                        | true          | string |   taker or maker     |                  |
\</list\>              |          |         |                    |              |
total_page             | true     | int     | total pages                |              |
current_page           | true     | int     | current page                |              |
total_size             | true     | int     | total size of the list                |              |
\</object\>            |          |         |                    |              |
ts                     | true     | long    | timestamp                |              |

### Notice

- If users don’t upload/fill the page_index or page_size, it will automatically be set as the default value of the top 20 data on the first page, for more details, please follow the parameters illustration.

- The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

# HuobiDM Transferring Interface

##  Transfer margin between Spot account and Future account 

### Example

- POST `https://api.huobi.pro/v1/futures/transfer`

### Notice

This interface is used to transfer assets between Spot account and Future account.

The type is “pro-to-futures” when transferring assets from Spot account to Future; “futures-to-pro” when transferring from Future account to Spot account. 

API rate limit for this interface is up to 10 times per minute.

Transferring margin between Spot account and Future account Interface, sets 8 decimal places for transferring amount of all coins.

### Request Parameter

| Parameter Name  |  Mandatory  |  Type  |  Desc                    |  Default   |  Value Range  |  
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| currency      | true     | string | currency          |         | e.g. btc                          |
| amount  | true     | Decimal    | Transferring amount         |         |   |
| type | true     | string  |  type of the transfer            |         | Transfer from Future account to Spot account: “futures-to-pro”  Transfer from Spot account to Future account: "pro-to-futures" |

> Response:

  ```
	{
	"status": "ok",
	"data":56656,
    }
	Error response
	{
	"status": "error",
	"data":null,
	"err-code":"dw-account-transfer-error",
	"err-msg":"account transfer error"
    }
	
 ```

### Returning Parameter

|  Parameter Name                |  Mandatory  |  Type  |  Desc         |  Value Range                    |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status                 | true     | string  | Response status           | ok, error             |
| data               | true     | long    | Transfer ID             |       If status="error", data will be null.        |
| order_id               | true     | long    | order ID              |              |
| err-code                 | true     | string  | Error code              |              |
| err-msg          | true     | string  | Error code description              |   |


## Error Code Table

err-code | err-msg  |  Comments     |
------  | --------------------------------- |-----------------------------     |
base-msg|    |    Other errors, please refer to err-msg list below for details。
base-currency-error  |  The currency is invalid  |       |
frequent-invoke  |  the operation is too frequent. Please try again later  |                 |
banned-by-blacklist  |  Blacklist restriction  |                      |
dw-insufficient-balance  |  Insufficient balance. You can only transfer {0} at most.  |                   |
dw-account-transfer-unavailable  |  account transfer unavailable  |         |
dw-account-transfer-error  |  account transfer error  |               |
dw-account-transfer-failed  |  Failed to transfer. Please try again later.  |           |
dw-account-transfer-failed-account-abnormality  |  Account abnormality, failed to transfer。Please try again later.  |        |

## Error message when err-code is ‘base-msg’.

err-msg  |  Comments   |
----------------------- |----------------------------------    |
Unable to transfer in currently. Please contact customer service.  |         |
Unable to transfer out currently. Please contact customer service.  |        |
Abnormal contracts status. Can’t transfer.  |           |
Sub-account doesn't own the permissions to transfer in. Please contact customer service.  |            |
Sub-account doesn't own the permissions to transfer out. Please contact customer service.  |           |
The sub-account does not have transfer permissions. Please login main account to authorize.  |         |
Insufficient amount available.|Insufficient amount of Future Contract Account  |                       |
The single transfer-out amount must be no less than {0}{1}.  |         |
The single transfer-out amount must be no more than {0}{1}.  |         |
The single transfer-in amount must be no less than {0}{1}.  |          |
The single transfer-in amount must be no more than {0}{1}.  |          |                                                           
Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.  |              |
Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.  |                |
Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.  |          |
Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.  |            |
The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.  |            |
The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.  |              |
The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.  |        |
The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.  |          |
Transfer failed. Please try again later or contact customer service.  |       |
Abnormal service, transfer failed. Please try again later.  |           |
You don’t have access permission as you have not opened contracts trading.  |     |
This contract type doesn't exist.  |              |

# WebSocket Reference for Huobi Derivatives

## API List

  Permission |   Content Type   | Request Method |  Type  |  Description                 |  Authentication Required      |                                                                                                                                            
----------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |---------- |---------------------------- |--------------|
  Read  |  Market Data Interface |         market.$symbol.kline.$period  |      sub        |    Subscribe KLine data           |  No |
  Read  |  Market Data Interface |           market.$symbol.kline.$period  |              req        |     Request Kline Data|  Nos  |
 Read  |     Market Data Interface      |  market.$symbol.depth.$type  |               sub        |       Subscribe Market Depth Data | No | 
 Read  |  市    Market Data Interface       |  market.$symbol.detail  |               sub        |    Subscribe Market Detail Data    |   No  |
 Read   |     Market Data Interface        |  market.$symbol.trade.detail  |               req        |    Request Trade Detail Data |  No|
Read  |    Market Data Interface         |  market.$symbol.trade.detail  |        sub |  Subscribe Trade Detail Data | No  | 
    Trade |       Trade Interface      |  orders.$symbol  |        sub |  Subscribe Order Data  | Yes | 
  Read |     Account Interface        |  accounts.$symbol  |        sub  |  Subscribe asset change Information of a given coin  | Yes  | 
  Read |      Account Interface      |  positions.$symbol  |        sub  |  Subscribe position change Information of a given coin  | Yes | 
    Read |      Trade Interface     |  liquidationOrders.$symbol  |        sub  |  Subscribe liquidation Order information of a given coin | Yes | 

## Huobi DM WebSocket Subscription Address

Market Data Request and Subscription: wss://www.hbdm.com/ws 

Order Push Subscription: wss://api.hbdm.com/notification
 
If you fail visiting the two addresses above, you can also visit: 

Market Data Request and Subscription Address: wss://www.btcgateway.pro/ws;
 
Order Push Subscription：wss://api.btcgateway.pro/notification
 
If you have further queries about Huobi DM order push subscription, please refer to [Demo](https://github.com/huobiapi/Futures-Java-demo)
 
## API Rate Limit Illustration

There is rate limit for both public and private interfaces. More details are laid out as below:
- Generally, for the private interfaces, users need to user API keys. The rate limit for each UID is 30 times at most every 3 seconds. (Please note that the 30 times/3s of rate limit mentioned above are shared by all contracts (all coins and contracts types expiring at different date).

- For public interfaces used to get information of non-market data (such as request information of index, price limit, delivery and settlement, positions, etc.), the rate limit for each IP is 60 times every 3 seconds. (Please note that the 60 times/3s rate limit is shared by all the requests for non-market data under this UID)

- For public interface to get market data such as  Get K-line data, Get Market Data Overview, Get Contract Information, Get the last Trade of a Contract and so on：

   (1) For restful interface：200 times/second for one IP at most 
　　
   (2)  The rate limit for “req” request is 50 times/s at most. No limit for “sub” request as the data will be pushed by server voluntarily. 

- The order push private WebSocket interface requires API Key for authentication.

    Each UID can create 10 WS connections at most for private order push at the same time. The user under this UID only need to subscribe one WS order push for the contracts of the same underlying coins. For example, users only need to create one WS order push connection for BTC Contract, which our system will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly contracts via this connection.

Note: The rate limit of WS order push and RESTFUL private interface are separated from each other with no relations.

Response the following strings for “Header” via API

- ratelimit-limit： the upper request limit per time, unit: time

- ratelimit-interval： reset interval(reset the number of request ), unit: ms

- ratelimit-remaining： available request number left in this round, unit: time

- ratelimit-reset： upper limit of reset time used to request number， unit: ms
 
# WebSoket Heartbeat and Authentication Interface

## Market Heartbeat
WebSocket API supports two-way heartbeat. Both Server and Client can send ping message, which the opposite side can return with pong message.

:
- WebSocket Server sends heartbeat：

`{"ping": 18212558000}`

- WebSocket Client should respond:：

`{"pong": 18212558000}`

Note: Once the WebSocket Client and WebSocket Server get connected, the server will send a heartbeat every 5 seconds (the frequency might change). The connection will get disconnected automatically if the WebSocket Client ignores the heartbeat message for 2 times. The server will remain connection if the WebSocket Client responds one “ping” value within the latest 2 heartbeat messages.

## Order Push Address

- Huobi DM uses one official address:

  `wss://api.hbdm.com/notification`
  
Please note that the WS request connection should not go over 10 normally.

### Data Compression

All response data from WebSocket server are compressed into GZIP format. Clients have to decompress them for further use.

### Illustration of Request(req and rep) Data

- Character Encoding：UTF-8

- Case sensitive，including parameter name and return parameter

- Data type： use JSON to transmit data

-All request data has fixed format. Please note that Huobi DM API document will only focus on data illustration in non-fixed format.

> Request data format is laid out as below:

```

  {
  "op": string, // Required; Client requests operator name (Server will returns the same value), For detailed operator name list, please refer to the appendix
  "cid": string, // Optional;Request unique ID( Client generate a unique ID which server will return the same value)
  // Others required/ Optional string
  }

```

> All responses push data will be returned in fixed format，Huobi DM API document will only focus on data illustration， Response data format is laid out as below；

```
   
  {
  "op": string, // Required; Clients request operator name
  "cid": string, // optional; Client requests unique ID
  "ts": long, // required; Server responds local timestamp
  "err-code": integer, // required; return error code, “0” means successfully responded, others means error. For detailed return error code list, please refer to appendix
  "err-msg": string, only responds error message when error occurs, detailed error information. 
  "data": object // optional; return data object， request valid data after error removed 
  }
  
 ```

>  Push Data Format is laid out as below:

```

  {
  "op": "string", // required;Server pushes operator name, For detailed operator type list, please refer to appendix
  "ts": long, // required; Server pushes local timestamp
  "data": object // required;返return data object
  }
  
```

## Server voluntarily disconnects connection

During making connection and authentication, server will disconnect connection automatically when error occurs. Before disconnecting, server will send notification below,

`{`

  `"op": "close", // represents server disconnect connection voluntarily
   
  `"ts": long   // Server pushes local timestamp
  
`}`


## Server return error code but remain connection

After authentication, if clients encountered internal error or request data out from Operator List, WebSocket server will return error message. But server will remain connection

`{`

  `"op": "error", // means server receive data out from Operator List or clients got internal error `
  
  `"ts": long// Server pushes local timestamp`
  
`}`

## Authentication

Clients can create Access Key and Secret Key on Huobi which Access Key is the API access key kept by the client.  The Secret Key is used to sign the request (available only for request). To apply/change API key, please go to “Account-API Management” on Huobi DM. Make name for the API Key and click “create” to finish. It’s optional to bind IP address to the API Key.

For the Trade WebSocket interface, server have to do authentication for topics require authentication before making connection. 

Note: These two keys are closely related to account security and should not be disclosed to others at any time.

### Authentication Format Example:

`{`

  `"op": "auth",`
  
  `"type": "api",`
  
  `"AccessKeyId": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",`
  
  `"SignatureMethod": "HmacSHA256",`
  
  `"SignatureVersion": "2",`
  
  `"Timestamp": "2017-05-11T15:19:30",`
  
  `"Signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=",`
  
`}`


### Illustration on Authentication Format Data

| Field        | type  | Description                                                         |
| --------------- | ----- | ----------------------------------------------------------- |
| op               | string | required； Operator type， Requested authentication operator type is auth                             |
| type             | string | required； Signature method  sign via API means API interface signature, sign via ticket means terminal signature        |
| cid              | string | Optional； Client requests the unique ID                                      |
| AccessKeyId      | string |required if users use API signature； API Access key is the API AccessKey you applied. |
| SignatureMethod  | string | required if users use API signature； Signature method, user computes signature basing on the protocol of hash ,the API uses HmacSHA256 |
| SignatureVersion | string | required if the users use API signature； the signature protocol version, the API uses 2           |
| Timestamp        | string | required if users use API signature； timestamp, the time you request(UTC timezone)  this value can help to avoid request data interception by the third party for example ：2017-05-11T16:22:06 (UTC time zone)
|  Signature        | string | required if the users use API signature； signature, the value computed is ensure valid authentication without being tampered |
| ticket           | string | required if users use ticket signature ； return when logged in                            |

#### Notice：

- To decrease API access rate, the WebSocket server uses the same signature algorithm with that on REST API 

- All data is case sensitive;

- When type is api, In API authentication, parameter op, type, cid, Signature do not participate in operation.

- The request method in signature's method is GET, the other parameter please refer to REST api document

#### Signature Illustration：

Example on Signature Computing Process:，

- Request code requirement for signature computing. Because it can return to total different data with different content when using HMAC for signature computing; Before requesting signature computing, clients have to request code requirements.


- Request Method (GET or POST), add newline character `\n` after URL

  `GET\n`

- add visit address with lowercase letters, add newline characters `\n` after URL

  `api.hbdm.com\n`

- Access path, adding newline character `\n` after URL

  `/notification\n`

- Sequence the parameter name according to ASCII code (use UTF-8 and transfer into URI encoding, capital letters for hexadecimal characters. E.G.: ‘:’ will be encoded into '%3A', blank will be encoded into '%20'). Here is an encoding example below for request parameters

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-
  7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-
  11T15%3A19%3A30`
  

- Connect all parameters with ’&’ according to the sequence above.
 
- The final strings for signature computing created by following the steps as below:
  
 Signature Computing, transmit the two parameters below into cryptographic hash: strings needed to be computed, API SecretKey. Get the signature computing result and get it encoded with Base 64 code standard. 

Add computed value into the Signature parameter in API request. Please note the computed value has to encoded into URI code.
  
  

### Authentication Response Format Illustration

| Field    | type    | description                                                |
| ------- | ------ | --------------------------------------------------- |
| op       | string  | required； Operator type， Authentication response type is auth                    |
| type     | string  | required； Return data according to the requested parameters                       |
| cid      | string  | optional； Return data when “cid” string requested                          |
| err-code | integer | 0 means successfully response, others means response failure成功返回 0 , For detailed Response code（Err-Code）, please refer to appendix  |
| err-msg  | string  | optional， response detailed error code when error occurs                         |
| ts       | long    |  server responds timestamp                                |
| user-id  | long    |  client ID                                           |

> Example of A Success Authentication Response

```json
 
{
  "op": "auth",
  "type":"api",
  "ts": 1489474081631,
  "err-code": 0,
  "data": {
    "user-id": 12345678
  }
}

```

> Example of Authentication Response with Error

```

{
"op": "auth",
"type":"api",
"ts": 1489474081631, 
"err-code": xxxx， 
"err-msg": ”Error details “
}

```
 
 
#  WebSocket Market Interface

## Subscribe K-line data

### To subscribe Kline data, clients have to connect WebSocket API server and send subscribe request with the format below：

`{`

  `"sub": "market.$symbol.kline.$period",`

  `"id": "id generate by client"`

`}`

> Example of a successful subscription request：

```json

    {
    "sub": "market.BTC_CQ.kline.1min",
    "id": "id1"
    }

```

### Request Parameter

  Parameter Name |   Mandatory   |     Type |   Description   |   Default  |   Value Range
--------------| -----------------| ---------- |----------| ------------  | --------------------------------------------------------------------------------  |
  symbol  |       true         |  string  |   Pairs  |               |  E.G.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC Bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |
  period    |     true          | string   |    Kline Period   |            |  1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon  |

### Return Parameter 

 Parameter Name |    Mandatory   |   Type |   Description  |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   Request Parameter  | 
  ts    |     true          | long   |  Time of Respond Generation，Unit：Millisecond   |           
  \<tick\>    |               |    |      |            | 
  id    |     true          | number   |  ID     |            
  mrid    |     true          | number   | ID Order ID    |            
  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
  count    |     true          | decimal   | Opening Price    |            
  open    |     true          | decimal   |  Order Quantity   |            
  close    |     true          | decimal   |  Closing Price,  the price in the last kline is the latest order price   |            
  low    |     true          | decimal   |  Low    |            
  high    |     true          | decimal   |  High   |            
  amount    |     true          | decimal   |  Trade Volume(Coin),  trade volume(coin)=sum(order quantity of a single order * face value of the coin/order price)   |            
  \</tick\>    |               |     |      |          


> After subscription, clients can receive updates upon any change. Example:

```json

    {
     "ch": "market.BTC_CQ.kline.1min",
     "ts": 1489474082831,
     "tick": 
        {
         "id": 1489464480,
         "mrid": 268168237,
         "vol": 100,
         "count": 0,
         "open": 7962.62,
         "close": 7962.62,
         "low": 7962.62,
         "high": 7962.62,
         "amount": 0.3
        }
    }

```


## Request Kline data

### To request Kline data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：


`{`
   
  `"req": "market.$symbol.kline.$period",`
        
  `"id": "id generated by client",`

        
  `"from": " type: long, the time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00, unit: s",`
        
  `"to": "type: long, the time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00, unit: s , the 'to' value should be larger than 'from' value"`

`}`

> Example of Kline Data Subscription Request：

```json

    {
    "req": "market.BTC_CQ.kline.1min",
    "id": "id4",
    "from": 1571000000,
    "to": 1573106298
    }
    
```

### Request Parameter 

  Parameter Name |    Mandatory   |   Type  |  Description  |    Default   |   Value Range
-------- | -------- | ------ | ------ | ------- |---------------------------------------- 
  symbol | true | string | Pairs | | E.g.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |
  period | false | string | Kline Period | | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|
  from   | true | long  |  Start Time | | |
  to      | true | long | End Time | | |
  
#### Note

If between time range [t1, t5], there are t1-t5 KLines in quantity.

from: t1, to: t5, return [t1, t5].

from: t5, to: t1, which t5  > t1, return [].

from: t5, return [t5].

from: t3, return [t3, t5].

to: t5, return [t1, t5].

from: t which t3  < t  <t4, return [t4, t5].

to: t which t3  < t  <t4, return [t1, t3].

from: t1 and to: t2, should satisfy 1325347200  < t1  < t2  < 2524579200.

Clients can request 2000 Klines at most in one request

### Return Parameter

 Parameter Name |    Mandatory   |   Type |    Description |
-------------- | -----------------  | ---------- |  -------------- |
  rep  |       true         |  string  |   Request Parameter  | 
  status  |       true         |  string  |   status   | 
  id  |       true         |  string  |   Request ID  | 
  wsid    |     true          | long   |    wsid |           
  \<data\>    |               |    |      |            | 
  id    |     true          | long   |  ID     |            
  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
  count    |     true          | decimal   |    Opening Price   |            
  open    |     true          | decimal   |    Order quantity   |            
  close    |     true          | decimal   |    Closing Price, the price in the latest Kline is the last order price   |            
  low    |     true          | decimal   |  Low   |            
  high    |     true          | decimal   |  High   |            
  amount    |     true          | decimal   |  Trade Volume(Coin), trade volume(coins)=sum(order quantity of a single order * face value of the coin/order price)   |            
  \</data\>    |               |     |      |          

  

> After subscription, Clients can receive the most recent data upon any update：

```json
    
    {
     "rep": "market.BTC_CQ.kline.1min",
     "status": "ok",
     "id": "id4",
     "wsid": 3925737956,
     "tick": [
       {
        "vol": 100,
        "count": 27,
        "id": 1494478080,
        "open": 10050.00,
        "close": 10058.00,
        "low": 10050.00,
        "high": 10058.00,
        "amount": 175798.757708
       },
       {
        "vol": 300,
        "count": 28,
        "id": 1494478140,
        "open": 10058.00,
        "close": 10060.00,
        "low": 10056.00,
        "high": 10065.00,
        "amount": 158331.348600
       }
     ]
    }
    
```

## Subscribe Market Depth Data

### To subscribe market depth data, clients have to make connection to WebSokcet API Server and send subscribe request in the format below：

`{`

  `"sub": "market.$symbol.depth.$type",`

  `"id": "id generated by client"`

`}`

> Example of a successful request ：

```json

    {
    "sub": "market.BTC_CQ.depth.step0",
    "id": "id5"
    }

```

### Request Parameter

 Parameter Name   |  Mandatory   |  Type   |  Description      |    Default   |  Value Range  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  symbol         |  true           |  string     |    Pairs          |        |  E.g.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract.  |
  type           |  true           |  string     |    Depth Type      |        |  ( 150 depth data)step0, step1, step2, step3, step4, step5（merged depth data 0-5）；when step is 0，depth data will not be merged; (20 depth data) step6, step7, step8, step9, step10, step11(merged depth data 7-11); when step is 6, depth data will not be merged. |

### Note:

When clients choose merged depth data, WebSocket server will only display the merged price within price steps in order book. Please note that the merged depth price will not make any change on the actual order price.

### Return Parameter

Parameter Name   |  Mandatory  |   Type  |      Description |    Value Range  |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ts | true | number | Time of Respond Generation, Unit: Millisecond  | |
ch | true |  string | Data channel, Format： market.period | | 
 \<tick\>    |               |    |      |            | 
mrid  | true| number | Order ID| 
id  | true| number | tick ID | 
asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
ts | true | number | Time of Respond Generation, Unit: Millisecond  | |
version | true | number | version ID  | |
ch | true |  string | Data channel, Format： market.period | | 
 \</tick\>    |               |    |      |            | | 


> Clients can receive data if there is any update upon market depth. Example：

```json

    {
     "ch": "market.BTC_CQ.depth.step0",
     "ts": 1489474082831,
     "tick":
       { 
        "mrid": 269073229,
         "id": 1539843937,
            "bids": [
             [9999.9101,1], 
             [9992.3089,2]
                    ],
             "asks": [
              [10010.9800,10],
              [10011.3900,15]
                     ],
	       "ts": 1539843937417,
	       "version": 1539843937,
	       "ch": "market.BTC_CQ.depth.step0"
        }
    }
    
```

## Subscribe Market Detail Data

### To subscribe market details, the clients have to make connection to WebSocket Server and send subscribe request in the format below:

`{`

`"sub": "market.$symbol.detail",`

`"id": "id generated by client"`

`}`

> Example of Subscribe Market Detail Data：

```json

    {
     "sub": "market.BTC_CQ.detail",
     "id": "id6"
    }

```

### Request Parameter

Parameter Name  |  Mandatory  |    Type  |     Description   |  Default   |  Value Range |
-------------- |  -------------- |  ---------- |  ------------ |  ------------ |  --------------------------------------------------------------------------------  |
  symbol         |  true           |  string     |     Pairs   |              |  E.g. "BTC_CW" stands for BTC Weekly contract, "BTC_NW" stands for BTC Bi-weekly contract, "BTC_CQ" stands for BTC Quarterly contract|


### Return Parameter

Parameter Name   |    Mandatory  |  Type     |  Description  |
-------------- |  -------------- |  -------------- |  ----------------------------------------------------------  |
ch  |  true  |  string  |   Data channel，Format： market.$symbol.detail.merged   |     
ts  |  true  |  number  |   Time of Respond Generation, Unit: Millisecond |    
 \<tick\>    |               |    |      |           
id  |  true  |  number  |    ID  |    
mrid  |  true  |  number  |   Order ID  |    
open  |  true  |  decimal  |    Opening Price |     
close  |  true  |  decimal  |    Closing Price, the price from the latest kline is the last order price |    
high  |  true  |  decimal  |   High |     
low  |  true  |  decimal  |    Low|     
amount  |  true  |  decimal  |   Trade volume(Coins), Trade volume(Coin)=SUM(quantity(cont.)*face value/ order price  |   
vol  |  true  |  decimal  |   Trade volue(Cont.)， the sum volume of both buy and sell sides  |     
count  |  true  |  decimal  |   fulfilled order quantity  |     
 \</tick\>    |               |    |      |           


> Example of a successful return data：

```json

  {
	"ch": "market.BTC_CW.detail",
	"ts": 1539842340724,
	"tick": {
		"id": 1539842340,
		"mrid": 268041138,
		"open": 6740.47,
		"close": 7800,
		"high": 7800,
		"low": 6726.13,
		"amount": 477.1200312075244664773339914558562673572,
		"vol": 32414,
		"count": 1716
	  }
  }

```

## Request Trade Detail Data

### To request Trade detail data, Clients have to make connection to the WebSocket Server and send request data in the format below：

`{`
     
   `"req": "market.$symbol.trade.detail",`
    
   `"id": "id generated by client"// “id” string is optional currently. Server will return with null` because client ID is not necessary
    
`}`

Return to the current trade detail data only

> Example of requesting market detail data：

```json


    {
     "req": "market.BTC_CQ.trade.detail",
     "id": "id8"
    }

```

### Return Parameter

Parameter Name     |    Mandatory |  Type  | Description |  Default   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  Data Channel，Format格式： market.\$symbol.trade.detail  |  |   
status  |  true  |  string  |  Request Status  |   |    
id  |  true  |  number  |  ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  number  |  ID  |   |    
price  |  true  |  decimal  |  Price |   |    
amount  |  true  |  decimal  |  Quantity(Cont.)  |   |    
direction  |  true  |  string  |  Order Direction  |   |    
ts  |  true  |  number  |  Order Creation Time |   |    
 \</data\>    |               |    |      | 


> Example of a successful return data：

```json

{
	"rep": "market.BTC_CQ.trade.detail",
	"id": 1573468030,
	"status": "ok",
	"data": [{
			"id": 601595424,
			"price": 10195.64,
			"amount": 100,
			"direction": "buy",
			"ts": 1494495766000
		},
		{
			"id": 601595423,
			"price": 10195.64,
			"amount": 200,
			"direction": "buy",
			"ts": 1494495711000
		}
	]
}
    
```

## Subscribe Trade Detail Data 

### To subscribe trade detail data, the Client has to make connection to the Server and send subscribe request in the format below：

`{`
 
  `"sub": "market.$symbol.trade.detail",`
    
  `"id": "id generated by client"`
    
`}`

### Note:

  Clients can only access the recent 300 trade detail data 
  
### Request Parameter

  Parameter Name    | Mandatory   |  Type    |   Description   |   Default     |   Value Range  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------|
  symbol         |  true           |  string     |  contract type    |            | E.g.: "BTC_CW" stands for BTC weekly contract,  "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |

>Example of a successful subscribe request：

```json

    {
     "sub": "market.BTC_CQ.trade.detail",
     "id": "id7"
    }
    
```

### Return Parameter

Parameter Name     | Mandatory | Type  |  Description |  Default  | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
ch  |  true  |  string  |  Data channel,format: market.$symbol.trade.detail  |  |   
ts  |  true  |  number  |  Request time  |   |    
 \<tick\>    |               |    |      | 
id  |  true  |  number  |  ID  |   |    
ts  |  true  |  number  |  Request time  |   |    
 \<data\>    |               |    |      | 
amount  |  true  |  decimal  |  quantity(Cont.) |   |    
ts  |  true  |  number  |  Request time  |   |    
id  |  true  |  number  |  tick id  |   |    
price  |  true  |  decimal  |  Price  |   |    
direction  |  true  |  string  |  Order direction  |   |    
 \</data\>    |               |    |      | 
 \</tick\>    |               |    |      | 

> When there is any update upon trade detail data, clients will receive notification from server. Example：

```json

{
  "ch": "market.BTC_NW.trade.detail",
  "ts": 1539831709042,
  "tick": {
    "id": 265842227,
    "ts": 1539831709001,
    "data": [{
      "amount": 20,
      "ts": 1539831709001,
      "id": 265842227259096443,
      "price": 6742.25,
      "direction": "buy"
    }]
  }
}

```

# Orders and Accounts WebSocket Interfaces

## Subscribe Order Data(sub)

To subscribe order data, Clients have to make connection to the Server and send subscribe request in the format below:

### Subscribe Request Format

`{`
  
  `“op”: “sub”,`
  
  `"cid": "id generated by client”,`
  
  `“topic": "topic to sub”`

`}`

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders.btc"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name for detailed topic list, please refer to appendix; |


> Illustration on detailed data format of orders Notification

```json

{
	"op": "notify",
	"topic": "orders.btc",
	"ts": 1489474082831,
	"symbol": "BTC",
	"contract_type": "this_week",
	"contract_code": "BTC180914",
	"volume": 111,
	"price": 1111,
	"order_price_type": "limit",
	"direction": "buy",
	"offset": "open",
	"status": 6,
	"lever_rate": 10,
	"order_id": 633989207806582784,
	"order_id_str": "633989207806582784",
	"client_order_id": 10683,
	"order_source": "web",
	"order_type": 1,
	"created_at": 1408076414000,
	"trade_volume": 1,
	"trade_turnover": 1200,
	"fee": 0,
	"trade_avg_price": 10,
	"margin_frozen": 10,
	"profit": 2,
	"trade": [{
		"id": "2131234825-6124591349-1",
		"trade_id": 112,
		"trade_volume": 1,
		"trade_price": 123.4555,
		"trade_fee": 0.234,
		"trade_turnover": 34.123,
		"created_at": 1490759594752,
		"role": "maker"
	}]
}

```

### Format Illustration on return data of order push

| Filed Name               | Type   | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | Required;Operator Name，Order push value is notify ;                          |
| topic                   | string  | Required; Order push topic                                              |
| ts                      | long    | Server responses timestamp                                           |
| symbol                  | string  | Coin                                                      |
| contract_type           | string  | Contract Type                                                    |
| contract_code           | string  | Contract Code                                                     |
| volume                  | decimal | Order quantity                                                    |
| price                   | decimal | Order price                                                     |
| order_price_type        | string  | Order price type "limit":limit order  "opponent": BBO "post_only": Post Only,  Post –only order is only limited by clients position                |
| direction               | string  | "buy" Long "sell": Short                                         |
| offset                  | string  | "open": Open "close":  Close                                       |
| status                  | int     | Order status(1. Placing orders to order book; 2 Placing orders to order book; 3. Placed to order book 4. Partially fulfilled; 5 partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled; 11Cancelling) |
| lever_rate              | int     | Leverage                                                     |
| order_id                | bigint    | Order ID                                                      |
| order_id_str            | string   | Order ID                                                   |
| client_order_id         | long    | Client ID                                                 |
| order_source            | int     | Order source(system: System; Web: web; API: api; m:Mobile; risk: risk control system) |
| order_type              | int     | Order type 1Requested orders; 2. Cancelled orders; 3. Liquidated orders; 4. Delivered orders                 |
| created_at              | long    | order creation time                                                |
| trade_volume            | decimal | trade volume(Cont.)                                                     |
| trade_turnover          | decimal | Turnover                                                   |
| fee                     | decimal | Fees                                                       |
| trade_avg_price         | decimal | Average order price                                                     |
| margin_frozen           | decimal | Frozen Margin                                                   |
| profit                  | decimal | Profits&Losses                                                       |
| \<list\>( Attribute Name: trade) |         |                                                              |
| id            | string| 	the unique ID. Match ID is not unique.  You can create a unique ID by combining the  mathc_id and the new “id”.。                                                       |
| trade_id                | long    | Trade ID is the result of sets of order execution and trade confirmation. NOTE: trade ID is not unique, which includes all order records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade ID.                                                  |
| trade_volume            | decimal | trade volume                                                      |
| trade_price             | decimal | trade price                                                    |
| trade_fee               | decimal | trading fees                                                   |
| trade_turnover          | decimal | turnover                                                    |
| created_at              | long    | trade creation time                                                 |
| role             | string  | taker or maker                                                |
| \</list\>                  |         |                                                             |


## Unsubscribe Order Data（unsub）

To unsubscribe order data, the clients have to make connection to the server and send unsubscribe request in the format below: 

### Format of Unsubscribe order data

`{`

  `“op”: “unsub”,`
  
  `“topic": "topic to unsub”,`
  
  `"cid": "id generated by client”,`
  
`}`

> Example of a successful unsubscribe request：

```json

{
  "op": "unsub",
  "topic": "orders.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; Unsubscribe Topic Name，for detailed topic name list, please refer to appendix; |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | Allowed  |
| orders.symbol1 | orders.*        | Not Allowed|
| orders.symbol1 | orders.symbol1  | Allowed |
| orders.symbol1 | orders.symbol2  | Not Allowed |
| orders.*       | orders.symbol1  | Not Allowed |


## Subscribe Account Equity Updates Data(sub)

To subscribe accounts equity data updates, the client has to make connection to the server and send subscribe request in the format below:

### Request Format for Subscribe Account Equity Updates Data

`{`

  `"op": "sub",`
  
  `"cid": "id generated by client”,`
  
  `“topic": "topic to sub”`

`}`

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "accounts.btc"
}

```

### Format illustration on request subscribe account equity updates data

| Field Name | Type   | Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，Subscribe value is sub             |
| cid      | string | Optional;  Client requests unique ID                  |
| topic    | string | Required； Subscribe Topic Name，Required subscribe accounts.$symbol   Subscribe/unsubscribe the balance change of a given coin，when the value of $symbol is “*”, it means to subscribe/unsubscribe the balance change of all coins; |


> When there is any balance change, the Server will send a notification with the return parameter. For example:

```json

{
	"op": "notify",
	"topic": "accounts",
	"ts": 1489474082831,
	"event": "order.match",
	"data": [{
		"symbol": "BTC",
		"margin_balance": 1,
		"margin_static": 1,
		"margin_position": 0,
		"margin_frozen": 3.33,
		"margin_available": 0.34,
		"profit_real": 3.45,
		"profit_unreal": 7.45,
		"withdraw_available": 4.0989898,
		"risk_rate": 100,
		"liquidation_price": 100,
		"lever_rate": 10,
		"adjust_factor": 0.1
	}]
}

```

### Format Illustration of Notification 

| Field Name               | Type   | Description                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| ts                        | long  | Time of Respond Generation, Unit: Millisecond                          |
| event                     | string  | notification on account asset change such as commit order(order.open), fulfill order(order.match)(excluding liquidated order and settled orders), settlement and delivery(settlement), fulfill liquidation order(order.liquidation)(including voluntarily fulfilled liquidation order and the fulfilled liquidation order taken over by system ) , cancel order(order.cancel), asset transfer（contract.transfer) (including withdraw and deposit), system (contract.system), other asset change(other), initial margin(init)                                              |
| \<data\>            |   |                                                        |
| symbol                    | string    | Coins. When the $symbol value is “*”, it stands for subscribing data of all coins                            |
| margin_balance            | decimal  | Account Equity                                                       |
| margin_static             | decimal  | Static Equity                                                     |
| margin_position           | decimal  | Position Margi(the margin for holding currenty positions)                                                    |
| margin_frozen             | decimal | Frozen Margin                                                     |
| margin_available          | decimal | Available Margin                                                   |
| profit_real               | decimal  | Realized Profits&Losses                |
| profit_unreal             | decimal  | Unrealized Profits&Losses                                          |
| risk_rate                 | decimal |Margin Ratio                                        |
| liquidation_price         | decimal     | Liquidation Price |
| withdraw_available        | decimal     | Assets available to withdraw                                                     |
| lever_rate                | decimal    | Leverage                                                      |
| adjust_factor                | decimal    | Adjustment Factor                                                      |
| \</data\>            |   |                                                        |


## Unsubscribe Account Equity Updates Data (ubsub)

To unsubscribe account equity updates data, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Account Equity Updates Data

`{`

  `“op”: “unsub”,`
  
  `“topic": "topic to unsub”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful subscription request

```json

{
  "op": "unsub",
  "topic": "accounts.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration on Unsubscribe Account Equity Updates

| Filed Name | Type | Description                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional; Client requests unique ID                          |
| topic    | string | Required;Required； Required； Subscribe Topic，Subscribe accounts.$symbol required  unsubscribe/unsubscribe account equity change of a given coin，when the $symbol value is *, it stands for subscribing/unsubscribing data of all coins; |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)    | Unsubscribe(unsub) | Rule |
| -------------- | --------------- | ------ |
| accounts.*       | accounts.*        | Allowed  |
| accounts.symbol1 | accounts.*        | Allowed |
| accounts.symbol1 | accounts.symbol1  | Allowed |
| accounts.symbol1 | accounts.symbol2  | Not Allowed |
| accounts.*       | accounts.symbol1  | Not Allowed |


## Subscribe Position Updates(sub)

To subscribe position updates data, the client has to make connection to the server and send subscribe request in the format below:

### Subscribe Request Format

`{`

  `“op”: “sub”,`
  
  `"cid": "id generated by client”,`
  
  `“topic": "topic to sub”`

`}`

> Example of a successful subscribe request:

```json	

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "positions.btc"
}

```

### Format Illustration of Subscribe Position Updates

| Filed Name |Type   | Description                                       |
| ------- | :----- | :------------------------------------------ |
| op       | string | Required；Operator Name，Subscribe value is sub             |
| cid      | string | Optional ; Client requests unique ID                 |
| topic    | string | Required； Subscribe Topic, Subscribe (positions.$symbol) Required  Subscribe/unsubscribe the position data of a single coin, when the $symbol value is *, it stands for subscribing the data of all coins |

> When there is any position update, the server will send notification with return parameter. For example:

```json

{
	"op": "notify",
	"topic": "positions",
	"ts": 1489474082831,
	"event": "order.match",
	"data": [{
		"symbol": "BTC",
		"contract_code": "BTC180914",
		"contract_type": "this_week",
		"volume": 1,
		"available": 0,
		"frozen": 1,
		"cost_open": 422.78,
		"cost_hold": 422.78,
		"profit_unreal": 0.00007096,
		"profit_rate": 0.07,
		"profit": 0.97,
		"position_margin": 3.4,
		"lever_rate": 10,
		"direction": "buy",
		"last_price": 9584.41
	}]
}

```

### Return Parameter Illustration


|   Filed Name           | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| ts                     | long  | Time of Respond Generation, Unit: Millisecond	                           |
| event                  | string  | Notification on position change such as commit order(order.open), fulfill order(order.match)(excluding liquidated order and settled orders), settlement and delivery(settlement), fulfill liquidation order(order.liquidation)(including voluntarily fulfilled liquidation order and the fulfilled liquidation order taken over by system ) , cancel order(order.cancel), asset transfer（contract.transfer) (including withdraw and deposit), system (contract.system), initial margin(init)                                             |
| \<data\>            |   |                                                        |
| symbol                 | string    | Coin, when $symbol value is *, it stands for subscribing the data of all coins                       |
| contract_code          | string  | Contract Code                                                      |
| contract_type          | string  | Contract Type, Weekly contract: "this_week", Bi-weeklycontract: "next_week", Quarterly Contract: "quarter", Expired Contract: “delivered”                                                    |
| volume                 | decimal  | Open Interest                                                     |
| available              | decimal | Positions available to close                                                     |
| frozen                 | decimal | Frozen Margin                                                      |
| cost_open              | decimal  | Open price           |
| cost_hold              | decimal  | Position Price                                         |
| profit_unreal          | decimal  |Unrealized Profits&Losses                                       |
| profit_rate            | decimal     | Profit/Losses Ratio |
| profit                 | decimal     | Profits/Losses                                                     |
| position_margin        | decimal    | Position Margin                                                      |
| lever_rate             | decimal     | Leverage                                                    |
| direction              | string    | Position direction   "buy":Long "sell":Short                                                     |
| last_price              | decimal    | Last Price                                                     |
| \</data\>            |   |                                                        |


## Unsubscribe Position Updates Data(unsub)

To unsubscribe, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Position Updates

`{`

  `“op”: “unsub”,`
  
  `“topic": "topic to unsub”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful unsubscribe request:

```json

{
  "op": "unsub",
  "topic": "positions.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration of Unsubscribe Position Updates

| Field Name | Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Required;Required；Required；Subscribe topic，Subscribe positions.$symbol required  Subscribe or unsubscribe the position updates of a single coin; when $symbol value is *, it stands for subscribing the data of all coins; |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)      | Unsubscribe(ubsub) |  Rule |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | Allowed  |
| positions.symbol1 | positions.*        | Allowed |
| positions.symbol1 | positions.symbol1  |  Allowed |
| positions.symbol1 | positions.symbol2  | Not Allowed |
| positions.*       | positions.symbol1  | Not Allowed |

## Subscribe Liquidation Order Data (sub)

### Subscription Request Format of Liquidation order data

`{`

  `“op”: “sub”,`
  
  `“topic": "topic to sub”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful subscription request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "liquidationOrders.btc"
}

```

### Return Parameter

| Field Name               | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| ts                 | number    | Time of Respond Generation，Unit：Millisecond 	                                             |
| symbol          | string  | Coin                                                      |
| contract_code          | string  | Contract Type, Weekly contract:"this_week", Bi-weekly contract:"next_week", Quarterly contract:"quarter"， Expired Contract：“delivered”                                                    |
| direction                 | string  | Long or short                                                     |
| offset              | string | Open or close                                                     |
| volume                 | decimal | quantity(Cont.)                                                      |
| price              | decimal  | Price                |
| created_at              | number  | Order Creation Time                                          |


> When there commences any liquidation order, the server will send notification with return parameter. For example：

```json

{
    "op": "notify",             
    "topic": "liquidationOrders.btc",     
    "ts": 1489474082831,    
    "symbol": "BTC",
    "contract_code": "BTC180914",     
    "direction": "buy",
    "offset": "close",
    "volume": 111,
    "price": 1111,
    "created_at": 1408076414000
}

```

## Format of Unsubscribe Liquidation Order Data(unsub)

### Unsubscribe Request Format

`{`

  `“op”: “unsub”,`
  
  `“topic": "topic to unsub”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful unsubscribe request :

```json

{
  "op": "unsub",
  "topic": "liquidationOrders.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### Return Parameter

| Field Name |Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，subscribe value is unsub;                 |
| cid      | string | Optional;   Client requests unique ID                        |
| topic    | string | Subscribe topic name，Require subscribe positions.$symbol  Subscribe/unsubscribe the data of a given coin; when the $symbol value is *, it stands for subscribing/unsubscribing the data of all coins，; |
| ts    | number | Required; Time of Respond Generation, Unit: Millisecond	|


> Example of a successful subscription

```json

{
  "op": "unsub",
  "topic": "liquidationOrders.btc",
  "cid": "id generated by client",
  "err-code": 0,
  "ts": 1489474081631
}

```

### Rules on Subscribe and Unsubscribe

|   Subscribe(sub)   | Unsubscribe(unsub) |  Rule |
| -------------- | --------------- | ------ |
| liquidationOrders.*       | liquidationOrders.*        | Allowed    |
| liquidationOrders.symbol1 | liquidationOrders.*        | Allowed   |
| liquidationOrders.symbol1 | liquidationOrders.symbol1  |  Allowed |
| liquidationOrders.symbol1 | liquidationOrders.symbol2  | Not Allowed  |
| liquidationOrders.*       | liquidationOrders.symbol1  | Not Allowed |

# Appendix

## Operator Type(OP)

| Type  |    Description            |
| ------ | -------------------- |
| ping   |  Server sends heatbeat with a Ping   |
| pong   |  Clients responds heatbeat   with a Pong        |
| auth   |  Authentication              |
| sub    |  Subscribe Message           |
| unsub  | Unsubscribe Message       |
| notify | Server pushes subscribe message |

## Topic Type

| Type          | applicative operator type | Description                                                         |
| -------------- | ------------ | ------------------------------------------------------------ |
| orders.$symbol | sub,ubsub    | Subscribe/unsubscribe the order data of a given pair; when the $symbol value is *, it stands for subscribing/unsubscribing the data of all pairs |

## Response code（Err-Code）

| Return Error Code | Return description                                |
| ------ | ---------------------------------------- |
| 0      | Request successfully.                    |
| 2001   | Invalid authentication.                  |
| 2002   | Authentication required.                 |
| 2003   | Authentication failed.                   |
| 2004   | Number of visits exceeds limit.          |
| 2005   | Connection has been authenticated.       |
| 2010   | Topic error.                             |
| 2011   | Contract doesn't exist.                  |
| 2012   | Topic not subscribed.                    |
| 2013   | Authentication type doesn't exist.       |
| 2014   | Repeated subscription.                   |
| 2030   | Exceeds connection limit of single user. |
| 2040   | Missing required parameter.              |

  
</br>
</br>
</br>
</br>
</br>
