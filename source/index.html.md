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

Welcome to the Huobi Future API! You can use our API to access all market data, trading, and account management endpoints.

We have code example in Shell! You can view code examples in the dark area to the right.

You can use the drop down list above to change the API version. You can also use the language option at the top right to switch documentation language.

## Market Maker Program

Market maker program gives clients with good market making strategy an opportunity to access customized trading fee structure.

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotion.
</aside>

### Eligibility Criteria as a Market Maker on Huobi Future

Welcome users, who are dedicated to maker strategy and have created large trading volume, to participate in Huobi Future long-term Market Maker project.If you have more than 5 BTC in your Huobi futures account, or more than 3 BTC in your Huobi perpetual swap account, please send the following information to dm_mm@huobi.com:

1. Huobi UIDs (not linked to any rebate program in any accounts)
2. Provide screenshot of trading volume for the past 30 days or VIP/corporate status with other Exchanges

# Changelog
## 1.1.2 2020-04-09【Add an interface: Futures liquidation order WS push without authentication】

- Interface name: WebSocket liquidation order push
- Subscribe topic: public.$symbol.liquidation_orders
- Interface type: public interface


## 1.1.1 2020-03-12 【upgrade：added websocket subscription of index kline data；added websocket subscription of basis data; added restful interface of querying index kline data; added restful interface of querying basis data】

### 1、Added websocket subscription of index kline data
  
   - Interface name：Subscribe Index Kline Data
   - Interface type：public interface
   - Subscribe Topic：market.$symbol.index.$period

### 2、Added websocket subscription of basis data

   - Interface name：Subscribe Basis Data
   - Interface type： public interface
   - Subscribe Topic：market.$symbol.basis.$period.$basis_price_type

### 3、Added restful interface of querying index kline data

   - Interface name： Get Index Kline Data
   - Interface type:  public interface
   - Interface URL：/index/market/history/index

### 4、Added restful interface of querying basis data

   - Interface name：Get Basis Data
   - Interface type：public interface
   - Interface URL：/index/market/history/basis


## 1.1.0 2020-03-05【upgrade：add transfer between master account and sub-account; add more order types; add websocket subscription of match orders】

### 1、Added asset transfer function between master account and sub-account on Web and API. When using Web, only master account has transfer authority, including transfer master account assets to sub-account and vice versa, but transfers between sub-accounts are not supported; When using API, only API Key of master account has authority for the transfer operations between master and sub account. 
 
#### 1.1、Added an interface: transfer between master account and sub-accounts, the rate limit between the master account and each subaccount is 10 times/ minute.Interface name: Transfer between master account and sub-accounts. 


  - Interface type: User private interface
  - URL：api/v1/contract_master_sub_transfer

 
#### 1.2、Added a parameter: transfer permission between master account and sub-accounts. Added strings: "master_transfer_sub" and "sub_transfer_master" in returning parameter data array.
    
  - Interface name: Query information on system status
  - Interface type: Public
  - URL：api/v1/contract_api_state

 
#### 1.3、Added an interface: query transfer records of master account and sub-accounts.
    
  - Interface name: Query transfer records of master account and sub-accounts.
  - Interface type: User private interface
  - URL: api/v1/contract_master_sub_transfer_record

 
#### 1.4、Added 4 kinds transfer statements of master account and sub-accounts in query contract financial record interface.

  - Interface name: Query contract financial record
  - Interface type: User private interface
  - URL: api/v1/contract_financial_record

 
### 2、Modifications details of contract asset interface and contract trade interface are laid out as following：

#### 2.1、Modified query contract information on order limit: added 10 order price types including opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok
    
  - Interface name: Query contract information on order limit
  - Interface type: User private interface
  - URL: POST api/v1/contract_order_limit

 
#### 2.2、Modified place an order interface: added 8 order price types, including opponent_ioc, optimal_5_ioc, optimal_10_ioc, optimal_20_ioc,  opponent_fok,optimal_5_fok, optimal_10_fok, optimal_20_fok.
    
  - Interface name: Place an order 
  - Interface type: User private interface
  - URL: api/v1/contract_order


 
#### 2.3、Modified place a batch of orders interface: added 8 order price types, including opponent_ioc, optimal_5_ioc, optimal_10_ioc, optimal_20_ioc,  opponent_fok, optimal_5_fok, optimal_10_fok, optimal_20_fok。
    
  - Interface name: Place a batch of orders
  - Interface type: User private interface
  - URL: api/v1/contract_batchorder

 
#### 2.4、Modified get trade details of an order interface: added string "liquidation_type".
    
  - Interface name: Get trade details of an order
  - Interface type: User private interface
  - URL: POST api/v1/contract_order_detail

 
#### 2.5、Modified "trade_type" and "orders" in query history orders interface. Added "reduce positions to close long" and "reduce positions to close short" types in request parameter "trade_type"; Added string "liquidation_type" in orders array of returning parameter.
 
  - Interface name: Query history orders interface.
  - Interface type: User private interface
  - URL: POST api/v1/contract_hisorders

 
#### 2.6、Modified place flash close order interface: added string "order_price_type", including values: lightning_ioc, lightning_fok, lightning
  
  - Interface name: Place flash close order
  - Interface type: User private interface
  - URL: api/v1/lightning_close_position

 
#### 2.7、Added string "liquidation_type" in order transaction push in WebSocket Subscription.
    
  - Interface name: Match result on order push in WebSocket subscription
  - Interface type: User private interface
  - Subscribe Topic: orders.$symbol
 
#### 2.8、Added matching order transaction push interface in WebSocket Subscription.
    
  - Interface name: WebSocket matching order transaction push
  - Interface type: User private interface
  - Subscribe Topic: matchOrders.$symbol

 
#### 2.9、Queried if system interface is available, added strings on perpetual swap related status, added strings "swap_heartbeat"、"swap_estimated_recovery_time"in the array "data" with the returned parameters
    
  - Interface name: Queried if system interface is available
  - Interface type: public
  - URL: https://www.hbdm.com/heartbeat


#### 2.10、Added API interface of getting user's API indicator disable information
Interface name: get user's API indicator disable information


  - Interface type: User private interface
  - Interface type: public
  - URL: api/v1/contract_api_trading_status


## 1.0.11 2020-02-21 API Uprade
### 1、 Interface URL: api/v1/contract_batchorder
the maximum number of batch order cancellation each time in request parameter “orders_data” will be changed from 20 to 10.
### 2、Interface URL: api/v1/contract_cancel 
 the maximum number of order cancellation each time in request parameter “order_id” and “client_order_id” will be changed from 20 to 10. Multiple order IDs are separated by “,”.


## 1.0.10 2020-01-15 API Upgrade
### 1、modify get Kline data interface:Added two request parameters “from” and “to”. Request parameter “from” stands for starting time and request parameter “to” stands for ending time. Data can be obtained for up to two consecutive years. Request parameter “size” was changed to non-mandatory.

  -  /market/history/kline Get K-line data

### 2、When getting information on order cancellation via get contracts Information interface, users can only query last 24-hour data.

 -  /api/v1/contract_order_info Get Contracts Information

### 3、When getting information on order cancellation via query history orders interface, users can only query last 24-hour data.

- /api/v1/contract_hisorders

### 4、When getting information on order cancellation via query order detail interface, users who type in parameters “created_at” and “order_type” can query last 90-day data, while users who don’t type in parameters “created_at” and “order_type” can only query last 24-hour data.

- /api/v1/contract_order_detail

## 1.0.9 2019-12-02 API Upgrade: Added API interface with trigger order function

### 1、Added API interface with query assets and positions function.

- rest uri: api/v1/contract_account_position_info Added to get the current assets and positions.
  
### 2、Added API interface with trigger order function.

- `api/v1/contract_trigger_order` Added API interface with place trigger order function 

- `api/v1/contract_trigger_cancel` Added API interface with cancel trigger order funcion

- `api/v1/contract_trigger_cancelall` Added API interface with cancal all trigger orders funciton

- `api/v1/contract_trigger_openorders` Added API interface with get trigger orders function

- `api/v1/contract_trigger_hisorders` Added API interface with get history trigger orders function

### 3、Updated API interfaces with fee coin type field added corresponding to the given fee.

Interfaces are as follows:

-  `api/v1/contract_fee` query current fee rate

-  `api/v1/contract_order_info`query order information

-  `api/v1/contract_order_detail`query order detail 

-  `api/v1/contract_openorders`query current open orders

-  `api/v1/contract_hisorders`query history orders

-  `api/v1/contract_matchresults`query history transactions

-  add fee coin type push in websocket transactions subcription

### 4、Updated API interfaces with the 'create_date' field to support any positive interger

Please note that the system will return with the last 90-day data by default if the 'create_date' field exceed 90.

- `api/v1/contract_hisorders`query history orders

- `api/v1/contract_trigger_hisorders`query history trigger orders

- `api/v1/contract_matchresults`query history transactions

- `api/v1/contract_financial_record`query financial records


## 1.0.8 2019-10-17 API Upgrade: Added the order_id_str field 

- To solve the problem that the userOrderId of node.js and javascript is too long, the order_id_str field will be added to the following interface, the type is String, which is expected to go online today: 

api/v1/contract_order

api/v1/contract_batchorder

api/v1/contract_matchresults

api/v1/contract_hisorders

api/v1/contract_openorders

api/v1/lightning_close_position 

api/v1/contract_order_info

- WebSocket added the order_id_str field  

## 1.0.7 2019-10-15

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

## 1.0.6 2019-08-08 API Upgrade: Added rest interface

### Added rest interface

  Request access to address: https://www.hbdm.com/heartbeat
  
  Note: To query whether the system is available or not, request https://www.hbdm.com/heartbeat. When Heartbeat is 1, system is available; when Heartbeat is 0, system is unavailable.

## 1.0.5 2019-07-10 API Upgrade: New Features of Query and Order Placing

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

## 1.0.4 2019-06-06 API Upgrade:Restful interface

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
 
## 1.0.3 2019-05-28 API Upgrade: WebSocket Portfolio Push 


### WebSoket balance push is available: 

  users could subscribe the interface to get information of their balances automatically.

### WebSoket position push is available: 

  users could subscribe the interface to get information of their positions automatically.

### Acuqire positions information via Restful interface: 

  api/v1/contract_position_info.
  
  The string of “latest price”is added into response

## 1.0.2 2019-05-14 API Upgrade: Transfer margin between Spot account and Future account

### URL /v1/futures/transfer

  This interface is used to transfer assets between Spot account and Future account.
  
  The type is “pro-to-futures” when transferring assets from Spot account to Future; “futures-to-pro” when transferring from Future account to Spot account.

  API rate limit for this interface is up to 10 times per minute.

### API rate limit

  Private interface rate limit has been increased from 10 times/second to 30 times every 3 seconds, which means users could send up to 30 requests within 3 seconds.
  
  The rate limit of other non-market public interface has been increased from 20 times/second to 60 times every 3 seconds, which means users could send up to 60 requests within 3 seconds.
 
## 1.0.1 2019-05-09 API Upgrade: Post_only and more

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
 
# Future API Access Illustration

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
Read     |   Market Data           |  api/v1/contract_liquidation_orders |   GET       |  Request Liquidation Order Information            |  No  |
Read     |  Market Data           |  api/v1/index/market/history/index |   GET       |  Get Index Kline Data            |  No  |
Read     |  Market Data           |  api/v1/index/market/history/basis |   GET       |  Get Basis Data            |  No  |
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
Read     |  User Account           |  api/v1/contract_account_position_info |     POST       | User’s position Information And User’s position Information            |  Yes  |
Read | Trade  |  api/v1/contract_trigger_openorders       | POST             |   Query Trigger Order Open Orders                              | Yes  |
Read | Trade  |  api/v1/contract_trigger_hisorders       | POST             |  Query Trigger Order History                          | Yes  |
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
Trade | Trade  |  v1/futures/transfer       | POST             |  Transfer margin between Spot account and Future account                          | Yes  |
Trade | Trade  |  api/v1/contract_trigger_order       | POST             |  Place Trigger Order                          | Yes  |
Trade | Trade  |  api/v1/contract_trigger_cancel       | POST             |  Cancel Trigger Order                          | Yes  |
Trade | Trade  |  api/v1/contract_trigger_cancelall       | POST             |    Cancel All Trigger Orders                   | Yes  |

##  Address

Address | Applicable sites | Applicable functions | Applicable trading pairs |
------ | ---- | ---- | ------ |
https://api.hbdm.com  | Huobi Future |    Market     | Trading pairs provided by Huobi Future  |

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

Futures and perpetual swaps are using seperate API rate limits.

Please note that, for both public interface and private interface, there are rate limits, more details are as below:

* Generally, the private interface rate limit of API key is at most 30 times every 3 seconds for each UID (this 30 times every 3 seconds rate limit is shared by all the altcoins contracts delivered by different date).

* For public interface used to get information of index, price limit, settlement, delivery, open positions and so on, the rate limit is 60 times every 3 seconds at most for each IP (this 60 times every 3 seconds public interface rate limit is shared by all the requests from that IP of non-marketing information, like above).

* In terms of public interface used to get candle chart data, the latest transaction record and information of aggregate market, order book and so on, the rate limit is as below:

    （1） For restful interface: 200 times/second for one IP at most.

    （2）For websocket: The rate limit for “req” request is 50 times at once. No limit for “sub” request as the data will be pushed by sever voluntarily.

* WebSocket, the private order push interface, requires API KEY Verification:

    Each UID can build at most create 10 WS connections for private order push at the same time. For each account, 
    contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS 
    order push connection for BTC Contract which will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly
    contracts. Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

* Will response following string for "header" via api 

    ratelimit-limit: the upper limit of requests per time, unit: time

    ratelimit-interval: reset interval (reset the number of request), unit: ms

    ratelimit-remaining: the left available request number for this round, unit: time

    ratelimit-reset: upper limit of reset time used to reset request number, unit: ms 

## API Limitation on Order Cancellation Ratio

* The system will calculate the order cancellation ratio automatically when the total number of orders placed via certain order price types by the API user goes equal to or larger than 2,500 within 10 minutes. If the order cancellation ratio is greater than 99%, the user will be prohibited for 5 minutes from placing orders via certain API order price types which will be listed below.
* A 30-minute API order placement prohibition will be triggered if the user was prohibited for 3 times within an hour. After resuming access, the total number of prohibited times will be cleared during the previous period and will not be counted into the total prohibited times in the new period.
* Please note that the prohibition from placing orders will cause no effect on order cancellation via API as well as order placement and cancellation via other terminals. We’ll keep you notified on each prohibition via SMS and email.
* Only four API order price types will be prohibited which are Limit order, Post_only, FOK and IOC. Please note that you can still use freely other order price types during the banned period, such as Flash Close, BBO, Optimal 5, Optimal 10 and Optimal 20, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok,etc.
* When placing order by using the four prohibited order price types during the prohibition period, the message header returned by interface will include the field: "recovery-time: recovery timestamp" whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp; if you are not in the prohibition period, the field is not included in returned header;
* Please note that our system calculates order cancellation ratio according to UID and therefore, the master account UID and sub-accounts UIDs will be counted separately. The calculation period is 10 min/time.
* Definition of Indicators：
  
  - Order Cancellation Ratio =Total number of invalid cancellation / Total number of placed orders (all types of orders placed via API) 
  - Total number of placed order: Total number of placed orders refers to all orders placed via API which meet these requirements:
    - 1.the order type is placing orders (Order Type = 1),
    - 2.order price types include Limit Order, Post_only, FOK and IOC.
    - 3.order creating time should be within the interval between 3 seconds before the start time of the calculation period and the end time of the calculation period.
  - Total number of invalid cancellation:Total number of invalid cancellation refers to all cancellation orders placed via API which meet the requirements.

    - the order type is placing orders (order Type=1),
    - the order price types are Limit Order, post_only, FOK and IOC.
    - the order status is “Orders cancelled” (status=7).
    - order with 0 fulfilled.
    - the interval between order cancellation and placement should be less than or equal to 3 seconds.
    - the order cancellation time should be within the calculation period.
  
- In order to ensure stability and transaction performance of API, please try to reduce order cancellation rate and cancellation amount during peak periods to avoid frequent triggering of API restriction mechanism.Suggestions of reducing order cancellation rate are as below:

  - 1. Set orders’ price to BBO prices as close as possible;

  - 2. Prolong the interval properly between each order placement and cancellation;

  - 3. Try to increase your amount for each order and reduce the frequency of order;

  - 4. Try to improve your order fulfillment rate:

    - （1）Please try to use order prices types that help more on order fulfillment in preference such as BBO, Optimal 5, Optimal 10, Optimal 20, Flash Close, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok, etc.

    - （2）Try to use best bid/ask price when placing IOC orders, FOK orders and Post_only orders.

  - 5. Please try to extend your request polling cycle when implementing your strategy.
    
## Query whether the system is available  

- Interface `https://www.hbdm.com/heartbeat`

> Response:

| Parameter Name | Parameter Type   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| status             | string                   | "ok" or "error"... 
| data             | dict object                 | 
| heartbeat             | integer                   | future 1: avaiable 0: not available 
| swap_heartbeat             | integer                   | swap 1: avaiable 0: not available 
| estimated_recovery_time             | long                   | null: normal. estimated recovery time :millionseconds.
| swap_estimated_recovery_time             | long                   | null: normal. swap estimated recovery time millionseconds.

```json
  {
      "status": "ok",
      "data": {"heartbeat": 1,
              "estimated_recovery_time": null,
              "swap_heartbeat": 1,
              "swap_estimated_recovery_time": null},
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
1004|System busy. Please try again later. |
1010|	user not existing              |
1011|	user session not exists            |
1012|	user account not exists             |
1013|	contract type not exists             |
1014|	contract not exists               |
1015|	index price not exists            |
1016|	BBO price not exists             |
1017|	query order not exists             |
1018|Main account doesn't exist. |
1019|Main account doesn't exist in the sub-account white list. |
1020|The number of your sub-account exceeds the maximum. |Please contact customer service. |
1021|Account open failed. Main account hasn’t opened contract trading account yet. |
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
1070|Empty data, cannot be exported. |
1071|Repeated withdraw. |
1072|Sell price must be lower than {0} USD.|
1073|Position abnormal. Please contact the customer service.|
1074|Unable to order currently. Please contact the customer service.|
1075|Your order may result in liquidation. Please modify and order again.|
1076|No orders, please try again later.|
1077|In settlement or delivery. Unable to get assets.|
1078|In settlement or delivery. Unable to get assets.|
1079|In settlement or delivery. Unable to get positions.|
1080|In settlement or delivery. Unable to get positions.|
1081|The number of unfilled trigger order exceeds the limit.|
1082|Trigger type parameter error.|
1083|Your position is in the process of forced liquidation. Unable to place order temporarily.|
1084|Your contract API is disabled, please try again after {0} (GMT+8).|
1085|Trigger order failed, please modify the price and place the order again or contact the customer service.|
1086|{0} contract is restricted of opening positions on {1}.  Please contact customer service.|
1087|{0} contract is restricted of closing positions on {1}.  Please contact customer service.|
1088|{0} contract is restricted of withdraw order on {1}. Please contact customer service.|
1089|{0}contract is restricted of transfer.  Please contact customer service.|
1090|Margin rate is lower than 0. Order can’t be placed.|
1091|Equity is less than 0. Order can’t be placed.|
1100|	users do not have rights to open positions            |
1101|	users do not have rights to close positions            |
1102|	users do not have rights to deposit            |
1103|	users do not have rights to withdraw            |
1104|	without contract trading permission, you are banned to trade       |
1105|	with current contract trading permission, you are only allowed to close positions       |
1106|Abnormal contracts status. Can’t transfer. |
1108|Abnormal service. Please try again later. |
1109|Sub-account doesn't own the permissions to open positions. Please contact customer service. |
1110|Sub-account  doesn't own the permissions to close positions. Please contact customer service.|
1111|Sub-account doesn't own the permissions to transfer in. Please contact customer service.|
1112|Sub-account doesn't own the permissions to transfer out. Please contact customer service.|
1113|The sub-account does not have transaction permissions. Please login main account to authorize.|
1114|The sub-account does not have transfer permissions. Please login main account to authorize.|
1115|You have no access permissions of this sub-account.|
1200|	login error                |
1220|	user has not onboarded Huobi Future or activate the account          |
1221|	lack of margin to open account              |
1222|	insufficient account opening days             |
1223|	account VIP level not high enough          |
1224|	account registration place restricted               |
1225|	unsuccessful account opening               |
1226|Repeated account.|
1227|Huobi Contract does not support sub-accounts. Please log out sub-account and log in again with primary account.|
1228|Account has not opened, cannot agree to agreement.|
1229|Cannot agree twice.|
1230|You haven't finished the risk verification.|
1231|You haven't finished the ID Verification.|
1232|The format/size of the image you uploaded does not meet the requirements. Please re-upload.|
1250|Unable to get the HT_token.|
1251|Unable to get BTC assets. Please try again later.|
1252|Unable to get currency account assets. Please try again later.|
1253|Error in signature verification.           |
1300|Transfer failed.|
1301|Insufficient amount available.|
1302|Transfer failed.|
1303|The single transfer-out amount must be no less than {0}{1}.|
1304|The single transfer-out amount must be no more than {0}{1}.|
1305|The single transfer-in amount must be no less than {0}{1}.|
1306|The single transfer-in amount must be no more than {0}{1}.|
1307|Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.|
1308|Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.|
1309|Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.|
1310|Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.|
1311|The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.|
1312|The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.|
1313|The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.|
1314|The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being|
1315|Wrong transfer type.|
1316|Failed to freeze the transfer.|
1317|Failed to unfreeze the transfer.|
1318|Failed to confirm the transfer.|
1319|Failed to acquire the available transfer amount.|
1320|The contract status is abnormal. Transfer is unavailable temporarily.|
1321|Transfer failed. Please try again later or contact customer service.|
1322|Invalid amount. Must be more than 0.|
1323|Abnormal service, transfer failed. Please try again later.|
1325|Failed to set trading unit|
1326|Failed to obtain trading units|
1327|No transfer permission, transfer failed, please contact customer service|
1328|No transfer permission, transfer failed, please contact customer service|
1329|No transfer permission, transfer failed, please contact customer service|
1330|No transfer permission, transfer failed, please contact customer service|
1331|Exceeds limit of transfer accuracy (8 digits). Please modify it|
12001|Invalid submission time.|
12002|Incorrect signature version.|
12003|Incorrect signature method.|
12004|Private key is expired.|
12005|Incorrect IP address.|
12006|The submission time can't be empty.|
12007|Incorrect public key.|
12008|Verification failed.|
12009|The user is locked or doesn't exist.|


### API ERROR FAQ

一、Orders can't be placed or cancelled during settlement period, error code "1056" will be returned if users place or cancel orders.
You are recommended to request contract information every few seconds during settlement period: api/v1/contract_contract_info. It's in settlement time if there is any number of 5, 6, 7, 8 included in the returned status code of contract_status, while it indicates that settlement completed and users could place and cancel orders as usual if the returned status code is 1.

二、 We warmly remind you that Huobi Futures is settled at 16:00 on each Friday (GMT+8). When querying fund or position information during the settlement period, error codes will be returned. 

Error codes and their meaning are as following:

1. Error code "1077" indicates that "the fund query of current perpetual swap trading pair failed during the settlement";            
2. Error code "1078" indicates that "the fund query of part of perpetual swap trading pairs failed during the settlement";            
3. Error code "1079" indicates that "the position query of current perpetual swap trading pair failed during the settlement";             
4. Error code "1080" indicates that "the position query of part of perpetual swap trading pairs failed during the settlement";   

You are recommended to read the status code from the returned message. If the above four types of status code appear, the returned data is not accurate and couldn't be used as reference.


三、We notice that the system is sometimes overloaded when the market suddenly turns to be highly volatile. If the system is busy recently or the following prompts appear:

{“status”: “error”, “err_code”: 1004, “err_msg”: “System busy. Please try again later.”, “ts”:}

please be patient, and do not place or cancel order repeatedly during the process to avoid repeated orders and additional pressure on system performance. In the meanwhile, it is recommended to place and cancel orders through Web and APP.

## API Best Practice

### 1. Query contract history orders interface: /api/v1/contract_hisorders

- To ensure timeliness and to reduce latency, users are highly recommended to get contract history orders information faster from server memory using interface “query contract order information” (URL: api/v1/contract_order_info).

- For users who use interface “query contract history orders” (URL: /api/v1/contract_hisorders), please enter as many query conditions as possible (including symbol, trade_type（recommended to send “0” to query all）, type, status, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 2. Query contract match results interface: /api/v1/contract_matchresults

- To improve query performance and response speed, please enter as many querying conditions as possible (including symbol, trade_type（recommended to send “0” to query all）, contract_code, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 3. Query contract financial record interface: /api/v1/contract_financial_record

- To improve query performance and response speed, please enter as many querying conditions as possible (including symbol, type(recommended to leave it blank to query all), create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 4. Query contract order detail interface: api/v1/contract_order_detail

- Querying condition “created_at” uses 13-bit long type time stamp (including milliseconds). Querying performance will be improved when accurate time stamps are entered.

- For example: the converted time stamp of "2019/10/18 10:26:22" is 1571365582123. The returned ts from interface “contract_order” can be used as time stamp to query corresponding order. 0 is not allowed in parameter “created_at”.

 

### 5. Query contract trigger order history orders interface:

- api/v1/contract_trigger_hisorders

- To improve query performance and response speed, please enter as many parameters as possible (including symbol, contract_code, trade_type, status, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 6. WebSocket subscription to Market Depth data:

- For acquiring market depth data within 150 steps, you are kindly suggested to use step0, step1, step2, step3, step4, step5；

- For acquiring market depth data within 20 steps, you are kindly suggested to use step6, step7, step8, step9, step10, step11；

- Since the large volume of pushing 150 steps data every 100ms, WebSocket disconnection may occur frequently if client’s network bandwidth is insufficient or the processing is not in time; therefore, we highly recommend users using step6, step7, step8, step9, step10, step11 to acquire 20 steps data. For instance, subscribing 20 steps data.

`{`

  `"sub": "market.BTC_CQ.depth.step6",`

  `"id": "id5"`

`}`

- We also suggest that you subscribe incremental market depth data.orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.You can subscribe 20 or 150 unmerged data.

`{`

  `"sub": "market.BTC_CQ.depth.size_20.high_freq",`

` "data_type":"incremental", `

` "id": "id1" `

`}`

### 7. Place order interface (URL: api/v1/contract_order) and place a batch of orders interface (URL:api/v1/contract_batchorder):

- We recommend to fill in the parameter “client_order_id”(should be unique from user-side),which can help users to acquire order status and other order information according to the parameter “client_order_id" from

- query order information interface (URL: api/v1/contract_order_info ) when there is no returned information due to network or other problems.

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

- <a href='https://github.com/huobiapi/Futures-Java-demo/tree/master/hbdm-java-sdk'>Java</a>


# Future API FAQ

## Access and Authentication

### Q1: Is the API Key  for future and spot the same ?
     
Yes. The future API key and spot API key are same. You can create API using the following link.<a href=https://www.hbg.com/zh-cn/apikey/> click here</a>

### Q2: Why are APIs  disconnected or timeout?

1. The network connection is unstable if the server locates in China mainland,it is suggested to invoke APIS from a server located in  1a area of AWS Tokyo.

2.  You can use api.btcgateway.pro to debug for domestic network.

### Q3: Why is the websocket often disconnected?

It seems that most of the abnormal websocket  issues (such as disconnect, websocket close )(websocket: close 1006 (abnormal closure))are caused by different network environment. The following measures can effectively reduce websocket issues.

It would be better if the server is located in 1a area of AWS Tokyo with url api.hbdm.vn and implement websocket re-connection mechanism. Both market heartbeat and order heartbeat should response with Pong with different format, following  Websocket market heartbeat and account heartbeat requirement.<a href=https://docs.huobigroup.com/docs/dm/v1/en/#websoket-heartbeat-and-authentication-interface>here</a>

### Q4:  What is the difference between api.hbdm.com and api.hbdm.vn?

The api.hbdm.vn uses AWS's CDN service. it should be more stable and faster for AWS users. The api.hbdm.com uses Cloudflare's CDN service.

### Q5: What is the colocation service ? which attention points should we know ?

Actually ,colo corresponds to a vpc node, which directly connects to  private network of huobi's future, so it will reduce the latency between the client and the Huobi future server (bypassing the CDN)

huobi future and huobi swap have the same colo, so the domain name connecting the swap api and the future api are the same.

Note : Colo needs to use api.hbdm.com for signature(authentication) to avoid getting 403 error: Verification failure. 

### Q6: Why does signature verification return failure (403: Verification failure) ?

The signature process of future is similar to huobi swap . In addition to the following precautions,please refer to the swap or future demo to verify whether the signature is successful. Please check your own signature code after demo verification is successful. The swap code demo is <a href=https://huobiapi.github.io/docs/coin_margined_swap/v1/cn/#2cff7db524>here</a>. The future code demo is <a href=https://huobiapi.github.io/docs/dm/v1/cn/#2cff7db524>here</a>.

1. Check if the API key is valid and copied correctly.
2. Check if the IP is in whitelist
3. Check if th timestamp is UTC time
4. Check if parameters are sorted alphabetically
5. Check if the encoding is UTF-8 
6. Check if the signature has base64 encoding
7. Any method with parameters for GET requests should be signed.
8. Any method with parameters for POST requests don't need to be signed.
9. Check if whether the signature is URI encoded and Hexadecimal characters must be capitalized, such as ":" should be encoded as "%3A", and the space should be encoded as "%20"
10. The authorization of websocket is similar to  the authorization of restful interface.Pls note that the json body of the websocket authorization shouldn't be URL encoded.

### Q7: Is the ratelimit of public market based on IP ? Is the ratelimit of interface with  private key based on UID?

Yes. The ratelimit of interface with private key is based on the UID, not the API key. The master and sub accounts are separately ratelimited and don't affect each other.

### Q8: Is there any recommendation for third-party framework which integrates Huobi future?

There is an open source asynchronous quantization framework which integrates Huobi future and Huobi swap: <a href=https://github.com/hbdmapi/hbdm_Python>here</a>. If you have any quetsions, please open a ticket in github issues.

## Market and Websocket


### Q1: How often are the snapshot orderbook subscription and incremental orderbook subscription pushed?

The snapshot orderbook subscription(market.$symbol.depth.$type) is checked once every 100MS.If there is an update,it will be pushed. It will be pushed at least 1 second.The incremental orderbook subscription is checked once every 30MS.If there is an update,it will be pushed.If there is no update, it will not be pushed.

### Q2: How often is the market trade subscription pushed?

The market trade subscription will be pushed when there is a transaction. 

### Q3: Are there historical K-line data or historical market trade data? 

Historical K-line data can be obtained through the API interface:/market/history/kline.Only the from and to parameters need to be filled in, and the size parameter is not needed.At most, only two consecutive years of data can be obtained.

The historical market trade data is currently not available, you can store it locally by subscribing to market trade: market.$symbol.trade.detail.

### Q4: How to get MACD and other technical indicators on K-line? 

The API does not have interfaces to get technical indicators such as MACD. You can refer to TradingView and other websites to calculate them.

### Q5: What is the definition of timestamp in the document? 

The timestamp in the document refers to the total number of seconds or total milliseconds from Greenwich Mean Time, January 1, 1970, 00:00:00 (Beijing Time, January 1, 1970, 08:00:00) to the present.

### Q6: What is the definition of the 150 level and 20 level of MBP?


The Subscription of MBP data: market.$symbol.depth.$type.150 price level means the current bids and asks splited into 150 level  by price.20 price level means the current bids and asks splited into 20 level by price.

### Q7: What is the meaning of merged depth when subscribing MBP data?

The subscrpition of MBP data:market.$symbol.depth.$type：

step1 and step7 are merged by 5 decimal places.bids down,asks up.
step2 and step8 are merged by 4 decimal places.bids down,asks up.
step3 and step9 are merged by 3 decimal places.bids down,asks up.
step4 and step10 are merged by 2 decimal places.bids down,asks up.
step5 and step11 are merged by 1 decimal places.bids down,asks up.

Example:

step4(0.01): 

bids price: 100.123, 100.245.
The merged bids price are 100.12, 100.24.

asks price: 100.123, 100.245
The merged asks price are 100.13, 100.25.

("Down" and "Up" are rounded up or down, if the price is down, the asks price is not rounded down, and the bids price is rounded up.)

120 price level: step0 to step5；

20 price level: step6 to step11;

More examples：

step1(0.00001):

price: 1.123456
The merged bid price is 1.12345.
The merged ask price is 1.12346.

step7(0.00001):

price: 1.123456
The merged bid price is 1.12345.
The merged ask price is 1.12346.

step6(0.000001)

price: 1.123456
The merged bid price is 1.123456.
The merged ask price is 1.123456.

step11(0.1):

price: 1.123456
The merged bid price is 1.1.
The merged ask price is 1.1.

### Q8:Does websocket's position channel push full data or incrementall data each time? 

Subscription of position event: "positions.btc".The latest position is pushed,including the volumes, available volumes, frozen volumes.If there is no update,it will not be pushed. 

### Q9: Does websocket's position channel push data when the unrealized profit is updated?

Subscription of position event: "positions.btc".It will not be pushed  if only unrealized profit is updated.
It will be pushed only when position event is updated.

### Q10: What is the difference between market detail and trade detail in WS?

Market Detail(market.$symbol.detail) is the merged market data. It will be checked every 0.5s, pushed once trade event udpates,including the OHLCV data,etc.Trade Detail(market.$symbol.trade.detail) is pushed once trade event updates,including trade price, trade volume, trade direction,etc.

### Q11: What is the meaning of the two ts pushed by subscription of incremental MBP ?

Subscription of incremental MBP：market.$symbol.depth.size_${size}.high_freq，The outer ts is the timestamp when the market server sends the data.The inner ts is the timestamp when the orderbook is checked.

### Q12: What is the difference between websocket subscription of MBP and incremental MBP? How often is the incremental MBP pushed?

market.$symbol.depth.$type is snapshot MBP data，market.$symbol.depth.size_${size}.high_freq is incremental MBP data.Snapshot MBP data is checked every 100ms,pushed at least every 1s.Incremental MBP data is checked every 30ms.It will not be pushed,if MBP has no update.

### Q13: How to maintain local MBP data subscribing incremental MBP:market.$symbol.depth.size_${size}.high_freq?

Snapshot MBP data will be pushed for the first time, and the incremental MBP data will be pushed afterwards.

(1) Compare the incremental price with the previous full MBP data, and replace the order amount with the same price;

(2) If the price is not in the local MBP data,add the price to the local MBP data;

(3) If a price level is gone, data such as [8100, 0] will be pushed.You have to remove the same price of local MBP data;

(4) For the same websocket connection, the incremental data version is incremented; if the version is not incremented, you need to re-subscribe and re-maintain the local full MBP data;

### Q14: Will the quarter contract of the delivery contract be converted to the next week contract, will it be notified or changged by WS?

If a quarterly contract such as BTC_CQ is converted to the next week contract BTC_NW, WS will not automatically notify you, you need to change the subscription to BTC_NW.

## Order and Trade

### Q1: What is the future settlement cycle? Which interface can be used to check the status when the future is settled? 

一、Orders can't be placed or cancelled during settlement period, error code "1056" will be returned if users place or cancel orders. You are recommended to request contract information every few seconds during settlement period: api/v1/contract_contract_info. It's in settlement time if there is any number of 5, 6, 7, 8 included in the returned status code of contract_status, while it indicates that settlement completed and users could place and cancel orders as usual if the returned status code is 1.

二、 We warmly remind you that Huobi Futures is settled at 16:00 on each Friday (GMT+8). When querying fund or position information during the settlement period, error codes will be returned.

Error codes and their meaning are as following:

Error code "1077" indicates that "the fund query of current perpetual swap trading pair failed during the settlement";
Error code "1078" indicates that "the fund query of part of perpetual swap trading pairs failed during the settlement";
Error code "1079" indicates that "the position query of current perpetual swap trading pair failed during the settlement";
Error code "1080" indicates that "the position query of part of perpetual swap trading pairs failed during the settlement";
You are recommended to read the status code from the returned message. If the above four types of status code appear, the returned data is not accurate and couldn't be used as reference.

### Q2: What's the reason for 1004 error code?

We notice that the system is sometimes overloaded when the market suddenly turns to be highly volatile. If the system is busy recently or the following prompts appear:

{“status”: “error”, “err_code”: 1004, “err_msg”: “System busy. Please try again later.”, “ts”:}

please be patient, and do not place or cancel order repeatedly during the process to avoid repeated orders and additional pressure on system performance. In the meanwhile, it is recommended to place and cancel orders through Web and APP.

### Q3: The same order ID and match ID can have multiple trades. for example: if a user take a large amount of maker orders, there will be multiple corresponding trades . How to identify these different trades ?

The field ID returned by the information interface api/v1/contract_order_detail is a globally unique transaction identifier. if a maker order is matched multiple times, a trade will be pushed once there is a transaction matched.

### Q4: What is the delay for the round trip of huobi future?

At present,it normally takes about 200-300ms from placing the order to getting the status of the order.

### Q5: Why does the API return connection reset or Max retris or Timeout error?

Most of the network connectivity problems ,(such as Connection reset or network timeout )  are caused by network instability , you can use the server in AWS Tokyo A area with api.hbdm.vn , which can effectively reduce network timeout errors.

### Q6: How to check the order status without order_id not returned?
 
 If the order_id couldn't be returned due to network problems, you can query the status of the order by adding the custom order number(client_order_id ).

### Q7: What to do if it's diconnected after the websocket subscription of account, order and positions for a while?
  
 When subscribing private accounts, orders and positions, the heartbeat should also be maintained regularly ,which is different from the market heartbeat format . Please refer to the <a href=https://docs.huobigroup.com/docs/dm/v1/en/#websoket-heartbeat-and-authentication-interface >"websocket Heartbeat and Authentication Interface" </a>. if the it is disconnected ,please try to reconnect.

### Q8. What is the difference between order status 1 and 2 ? what is the status 3 ?
 
 Status 1 is the preparation for submission. status 2 is the sequential submission  of internal process, which can be considered that it has been accepted by the system.  Status 3 indicated that the order has been  already submitted to market.

### Q9. Is there an interface to get the total assets in BTC of my account ? 
  
 No.

### Q10. Why is the order filled after the order is withdrawed successfully by placing API cancellation ?
  
 The success return of order cancellation or placement  only represents that the command is excuted successfully and doesn't mean that the order has been cancelled . You can check the order status through the interface api/v1/contract_order_info.

### Q11. How long does it generally take for an API from withdrawing to cancelling successfully ?

The order cancellation command generally takes several tens of ms. The actual status of order cancellation can be obtained by invoking the interface: api/v1/contract_order_info.


## Error Codes

### Q1: What is the reason for 1030 error code?

If you encounter errors such as {"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199},indicating that your input request parameter is not correct, please print your request body and complete URL parameters, and please check the corresponding API document interface one by one.The common example is that the volume must be an integer, and the client_order_id must be of type uint32 rather than type uint64. 

### Q2: What is the reason for 1048 error code?

If you encounter errors such as {'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available.'}, indicating that your available position is not enough.You need to query the api api/v1/contract_position_info to get your available position.

### Q3: What is the reason for 1032 error code? 

1032 means that your request exceeds the ratelimit. The perpetual contract and the delivery contract limit the rate separately. Please check the ratelimit in the api ratelimit instructions, and you can print the current ratelimit in the header of the API response to check whether the ratelimit is exceeded. It is recommended to increase the request interval delay to avoid exceeding the ratelimit.

## How to solve problems more effectively?

When you report an API error, you need to attach your request URL, the original complete body of the request and the complete request URL parameters, and the original complete log of the server's response. If it is a websocket subscription, you need to provide the address of the subscription, the topic of the subscription, and the original complete log pushed by the server.

If it is an order-related issue, use the API order query interface api/v1/contract_order_info to keep the complete log returned and provide your UID and order number.




# Market Data interface

## Get Contract Info 

### Example              
                                   
- GET  `api/v1/contract_contract_info`

```shell
curl "https://api.hbdm.com/api/v1/contract_contract_info"      
```
                                                           
### Request Parameter

  Parameter Name   |   Type   |   Mandatory   |   Description   |
------------------ | -------- | ------------- | --------------- |
symbol             | string   | false         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC","ETH"...  |
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
| symbol             | string             | false          | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC","ETH"... |

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
| symbol             | string             | false         | Case-Insenstive.Both uppercase and lowercase are supported.e.g."BTC","ETH"...                                    |
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
| symbol             | string             | false         | Case-Insenstive.Both uppercase and lowercase are supported.e.g."BTC","ETH"...                                    |
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
| symbol             | string             | true         | Case-Insenstive.Both uppercase and lowercase are supported.e.g."BTC","ETH"...                                    |

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
| symbol             | string             | true          | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| type               | string             | true          | Get depth data within step 150, use step0, step1, step2, step3, step4, step5（merged depth data 0-5）；when step is 0，depth data will not be merged; Get depth data within step 20, use step6, step7, step8, step9, step10, step11(merged depth data 7-11); when step is 6, depth data will not be merged. |

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
	"ch": "market.BTC_CQ.depth.step6",
	"ts": 1586336779425,
	"tick": {
		"mrid": 58038661925,
		"id": 1586336779,
		"bids": [
			[7376.41, 552],
			[7375.22, 3],
			[7375.21, 42],
			[7375.1, 50],
			[7374.97, 42],
			[7374.96, 111],
			[7374.95, 8],
			[7374.72, 8],
			[7374.71, 265],
			[7374.5, 50],
			[7374.08, 19],
			[7373.9, 100],
			[7373.88, 200],
			[7373.87, 38],
			[7373.8, 90],
			[7373.74, 161],
			[7373.64, 5],
			[7373.62, 13],
			[7373.49, 33],
			[7373.48, 10]
		],
		"asks": [
			[7376.42, 734],
			[7376.73, 1],
			[7377.26, 3],
			[7377.27, 67],
			[7377.28, 23],
			[7377.3, 50],
			[7377.45, 66],
			[7377.46, 68],
			[7377.53, 40],
			[7377.81, 9],
			[7377.9, 50],
			[7377.94, 200],
			[7377.95, 63],
			[7377.98, 33],
			[7378, 148],
			[7378.07, 11],
			[7378.24, 7],
			[7378.26, 3],
			[7378.38, 100],
			[7378.44, 13]
		],
		"ts": 1586336779412,
		"version": 1586336779,
		"ch": "market.BTC_CQ.depth.step6",
	}
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
| symbol             | true          | string   | Contract Name        |             | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| period             | true          | string   | K-Line Type          |             | 1min, 5min, 15min, 30min, 60min, 1hour,4hour,1day, 1mon      |
| size               | true         | integer  | Acquisition Quantity | 150         | [1,2000]                                                     |
| from              | false         | integer  | start timestamp seconds. |         |                                                    |
| to               | false         | integer  | end timestamp seconds |          |                                                      |
### Note

- Either `size` field or `from`/`to` fields need to be filled.
- If `size` field and `from`/`to` fields are not filled, It will return error messages.
- If `from` field is filled, `to` field need to filled too.
- The api can mostly return the klines of last two years.

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

### data parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | int | index kline id,the same as kline timestamp  |
| vol | decimal  | volume.             |
| count | decimal  | count.              |
| open | decimal  | open price               |
| close | decimal  | close  price            |
| low | decimal  |  lowest  price         |
| high | decimal  | highest price               |
| amount | decimal  |amount based on coins.            |


##  Get Market Data Overview

###  Example            
                                         
- GET `/market/detail/merged`
   
```shell
curl "https://api.hbdm.com/market/detail/merged?symbol=BTC_CQ"
```


###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | ------------- | ----------- | ------------------------------------------------------------ |
| symbol             | true          | string   | Contract Name |             | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |

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
| symbol             | true          | string   | Contract Name |             | Case-Insenstive.Both uppercase and lowercase are supported.. e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |

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
| symbol             | true          | string        | Contract Name                         |             | Case-Insenstive.Both uppercase and lowercase are supported.. e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter” |
| size               | true         | number        | Number of Trading Records Acquisition | 1           | [1, 2000]                                                    |

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
| symbol | false | string | Contract Type	 | Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，If no data detected, system will return to all contracts by default. |


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
| symbol | true | string |Contract Code	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |

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
| symbol | false | string | Contract Code	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...，If no data detected, system will return to all contracts by default. |


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
| symbol | true | string | Contract Code   | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
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
| symbol | false | string | symbol	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... If no data detected, system will return to all symbols by default |

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
master_transfer_sub | true | int | transfer from master to sub account："1" is available，“0” is unavailable |  |
sub_transfer_master | true | int | transfer from sub to master account："1" is available，“0” is unavailable |  |
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
| symbol | true | string | symbol	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
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
| symbol | true | string | symbol	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
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
| symbol      | true     | string | symbol        |         | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...                           |
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

## Get Index Kline Data

### example

- GET `/index/market/history/index`

```shell
curl "https://api.hbdm.com/index/market/history/index?symbol=BTC-USD&period=1min&size=150"
```

### request parameters
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | index symbol          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| size  | true     | integer    | data size          | 150 | [1,2000] |


### response parameters：
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | true     | string | data channel          |         | eg： market.period                           |
  \<data\>    |               |    |  object    |            | 
  id    |     true          | number   |  kline ID     |            
  vol    |     true          | decimal   |  Trade Volume(Cont.) The value is 0   |            
  count    |     true          | decimal   |   Order Quantity The value is 0|            
  open    |     true          | decimal   |   Opening Index Price  |            
  close    |     true          | decimal   |  Closing Index Price,  the price in the last kline is the latest order price   |            
  low    |     true          | decimal   |  Lowest Index Price   |            
  high    |     true          | decimal   |  Highest Index Price   |            
  amount    |     true          | decimal   |  Trade Volume(Coin), The value is 0. )   |            
  \</data\>    |               |     |      |          
| status  | true     | string    | process status          |   | "ok" , "error" |
| ts  | true     | long    | timestamp of the response of the server          |  |  unit：millionseconds |


- Response Example：

```
{
  "ch": "market.BTC-USD.index.1min",
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

## Get Basis Data

### example

- GET `/index/market/history/basis`

```shell
curl "https://api.hbdm.com/index/market/history/basis?symbol=BTC-USD&period=1min&size=150&basis_price_type=open"
```

### request parameters
| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | symbol name          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter”.                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |
| size  | true     | integer    | data size         | 150 | [1,2000] |

### response parameters

| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| id | true | long | unique id |  |
| contract_price | true | string | contract price|  |
| index_price | true | string | index price|  |
| basis | true | string | basis=contract_price - index_price |  |
| basis_rate | true | string | basis_rate=basis/index_price |  |
| ts | true  | long | the timestamp of generation |  |

- Note：
   2000 size at most per request ；

- Response example：

```json
{
  "ch": "market.BTC_CW.basis.1mon.close",
  "data": [{
    "basis": "34.39000000000124",
    "basis_rate": "0.003968208179193762",
    "contract_price": "8700.77",
    "id": 1580486400,
    "index_price": "8666.38"
  }, {
    "basis": "-18.720000000000255",
    "basis_rate": "-0.0028115411360609068",
    "contract_price": "6639.55",
    "id": 1582992000,
    "index_price": "6658.27"
  }],
  "status": "ok",
  "ts": 1585309433084
}
```


# Account Interface

## User’s Account Information

###  Example          
                                      
- POST `api/v1/contract_account_info`  

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |   Default   |   Value Range                                           |
| ------------------ | ------------- | -------- | ------------ | ----------- | ------------------------------------------------------- |
| symbol             | false         | string   | Variety code |             | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...if default, return to all types defaulted |

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
| symbol             | false         | string   | Variety code |             |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...if default, return to all types defaulted |

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
| symbol      | false     | string | type code          |         | Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...  ,if blank, it will return all contract types by default                          |

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
| symbol | false | string | type code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，if blank, it will return all contract types by default  |
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
| symbol | false | string | type code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，if blank, it will return all contract types by default  |
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
| symbol | true | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC","ETH"... |
| type | false | string | if not fill this parameter, it will query all types 【please use "," to seperate multiple types】 | close long：3，close short：4，fees for open positions-taker：5，fees for open positions-maker：6，fees for close positions-taker：7，fees for close positions-maker：8，close long for delivery：9，close short for delivery：10，delivery fee：11，close long for liquidation：12，lose short for liquidation：13，transfer from spot exchange to contract exchange：14，tranfer from contract exchange to spot exchange：15，settle unrealized PnL-long positions：16，settle unrealized PnL-short positions：17，clawback：19，system：26，activity prize rewards：28，rebate：29 transfer to sub：34，transfer from sub: 35, transfer to master: 36，transfer from master：37,  |
| create_date | false | int |  any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.  |  |
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
      }],
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
| symbol | false | string | contract code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，If no data detected, system will return to all contracts by default |
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Flash Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order,"opponent_ioc"：IOC order using the BBO price，"lightning_ioc"：lightning IOC，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC， "optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"lightning_fok"：lightning FOK，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |

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
| symbol | false | string | Contract Code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，If no data detected, system will return to all contract by default|

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
      "delivery_fee": "0.0005",
      "fee_asset":"BTC"
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
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| \</data\> |  |  |  |  |

## Query information on Transfer Limit

- POST `api/v1/contract_transfer_limit`
 
 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | Contract Code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，If no data detected, system will return to all contracts by default. |

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
| symbol | false | string | Contract Code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...，If no data detected, system will return to all contracts by default. |

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

## Query Assets And Positions

- post `api/v1/contract_account_position_info`
  
### params

field               |  Mandatory |  type  |  desc         |   range       |
----------------------- | -------- | ------- | ------------------ | -------------- |
symbol | true | string | symbol	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH".... |

> Response:

```json

{
	"status": "ok",
	"data": [{
		"symbol": "BTC",
		"margin_balance": 0,
		"margin_position": 0,
		"margin_frozen": 0,
		"margin_available": 0,
		"profit_real": 0,
		"profit_unreal": 0,
		"risk_rate": null,
		"withdraw_available": 0,
		"liquidation_price": null,
		"lever_rate": 20,
		"adjust_factor": 0.13,
		"margin_static": 1,
		"positions": [{
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
			"lever_rate": 20,
			"direction": "buy",
			"last_price": 7900.17
		}]
	}],
	"ts": 1560147583367
}

```

### response

attr | type | Mandatory | desc     |
-----  | -----  | -----  | -----  |
symbol | String | true | contract type                                     |
margin_balance | Number | true | Balance Margin                            |
margin_position | Number | true | Postion Margin                           |
margin_frozen | Number | true | Frozen Margin                              |
margin_available | Number | true | Available Margin                        |
profit_real | Number | true | Realized Profit                              |
profit_unreal | Number | true | Unreadlized Profit                         |
risk_rate | Number | true | risk rate                                      |
withdraw_available | Number | true | Available Withdraw                    |
liquidation_price | Number | true | Estimated Liquidation Price            |
lever_rate | Number | true | Leverage Rate                                 |
adjust_factor | Number | true | Adjustment Factor                          |
margin_static | decimal  | true  | Static Margin                          |
\<list\>(Attrs: positions) |              |          |                            |
symbol | String | true | Variety Code                                                    |
contract_code |  string | true  | Contract Code	"BTC180914" ...                         |
contract_type  | string |  true | Contract Type	"this_week", "next_week", "quarter"     |
volume  | decimal  |  true | Position Quantity                                           |
available  |  decimal |  true  | Available position quatity can be closed                |
frozen  |  decimal |  true | forzen postion Quantity                                     |
cost_open  |  decimal |  true | Opening Average Price                                    |
cost_hold | decimal  |  true | Average position price                                    |
profit_unreal | decimal  | true  | Unrealized profit                                     |
profit_rate | decimal  | true  | Profit Rate                                            |
profit |  decimal |  true | Profit                                                      |
position_margin |  decimal |  true | Position Margin                                    |
lever_rate | Number | true | Leverage Rate                                               |
direction | string  | true  | "buy" "sell"	                                            |
last_price | decimal  | true  | Last Price                                              |
\</list\>                  |              |          |                            |
 
## Transfer between master and sub account

- post `api/v1/contract_master_sub_transfer`

> Request:

```json
{
	"sub_uid": "123123123",
	"symbol": "BTC",
	"amount": "123",
	"type": "master_to_sub"
}
```

### 请求参数

| attr   | required  | type     | desc   |     |
| ------ | ----- | ------ | ---- | ---------------------------- |
| sub_uid | true | long | uid of sub account	 |  |
| symbol | true | string | symbol | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
| amount | true | decimal | transfer amount ||
| type | true | string | transfer type | "master_to_sub" or "sub_to_master" |

- Note：
  the rate limit between the master account and each subaccount is 10 times/ minute
  
> Response:

```json
{
  "status": "ok",
  "ts": 158797866555,
  "data":   {
      "order_id": 122133213,
  }
}

```

### response

| attr          | required | type      | desc              |                                      |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | status          | "ok" , "error"                           |
| ts            | true | long    | response timestamp，millionseconds   |                                          |
| \<data\>      | true     |  object        |      |   |
| order_id        | true | long  | order id            |  |
| \</data\>     |      |         |         |   |

## Get transfer records between master and sub account

- post `api/v1/contract_master_sub_transfer_record`

> Request:

```json
{
	"sub_uid": "123123123",
	"symbol": "BTC",
	"amount": "123",
	"type": "master_to_sub"
}
```

### request

| attr   | required  | type    | desc   |      |
| ------ | ----- | ------ | ---- | ---------------------------- |
| symbol | true | string | symbol | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
| transfer_type | false | string | All by default【multiple types need to be joined with ';'】 | 34:transfer to sub account 35:transfer from sub account  |
| create_date | true | int | days | days need to be less than or equal to 90 |
| page_index | false | int | 1 by default | 1 |
| page_size | false | int | 20 by default.less than or equal to 50. | 20 |

> Response:

```json
{                                  
    "status": "ok",                           
    "ts": 1490759594752,            
    "data":{                         
      "transfer_record" : [         
        {                            
        "id": 192838272,             
        "ts": 1408076414000,         
        "symbol":"BTC",        
        "sub_uid":123123123,      
        "sub_account_name":"bolin",       
        "transfer_type":34,              
        "amount":1,                  
        },...                        
      ],
      "total_page":15,          
      "current_page":3,         
      "total_size":3            
      } 
  }
```

### response

| attr          | required | type     | desc |  |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | respone status          | "ok" , "error"                           |
| ts            | true | long    | response millionseconds.   |                                          |
| \<data\>      | true     |  object        |      |   |
| \<transfer_record\>      | true     |  object array      |      |   |
| id        | true | long  | transfer id            |  |
| ts        | true | long  | create timestamp            |  |
| symbol        | true | string  | symbol  |"BTC","ETH"...  |
| sub_uid        | true | long  | subaccount uid            |  |
| sub_account_name        | true | string  | subaccount name            |  |
| transfer_type        | true | int  | transfer type            | transfer from subaccount：35，transfer to subaccount:34 |
| amount        | true | decimal  | amount           |  |
| \</transfer_record\>     |      |         |         |   |
| total_page        | true | int  | total page            |  |
| current_page        | true | int  | current page            |  |
| total_size        | true | int  | total size            |  |
| \</data\>     |      |         |         |   |


## get user's API indicator disable information

- get `api/v1/contract_api_trading_status`


### request body
 
 null

### Response:

| attr          | required | type     | desc  |  |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | response status          | "ok" , "error"                           |
| ts            | true | long    | response millionseconds   |                                          |
| \<data\>      | true     |  array object        |      |   |
| is_disable        | true | long  |             | 1：is disabled，0：isn't disabled |
| order_price_types        | true | long  | order price types,such as：“limit,post_only,FOK,IOC”          |  |
| disable_reason        | true | string  | disable reason  | "COR":（Cancel Order Ratio），“TDN”：（Total Disable Number）  |
| disable_interval        | true | long  | disable millionseconds            |  |
| recovery_time        | true | long  | recovery millionseconds            |  |
| \<COR>       | true | dict object  | （Cancel Order Ratio） |
| orders_threshold        | true | long  | orders threshold           |  |
| orders        | true | long  | total pending orders           |  |
| invalid_cancel_orders        | true | long  | numbers of invalid cancel orders           |  |
| cancel_ratio_threshold        | true | decimal  | cancel ratio threshold            |  |
| cancel_ratio        | true | decimal  | cancel ratio           |  |
| is_trigger        | true | long  |            | 	1: triggered，0: not triggered |
| is_active        | true | long  |   | 1: active，0：not active
| \</COR>       | true | dict object  |  |
| \<TDN>       | true | dict object  | Total Disable Number|
| disables_threshold        | true | long  | disable threshold        |  |
| disables        | true | long  | total disable number        |  | 
| is_trigger        | true | long  | | 	1：triggered，0：not triggered |
| is_active        | true | long  |          |  | 1：active，0：not active
| \</TDN>       | true | dict object  |  |
| \</data\>     |      |         |         |   |

 > eg：
 
 ```json
  {
  "status": "ok",
  "data":
  [{
      "is_disable": 1,  
      "order_price_types": “limit,post_only,FOK,IOC”, 
      "disable_reason":"COR", 
      "disable_interval": 5,
      "recovery_time": 1,
      "COR":
       {
           "orders_threshold": 150,
           "orders": 150,
           "invalid_cancel_orders": 150,
           "cancel_ratio_threshold": 0.98,
           "cancel_ratio": 0.98,
           "is_trigger": 1,
           "is_active": 1
      } ,
      "TDN":
       {
           "disables_threshold": 3,
           "disables": 3,
           "is_trigger": 1,
           "is_active": 1
      } 
   }],
 "ts": 158797866555
}


 ```
 


# Trade Interface

##  Place an Order 

###  Example  

- POST `api/v1/contract_order`

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ------------------------------------------------------------ |
| symbol             | string             | false         |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...                                               |
| contract_type      | string             | false         | Contract Type ("this_week": "next_week": "quarter":)         |
| contract_code      | string             | false         | BTC180914                                                    |
| client_order_id    | long               | false         | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807 |
| price              | decimal            | false          | Price                                                        |
| volume             | long               | true          | Numbers of orders (amount)                                   |
| direction          | string             | true          | Transaction direction                                        |
| offset             | string             | true          | "open", "close"                                              |
| lever_rate         | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate |
| order_price_type   | string             | true     |  "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order. "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |

###  Note ： 

If there is a number in the Contract Code row，inquiry with Contract_Code. 

If there is no number，inquiry by Symbol + Contract Type.

Post-Only orders are limit orders that will never take liquidity (also called maker-only order). There are order limit and position for post-only orders which the upper limit is 500,000 for open/close orders under weekly, bi-weekly and quarterly contract respectively.

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
| client_order_id    | true          | int     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| ts                 | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

##  Place a Batch of Orders

###  Example  

- POST `/v1/contract_batchorder`

###  Request Parameter  

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
| orders_data |     List\<Object\>               |               |          10 orders most.                                                    |

- orders_data object detail

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
| symbol                                | string             | false         |Case-Insenstive.Both uppercase and lowercase are supported. "BTC","ETH"...                                               |
| contract_type                         | string             | false         | Contract Type: "this_week": "next_week": "quarter":          |
| contract_code                         | string             | false         | BTC180914                                                     |
| client_order_id                       | long              | false          | Clients fill and maintain themselves.Must be Less or Equal than 9223372036854775807 |
| price                                 | decimal            | false          | Price                                                        |
| volume                                | long               | true          | Numbers of orders (amount)                                   |
| direction                             | string             | true          | Transaction direction                                        |
| offset                                | string             | true          | "open": "close"                                              |
| leverRate                            | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate |
| orderPriceType   | string             | true     | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20 ,ioc: IOC Order,，fok：FOK Order ,"opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK|

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
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 10 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID (different IDs are separated by ",", maximum 10 orders can be withdrew at one time) |
| symbol             | true          | string   | Case-Insenstive.Both uppercase and lowercase are supported.."BTC","ETH"...                                               |

###  Note  ：

Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

The return data from Cancel An Order Interface only means that order cancelation designation is executed successfully. To check cancelation result, please check your order status at Get Information Of An Order interface.

> Response: result of multiple order withdraws (successful withdrew order ID, failed withdrew order ID)

```json
{
  "status": "ok",
  "data":{
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
    "successes":"161256,1344567"
  }
  "ts": 1490759594752
}
```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                    |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                                 | "ok" , "error"  |
| \<dict\>(Key Name: data) |               |          |                                                           |                 |
| \<list\>(Attribute Name: errors) |               |          |                                                           |                 |
| order_id                         | true          | string   | Order ID                                                  |                 |
| err_code                         | true          | int      | Error code                                                |                 |
| err_msg                          | true          | string   | Error information                                         |                 |
| \</list\>                        |               |          |                                                           |                 |
| \</dict\>                        |               |          |                                                           |                 |
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
| symbol             | true          | string   | Case-Insenstive.Both uppercase and lowercase are supported..Variety code，eg "BTC","ETH"... |
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
| symbol | false | String | Contract Code	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
| contract_type | false | String | Contract Type | “this_week”:Weekly，“next_week”:Bi-weekly，“quarter”:Quarterly|
| contract_code | false | String | Contract Code | BTC190903 |
| volume | true | int | Order Quantity(Cont) |  |
| direction | true | String | “buy”:Open，“sell”:Close |  |
| client_order_id | false | long | Client order ID.must be Less or Equal than 9223372036854775807 |  |
| order_price_type | false  | string | "lightning" by default. "lightning_fok": lightning FOK type,"lightning_ioc": lightning IOC type|  |
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
| client_order_id | false | int | user’s own order ID |  |
| order_price_type | false  | string | "lightning" by default. "lightning_fok": lightning FOK type|  |
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
| symbol             | true          | string   | Case-Insenstive.Both uppercase and lowercase are supported.."BTC","ETH"...                                               |

###  Note  ：

When getting information on order cancellation via get contracts Information interface, users can only query last 24-hour data

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
      "status": 0,
      "fee_asset":"BTC"
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
      "status": 0,
      "fee_asset":"BTC"
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
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| \</list\>                      |               |          |                                                              |                                     |
| ts                             | true          | long     | Timestamp                                                    |                                     |



## Order details acquisition

###  Example   

- POST `api/v1/contract_order_detail`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                        |
| ------------------ | ------------- | -------- | ---------------------------------- |
| symbol             | true          | string   | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...                |
| order_id           | true          | long     | Order ID                      |
| created_at           | true          | long     | Timestamp                     |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| page_index         | false         | int      | Page number, default 1st page |
| page_size          | false         | int      | Default 20，no more than 50   |

### Note
When getting information on order cancellation via query order detail interface, users who type in parameters “created_at” and “order_type” can query last 15-day data, while users who don’t type in parameters “created_at” and “order_type” can only query last 24-hour data.


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
    "canceled_at": 1408076414000,
    "final_interest": 0,
    "adjust_value": 1,
    "fee_asset":"BTC",
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
|  canceled_at                       | true         | long      |  Cancellation time   |      |
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
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| liquidation_type              | true | string     | 0:Not Forced Liquidation Type，1：Netting Type， 2: Partial Takeover，3：All Takeover       |                                          |
| \<list\> (Attribute Name: trades) |               |          |                                                              |                                   |
| id                          | true          | string     |  the global unique id of the trade.                                         |                                   |
| trade_id                          | true          | long     | In this interface, trade_id is the same with match_id of api/v1/contract_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                               |                                   |
| trade_price                       | true          | decimal  | Match Price                                                  |                                   |
| trade_volume                      | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                    | true          | decimal  | Transaction price                                            |                                   |
| trade_fee                         | true          | decimal  | Transaction Service fee                                      |                                   |
| role                        | true          | string  |   taker or maker                              |                                                         |
| created_at                        | true          | long     | Creation time                                                |                                   |
| \</list\>                         |               |          |                                                              |                                   |
| \</object \>                      |               |          |                                                              |                                   |
| ts                                | true          | long     | Timestamp                                                    |                                   |


## Query Open Orders

###  Example  

- POST  `api/v1/contract_openorders`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | --------------- |
| symbol             | true         | string   | Variety code                |             | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...  |
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
         "status": 1,
         "fee_asset":"BTC"
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
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
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
| symbol             | true          | string   | Variety code                |             | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...                                               |
| trade_type         | true          | int      | Transaction type            |             | 0:all,1: buy long,2: sell short,3: buy short,4: sell  long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short 11:reduce positions to close long，12:reduce positions to close short|
| type               | true          | int      | Type                        |             | 1:All Orders,2:Order in Finished Status                      |
| status             | true          | string      | Order Status                |          | support multiple query seperated by ',',such as  '3,4,5','0': all.  3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled;  |
| create_date        | true          | int      | Date                        |             | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                                     |
| page_index         | false         | int      | Page, default 1st page      | 1           |                                                              |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                                                              |
| contract_code          | false         | string      | Contract Code  |           |     "BTC180914" ...         |                                                 |
| order_type          | false         | string      | Order Type |           |     1:"limit"，3:"opponent"，4:"lightning",5:"Trigger Order",6:"pst_only",7:"optimal_5"，8:"optimal_10"，9:"optimal_20",10:"fok":FOK order,11:"ioc":ioc order      |                                                      |
### Note
When getting information on order cancellation via query history orders interface, users can only query last 24-hour data.

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
        "order_type": 1,
        "fee_asset":"BTC"
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
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| liquidation_type              | true | string     | 0:Not Forced Liquidation Type，1：Netting Type， 2: Partial Takeover，3：All Takeover       |                                          |
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
symbol      | true     | string | symbol          |         | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"...                           |
trade_type  | true     | int    | trasanction types          |         |  0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
create_date | true     | int    | date            |         | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                            |
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
			"role": "maker",
			"fee_asset":"BTC"
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
id               | true     | string    | the global unique ID of the trade.               |              |
match_id               | true     | long    | match_id is the same with trade_id of the websocket subscriptions: orders.$symbol and matchOrders.$symbol.match_id is the result of sets of order execution and trade confirmation. NOTE: match_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same match_id.              |              |
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
trade_fee                    | true     | decimal | fees charged by platform                |              |
role                        | true          | string |   taker or maker     |                  |
fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
\</list\>              |          |         |                    |              |
total_page             | true     | int     | total pages                |              |
current_page           | true     | int     | current page                |              |
total_size             | true     | int     | total size of the list                |              |
\</object\>            |          |         |                    |              |
ts                     | true     | long    | timestamp                |              |

### Notice

- If users don’t upload/fill the page_index or page_size, it will automatically be set as the default value of the top 20 data on the first page, for more details, please follow the parameters illustration.

- The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

## Place Trigger Order

- POST `api/v1/contract_trigger_order`

### Note

  - If the contract_code field is filled with a number, order will by placed by contract_code.
  - If the contract_code field is None, order will by placed by symbol and contract_type.
  
  - optimal_5: top 5 optimal BBO price. optimal_10: top 10 optimal BBO price. optimal_20: top 20 optimal BBO price. limit: the limit order, order_price needed.
 
### body

|  Params                |   Mandatory  |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | String | symbol	 | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
| contract_type | false | String | contract type | “this_week”，“next_week”，“quarter”|
| contract_code | false | String | contract code | BTC190903 |
| trigger_type | true | String | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to |  |
| trigger_price | true | Number | Trigger Price |  |
| order_price | false | Number | Order Price |  |
| order_price_type | false |  | order price type： "limit" by default;"optimal_5", "optimal_10"，"optimal_20" |  |
| volume | true | Number | volume |  |
| direction | true | String | buy sell |  |
| offset | true | String | open close |  |
| lever_rate | true | Number | Long leverage shall be equal to short leverage. |  |

> Return:

```json

{
    "status": "ok",
    "data": {
        "order_id": 35,
        "order_id_str": "35"
    },
    "ts": 1547521135713
}

```

### Response Desc

| field | type | Mandatory | Desc
| -----  | -----  | -----  | -----
| status | string | true | status: ok,error
| err-code | Number | false | error code
| err-msg | string| false | error message
| data | List<OrderInsertRspInfo>| false | list info
| ts | Number| true | timestamp

- OrderInsertRspInfo

| field | type | Mandatory | Desc
| -----  | -----  | -----  | -----
| order_id | Number | true | order id. order id may be same among different users
| order_id_str | string | true | order id str 


> Error：

```json

{
    "status": "error",
    "err_code": 1014,
    "err_msg": "...",
    "ts": 1547519608126
}

```

## Cancel Trigger Order

- POST `api/v1/contract_trigger_cancel`

### request params

| field | type | Mandatory |  desc  |
| -----  | -----  | -----  | ----- |
|  symbol |  String  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported.BTC,LTC...  |
|  order_id  |  String  |  true  |  order id. multiple orderids need to be joined by ",".Max number of order ids is 20 once.|

> Response:

```json

{
  "status": "ok",
  "data": {
    "errors": [{
        "order_id": 161251,
        "err_code": 200417,
        "err_msg": "invalid symbol"
      },
      {
        "order_id": 161251,
        "err_code": 200415,
        "err_msg": "invalid symbol"
      }
    ],
    "successes": "161256,1344567"
  },
  "ts": 1490759594752
}

```

### response

| field             | Required | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | response status               | "ok" , "error" |
| successes                  | true         | string   | successful orders                 |                |
| \<list\>(field name: errors) |              |          |                            |                |
| order_id                   | true         | String   | order id                     |                |
| err_code                   | true         | int      | error code             |                |
| err_msg                    | true         | int      | error messages               |                |
| \</list\>                  |              |          |                            |                |
| ts                         | true         | long     | response timestamp millseconds |  |


> error response：

```json

{
    "status": "error",
    "err_code": 20012,
    "err_msg": "invalid symbol",
    "ts": 1490759594752
}

```

## Cancel All Trigger Orders

- POST `api/v1/contract_trigger_cancelall`

### Params

| field | type | Mandatory |desc
| -----  | -----  |  -----  | ----- |
|  symbol  |  String  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported.BTC、LTC...  |
|  contract_code  |  String  |  false  |  contract code,"BTC180914" ...  |
|  contract_type  |  String  |  false  |  contract type	"this_week" "next_week" "quarter"  |

### Note

- If only symbol is filled, cancel all trigger orders of this symbol

- If contract_code is filled, cancel trigger orders of this contract code.

- If symbol and contract_type are filled, cancel trigger orders of this symbol and contract code.

> Response:

```json

{
  "status": "ok",
  "data": {
    "errors":[
      {
        "order_id":161251,
        "err_code": 200417,
        "err_msg": "invalid symbol"
       },
      {
        "order_id":161251,
        "err_code": 200415,
        "err_msg": "invalid symbol"
       }
      ],
    "successes":"161256,1344567"
   },
  "ts": 1490759594752
}

```

### response params

| field              | Mandatory | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | status               | "ok" , "error" |
| \<list\>(data name: errors) |              |          |                            |                |
| order_id                   | true         | String   | order id                    |                |
| err_code                   | true         | int      | error code            |                |
| err_msg                    | true         | int      | error message               |                |
| \</list\>                  |              |          |                            |                |
| successes                  | true         | string   | successful orders                 |                |
| ts                         | true         | long     | response timestamp in millseconds |   |


> response error：

```json

{
    "status": "error",
    "err_code": 20012,
    "err_msg": "invalid symbol",
    "ts": 1490759594752
}

```

## Query Trigger Order Open Orders

- POST `api/v1/contract_trigger_openorders`

### Request Parameter
 
|Parameter Name	| Type | Mandatory | Description
| -----  | -----   | -----  | ----- |
|  symbol  |  String  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported.BTC,LTC... |
|  contract_code|  String  |  false  |  Case-Insenstive.Both uppercase and lowercase are supported..contract code  |
|  page_index  |  Number   |  false  |  page number，default page 1 if no given instruction| 
|  page_size   |  Number   |  false  |  default 20 if no given instruction|，no more than 50 |

> Response:

```json

{
	"status": "ok",
	"data": {
		"orders": [{
				"symbol": "EOS",
				"contract_code": "EOS190118",
				"contract_type": "this_week",
				"trigger_type": "ge",
				"volume": 4,
				"order_type": 1,
				"direction": "sell",
				"offset": "open",
				"lever_rate": 1,
				"order_id": 23,
				"order_id_str": "161251",
				"order_source": "web",
				"trigger_price": 2,
				"order_price": 2,
				"created_at": 1547448030638,
				"order_price_type": "limit",
				"status": 4
			},
			{
				"symbol": "EOS",
				"contract_code": "EOS190118",
				"contract_type": "this_week",
				"trigger_type": "ge",
				"volume": 4,
				"order_type": 1,
				"direction": "sell",
				"offset": "open",
				"lever_rate": 1,
				"order_id": 23,
				"order_id_str": "161251",
				"order_source": "web",
				"trigger_price": 2,
				"order_price": 2,
				"created_at": 1547448030638,
				"order_price_type": "limit",
				"status": 4
			}
		],
		"total_page": 3,
		"current_page": 1,
		"total_size": 22
	},
	"ts": 1547520777695
}


```

### Returning Parameter

| Parameter Name      | Mandatory | Type | Description            |  Value Range  |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status   | true   | string   | Request Processing Result    | "ok" , "error" |
| data    |    true   |      object    |    Returned data          |               |
| ts     | true         | long     | Time stamp of response, Unit: millisecond   |   |

- data details

| Parameter Name      | Mandatory | Type | Description            |  Value Range  |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| total_page   | Number | true | total page
| current_page | Number | true | current page
| total_size   | Number | true | total size
| \<list\> (Attribute Name: orders)   |              |          |                            |                |
| symbol |string| true | Cryptocurrency
| contract_code | string | true | contract code
| contract_type | string | true | contract type
| trigger_type | string | true | trigger type： `ge`great than or equal to；`le`less than or equal to
| volume | Number | true | trigger order volume
| order_type | Number | true | Transaction Type 1. Place orders 2. cancel orders
| direction | string | true | order direction [buy,sell]
| offset | string | true | offset direction [open,close]
| lever_rate | Number | true | Leverage 1\5\10\20
| order_id | Number | true | trigger order ID
| order_id_str | string | true | the order ID with string
| order_source | Number | true | source
| trigger_price | Number | true | trigger price
| order_price | Number | true | the preset price by the client
| created_at | Number | true | order creation time
| order_price_type | string | true | order price type "limit": limit order，"optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20
| status | Number | true | order status：1:ready to submit、2:submited、3:order accepted、7:wrong order、8：canceled orders but not found、9：canceling order、10：failed'
| \</list\>                  |              |          |                            |                |

> error response：

```json

{
	"status": "error",
	"err_code": 20012,
	"err_msg": "invalid symbol",
	"ts": 1490759594752
}
```

## Query Trigger Order History

- POST `api/v1/contract_trigger_hisorders`

### Request Parameter

|   Parameter Name    |   Mandatory |   Type |     Desc             |   Default   |   Value Range |
| ------- | ------- | ------- | -------- | ------- | -------- |
| symbol        | true         | string   | Cryptocurrency             |            | Case-Insenstive.Both uppercase and lowercase are supported."BTC","ETH"... |
| contract_code | false        | string   | Contract Code            |            | EOS190118         |
| trade_type        | true         | number      |    Transaction type            |            | 0: All ,1: Open Long,2: Close Short,3: Open Short,4: Close Long；the system will transfer these parameters into offset and direction and query the requested data. Please note that no data can be requested with parameter out of this range. |
| status        | true         | String      | Oder Status              |            | data divided with several commas, trigger orders ready to be submitted：0: All (All filled orders),4: Trigger orders successfully submitted,5: Trigger orders failed being submitted, 6: Trigger orders cancelled |
| create_date   | true         | number      | Date                 |            | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.    |
| page_index    | false        | int      | Page, 1st page by default without given instruction  | 1          | page，1st page by default without given instruction|
| page_size     | false        | int      | Page 20 by default without given instruction,  ，no more than 50 | 20         | Page 20 by default without given instruction,  ，no more than 50  |

### NOTE

- System will query the filled trigger order history by default 

> Response:

```json

{
	"status": "ok",
	"data": {
		"orders": [{
				"symbol": "EOS",
				"contract_code": "EOS190118",
				"contract_type": "this_week",
				"trigger_type": "ge",
				"volume": 4,
				"order_type": 1,
				"direction": "sell",
				"offset": "open",
				"lever_rate": 1,
				"order_id": 23,
				"order_id_str": "161251",
				"relation_order_id": "88",
				"order_price_type": "limit",
				"status": 6,
				"order_source": "web",
				"trigger_price": 2,
				"triggered_price": 2.03,
				"order_price": 2,
				"created_at": 1547448030638,
				"triggered_at": 0,
				"order_insert_at": 0,
				"canceled_at": 1547448845593,
				"fail_code": null,
				"fail_reason": null
			},
			{
				"symbol": "EOS",
				"contract_code": "EOS190118",
				"contract_type": "this_week",
				"trigger_type": "ge",
				"volume": 4,
				"order_type": 1,
				"direction": "sell",
				"offset": "open",
				"lever_rate": 1,
				"order_id": 22,
				"order_id_str": "161251",
				"relation_order_id": "-1",
				"order_price_type": "limit",
				"status": 5,
				"order_source": "web",
				"trigger_price": 2,
				"order_price": 2,
				"created_at": 1547433975948,
				"triggered_at": 0,
				"order_insert_at": 0,
				"canceled_at": 0,
				"fail_code": 1064,
				"fail_reason": " Error detected. Please try again"
			}
		],
		"total_page": 3,
		"current_page": 1,
		"total_size": 22
	},
	"ts": 1547520777695
}

```

### Returning Parameter

| Parameter Name             | Mandatory | Type |Desc                 | Value Range |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | Request Processing Result             | "ok" , "error" |
| data |       true       |      object    |         Return data                |                |
| ts                         | true         | long     |Time of Respond Generation, Unit: Millisecond |   |

-  Data details：

| Parameter Name          | Mandatory | Type |  Desc          | Value Range |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| total_page   | Number | true | Total page
| current_page | Number | true | Current page
| total_size   | Number | true | Total Size
| \ <list\>(Attribute Name: orders)|              |          |                            |                |
| symbol |string| true | Cryptocurrency
| contract_code | string | true | Contract Code
| contract_type | string | true | Contract Type
| trigger_type | string | true | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to
| volume | Number | true | Numbers of order placed
| order_type | Number | true | Transaction type：1、Place orders  2、Cancel orders
| direction | string | true | order direction, [Buy (buy), Sell(sell)]
| offset | string | true | offset direction [Open(open), Close(lose)]
| lever_rate | Number | true | leverage 1\5\10\20
| order_id | Number | true | Trigger order ID, the field value in user_order_id data under t_trigger_orders sheet
| order_id_str | string | true | the order ID with string 
| relation_order_id | string | true | Relation order ID is the string related to the limit orders which is the field value in order_id under t_trigger_order list. The value is -1 before the trigger orders executed. | order_price_type | string | true | order type "limit": Limit order price，"optimal_5": Optimal 5  price level，"optimal_10":Optimal 10 price level，"optimal_20": the Optimal 20 price level
| status | Number | true | Oder status (4:Orders accepted、5: Orders failing being placed、6: Orders canceled )
| order_source | Number | true | Order source
| trigger_price | Number | true | trigger price
| triggered_price | Number | true | the price when trigger orders executed
| order_price | Number | true | the order price preset by the client
| created_at | Number | true | the order creation time
| triggered_at | Number | true | the execution time when orders getting triggered. 
| order_insert_at | Number | true | the time when the triggered orders filled successfully.
| canceled_at | Number | true | Order cancelation time
| fail_code | Number | true | the error code when the triggered orders failed to be filled
| fail_reason | string | true | the error message with failure reason when triggered orders failed to filled.
| \</list\>                  |              |          |                            |                |

> Example of failure Query trigger order history

```json

{
	"status": "error",
	"err_code": 20012,
	"err_msg": "invalid symbol",
	"ts": 1490759594752
}
```

# Transferring Interface

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
| currency      | true     | string | currency. Case insensitive         |         | e.g. btc, BTC                          |
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
 Read  |     Market Data Interface      |  market.$symbol.depth.size_${size}.high_freq  |               sub        |       Subscribe Incremental Market Depth Data | No | 
 Read  |      Market Data Interface       |  market.$symbol.detail  |               sub        |    Subscribe Market Detail Data    |   No  |
 Read   |     Market Data Interface        |  market.$symbol.trade.detail  |               req        |    Request Trade Detail Data |  No|
Read  |    Market Data Interface         |  market.$symbol.trade.detail  |        sub |  Subscribe Trade Detail Data | No  | 
Trade |       Trade Interface      |  orders.$symbol  |        sub |  Subscribe Order Data  | Yes | 
Trade |       Trade Interface      |  matchOrders.$symbol  |        sub |  Subscribe Order Data  | Yes | 
  Read |     Account Interface        |  accounts.$symbol  |        sub  |  Subscribe asset change Information of a given coin  | Yes  | 
  Read |      Account Interface      |  positions.$symbol  |        sub  |  Subscribe position change Information of a given coin  | Yes | 
  Read |      Trade Interface     |  liquidationOrders.$symbol  |        sub  |  Subscribe liquidation Order information of a given coin | Yes | 

## Huobi Future WebSocket Subscription Address

Market Data Request and Subscription: wss://api.hbdm.com/ws 

Order Push Subscription: wss://api.hbdm.com/notification

Index Kline Data and Basis Data Subscription: wss://api.hbdm.com/ws_index
 
If you fail visiting the two addresses above, you can also visit: 

Market Data Request and Subscription Address: wss://api.btcgateway.pro/ws;
 
Order Push Subscription：wss://api.btcgateway.pro/notification

Index Kline Data and Basis Data Subscription: wss://api.btcgateway.pro/ws_index
 
If you have further queries about Huobi Future order push subscription, please refer to [Demo](https://github.com/huobiapi/Futures-Java-demo)
 
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

## Order Push Heartbeat

### WebSocket API supports one-way heartbeat. The Server initiates ping message and the Client will return pong message. The Server sends back a heartbeat:

`{`

  `"op": "ping",`
  
  `"ts": 1492420473058`
  
`}`

- WebSocket Client should return:

`{`

  `"op": "pong",`
  
  `"ts": 1492420473058`
  
`}`

### Note

- "ts" value in the return "pong" message is the "ts" value from "ping" push Once the WebSocket Client and WebSocket Server connected, Websocket Server will send a heartbeat every 5 seconds (the frequency might change) to Wesocket Client. If WebSocket Client ignores the heartbeat message for 3 times, it will get disconnected with Websocket Sever automatically. Under abnormal conditions, WebSocket Server will return error message like:

`{`

  `"op": "pong"`

  `"ts": 1492420473027,`
  
  `"err-code": 2011,`
  
  `"err-msg": “detailed error message”`

`}`

- Websocket Server disconnects automatically During period of building connection and authentication, Websocket Server will disconnect automatically if there is any error. The data structure before closing pushing are as below:

`{`

  `"op": "close", // indicate Websocket Server disconnected automatically`
   
  `"ts": long   // The local timestamp of Server push`
  
`}`

- Server return error but remain connection After successful authentication, Server will return error but not disconnect if Client provides illegal Op or there is any internal error.

`{`

  `"op": "error", // indicate that receive illegal Op or internal error`
  
  `"ts": long// The local timestamp of Server push`
  
`}`

## Order Push Address

- Huobi Future uses one official address:

  `wss://api.hbdm.com/notification`
  
Please note that the WS request connection should not go over 10 normally.

### Data Compression

All response data from WebSocket server are compressed into GZIP format. Clients have to decompress them for further use.

### Illustration of Request(req and rep) Data

- Character Encoding：UTF-8

- Case sensitive，including parameter name and return parameter

- Data type： use JSON to transmit data

-All request data has fixed format. Please note that Huobi Future API document will only focus on data illustration in non-fixed format.

> Request data format is laid out as below:

```

  {
  "op": string, // Required; Client requests operator name (Server will returns the same value), For detailed operator name list, please refer to the appendix
  "cid": string, // Optional;Request unique ID( Client generate a unique ID which server will return the same value)
  // Others required/ Optional string
  }

```

> All responses push data will be returned in fixed format，Huobi Future API document will only focus on data illustration， Response data format is laid out as below；

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

Clients can create Access Key and Secret Key on Huobi which Access Key is the API access key kept by the client.  The Secret Key is used to sign the request (available only for request). To apply/change API key, please go to “Account-API Management” on Huobi Future. Make name for the API Key and click “create” to finish. It’s optional to bind IP address to the API Key.

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
  symbol  |       true         |  string  |   Pairs  |               |  Case-Insenstive.Both uppercase and lowercase are supported..E.G.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC Bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |
  period    |     true          | string   | Kline Period   |            | Case-Senstive.Only lowercase is supported. 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon  |

### Return Parameter 

 Parameter Name |    Mandatory   |   Type |   Description  |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   Request Parameter  | 
  ts    |     true          | long   |  Time of Respond Generation，Unit：Millisecond   |           
  \<tick\>    |               |    |      |            | 
  id    |     true          | number   |  ID     |            
  mrid    |     true          | number   | ID Order ID    |            
  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
  count    |     true          | decimal   |   Order Quantity  |            
  open    |     true          | decimal   |   Opening Price  |            
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
  symbol | true | string | Pairs | | Case-Insenstive.Both uppercase and lowercase are supported..E.g.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |
  period | false | string | Kline Period | | Case-Senstive.Only lowercase is supported.1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|
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
  vol    |     true          | decimal   |    Trade Volume(Cont.)   |            
  count    |     true          | decimal   |  Order quantity   |            
  open    |     true          | decimal   |      Opening Price  |            
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
  symbol         |  true           |  string     |    Pairs          |        |  Case-Insenstive.Both uppercase and lowercase are supported..E.g.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract.  |
  type           |  true           |  string     |    Depth Type      |        |  Get depth data within step 150, use step0, step1, step2, step3, step4, step5（merged depth data 0-5）；when step is 0，depth data will not be merged; Get depth data within step 20, use step6, step7, step8, step9, step10, step11(merged depth data 7-11); when step is 6, depth data will not be merged. |

### Note:

- When clients choose merged depth data, WebSocket server will only display the merged price within price steps in order book. Please note that the merged depth price will not make any change on the actual order price.

- steps between step1 and step5 are merged orderbook data of step 150. 
steps between step7 and step11 are merged orderbook data of step 20. 
Details are below:

| Depth | precision |
|----|----|
|step1、step7|0.00001|
|step2、step8|0.0001|
|step3、step9|0.001|
|step4、step10|0.01|
|step5、step11|0.1|

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

## Subscribe Incremental Market Depth Data

### To subscribe incremental market depth data, clients have to make connection to WebSokcet API Server and send subscribe request in the format below：

{

"sub": "market.$symbol.depth.size_${size}.high_freq",

"data_type":"incremental",

"id": "id generated by client"

}


```json
{
"sub": "market.$symbol.depth.size_${size}.high_freq",
"data_type":"incremental",
"id": "id generated by client"
}

```

### Request Parameter

 Parameter Name   |  Mandatory   |  Type   |  Description      |    Default   |  Value Range  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  symbol         |  true           |  string     |    Pairs          |        |  Case-Insenstive.Both uppercase and lowercase are supported.. E.g.: "BTC_CW" stands for BTC weekly contract, "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract.  |
  size           |  true           |  integer     |    Depth size      |        |  `20`: stands for 20 unmerged data. `150`:stands for 150 unmerged data.|
  data_type           |  false          |  string     |    Depth size      |        |  data type. `snapshot` by default. `incremental`: incremental data.`snapshot`: full data.|


### Return Parameter

Parameter Name   |  Mandatory  |   Type  |      Description |    Value Range  |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ts | true | int | Timestamp of Respond Generation, Unit: Millisecond  | |
ch | true |  string | Data channel, Format：`market.$symbol.depth.size_${size}.high_freq`  | | 
 \<tick\>    |               |    |      |            | 
mrid  | true| long | Order ID| 
id  | true| long | tick ID | 
asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
ts | true | int | Time of Respond Generation, Unit: Millisecond  | |
version | true | long | version ID,auto increment ID.  | |
event | true | string | event type: `update` or `snapshot`  | |
ch | true |  string | Data channel, Format： `market.$symbol.depth.size_${size}.high_freq` | | 
 \</tick\>    |               |    |      |            | | 

### Note:

- when `data_type` is `incremental`,`snapshot` data wil be pushed for the first time. When re-connection occurs, `snapshort` data will be pushed for the first time. 
- `version`: auto increment in single websocket connection. `version` may be different among several websocket subscription connections.
-  orderbook will be pushed if orderbook is updated whenever `incremental` or `snapshot`.   
-  orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.
- you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.

### Response example:
```json
  {
    "ch": "market.BTC_CQ.depth.size_20.high_freq",
    "tick": {
        "asks": [
            [
                7365.69,
                225
            ],
            [
                7366.38,
                17
            ],
            [
                7366.39,
                128
            ],
            [
                7366.79,
                25
            ],
            [
                7366.8,
                100
            ],
            [
                7367.1,
                40
            ],
            [
                7367.2,
                10
            ],
            [
                7367.4,
                50
            ],
            [
                7367.41,
                5
            ],
            [
                7367.58,
                91
            ],
            [
                7367.59,
                112
            ],
            [
                7367.6,
                100
            ],
            [
                7368,
                92
            ],
            [
                7368.01,
                313
            ],
            [
                7368.08,
                11
            ],
            [
                7368.14,
                20
            ],
            [
                7368.18,
                109
            ],
            [
                7368.22,
                38
            ],
            [
                7368.32,
                9
            ],
            [
                7368.33,
                3
            ]
        ],
        "bids": [
            [
                7365.68,
                1461
            ],
            [
                7365.67,
                1
            ],
            [
                7365.3,
                3
            ],
            [
                7365.03,
                32
            ],
            [
                7365.02,
                68
            ],
            [
                7365,
                329
            ],
            [
                7364.4,
                52
            ],
            [
                7363.3,
                100
            ],
            [
                7363.25,
                1
            ],
            [
                7363.23,
                20
            ],
            [
                7363.15,
                38
            ],
            [
                7363.04,
                36
            ],
            [
                7363.02,
                71
            ],
            [
                7363,
                3
            ],
            [
                7362.92,
                200
            ],
            [
                7362.76,
                33
            ],
            [
                7362.75,
                16
            ],
            [
                7362.63,
                12
            ],
            [
                7362.44,
                8
            ],
            [
                7362.43,
                7
            ]
        ],
        "ch": "market.BTC_CQ.depth.size_20.high_freq",
        "event": "snapshot",
        "id": 58039921057,
        "mrid": 58039921057,
        "ts": 1586337225104,
        "version": 80067445
    },
    "ts": 1586337225107
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
  symbol         |  true           |  string     |     Pairs   |              |  Case-Insenstive.Both uppercase and lowercase are supported..E.g. "BTC_CW" stands for BTC Weekly contract, "BTC_NW" stands for BTC Bi-weekly contract, "BTC_CQ" stands for BTC Quarterly contract|


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
### Request Parameter

  Parameter Name    | Mandatory   |  Type    |   Description   |   Default     |   Value Range  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------|
  symbol         |  true           |  string     |  contract type    |            | Case-Insenstive.Both uppercase and lowercase are supported..E.g.: "BTC_CW" stands for BTC weekly contract,  "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |

### Return Parameter

Parameter Name     |    Mandatory |  Type  | Description |  Default   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  Data Channel，Format格式： market.\$symbol.trade.detail  |  |   
status  |  true  |  string  |  Request Status  |   |    
id  |  true  |  number  |  ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  number  |  ID  |   |    
price  |  true  |  decimal  |  Price |   |    
amount  |  true  |  decimal  |  Quantity of both sides,'buy' and 'sell' included.  |   |    
direction  |  true  |  string  |  Active transaction direction  |   |    
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
  symbol         |  true           |  string     |  contract type    |            | Case-Insenstive.Both uppercase and lowercase are supported..E.g.: "BTC_CW" stands for BTC weekly contract,  "BTC_NW" stands for BTC bi-weekly contract, "BTC_CQ" stands for BTC quarterly contract |

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
ts  |  true  |  number  |  server response time  |   |    
 \<tick\>    |               |    |      | 
id  |  true  |  number  |  tick ID.  |   |    
ts  |  true  |  number  |   tick time  |   |    
 \<data\>    |               |    |      | 
amount  |  true  |  decimal  |  quantity(Cont.) |   |    
ts  |  true  |  number  |  trade timestamp  |   |    
id  |  true  |  number  |  trade id  |   |    
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


# WebSocket Index and Basis Interface

### The websocket url of Index and Basis Data is：wss://api.hbdm.com/ws_index 

## Subcribe Index Kline Data

### To subscribe index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$symbol.index.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of index kline data：

```json

    {
    "sub": "market.BTC-USD.index.1min",
    "id": "id1"
    }

```

### request Parameter
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | index symbol          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |

  - Note
    - Pushed once the index data is changed.
  
    - Periodical Push when the index data hasn't changed according to the kline period.


- results pushed by the server

```
{
  "ch": "market.BTC-USD.index.1min",
  "ts": 1585307166166,
  "tick": {
    "id": 1585307160,
    "open": "6665.2725",
    "close": "6665.2725",
    "high": "6665.2725",
    "low": "6665.2725",
    "amount": "0",
    "vol": "0",
    "count": 0
  }
}
```
### tick parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | string | index kline id,the same as kline timestamp  |
| vol | string  | volume. The value is 0.             |
| count | decimal  | count. The value is 0.              |
| open | string  | open index price               |
| close | string  | close index price             |
| low | string  |  lowest index price             |
| high | string  | highest index price               |
| amount | string  |amount based on coins.            |


## Request Index Kline Data

### To subscribe index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$symbol.index.$period",`
    
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. ",`
    
`}`


### Request Parameter：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | symbol          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| from          | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |         |    |
| to          | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |         |    |

### Note：
    - Pushed once the index data is changed.

- response example：

```
 {
  "id": "",
  "rep": "market.BTC-USD.index.1min",
  "wsid": 1157008131,
  "status": "ok",
  "data": [{
    "id": 1584065400,
    "open": 4147.4425,
    "close": 4188.29,
    "low": 4147.4425,
    "high": 4188.29,
    "amount": 0,
    "vol": 0,
    "count": 0
  }, {
    "id": 1584065820,
    "open": 3937.44,
    "close": 4017.605,
    "low": 3924.785,
    "high": 4017.605,
    "amount": 0,
    "vol": 0,
    "count": 0
  }]
}
```
### data parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | int | index kline id,the same as kline timestamp  |
| vol | decimal  | volume. The value is 0.             |
| count | decimal  | count. The value is 0.              |
| open | decimal  | open index price               |
| close | decimal  | close index price             |
| low | decimal  |  lowest index price             |
| high | decimal  | highest index price               |
| amount | decimal  |amount based on coins.            |


## Subscribe Basis Data

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$symbol.basis.$period.$basis_price_type",`

  `"id": "id generate by client"`

`}`

> example of the subscription of basis data：

```json

    {
    "sub": "market.BTC_CW.basis.1min.open",
    "id": "id1"
    }

```

### Request Parameter：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | symbol name          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter”.                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |

### Response Example

```
{
  "ch": "market.BTC_CW.basis.5min.close",
  "ts": 1585307850144,
  "tick": {
    "id": 1585307700,
    "index_price": "6687.435",
    "contract_price": "6667.37",
    "basis": "-20.065",
    "basis_rate": "-0.0030004029945711621869969577274395938"
  }
}
```

### Response Parameters

| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| id | true | long | unique id |  |
| contract_price | true | string | contract price|  |
| index_price | true | string | index price|  |
| basis | true | string | basis=contract_price - index_price |  |
| basis_rate | true | string | basis_rate=basis/index_price |  |

## Request Basis Data

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$symbol.basis.$period.$basis_price_type",`
    
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. "`
    
`}`


### Request Parameter：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | symbol name          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC_CW" represents BTC “This Week”，"BTC_NW" represents BTC “Next Week”，"BTC_CQ" represents BTC “Quarter”.                          |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |
| from          | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |         |    |
| to          | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |         |    |

### Note：
    - 2000 data at most per request.

- response example：

```
{
  "ch": "market.BTC_CW.basis.5min.close",
  "ts": 1585307850144,
  "tick": {
    "id": 1585307700,
    "index_price": "6687.435",
    "contract_price": "6667.37",
    "basis": "-20.065",
    "basis_rate": "-0.0030004029945711621869969577274395938"
  }
}
```
### Response Parameters

| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| id | true | long | unique id |  |
| contract_price | true | string | contract price|  |
| index_price | true | string | index price|  |
| basis | true | string | basis=contract_price - index_price |  |
| basis_rate | true | string | basis_rate=basis/index_price |  |

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
| topic    | string | Required；format: orders.$symbol; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |


> Illustration on detailed data format of orders Notification

- Note: The order status of 'post_only' type pushed by ws is ethier '7:canceled' or '3:submitted'.

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
	"fee_asset":"BTC",
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
| status                  | int     | Order status(1. Placing orders to order book; 2 Placing orders to order book; 3. Placed to order book 4. Partially fulfilled; 5 partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled;) |
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
| fee_asset   | string | the corresponding cryptocurrency to the given fee |
| liquidation_type              | string     | 0:Not Forced Liquidation Type，1：Netting Type， 2: Partial Takeover，3：All Takeover       |                                          |
| \<list\>( Attribute Name: trade) |         |                                                              |
| id            | string| 	the global unique id of the trade.。                                                       |
| trade_id                | long    | In this interface, trade_id is the same with match_id of api/v1/contract_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.      |
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
| topic    | string | Optional; Unsubscribe Topic Name，format: orders.$symbol; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" ; |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | Allowed  |
| orders.symbol1 | orders.*        | Not Allowed|
| orders.symbol1 | orders.symbol1  | Allowed |
| orders.symbol1 | orders.symbol2  | Not Allowed |
| orders.*       | orders.symbol1  | Not Allowed |



## subscribe Match Order Data（sub）


To subscribe order data, Clients have to make connection to the Server and send subscribe request in the format below:

### Subscribe Request Format

`{`
  
  `“op”: “sub”,`
  
  `"cid": "cid”,`
  
  `“topic": "matchOrders.btc”`

`}`

> sub example:

``` json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "matchOrders.btc"
}

```

### Format of subscribe match order data

| attr | type   | desc                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: matchOrders.$symbol; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |


> Illustration on detailed data format of orders Notification

#### Note: 
- The order status of 'post_only' type pushed by ws is ethier '7:canceled' or '3:submitted'.
- The orders will be pushed when matched by matching engine.
- The delivery orders will not be pushed.
- The orders transfered from future or to future will not be pushed.
- The netting and forced liquidation orders will not be pushed.
- The orders will generally be pushed faster than the normal orders subscription.But It's not guranted.
- If there is an order with N trades,including 1 taker and N maker,it will push N+1 trades at most.
- If there is a status with 9 or 10,pls ignore it.

> response

```json

{
  "op": "notify",           
  "topic": "matchOrders.btc",     
  "ts": 1489474082831,    
  "symbol": "BTC",         
  "contract_type": "this_week",     
  "contract_code": "BTC180914",     
  "status": 1,   
  "order_id": 106837,            
  "order_id_str": "106837",     
  "order_type": "1",    
  "trade":[{
      "id": "1232-213123-1231", 
      "trade_id":112,     
      "trade_volume":1,    
      "trade_price":123.4555,     
      "trade_turnover":34.123,    
      "created_at": 1490759594752,    
      "role": "maker"
    }]
}

```

### format of order data pushed

| attr                | type    | desc                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | notify;                          |
| topic                   | string  | topic                                              |
| ts                      | long    | | server response timestamp                                             |
| symbol                  | string  | ID                                                       |
| contract_type           | string  | contract type                                                     |
| contract_code           | string  | | contract code                                                     |
| status                  | int     | 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; |
| order_id                | bigint    |                                                        |
| order_id_str            | string   |                                                      |
| order_type              | int     | Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order                 |
| \<list\>(attr: trade) |         |                                                              |
| id            | string| 	the global unique id of the trade.                                                       |
| trade_id                | long    | In this interface, trade_id is the same with match_id of api/v1/contract_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                                  |
| trade_volume            | decimal | trade volume                                                       |
| trade_price             | decimal | trade price                                                    |
| trade_turnover          | decimal | trade turnover                                                    |
| created_at              | long    | created at                                                 |
| role             | string  | taker or maker                                                 |
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
| topic    | string | Optional; format: orders.$symbol; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| matchOrders.*       | matchOrders.*        | allowed   |
| matchOrders.symbol1 | matchOrders.*        | Not Allowed   |
| matchOrders.symbol1 | matchOrders.symbol1  | allowed   |
| matchOrders.symbol1 | matchOrders.symbol2  | Not Allowed |
| matchOrders.*       | matchOrders.symbol1  | Not Allowed |


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
| topic    | string | Required； Subscribe Topic Name，Required subscribe accounts.$symbol   Subscribe/unsubscribe the balance change of a given coin，when the value of $symbol is “*”, it means to subscribe/unsubscribe the balance change of all coins; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC"|


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
| topic    | string | Required;Required； Required； Subscribe Topic，Subscribe accounts.$symbol required  unsubscribe/unsubscribe account equity change of a given coin，when the $symbol value is *, it stands for subscribing/unsubscribing data of all coins; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC"|


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
| topic    | string | Required； Subscribe Topic, Subscribe (positions.$symbol) Required  Subscribe/unsubscribe the position data of a single coin, when the $symbol value is *, it stands for subscribing the data of all coins.symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |


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
| topic    | string | Required;Required；Required；Subscribe topic，Subscribe positions.$symbol required  Subscribe or unsubscribe the position updates of a single coin; when $symbol value is *, it stands for subscribing the data of all coins; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)      | Unsubscribe(unsub) |  Rule |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | Allowed  |
| positions.symbol1 | positions.*        | Allowed |
| positions.symbol1 | positions.symbol1  |  Allowed |
| positions.symbol1 | positions.symbol2  | Not Allowed |
| positions.*       | positions.symbol1  | Not Allowed |

## Subscribe Liquidation Order Data(No authentication) (sub)

### Subscription Request Format of Liquidation order data

`{`

  `“op”: “sub”,`
  
  `“topic": "public.$symbol.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful subscription request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "public.BTC.liquidation_orders"
}

```


### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$symbol.liquidation_orders. symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC"  |


### Return Parameter

| Field Name               | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| op   | true | string  | value:"notify";    |   |
| topic   | true | string  | topic subscribed   |   |
| ts                 | number    | Time of Respond Generation，Unit：Millisecond 	                                             |
| \<data\> | true | array object |  | |
| symbol          | string  | Coin                                                      |
| contract_code          | string  | contract code                                    |
| direction                 | string  | Long or short                                                     |
| offset              | string | Open or close                                                     |
| volume                 | decimal | quantity(Cont.)                                                      |
| price              | decimal  | Price                |
| created_at              | number  | Order Creation Time                                          |
| \<\data> | | |  | |


> When there commences any liquidation order, the server will send notification with return parameter. For example：

```json

{
    "op": "notify",
    "topic": "public.EOS.liquidation_orders",
    "ts":1580815422403,
    "data":[{
        "symbol": "EOS",
	"contract_code": "EOS191227",
	"direction": "buy",
	"offset": "close",
	"volume": 7.0000000000000,
	"price": 4.23600000000000,
	"created_at": 1580815422296
    }]
}

```

## Unsubscribe Liquidation Order Data(no authentication)(unsub)

### Unsubscribe Request Format

`{`

  `“op”: “unsub”,`
  
  `“topic": "public.$symbol.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful unsubscribe request :

```json

{
  "op": "unsub",
  "topic": "public.BTC.liquidation_orders”",
  "cid": "40sG903yz80oDFWr"
}

```


### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$symbol.liquidation_orders. symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |

### Return Parameter

| Field Name |Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，subscribe value is unsub;                 |
| cid      | string | Optional;   Client requests unique ID                        |
| topic    | string | Subscribe topic name，Require subscribe public.$symbol.liquidation_orders.Subscribe/unsubscribe the data of a given coin; when the $symbol value is *, it stands for subscribing/unsubscribing the data of all coins;symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC" |
| ts    | number | Required; Time of Respond Generation, Unit: Millisecond	|


> Example of a successful subscription

```json

{
  "op": "unsub",
  "topic": "public.BTC.liquidation_orders",
  "cid": "id generated by client",
  "err-code": 0,
  "ts": 1489474081631
}

```

### Rules on Subscribe and Unsubscribe

|   Subscribe(sub)   | Unsubscribe(unsub) |  Rule |
| -------------- | --------------- | ------ |
| public.*.liquidationOrders       | public.*.liquidationOrders        | Allowed    |
| public.symbol1.liquidationOrders | public.*.liquidationOrders        | Allowed   |
| public.symbol1.liquidationOrders | public.symbol1.liquidationOrders  |  Allowed |
| public.symbol1.liquidationOrders | public.symbol2.liquidationOrders  | Not Allowed  |
| public.*.liquidationOrders       | public.symbol1.liquidationOrders   | Not Allowed |


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
