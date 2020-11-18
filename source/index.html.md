---
title: Huobi Coin Margined Swap API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Introduction

## API Documentation Summary

Welcome to the Huobi Coin Margined Swap API! You can use our API to access all market data, trading, and account management endpoints.

We have code examples in Shell! You can view code examples in the dark area to the right.

## Market Maker Program

Market maker program gives clients with good market making strategy an opportunity to have customized trading fee structure.

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotions.
</aside>

### Eligibility Criteria as a Market Maker on Huobi Futures

Welcome users, who are dedicated to maker strategy and have created large trading volume, to participate in Huobi Futures long-term Market Maker project.If you have more than 3 BTC in your Huobi future account, or more than 3 BTC in your Huobi coin margined swap account, or you have more than 3 BTC in your Huobi option account,or more than 30000 USDT in your Huobi USDT Margined swap account, please send the following information to dm_mm@huobi.com:

1. Huobi UIDs (not linked to any rebate program in any accounts)
2. Provide screenshot of trading volume for the past 30 days or VIP/corporate status with other Exchanges

# Changelog

## 1.1.0 2020-10-28 【Newly added：Query financial records via multiple fields, Query history orders via multiple fields,Query history transactions via multiple fields.】

### 1、Query history transactions via multiple fields
  
  - Interface Name：Query history transactions via multiple fields
  
  - Interface Type：private
  
  - Interface URL：swap-api/v1/swap_matchresults_exact
  
### 2、Query history orders via multiple fields

  - Interface Name：Query history orders via multiple fields
  
  - Interface Type：private
  
  - Interface URL：swap-api/v1/swap_hisorders_exact
  
### 3、Query financial records via multiple fields

  - Interface Name：Query financial records via multiple fields
  
  - Interface Type：private
  
  - Interface URL：swap-api/v1/swap_financial_record_exact

## 1.0.9 2020-10-15 【Newly added：Added switch leverage interface; Updated:  websocket messages of account topic will be pushed when leverage switch succeeds;  websocket messages of position topic will be pushed when leverage switch succeeds; new response fields are added on websocket topic of match orders; the interface(swap_order_info) supports query of 4-hour order cancellation data (previously only support to query 24-hour data).】

### 1、Added switch leverage interface

  - Interface Name：Switch Leverage

  - Interface Type：private

  - Interface URL：swap-api/v1/swap_switch_lever_rate

### 2、Subscribe Account Equity Updates Data（Return parameters added “switch_lever_rate” event type to represent switching leverages. When the leverage is successfully switched, a latest information on assets will be pushed with event“switch_lever_rate".）

  - Interface Name：Subscribe Account Equity Updates Data

  - Interface Type：private

  - Subscribe topic：accounts.$contract_code

### 3、Subscribe Position Updates（Return parameters added “switch_lever_rate” event type to represent switching leverages. When the leverage is successfully switched, a latest information on positions will be pushed with event“switch_lever_rate" (the information will not be pushed when the user's position is 0).）

  - Interface Name：Subscribe Position Updates

  - Interface Type：private

  - Subscribe topic：positions.$contract_code

### 4、Subscribe Match Order Data （Added the following fields in return parameters: direction (buy/sell direction), offset (open/close direction), lever_rate (leverages), price (order price), created_at (creation time), order_source (order source), order_price_type (order quotation type).）

  - Interface Name：Subscribe Match Order Data

  - Interface Type：private

  - Subscribe topic：matchOrders.$contract_code 

### 5、The interface(swap_order_info) supports query of 4-hour order cancellation data (previously only support to query 24-hour data).

  - Interface Name：Get Information of an Order

  - Interface Type：private

  - Interface URL：swap-api/v1/swap_order_info


## 1.0.8 2020-10-10 【Newly added：Added WS interface for subscribing system status updates push】

### 1. Added WS interface for subscribing system status updates push
  - Interface name: subscribe system status updates
  - Interface type: public
  - Subscription topic：public.$service.heartbeat

## 1.0.7 2020-08-06 【Added interfaces：Subscribe market BBO data push； Query user’s available leverage；Query user’s settlement records；Subscribe trigger orders updates 】

### 1、Subscribe Market BBO Data

  - Interface Name：Subscribe market BBO data push
  
  - Interface Type：public
  
  - Subscribe topic：market.$contract_code.bbo
  
### 2、 Query user’s available leverage

  - Interface Name： Query user’s available leverage
  
  - Interface Type：private
  
  - Interface URL：swap-api/v1/swap_available_level_rate
  
### 3、Query user’s settlement records

  - Interface Name：Query user’s settlement records
  
  - Interface Type：private
  
  - Interface URL：swap-api/v1/swap_user_settlement_records
  
### 4、Subscribe trigger orders updates

  - Interface Name：Subscribe trigger orders updates
  
  - Interface Type：private
  
  - Subscribe topic：trigger_order.$contract_code


## 1.0.6 2020-06-19 【 Update: added client_order_id in outer return parameter 】

### 1、Modified perpetual swaps subscribe match order data interface: added client_order_id in outer return parameter

- Interface name: subscribe match order data
- Interface type: private
- Subscription topic: matchOrders.$contract_code

## 1.0.5 2020-06-14  【 Add interfaces: Premium index Kline data(websocket, restful); Estimated funding rate Kline data(restful, websocket); Basis data (restful, websocket);Update interfaces: add average premium index of querying historical funding rates; add four depth level of subscribing market depth; etc】

### 1、Add an interface: Query Premium Index Kline Data

- Interface Name: Query Premium Index Kline Data
- Interface Type: public interface
- Interface URL: /index/market/history/swap_premium_index_kline

### 2、Add an interface: Subscribe Premium Index Kline Data

- Interface Name: Subscribe Premium index Kline data
- Interface Method: public interface
- Subscribe Topic:  market.$contract_code.premium_index.$period

### 3、Add an interface: Request Premium Index Kline Data

- Interface Name: Request Premium index Kline data
- Interface Method: public interface
- Request Topic: market.$contract_code.premium_index.$period

### 4、Add an interface: Query Estimated Funding Rate Kline Data

- Interface Name: Query Estimated funding rate Kline
- Interface Type: public interface
- Interface URL: /index/market/history/swap_estimated_rate_kline

### 5、Add an interface: Subscribe Estimated Funding Rate Kline Data

- Interface Name: Subscribe Estimated Funding Rate Kline
- Interface Type: public interface
- Subscribe Topic: market.$contract_code.estimated_rate.$period

### 6、Add an interface: Request Estimated Funding Rate Kline Data

- Interface Name: Request estimated funding rate k line
- Interface Type: public interface
- Request Topic: market.$contract_code.estimated_rate.$period

### 7、Add an interface: Query Swap Basis Data

- Interface Name: Get basis data
- Interface Type: public interface
- Interface URL: /index/market/history/swap_basis

### 8、Add an interface: Subscribe Swap Basis Data

- Interface Name: Subscribe basis data
- Interface Type: public interface
- Subscribe Topic: market.$contract_code.basis.$period.$basis_ price_type

### 9、Add an interface: Request Swap Basis data

 - Interface Name: Request basis data
 - Interface Type: public interface
 - Request Topic:  market.$contract_code.basis.$period.$basis_ price_type


### 10、Add average premuim index field of querying historical funding rate

- Interface Name: Query historical funding rate
- Interface Type: public interface
- Interface URL: /swap-api/v1/swap_historical_funding_rate

### 11、Add Four depth level of subscribing Market Depth: step12,step13,step14,step15

- Interface Name: Suscribe Market Depth
- Interface Type: public interface
- Interface URL: market.$contract_code.depth.$type

### 12、Add periodical push of websocket subscription of account: every 5s

- Interface Name: Subscribe Account
- Interface Type: private interface
- Interface URL: accounts.$contract_code

### 13、Add periodical push of websocket subscription of position: every 5s

- Interface Name: Subscribe Position
- Interface Type: private interface
- Interface URL: positions.$contract_code

### 14、Add return fields of order related interfaces:

#### 14.1 Add fields: order_id, order_id_str, client_order_id, order_type, status, trade_avg_price, trade_turnover, trade_volume

- Interface Name: Query Order Detail
- Interface Type: private interface
- Interface URL: swap-api/v1/swap_order_detail

#### 14.2、Add fields: liquidation_type，canceled_at

- Interface Name: Query Order Information
- Interface Type: private interface
- Interface URL: swap-api/v1/swap_order_info

#### 14.3、Add fields: canceled_at, fee_asset

- Interface Name: Subcribe Orders
- Interface Type: private interface
- Subscribe Topic: orders.$contract_code

### 15、Add a field returned by websocket subscription of private topics: uid

- Interface Name: Subscribe Orders
- Interface Type: private interface
- Subscribe Topic: orders.$contract_code

- Interface Name: Subscribe Accounts
- Interface Type: private interface
- Subscribe Topic: accounts.$contract_code

- Interface Name: Subscribe Positions
- Interface Type: private interface
- Subscribe Topic: positions.$contract_code

- Interface Name: Subscribe match Orders
- Interface Type: private interface
- Subscribe Topic: matchOrders.$contract_code

### 16、Add an interface: place a trigger order

 - Interface Name: Place a trigger order
 - Interface Type: private interface
 - Interface URL: /swap-api/v1/swap_trigger_order

### 17、Add an interface: Cancel trigger order

 - Interface Name: Cancel all trigger orders
 - Interface Type: private interface
 - Interface URL: /swap-api/v1/swap_trigger_cancel

### 18、Add an interface: Cancel all trigger orders

 - Interface Name: Cancel all trigger orders
 - Interface Type: private interface
 - Interface URL: /swap-api/v1/swap_trigger_cancelall

### 19、Add an interface: Query open trigger orders

 - Interface Name: Query open trigger orders
 - Interface Type: private interface
 - Interface URL: /swap-api/v1/swap_trigger_openorders

### 20、Add an interface: Query historical trigger orders

 - Interface Name: Query historical trigger orders
 - Interface Type: private interface
 - Interface URL: /swap-api/v1/swap_trigger_hisorders

### 21、Add an interface: Subscribe Match Orders

 - Interface Name: Subscribe Match Orders
 - Interface Type: private interface
 - Subscribe Topic: matchOrders.$contract_code

## 1.0.4 2020-5-27 【 Add an interface: websocket subscription of contract info 】

### 1、Add an interface: websocket subscription of contract info event

  - Interface Name: websocket subscription of contract info event

  - Interface Type: public interface.

  - Subscription topic: public.$contract_code.contract_info

## 1.0.3 2020-05-07 【 Add an interface: query assets and position info】

### 1、Add an interface: query assets and position info

  - Interface Name: query assets and position info

  - Interface Type: Private interface.

  - Interface URL： /swap-api/v1/swap_account_position_info


## 1.0.2 2020-04-09 [Add an interface: perpetual swaps funding rate WS push without authentication;2.	Add an interface: perpetual swaps liquidation order WS push without authentication]

### 1、Add an interface: perpetual swaps funding rate WS push without authentication.

  - Interface name: Subscribe funding rate (no authentication) 
  - Interface type: public interface.
  - Subscribe topic: public.$contract_code.funding_rate

### 2、	Add an interface: perpetual swaps liquidation order WS push without authentication

  - Interface name: Subscribe liquidation orders (no authentication)
  - Interface type: public interface.
  - Subscribe topic: public.$contract_code.liquidation_orders

## 1.0.1 2020-03-20

### 1、Log in with your master account on Web to sign the High Leverage Agreement if you use high leverage (>20x) for the first time. Afterwards, you can place order by API with high leverage (>20x).

### 2、The authentication path of the websocket subscription of order and user data is changed from '/notification' to '/swap-notification'.

  - Interface name: All interfaces under the websocket subscription of order and user data.
  - Interface type: User private interface.
  - Authentication path: /swap-notification.

### 3、Added incremental websocket subscription of orderbook data.orderbook event will be checked every 30ms.If there is no orderbook event, you will not receive any orderbook data.

  - Interface Name: Subscribe Incremental Market Depth Data.
  - Interface type: public interface.
  - Subscribe Topic: market.$contract_code.depth.size_${size}.high_freq.

### 4、Added API interface of querying user's API indicator disable information

  - Interface name: Query user's API indicator disable information
  - Interface type: User private interface 
  - URL: /swap-api/v1/swap_api_trading_status

### 5、 Added websocket subscription of funding rate.It will be pushed once the funding rate is updated.
  
  - Interface name: Subscribe funding rate
  - Interface type: User private interface
  - Subscribe Topic: funding_rate.$contract_code

### 6、Modified on the interface of querying contract information on order limit: added 10 order price types including opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok
    
  - Interface name: Query contract information on order limit
  - Interface type: User private interface
  - URL: POST /swap-api/v1/swap_order_limit

### 7、Modified on the interface of placing an order: added 8 order price types, including opponent_ioc, optimal_5_ioc, optimal_10_ioc, optimal_20_ioc,  opponent_fok,optimal_5_fok, optimal_10_fok, optimal_20_fok.
    
  - Interface name: Place an order 
  - Interface type: User private interface
  - URL: /swap-api/v1/swap_order

### 8、Modified on the interface of placing a batch of orders: added 8 order price types, including opponent_ioc, optimal_5_ioc, optimal_10_ioc, optimal_20_ioc,  opponent_fok, optimal_5_fok, optimal_10_fok, optimal_20_fok。
    
  - Interface name: Place a batch of orders
  - Interface type: User private interface
  - URL: /swap-api/v1/swap_batchorder

### 9、Modified on the interface of placing lightning close order interface: added string "order_price_type", including values: lightning_ioc, lightning_fok, lightning
  
  - Interface name: Place lightning close order
  - Interface type: User private interface
  - URL: /swap-api/v1/swap_lightning_close_position

### 10、Modified on the interface of querying trade details for an order: added string "liquidation_type".
    
  - Interface name: Get trade details of an order
  - Interface type: User private interface
  - URL: POST /swap-api/v1/swap_order_detail

### 11、Modified "trade_type" and "orders" in the interface of querying history orders. Added "reduce positions to close long" and "reduce positions to close short" types in request parameter "trade_type"; Added string "liquidation_type" in orders array of returning parameter.
 
  - Interface name: Query history orders interface.
  - Interface type: User private interface
  - URL: POST /swap-api/v1/swap_hisorders

### 12、Added string "liquidation_type" in order transaction push in WebSocket Subscription.
    
  - Interface name: Match result on order push in WebSocket subscription
  - Interface type: User private interface
  - Subscribe Topic: orders.$contract_code

### 13、Added an interface: transfer between master account and sub-accounts, the rate limit between the master account and each subaccount is 10 times/ minute.Interface name: Transfer between master account and sub-accounts. 

  - Interface name: transfer between master account and sub-accounts
  - Interface type: User private interface
  - URL：/swap-api/v1/swap_master_sub_transfer
 
### 14、Added a parameter: transfer permission between master account and sub-accounts. Added strings: "master_transfer_sub" and "sub_transfer_master" in returning parameter data array.
    
  - Interface name: Query information on system status
  - Interface type: Public
  - URL：/swap-api/v1/swap_api_state
 
### 15、Added an interface: query transfer records of master account and sub-accounts.
    
  - Interface name: Query transfer records of master account and sub-accounts.
  - Interface type: User private interface
  - URL: /swap-api/v1/swap_master_sub_transfer_record
 
### 16、Added four kinds of transfer statements between master account and sub-accounts in returning financial record interface.

  - Interface name: Query contract financial record
  - Interface type: User private interface
  - URL: /swap-api/v1/swap_financial_record
  

 
# Swap API Access Guide

##  API List

permission type  |  Content Type  |   Context                                      |   Request Type   |   Desc                                        | Signature Required   |
--------- | ---------------- | ------------------------------------------------ | ---------------- | ---------------------------------------------- | ---------------------- |
Read  | Market Data      | /swap-api/v1/swap_contract_info      |  GET              | Query Swap Info                      | No                     |
Read  | Market Data      | /swap-api/v1/swap_index             |  GET              | Query Swap Index Price Information          | No                     |
Read  | Market Data      |  /swap-api/v1/swap_price_limit       |  GET              | Query Swap Price Limitation                      | No                     |
Read  | Market Data      |  /swap-api/v1/swap_open_interest     |  GET              | Get Swap Open Interest Information        | No                     |
Read  | Market Data      |  /swap-api/v1/swap_delivery_price     |  GET              |  Get the estimated delivery price         | No                     |
Read  | Market Data      |  /swap/heartbeat/     |  GET              |  Query whether the system is available         | No                     |
Read  | Market Data      |  /api/v1/timestamp     |  GET              |    Get current system timestamp       | No                     |
Read     |  Market Data           |   /swap-api/v1/swap_api_state   |                  GET        |  Query information on system status    |  No  |
Read  | Market Data      |  /swap-ex/market/depth                  |  GET              | Get Market Depth                               | No                     |
Read  | Market Data      | /swap-ex/market/history/kline          |  GET              | Get KLine Data                                | No                     |
Read  | Market Data      |  /swap-ex/market/detail/merged         |  GET              | Get Market Data Overview                       | No                     |
Read  | Market Data      |  /swap-ex/market/trade                  |  GET              | Query The Last Trade of a Contract                   | No                     |
Read  | Market Data      | /swap-ex/market/history/trade           |  GET              | Query a Batch of Trade Records of a Contract | No                     |
Read    |  Market Data           |  /swap-api/v1/swap_risk_info |     GET       |  Query information on contract insurance fund balance and estimated clawback rate |  No  |
Read    |  Market Data           |  /swap-api/v1/swap_insurance_fund |   GET       |  Query history records of insurance fund balance            |  No  |
Read    |  Market Data           |  /swap-api/v1/swap_adjustfactor |    GET       |  Query information on Tiered Adjustment Factor            |  No  |
Read    |  Market Data           |  /swap-api/v1/swap_his_open_interest |    GET       |  Query information on open interest            |  No  |
Read     |   Market Data           |  /swap-api/v1/swap_elite_account_ratio |   GET       | Query Top Trader Sentiment Index Function-Account            |  No  |
Read     |   Market Data           |  /swap-api/v1/swap_elite_position_ratio |   GET       | Query Top Trader Sentiment Index Function-Position            |  No  |
Read     |   Market Data           |  /swap-api/v1/swap_liquidation_orders |   GET       |  Query Liquidation Orders            |  No  |
Read     |   Market Data           |  /index/market/history/swap_premium_index_kline |   GET       |  Query Premium Index Kline Data            |  No  |
Read     |   Market Data           |  /index/market/history/swap_basis |   GET       |  Query Basis Data            |  No  |
Read     |   Market Data           |  /swap-api/v1/swap_historical_funding_rate |   GET       |  Query historical funding rate         |  No  |
Read  | Account          | /swap-api/v1/swap_account_info   |  POST             | Query User’s Account Information                     | Yes                    |
Read  | Account          | /swap-api/v1/swap_position_info  |  POST             | Query User’s position Information                    | Yes                    |
Read   | Account | /swap-api/v1/swap_sub_account_list    | POST             |     Query assets information of all sub-accounts under the master account (Query by coins)     | Yes   |
Read   | Account | /swap-api/v1/swap_sub_account_info     | POST             |  Query a single sub-account's assets information   | Yes   |
Read   |  Account  | /swap-api/v1/swap_sub_position_info    | POST             | Query a single sub-account's position information    | Yes   |
Read   | Account  | /swap-api/v1/swap_financial_record    | POST             | Query account financial records  | Yes   |
Read   | Account  | swap-api/v1/swap_financial_record_exact    | POST             | Query financial records via multiple fields  | Yes   |
Read   | Account  | swap-api/v1/swap_user_settlement_records    | POST             | Query user’s settlement records  | Yes   |
Read   | Account  | swap-api/v1/swap_available_level_rate    | POST             | Query user’s available leverage | Yes   |
Read     | Account           |  /swap-api/v1/swap_order_limit |  POST       |  Query contract information on order limit            |  Yes  |
Read     | Account           |  /swap-api/v1/swap_fee |       POST       | Query information on contract trading fee            |  Yes  |       
Read     | Account           |  /swap-api/v1/swap_transfer_limit |     POST       |  Query information on Transfer Limit            |  Yes  |
Read     |  Account           |  /swap-api/v1/swap_position_limit |     POST       |  Query information on position limit            |  Yes  |
Read     |  Account           |   /swap-api/v1/swap_master_sub_transfer_record   |                  GET        |  Query transfer records of master account    |  No  |
Write     |  Account           |   /swap-api/v1/swap_master_sub_transfer  |                  POST        |  transfer between master account and sub-accounts  |  No  |
Trade  | Trade            |  /swap-api/v1/swap_order          |  POST             | Place an Order                                 | Yes                    |
Trade | Trade            | /swap-api/v1/swap_batchorder       |  POST             | Place a Batch of Orders                        | Yes                    |
Trade | Trade            | /swap-api/v1/swap_cancel           |  POST             | Cancel an Order                                | Yes                    |
Trade | Trade            | /swap-api/v1/swap_cancelall        |  POST             | Cancel All Orders                              | Yes                    |
Trade     |  Trade           |  /swap-api/v1/swap_switch_lever_rate |             POST       |  Switch Leverage                  |  Yes  |
Trade     |  Trade           |  /swap-api/v1/swap_lightning_close_position |   POST       |  Place Lightning Close Order            |  Yes  |
Trade  | Trade            |  /swap-api/v1/swap_trigger_order          |  POST             | Place an Trigger Order                                 | Yes                    |
Trade  | Trade            |  /swap-api/v1/swap_trigger_cancel          |  POST             | Cancel a Trigger Order                                 | Yes                    |
Trade  | Trade            |  swap-api/v1/swap_trigger_cancelall          |  POST             | Cancel all trigger Orders                                 | Yes                    |
Trade  | Trade            |  swap-api/v1/swap_trigger_openorders          |  POST             | Get all open trigger Orders                                 | Yes                    |
Trade  | Trade            |  swap-api/v1/swap_trigger_hisorders          |  POST             | Get all history trigger Orders                                 | Yes                    |
Read  | User Order Info  | /swap-api/v1/swap_order_info       |  POST             | Get Information of an Order                    | Yes                    |
Read  | User Order Info  |  /swap-api/v1/swap_order_detail   |  POST             | Get Trade Details of an Order                  | Yes                    |
Read  | User Order Info  |  /swap-api/v1/swap_openorders     |  POST             | Get Current Orders                             | Yes                    |
Read  | User Order Info  |  /swap-api/v1/swap_hisorders      |  POST             | Get History Orders                             | Yes                    |
Read  | User Order Info  |  /swap-api/v1/swap_hisorders_exact      |  POST             | Query history orders via multiple fields                       | Yes                    |
Read  | User Order Info  |  /swap-api/v1/swap_matchresults       |  POST             | Acquire History Match Results                             | Yes   |
Read  | User Order Info  |  /swap-api/v1/swap_matchresults_exact       |  POST             | Query history transactions via multiple fields                           | Yes   |


##  Address

Address | Applicable sites | Applicable functions | Applicable trading pairs |
------ | ---- | ---- | ------ |
https://api.hbdm.com  | Huobi Coin Margined Swap |  API       | Trading pairs provided by Huobi Coin Margined Swap  |

### Notice

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".


## Signature Authentication & Verification

### Signature Guide

Considering that API requests may get tampered in the process of transmission, to keep the transmission secure, you have to use your API Key to do Signature Authentication for all private interface except for public interface (used for acuqiring basic information and market data), in this way to verify whether the parameters/ parameter value get tampered or not in the process of transmission

A legitimate request consists of following parts：

- Request address of method, i.e. visit server address--api.hbdm.com, e.g.:  api.hbdm.com/swap-api/v1/swap_order

- API Access Key ID (AccessKeyId): Access Key of the API Key that you apply.

- Method of Signature (SignatureMethod): Based on the Hash Aggrement, users calculate the signature via HmacSHA256.

- Signature Version (SignatureVersion): It adopts version 2 in terms of Signature Version.

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

`https://api.hbdm.com/swap-api/v1/swap_order?`

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
//swap-api/v1/swap_order\n
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


#### 5.After ranking

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

#### 6.Following the sequence above, link parameters with "&"


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`

#### 7. Form the final character strings that need to do Signature calculation as following:

`POST\n`

`api.hbdm.com\n`

`//swap-api/v1/swap_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. Use the "request character strings" formed in the last step and your Secret Key to create a digital Signature.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. Take the request character string formed in the last step and API Secret Key as two parameters, encoding them with the Hash Function HmacSHA256 to get corresponding Hash value.

2. Encoding the Hash value with base-64 code, the result will be the digital Signature of this request.

#### 9. Add the digital Signature into the parameters of request path.

The final request sent to Server via API should be like:

`https://api.hbdm.com/swap-api/v1/swap_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. Add all the must authentication parameters into the parameters of request path;

2. Add the digital Signature encoded with URL code into the path parameters with the parameter name of "Signature".

## API Rate Limit Illustration

Future, Coin Margined Swap,Option Swap and USDT Margined Swap are using separate API rate limits.

Please note that, for both public interface and private interface, there are rate limits, more details are as below:

* Generally, the private interface rate limit of API key is at most 45 times every 3 second for each UID (this 45 times every 3 second rate limit is shared by all the altcoins contracts).

* For public interface used to get information of index, price limit, settlement, delivery, open positions and so on, the rate limit is 120 times every 3 second at most for each IP (this 120 times every 3 second public interface rate limit is shared by all the requests from that IP of non-marketing information, like above).

* For public interface to get market data such as  Get Kline data, Get Market Data Overview, Get Contract Information,Get market in-depth data, Get premium index Kline, Get real-time forecast capital rate kline, Get basis data, Get the last Trade of a Contract and so on：

    （1） For restful interface: 800 times/second for one IP at most.

    （2）For websocket: The rate limit for “req” request is 50 times at once. No limit for “sub” request as the data will be pushed by sever voluntarily.

* WebSocket, the private order push interface, requires API KEY Verification:

    Each UID can build at most create 30 WS connections for private order push at the same time. For each account, 
    contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS 
    order push connection for BTC Contract which will automatically push orders of BTC-USD
    contracts. Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

* Will response following string for "header" via api 

    ratelimit-limit: the upper limit of requests per time, unit: times

    ratelimit-interval: reset interval (reset the number of request), unit: ms

    ratelimit-remaining: the left available request number for this round, unit: times

    ratelimit-reset: upper limit of reset time used to reset request number, unit: ms 

    When API Limitation on Order Cancellation Ratio is triggered,the following string for "header" via api will also be returned:

    recovery-time: recovery timestamp, whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp; 

    if you are not in the prohibition period, the field is not included in returned header; 


## API Limitation on Order Cancellation Ratio

* The system will calculate the order cancellation ratio automatically when the total number of orders placed via certain order price types by the API user goes equal to or larger than 3,000 within 10 minutes. If the order cancellation ratio is greater than 99%, the user will be prohibited for 5 minutes from placing orders via certain API order price types which will be listed below.
* A 30-minute API order placement prohibition will be triggered if the user was prohibited for 3 times within an hour. After resuming access, the total number of prohibited times will be cleared during the previous period and will not be counted into the total prohibited times in the new period.
* Please note that the prohibition from placing orders will cause no effect on order cancellation via API as well as order placement and cancellation via other terminals. We’ll keep you notified on each prohibition via SMS and email.
* Only four API order price types will be prohibited which are Limit order, Post_only, FOK and IOC. Please note that you can still use freely other order price types during the banned period, such as Lightning Close, BBO, Optimal 5, Optimal 10 and Optimal 20, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok,etc.

- The response header returned by HTTP request:
  - When placing order by using the four prohibited order price types during the prohibition period, the message header returned by interface will include the field: 
  - "recovery-time": recovery timestamp,whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp; 
  - if you are not in the prohibition period, the field is not included in returned header;
  
- Please note that our system calculates order cancellation ratio according to UID and therefore, the master account UID and sub-accounts UIDs will be counted separately. The calculation period is 10 min/time.
- Definition of Indicators：
  
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

    - （1）Please try to use order prices types that help more on order fulfillment in preference such as BBO, Optimal 5, Optimal 10, Optimal 20, lightning Close, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok, etc.

    - （2）Try to use best bid/ask price when placing IOC orders, FOK orders and Post_only orders.

  - 5. Please try to extend your request polling cycle when implementing your strategy.
    


## Get system status

This endpoint allows users to get system status, Incidents and planned maintenance.

The system status can also be obtained through email, SMS, webhook, RSS/Atom feed. Users can You can click <a href='https://status-swap.huobigroup.com/'>here</a> to subscribe. The subscription function depends on Google services. Before you subscribe, please ensure that you can access Google services normally. 

```shell
curl "https://status-swap.huobigroup.com/api/v2/summary.json"
```

### HTTP Request

- GET `https://status-swap.huobigroup.com/api/v2/summary.json`

### Request Parameters

No parameter is available for this endpoint.

> Response:

```json
{
  "page": {  // Basic information of status page
    "id": "p0qjfl24znv5",  // page id
    "name": "Huobi",  // page name
    "url": "https://status-swap.huobigroup.com/", // page url
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
|page    |                     | basic information of status page
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




## Query whether the system is available  


- Interface `https://api.hbdm.com/heartbeat/`

### Returning Parameter
| Parameter Name | Parameter Type   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| status             | string                   | "ok" or "error"... 
| \<data\>             | dict object                 | 
| heartbeat             | int                   | future 1: avaiable 0: not available 
| swap_heartbeat             | int                   | coin margined swap 1: avaiable 0: not available 
| estimated_recovery_time             | long                   | null: normal. estimated recovery time :millionseconds.
| swap_estimated_recovery_time             | long                   | null: normal. coin margined swap estimated recovery time millionseconds.
| option_heartbeat             | int                   | option 1: avaiable 0: not available 
| option_estimated_recovery_time             | long                   | null: normal. option estimated recovery time :millionseconds.
| linear_swap_heartbeat             | long                   | USDT margined swap 1: avaiable 0: not available 
| linear_swap_estimated_recovery_time             | long                   | null: normal. USDT margined swap estimated recovery time millionseconds.
| \</data\>             |                  | 

> Response:

```json

{
    "status":"ok",
    "data":{
        "heartbeat":1,
        "estimated_recovery_time":null,
        "swap_heartbeat":1,
        "swap_estimated_recovery_time":null,
        "option_heartbeat":1,
        "option_estimated_recovery_time":null,
        "linear_swap_heartbeat":1,
        "linear_swap_estimated_recovery_time":null
    },
    "ts":1557714418033
}
```

- Notice: Heartbeat is 1 is available, 0 is not available. 

## Get current system timestamp

 get `https://api.hbdm.com/api/v1/timestamp`

### request
   null
   
> response

```json

{
    "status": "ok",
    "ts": 1578124684692
}

```
### Returning Parameter

| Parameter Name	  | Mandatory | Type      | Desc       | Value Range    |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result             |                                          |
| ts                     | true | long    | current system timestamp        |                                          |

#### Note:
- It can be used for  system time calibration.


## Details of Each Error Code

Error Code | Error Details Description|
----- | ---------------------- |
403	|	invalid ID                |
1000  |  System error.  | 
1001  |  System is unprepared.  | 
1002  |  Query error.  | 
1003  |  Abnormal redis operation.  | 
1004  |  System busy. Please try again later.  | 
1010  |  Account doesn't exist.  | 
1011  |  The user's session doesn't exist.  | 
1012  |  The user's account doesn't exist.  | 
1013  |  This contract type doesn't exist.  | 
1014  |  This contract doesn't exist.  | 
1015  |  The index price does not exist.  | 
1016  |  The bid offer does not exist. Please input the price.  | 
1017  |   Order doesn't exist.  | 
1018  |  Main account doesn't exist.  | 
1019  |  Main account doesn't exist in the sub-account white list.  | 
1020  |  The number of your sub-account exceeds the maximum. Please contact customer service.  | 
1021  |  Account open failed. Main account hasn’t opened contract trading account yet.   | 
1030  |  Input error.  | 
1031  |  Incorrect form source.  | 
1032  |  The number of access exceeded the limit.  | 
1033  |  Incorrect field of contract period.  | 
1034  |  Incorrect field of contract period.  | 
1035  |  Incorrect field of form direction.  | 
1036  |  Incorrect field of open long form.  | 
1037  |  The leverage is invalid. Please contact the customer service.  | 
1038  |  The order price exceeds the precision limit, please modify and order again.  | 
1039  |  Buy price must be lower than {0} USD. Sell price must exceed {1} USD.  | 
1040  |  Invalid amount, please modify and order again.  | 
1041  |  The order amount exceeds the limit ({0}Cont), please modify and order again.  | 
1042  |  Current positions have triggered position limits ({0}Cont). Please order after changing the amount.  | 
1043  |  Current positions have triggered position limits ({0}Cont). Please order after changing the amount.  | 
1044  |  Current positions have triggered position limits of our platform. Please order after changing the amount.  | 
1045  |  Unable to switch leverage  due to current holdings or open orders.  | 
1046  |  Abnormal service. Please try again later.  | 
1047  |  Insufficient margin available.   | 
1048  |  Insufficient close amount available.   | 
1049  |  Open a position with market price is not available.contracts.  | 
1050  |  Customer's order number is repeated. Please try again later.  | 
1051  |  No orders to cancel.  | 
1052  |  The number exceeds the batch limit.  | 
1053  |  Unable to get the latest price range.  | 
1054  |  Unable to get the latest price.  | 
1055  |  The price is not reasonable, and the account equity will be less than 0 after placing this order. Please modify the price and place the order.   | 
1056  |  In settlement. Your order can’t be placed/withdrew currently.  | 
1057  |  Your order can’t be placed due to trading halt.  | 
1058  |  Your order can’t be placed due to trade suspension.  | 
1059  |  In delivery. Your order can’t be placed/withdrew currently.  | 
1060  |  Your order can’t be placed currently due to abnormal contracts status.  | 
1061  |  This order doesn't exist.  | 
1062  |  Cancelling. Please be patient.  | 
1063  |  The order has been executed.  | 
1064  |  The main key of order conflicts.  | 
1065  |  The form number of client isn't an integer.  | 
1066  |  {0} cannot be empty.  | 
1067  |  Illegal parameter {0}.  | 
1068  |  Export error.  | 
1069  |  The price is not reasonable.  | 
1070  |  Empty data, cannot be exported.  | 
1071  |  Repeated cancellation. Your order has been canceled.  | 
1072  |   Sell price must be lower than {0} USD.  | 
1073  |  Position abnormal. Please contact the customer service.  | 
1074  |  Unable to order currently. Please contact the customer service.  | 
1075  |  The price is not reasonable, and the margin rate will be less than 0 after placing this order. Please modify the price and place the order.   | 
1076  |  No orders, please try again later.  | 
1077  |  In settlement or delivery. Unable to get assets.  | 
1078  |  In settlement or delivery. Unable to get assets.  | 
1079  |  In settlement or delivery. Unable to get positions.  | 
1080  |  In settlement or delivery. Unable to get positions.  | 
1081  |  The number of unfilled trigger order exceeds the limit.  | 
1082  |  Trigger type parameter error.  | 
1083  |  Your position is in the process of forced liquidation. Unable to place order temporarily.  | 
1084  |  Your contract API is disabled, please try again after {0} (GMT+8).  | 
1085  |  Trigger order failed, please modify the price and place the order again or contact the customer service.  | 
1086  |  {0} contract is restricted of opening positions on {1}.  Please contact customer service.  | 
1087  |  {0} contract is restricted of closing positions on {1}.  Please contact customer service.  | 
1088  |  {0} contract is restricted of withdraw order on {1}.  Please contact customer service.  | 
1089  |  {0} contract is restricted of transfer.  Please contact customer service.  | 
1090  |  Margin rate is lower than 0. Order can’t be placed.  | 
1091  |  Equity is less than 0. Order can’t be placed.  | 
1092  |  The Flash Closing Order takes the {0}th price at the order book. After placing an order, the account equity will be less than 0. Please manually enter the price or place an order with the counterparty price.  | 
1093  |  The Flash Closing Order takes the {0}th price at the order book. The margin rate will be less than 0 after placing an order. Please manually enter the price or place an order with the counterparty price.  | 
1094  |  The leverage cannot be empty, please switch the leverage or contact customer service.  | 
1095  |  Non-trading state, unable to switch the leverage temporarily.  | 
1100  |  Unable to open a position currently. Please contact the customer service.  | 
1101  |  Unable to close a position currently. Please contact the customer service.  | 
1102  |  Unable to transfer in currently. Please contact customer service.  | 
1103  |  Unable to transfer out currently. Please contact customer service.  | 
1104  |  Trading is prohibited due to contracts trading constraints.  | 
1105  |  Only Close is available due to contracts trading constraints.  | 
1106  |  Abnormal contracts status. Can’t transfer.  | 
1108  |  Abnormal service. Please try again later.  | 
1109  |  Sub-account doesn't own the permissions to open positions. Please contact customer service.  | 
1110  |  Sub-account  doesn't own the permissions to close positions. Please contact customer service.  | 
1111  |  Sub-account doesn't own the permissions to transfer in. Please contact customer service.  | 
1112  |  Sub-account doesn't own the permissions to transfer out. Please contact customer service.  | 
1113  |  The sub-account does not have transaction permissions. Please login main account to authorize.  | 
1114  |  The sub-account does not have transfer permissions. Please login main account to authorize.  | 
1115  |  You have no access permissions of this sub-account.  | 
1200  |  Login error. Please try again.  | 
1220  |  You don’t have access permission as you have not opened contracts trading.  | 
1221  |  The total balances of Exchange Account can't meet the requirements for opening contracts.  | 
1222  |  The days of opening account can't meet the requirements for opening contracts.  | 
1223  |  The VIP level can't meet the requirements for opening contracts.  | 
1224  |  Your country/region can't meet the requirements for opening contracts.  | 
1225  |  Failed to open contracts.  | 
1226  |  Repeated account.  | 
1227  |  Huobi Contract does not support sub-accounts. Please log out sub-account and log in again with primary account.  | 
1228  |  Account has not opened, cannot agree to agreement.  | 
1229  |  Cannot agree twice.  | 
1230  |  You haven't finished the risk verification.  | 
1231  |  You haven't finished the ID Verification.  | 
1232  |  The format/size of the image you uploaded does not meet the requirements. Please re-upload.  | 
1233  |  High leverage is not enabled (Please sign in the APP or web with your main account to agree to the High-Leverage Agreement).  | 
1234  |  {0} contract opening orders cannot exceed {1} .  | 
1235  |  {0} contract closing orders cannot exceed {1}.  | 
1250  |  Unable to get the HT_token.  | 
1251  |  Unable to get BTC assets. Please try again later.  | 
1252  |  Unable to get currency account assets. Please try again later.  | 
1253  |  Error in signature verification.  | 
1254  |  The sub-account has no permission to open futures, please go to the web side to log in the main account and open.   | 
1300  |  Transfer failed.  | 
1301  |  Insufficient amount available.  | 
1302  |  Transfer failed.  | 
1303  |  The single transfer-out amount must be no less than {0}{1}.  | 
1304  |  The single transfer-out amount must be no more than {0}{1}.  | 
1305  |  The single transfer-in amount must be no less than {0}{1}.  | 
1306  |  The single transfer-in amount must be no more than {0}{1}.  | 
1307  |  Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.  | 
1308  |  Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.  | 
1309  |  Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.  | 
1310  |  Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.  | 
1311  |  The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.  | 
1312  |  The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.  | 
1313  |  The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.  | 
1314  |  The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.  | 
1315  |  Wrong transfer type.  | 
1316  |  Failed to freeze the transfer.  | 
1317  |  Failed to unfreeze the transfer.  | 
1318  |  Failed to confirm the transfer.  | 
1319  |  Failed to acquire the available transfer amount.  | 
1320  |  The contract status is abnormal. Transfer is unavailable temporarily.  | 
1321  |  Transfer failed. Please try again later or contact customer service.  | 
1322  |  Invalid amount. Must be more than 0.  | 
1323  |  Abnormal service, transfer failed. Please try again later.  | 
1325  |  Failed to set trading unit.  | 
1326  |  Failed to obtain trading units.  | 
1327  |  No transfer permission, transfer failed, please contact customer service.  | 
1328  |  No transfer permission, transfer failed, please contact customer service.  | 
1329  |  No transfer permission, transfer failed, please contact customer service.  | 
1330  |  No transfer permission, transfer failed, please contact customer service.  | 
1331  |  Exceeds limit of transfer accuracy (8 digits). Please modify it.  | 
1332  |  The contract doesn't exist.  | 
1333  |  Failed to open the Maker&Taker agreement.  | 
1334  |  Failed to check the Maker&Taker agreement.  | 
1335  |  Failed to check the second confirmation setting of Maker&Taker.  | 
1336  |  Failed to update the second confirmation setting of Maker&Taker.  | 
1337  |  Failed to check the settings of Maker&Taker.  | 
1338  |  Failed to update the settings of Maker&Taker.  | 
1339  |  Nickname contains illegal words, please modify it.  | 
1340  |  Nickname has been used, please modify it.  | 
1341  |  The enrollment has ended.  | 
1342  |  You cannot set nickname for sub-account.  | 
12001  |  Invalid submission time.  | 
12002  |  Incorrect signature version.  | 
12003  |  Incorrect signature method.  | 
12004  |  Private key is expired.  | 
12005  |  Incorrect IP address.  |   
12006  |  The submission time can't be empty.  | 
12007  |  Incorrect public key.  | 
12008  |  Verification failed.  | 
12009  |  The user is locked or doesn't exist.  | 


## API Best Practice

### 1. Query contract history orders interface: /swap-api/v1/swap_hisorders

- To ensure timelines and to reduce latency, users are highly recommended to get contract history orders information faster from server memory using interface “query contract order information” (URL: /swap-api/v1/swap_order_info).

- For users who use interface “query contract history orders” (URL: //swap-api/v1/swap_hisorders), please enter as many query conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, type, status, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 2. Query contract match results interface: /swap-api/v1/swap_matchresults

- To improve query performance and response speed, please enter as many querying conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 3. Query contract financial record interface: /swap-api/v1/swap_financial_record

- To improve query performance and response speed, please enter as many querying conditions as possible (including symbol, type(recommended to leave it blank to query all), create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 4. Query contract order detail interface: /swap-api/v1/swap_order_detail

- Querying condition “created_at” uses 13-bit long type time stamp (including milliseconds). Querying performance will be improved when accurate time stamps are entered.

- For example: the converted time stamp of "2019/10/18 10:26:22" is 1571365582123. The returned ts from interface “contract_order” can be used as time stamp to query corresponding order. 0 is not allowed in parameter “created_at”.


### 5. WebSocket subscription to Market Depth data:

- For acquiring market depth data within 150 steps, you are kindly suggested to use step0, step1, step2, step3, step4, step5, step14, step15；

- For acquiring market depth data within 20 steps, you are kindly suggested to use step6, step7, step8, step9, step10, step11, step12, step13；

- Since the large volume of pushing 150 steps data every 100ms, WebSocket disconnection may occur frequently if client’s network bandwidth is insufficient or the processing is not in time; therefore, we highly recommend users using step6, step7, step8, step9, step10, step11, step12, step13 to acquire 20 steps data. For instance, subscribing 20 steps data.

`{`

  `"sub": "market.BTC-USD.depth.step6",`

  `"id": "id5"`

`}`

- We also suggest that you subscribe incremental market depth data.orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.You can subscribe 20 or 150 unmerged data.

`{`

  `"sub": "market.BTC-USD.depth.size_20.high_freq",`

` "data_type":"incremental", `

` "id": "id1" `

`}`

### 6. Place order interface (URL: /swap-api/v1/swap_order) and place a batch of orders interface (URL:/swap-api/v1/swap_batchorder):

- We recommend to fill in the parameter “client_order_id”(should be unique from user-side),which can help users to acquire order status and other order information according to the parameter “client_order_id" from

- query order information interface (URL: /swap-api/v1/swap_order_info ) when there is no returned information due to network or other problems.


## Code Demo

PS: Coin Margined Swap api is similar to future api.

- <a href='https://github.com/hbdmapi/java_demo'>Java</a>

- <a href='https://github.com/hbdmapi/hbdm_Python'>Python</a>

- <a href='https://github.com/hbdmapi/hbdm_swap_Rust'>Rust</a>

- <a href='https://github.com/hbdmapi/huobi_swap_Cpp'>C++</a>

- <a href='https://github.com/hbdmapi/huobi_futures_Postman'>Postman</a>

# Swap API FAQ

## Access and Authentication

### Q1: Is the API Key  for future and spot the same ?
     
Yes. The future API key and spot API key are same. You can create API using the following link.<a href=https://www.hbg.com/zh-cn/apikey/> click here</a>

### Q2: Why are APIs  disconnected or timeout?

1. The network connection is unstable if the server locates in China mainland,it is suggested to invoke APIS from a server located in  1c area of AWS Tokyo.

2.  You can use api.btcgateway.pro or api.hbdm.vn to debug for China mainland  network.

### Q3: Why is the websocket often disconnected?

It seems that most of the abnormal websocket  issues (such as disconnect, websocket close )(websocket: close 1006 (abnormal closure))are caused by different network environment. The following measures can effectively reduce websocket issues.

It would be better if the server is located in 1c area of AWS Tokyo with url api.hbdm.vn and implement websocket re-connection mechanism. Both market heartbeat and order heartbeat should response with Pong with different format, following  Websocket market heartbeat and account heartbeat requirement.<a href=https://docs.huobigroup.com/docs/coin_margined_swap/v1/cn/#472585d15d>here</a>

### Q4:  what is the difference between api.hbdm.com and api.hbdm.vn?

The api.hbdm.vn uses AWS's CDN service. it should be more stable and faster for AWS users. The api.hbdm.com uses Cloudflare's CDN service

### Q5: What is the colocation service ? which attention points should we know ?

Actually ,colo corresponds to a vpc node, which directly connects to  private network of huobi's future, so it will reduce the latency between the client and the Huobi future server (bypassing the CDN)

huobi future and huobi swap have the same colo, so the domain name connecting the swap api and the future api are the same.

Note : Colo needs to use api.hbdm.com for signature(authentication) to avoid getting 403 error: Verification failure. 

### Q6: Why does signature verification return failure (403: Verification failure) ?

The signature process of coin margined swap is similar to huobi future . In addition to the following precautions,please refer to the future demo to verify whether the signature is successful. Please check your own signature code after demo verification is successful. The coin margined  swap code demo is <a href=https://docs.huobigroup.com/docs/coin_margined_swap/v1/en/#code-demo>here</a>. The future code demo is <a href=https://docs.huobigroup.com/docs/dm/v1/en/#code-demo>here</a>.The option code demo is <a href=https://docs.huobigroup.com/docs/option/v1/en/#code-demo>here</a>. The USDT Margined Swap code demo is <a href=https://docs.huobigroup.com/docs/usdt_swap/v1/en/#code-demo>here</a>.

1. Check if the API key is valid and copied correctly.
2. Check if the IP is in whitelist
3. Check if th timestamp is UTC time
4. Check if parameters are sorted alphabetically
5. Check if the encoding is UTF-8 
6. Check if the signature has base64 encoding
7. Any method with parameters for GET requests should be signed.
8. Any method with parameters for POST requests don't need to be signed.
9. Check if whether the signature is URI encoded and Hexadecimal characters must be capitalized, such as ":" should be encoded as "%3A", and the space shoule be encoded as "%20"

### Q7: Is the ratelimit of public market based on  IP ? Is the ratelimit of interface with  private key based on UID?

Yes. The ratelimit of interface with private key is based on the UID, not the API key. The master and sub accounts are separately ratelimited and don't affect each other.

### Q8: Is there any recommendation for third-party framework which integrates Huobi swap?

There is an open source asynchronous quantization framework which integrates Huobi future and Huobi swap: <a href=https://github.com/hbdmapi/hbdm_Python>here</a>. If you have any quetsions, please open a ticket in github issues.

## Market and Websocket


### Q1: How often are the snapshot orderbook subscription and incremental orderbook subscription pushed?

The snapshot orderbook subscription(market.$contract_code.depth.$type) is checked once every 100MS.If there is an update,it will be pushed. It will be pushed at least 1 second.The incremental orderbook subscription is checked once every 30MS.If there is an update,it will be pushed.If there is no update, it will not be pushed.

### Q2: How often is the market trade subscription pushed?

The market trade subscription will be pushed when there is a transaction. 

### Q3: Are there historical Kline data or historical market trade data? 

Historical Kline data can be obtained through the API interface:swap-ex/market/history/kline.Only the from and to parameters need to be filled in, and the size parameter is not needed.At most, only two consecutive years of data can be obtained.

The historical market trade data is currently not available, you can store it locally by subscribing to market trade: market.$Contract_code.trade.detail.

### Q4: How to get MACD and other technical indicators on Kline? 

The API does not have interfaces to get technical indicators such as MACD. You can refer to TradingView and other websites to calculate them.

### Q5: What is the definition of timestamp in the document? 

The timestamp in the document refers to the total number of seconds or total milliseconds from Greenwich Mean Time, January 1, 1970, 00:00:00 (Beijing Time, January 1, 1970, 08:00:00) to the present.

### Q6: What is the definition of the 150 level and 20 level of MBP?


The Subscription of MBP data: market.$contract_code.depth.$type.150 price level means the current bids and asks splited into 150 level  by price.20 price level means the current bids and asks splited into 20 level by price.

### Q7: What is the meaning of merged depth when subscribing MBP data?

The subscrpition of MBP data:market.$contract_code.depth.$type：

step1 and step7 are merged by 5 decimal places.bids down,asks up.
step2 and step8 are merged by 4 decimal places.bids down,asks up.
step3 and step9 are merged by 3 decimal places.bids down,asks up.
step4 and step10 are merged by 2 decimal places.bids down,asks up.
step5 and step11 are merged by 1 decimal places.bids down,asks up.
step12 and step14 are combined by single digit.bids down,asks up.
step13 and step15 are combined by tens.bids down,asks up.

Example:

step4(0.01): 

bids price: 100.123, 100.245.
The merged bids price are 100.12, 100.24.

asks price: 100.123, 100.245
The merged asks price are 100.13, 100.25.

("Down" and "Up" are rounded up or down, if the price is down, the asks price is not rounded down, and the bids price is rounded up.)

150 price level: step0 to step5, step14, step15；

20 price level: step6 to step13;

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

Subscription of position event: "positions.BTC-USD".The latest position is pushed,including the volumes, available volumes, frozen volumes.If there is no update,it will not be pushed. 

### Q9: Does websocket's position channel push data when the unrealized profit is updated?

Subscription of position event: "positions.BTC-USD".It will not be pushed  if only unrealized profit is updated.
It will be pushed only when position event is updated.

### Q10: What is the difference between market detail and trade detail in WS?

Market Detail(market.$contract_code.detail) is the merged market data. It will be checked every 0.5s,pushed once trade event updates,including the OHLCV data,etc.Trade Detail(market.$contract_code.trade.detail) is pushed once trade event updates,including trade price, trade volume, trade direction,etc.

### Q11: What is the meaning of the two ts pushed by subscription of incremental MBP ?

Subscription of incremental MBP：market.$contract_code.depth.size_${size}.high_freq，The outer ts is the timestamp when the market server sends the data.The inner ts is the timestamp when the orderbook is checked.

### Q12: What is the difference between websocket subscription of MBP and incremental MBP? How often is the incremental MBP pushed?

market.$contract_code.depth.$type is snapshot MBP data，market.$contract_code.depth.size_${size}.high_freq is incremental MBP data.Snapshot MBP data is checked every 100ms,pushed at least every 1s.Incremental MBP data is checked every 30ms.It will not be pushed,if MBP has no update.

### Q13: How to maintain local MBP data subscribing incremental MBP:market.$contract_code.depth.size_${size}.high_freq?

Snapshot MBP data will be pushed for the first time, and the incremental MBP data will be pushed afterwards.

(1) Compare the incremental price with the previous full MBP data, and replace the order amount with the same price;

(2) If the price is not in the local MBP data,add the price to the local MBP data;

(3) If a price level is gone, data such as [8100, 0] will be pushed.You have to remove the same price of local MBP data;

(4) For the same websocket connection, the incremental data version is incremented; if the version is not incremented, you need to re-subscribe and re-maintain the local full MBP data;

## Order and Trade

### Q1: What is the perpetual funding rate settlement cycle? Which interface can be used to check the status when the fund rate is settled? 

We warmly remind you that Huobi Perpetual Swaps is settled every 8 hours, and the settlement will be at the end of each period. For example, 00:00 - 08:00 is a period, and its settlement time would be at 08:00; 08:00 - 16:00 is a period, and its settlement time would be at 16:00; 16:00 - 00:00 (+1 day) is a period, and its settlement time would be at 00:00. All times mentioned above are Singapore Standard time (GMT+8).

（1）Orders can't be placed or cancelled during settlement period, error code "1056" will be returned if users place or cancel orders. You are recommended to request contract information every few seconds during settlement period: swap-api/v1/swap_contract_info. It's in settlement time if there is any number of 5, 6, 7, 8 included in the returned status code of contract_status, while it indicates that settlement completed and users could place and cancel orders as usual if the returned status code is 1.

（2）When querying fund or position information during the settlement period, error codes will be returned. Error code and their meaning are as following:

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

The field ID returned by the information interface swap-api/v1/swap_order_detail is a globally unique transaction identifier. if a maker order is matched multiple times, a trade will be pushed once there is a transaction matched.

### Q4: What is the delay for the round trip of huobi swap?

At present,it normally takes about 30-50ms from placing the order to getting the status of the order.

### Q5: Why does the API return connection reset or Max retris or Timeout error?

Most of the network connectivity problems ,(such as Connection reset or network timeout )  are caused by network instability , you can use the server in AWS Tokyo C area with api.hbdm.vn , which can effectively reduce network timeout errors.

### Q6: How to check the order status without order_id not returned?
 
 If the order_id couldn't be returned due to network problems, you can query the status of the order by adding the custom order number(client_order_id ).

### Q7: What to do if it's diconnected after the websocket subscription of account, order and positions for a while?
  
 When subscribing private accounts, orders and positions, the heartbeat should also be maintained regularlyl ,which is different from the market heartbeat format . Please refer to the "websocket Heartbeat and Authentication Interface" . if the it is disconnected ,please try to reconnect.

### Q8. What is the difference between order status 1 and 2 ? what is the status 3 ?
 
 Status 1 is the preparation for submission. status 2 is the sequential submission  of internal process, which can be considered that it has been accepted by the system.  Status 3 indicated that the order has been  already submitted to market.

### Q9. Is there an interface to get the total assets in BTC of my account ? 
  
 No.

### Q10.  Why is the order filled after the order is withdrawed successfully by placing API cancellation ?
  
 The success return of order cancellation or placement  only represents that the command is excuted successfully and doesn't mean that the order has been cancelled . You can check the order status through the interface swap-api/v1/swap_order_info.

### Q11: Does the order status of 10 mean the order is failed?

Query the order status by swap-api/v1/swap_order_info.If the status is 10,the order is failed。

### Q12. How long does it generally take for an API from withdrawing to cancelling successfully ?

The order cancellation command generally takes several tens of ms. The actual status of order cancellation can be obtained by invoking an interface: swap-api/v1/swap_order_info


## Error Codes

### Q1: What is the reason for 1030 error code?

If you encounter errors such as {"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199},indicating that your input request parameter is not correct, please print your request body and complete URL parameters, and please check the corresponding API document interface one by one.The common example is that the volume must be an integer. 

### Q2: What is the reason for 1048 error code?

If you encounter errors such as {'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available.'}, indicating that your available position is not enough.You need to query the api swap-api/v1/swap_position_info to get your available position.

### Q3: What is the reason for 1032 error code? 

1032 means that your request exceeds the ratelimit. The coin margined swap, future, option swap and USDT margined swap limit the rate separately. Please check the ratelimit in the api ratelimit instructions, and you can print the current ratelimit in the header of the API response to check whether the ratelimit is exceeded. It is recommended to increase the request interval delay to avoid exceeding the ratelimit.

## How to solve problems more effectively?

When you report an API error, you need to attach your request URL, the original complete body of the request and the complete request URL parameters, and the original complete log of the server's response. If it is a websocket subscription, you need to provide the address of the subscription, the topic of the subscription, and the original complete log pushed by the server.

If it is an order-related issue, use the API order query interface swap-api/ v1/swap_order_info to keep the complete log returned and provide your UID and order number.


# Swap Market Data interface

## Query Swap Info 

### Example              
                                   
- GET  `/swap-api/v1/swap_contract_info`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_contract_info"      
```
                                                           
### Request Parameter

  Parameter Name   |   Type   |   Mandatory   |   Description   |
------------------ | -------- | ------------- | --------------- |
contract_code | string   | false      | Case-insenstive.such as "BTC-USD". All swaps default.|


> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USD",
            "contract_size": 100.000000000000000000,
            "price_tick": 0.100000000000000000,
            "create_date": "20200325",
            "contract_status": 1,
            "settlement_date": "1603872000000"
        }
    ],
    "ts": 1603851828069
}
```


### Returning Parameter

Parameter Name               |   Mandatory   |   Type   |   Description                                |   Value Range                                                |
------------------------------ | ------------- | -------- | --------------------------------------------- | ------------------------------------------------------------ |
status                         | true          | string   | Request Processing Result                     | "ok" , "error"                                               |
data \<list\>|               |          |   
symbol                     |  true           |  string     |  symbol                          |  "BTC","ETH"...  |
contract_code                  | true          | string   | Contract Code                                 | "BTC-USD" ...                                              |
contract_size                  | true          | decimal  | Contract Value (USD of one contract)          | 10, 100...                                                   |
price_tick                     | true          | decimal  | Minimum Variation of Contract Price           | 0.001, 0.01...                                               |
settlement_date                  | true          | string   | Settlement  Date                        | eg "1490759594752"                                                |
create_date                    | true          | string   | Listing Date                         | eg "20190808"                                                |
contract_status                | true          | int      | Contract Status                               | 0: Delisting,1: Listing,2: Pending Listing,3: Suspension,4: Suspending of Listing,5: In Settlement,6: Delivering,7: Settlement Completed,8: Delivered,9: Suspended Listing |
\</list\>                      |               |          |                                               |                                                              |
ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                                                              |


## Query Swap Index Price Information 

### Example                                                
                                                            
- GET `/swap-api/v1/swap_index` 

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_index?contract_code=BTC-USD"
```

### Request Parameter

| Parameter Name | Parameter Type | Mandatory   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| contract_code             | string             | false          | Case-insenstive."BTC-USD","ETH-USD"... |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "index_price": 13764.072500000000000000,
            "index_ts": 1603851876012,
            "contract_code": "BTC-USD"
        }
    ],
    "ts": 1603851883506
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  |
| data\<list\> |               |          |                                               |                 |
| contract_code                 | true          | string   | contract_code                                        | "BTC-USD","ETH-USD"...  |
| index_price                    | true          | decimal  | Index Price                                   |                 |
| index_ts                    | true          | Long  | Index time	                                  |                 |
| \</list\>                      |               |          |                                               |                 |
| ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                 |

  
## Query Swap Price Limitation

###  Example      
                                                                          
- GET `/swap-api/v1/swap_price_limit` 
 
```shell
curl "https://api.hbdm.com/swap-api/v1/swap_price_limit?contract_code=BTC-USD
```

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| contract_code      | string             | true         | Case-insenstive.such as:BTC-USD  ...                                    |

> Response

```json


{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USD",
            "high_limit": 14313.100000000000000000000000000000000000,
            "low_limit": 13212.200000000000000000000000000000000000
        }
    ],
    "ts": 1603851945000
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" ,"error"                     |
| data \<list\> |               |          |                                               |                                   |
| symbol  |  true  |  string  |  Variety code  |  "BTC","ETH" ...                                    
| high_limit                     | true          | decimal  | Highest Buying Price                          |                                   |
| low_limit                      | true          | decimal  | Lowest Selling Price                          |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC-USD"  ...               |
| \<list\>                       |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## Get Swap Open Interest Information

###  Example   
                                                                                 
- GET `/swap-api/v1/swap_open_interest` 

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_open_interest?contract_code=BTC-USD"
```

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| contract_code      | string             | false         | Case-insenstive.such as BTC-USD. ALL contracts by default.                                        |

> Response:


```json

{
    "status": "ok",
    "data": [
        {
            "volume": 2369902.000000000000000000,
            "amount": 17225.879137652822398930,
            "symbol": "BTC",
            "contract_code": "BTC-USD"
        }
    ],
    "ts": 1603852005954
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                    |
| data \<list\> |               |          |                                               |                                   |
| symbol                         | true          | string   | Variety code                                  | "BTC", "ETH" ...                  |
| volume                         | true          | decimal  | Position quantity(volume)                     |                                   |
| amount                         | true          | decimal  | Position quantity(Currency)                   |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC-USD"   ...              |
| \</list\>                      |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## Get Market Depth

###  Example            
                                            
- GET `/swap-ex/market/depth` 

```shell
curl "https://api.hbdm.com/swap-ex/market/depth?contract_code=BTC-USD&type=step5"
```  

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ----------------------------------------------------------------- |
| contract_code             | string             | true          | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
| type               | string             | true          | Get depth data within step 150, use step0, step1, step2, step3, step4, step5, step14, step15（merged depth data 0-5,14-15）；when step is 0，depth data will not be merged; Get depth data within step 20, use step6, step7, step8, step9, step10, step11, step12, step13(merged depth data 7-13); when step is 6, depth data will not be merged. |


> Response:

```json

{
    "ch": "market.BTC-USD.depth.step6",
    "status": "ok",
    "ts": 1603852132212,
    "tick": {
        "mrid": 50950394258,
        "id": 1603852132,
        "bids": [
            [
                13762.2,
                22198
            ],
            [
                13762.1,
                566
            ]
        ],
        "asks": [
            [
                13762.3,
                4193
            ],
            [
                13762.4,
                2
            ]
        ],
        "ts": 1603852132152,
        "version": 1603852132,
        "ch": "market.BTC-USD.depth.step6"
    }
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period                |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation，Unit：Millisecond                |                 |
| \<tick\>    |               |    |      |            | 
| mrid  | true| string | Order ID| 
| id  | true| string | tick ID | 
| asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
| bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
| ts | true | long | Time of Respond Generation, Unit: Millisecond  | |
| version | true | long | version ID  | |
| ch | true |  string | Data channel, Format： market.period | | 
| \</tick\>    |               |    |      |            | | 


## Get KLine Data

###  Example     
                                                                   
- GET `/swap-ex/market/history/kline` 

```shell
curl "https://api.hbdm.com/swap-ex/market/history/kline?period=1min&size=200&contract_code=BTC-USD"
```

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc               |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | -------------------- | ----------- | ------------------------------------------------------------ |
| contract_code             | true    |   string   | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
| period             | true          | string   | KLine Type          |             | 1min, 5min, 15min, 30min, 60min, 1hour,4hour,1day, 1mon      |
| size               | false         | int  | Acquisition Quantity | 150         | [1,2000]                                                     |
| from              | false         | long  | start timestamp seconds. |         |                                                    |
| to               | false         | long  | end timestamp seconds |          |                                                      |
### Note

- Either `size` field or `from` and `to` fields need to be filled.
- If `size` field and `from`/`to` fields are not filled, It will return error messages.
- If `from` field is filled, `to` field need to filled too.
- The api can mostly return the klines of last two years.
- If `from` `to` `size` are all filled,'from' and 'to' will be ignored.

> Data Illustration：

```
"data": [
  {
        "id": KLine id,
        "vol": Transaction Volume(amount),
        "count": transaction count
        "open": opening Price
        "close": Closing Price, when the Kline is the latest one，it means the latest price
        "low": Lowest price
        "high": highest price
        "amount": transaction volume(currency), sum(every transaction volume(amount)*every contract value/transaction price for this contract)
   }
]
```

> Response:

```json

{
    "ch": "market.BTC-USD.kline.5min",
    "data": [
        {
            "amount": 876.9369459997886,
            "close": 13782.1,
            "count": 1357,
            "high": 13782.2,
            "id": 1603851900,
            "low": 13755.8,
            "open": 13764.7,
            "vol": 120706
        },
        {
            "amount": 921.6695838405225,
            "close": 13779,
            "count": 1111,
            "high": 13787.6,
            "id": 1603852200,
            "low": 13777.5,
            "open": 13782.1,
            "vol": 127036
        }
    ],
    "status": "ok",
    "ts": 1603852355339
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                        |   Value Range   |
| ------------------ | ------------- | ------------- | --------------------------------------------- | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period |                 |
| status             | true          | string        | Request Processing Result                     | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation, Unit: Millisecond |                 |
|  \<list\>(attr name: data)    |               |kline data    |      |            | 
|  id    |     true          | long   |  kline id,the same as kline timestamp, kline start timestamp     |            
|  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
|  count    |     true          | decimal   |   Order Quantity  |            
|  open    |     true          | decimal   |   Opening Price  |            
|  close    |     true          | decimal   |  Closing Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | decimal   |  Low    |            
|  high    |     true          | decimal   |  High   |            
|  amount    |     true          | decimal   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of the coin/order price)   |            
|  \</list\>    |               |     |      |      


##  Get Market Data Overview

###  Example            
                                         
- GET `/swap-ex/market/detail/merged`
   
```shell
curl "https://api.hbdm.com/swap-ex/market/detail/merged?contract_code=BTC-USD"
```


###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | ------------- | ----------- | ------------------------------------------------------------ |
| contract_code             | true             | string          | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |

> tick Illustration:

```
"tick": {
    "id": KLine id,
    "vol": transaction volume（contract）,
    "count": transaction count
    "open": opening price,
    "close": Closing Price, when the Kline is the latest one，it means the latest price
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
    "ch": "market.BTC-USD.detail.merged",
    "status": "ok",
    "tick": {
        "amount": "358917.5563748616647638772009932561387079078",
        "ask": [
            13780.3,
            25907
        ],
        "bid": [
            13780.2,
            1455
        ],
        "close": "13780.2",
        "count": 412778,
        "high": "13796.5",
        "id": 1603852483,
        "low": "13531.2",
        "open": "13616.9",
        "ts": 1603852483765,
        "vol": "48357818"
    },
    "ts": 1603852483765
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，format： market.$contract_code.detail.merged |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation, Unit: Millisecond                |                 |
|  \<dict\>(attr name: tick)    |               |kline data    |      |            | 
|  id    |     true          | long   |  kline id,the same as kline timestamp   |            
|  vol    |     true          | string   |  Trade Volume(Cont.)    |            
| count    |     true          | decimal   |   Order Quantity  |            
|  open    |     true          | string   |   Opening Price  |            
|  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | string   |  Low    |            
|  high    |     true          | string   |  High   |            
|  amount    |     true          | string   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of the coin/order price)   |            
| ask | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
| bid | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
| ts  | true          | long        | Timestamp               |                 |
|  \</dict\>    |               |     |      |  


## Query The Last Trade of a Contract

###  Example   
                                          
- GET `/swap-ex/market/trade`   

```shell
curl "https://api.hbdm.com/swap-ex/market/trade?contract_code=BTC-USD"
```
 
###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        | 
| ------------------ | ------------- | -------- | ------------- | 
| contract_code             | true            | string          | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |

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
    "ch": "market.BTC-USD.trade.detail",
    "status": "ok",
    "tick": {
        "data": [
            {
                "amount": "40",
                "direction": "sell",
                "id": 509516201220000,
                "price": "13789.5",
                "ts": 1603852755227
            }
        ],
        "id": 1603852755779,
        "ts": 1603852755779
    },
    "ts": 1603852755779
}

```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | ----------------------------------------------------------- | ----------- | --------------- |
| ch                 | true          | string   | Data belonged channel，Format： market.$contract_code.trade.detail |             |                 |
| status             | true          | string   |                                                             |             | "ok","error"    |
| ts                 | true          | long   | Sending time                                                |             |                 |
|  \<tick\> (attrs: tick)   |               |    |      | 
| id  |  true  |  long  |  ID  |   |    
| ts  |  true  |  long  |  Latest Creation Time |   |    
|  \<list\>  (attrs: data)  |               |    |      | 
| id  |  true  |  long  |  ID  |   |    
| price  |  true  |  decimal  |  Price |   |    
| amount  |  true  |  decimal  |  Quantity(Cont.)  |   |    
| direction  |  true  |  string  |  Order Direction  |   |    
| ts  |  true  |  long  |  Order Creation Time |   |    
|  \</list\>    |               |    |      | 
|  \</tick\>    |               |    |      | 


## Query a Batch of Trade Records of a Contract

###  Example  
                                                            
- GET `/swap-ex/market/history/trade`
   
```shell 
curl "https://api.hbdm.com/swap-ex/market/history/trade?contract_code=BTC-USD&size=100"
```

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                |   Default   |   Value Range                                                |
| ------------------ | ------------- | ------------- | ------------------------------------- | ----------- | ------------------------------------------------------------ |
| contract_code     | true             | string    |  contract code  |  | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
| size               | true         | int        | Number of Trading Records Acquisition | 1           | [1, 2000]                                                    |

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
    "ch": "market.BTC-USD.trade.detail",
    "data": [
        {
            "data": [
                {
                    "amount": 4,
                    "direction": "sell",
                    "id": 509517815610000,
                    "price": 13804,
                    "ts": 1603852832106
                },
                {
                    "amount": 4,
                    "direction": "sell",
                    "id": 509517815610001,
                    "price": 13804,
                    "ts": 1603852832106
                },
                {
                    "amount": 2,
                    "direction": "sell",
                    "id": 509517815610002,
                    "price": 13804,
                    "ts": 1603852832106
                }
            ],
            "id": 50951781561,
            "ts": 1603852832106
        }
    ],
    "status": "ok",
    "ts": 1603852832219
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                      |   Value Range   |
| ------------------ | ------------- | ------------- | ----------------------------------------------------------- | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.$contract_code.trade.detail |                 |
| status             | true          | string        |                                                             | "ok"，"error"   |
| ts                 | true          | long        | Time of Respond Generation, Unit: Millisecond               |                 |
|  \<data\> (attrs: data)   |               |    |      | 
| id  |  true  |  long  |  ID  |   |    
| ts  |  true  |  long  |  Latest Creation Time |   |    
|  \<list\>  (attrs: data)  |               |    |      | 
| id  |  true  |  long  |  ID  |   |    
| price  |  true  |  decimal  |  Price |   |    
| amount  |  true  |  decimal  |  Quantity(Cont.)  |   |    
| direction  |  true  |  string  |  Order Direction  |   |    
| ts  |  true  |  long  |  Order Creation Time |   |    
|  \</list\>    |               |    |      | 
|  \</data\> (attrs: data)   |               |    |      | 

## Query information on contract insurance fund balance and estimated clawback rate

- GET `/swap-api/v1/swap_risk_info`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_risk_info"
```
 
###  Request Parameter 

|  Parameter Name                 |   Mandatory  |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             | false             | string   |   contract code     | Case-Insenstive.e.g. "BTC-USD" |


> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "BTC-USD",
            "insurance_fund": 593.770630435491805966,
            "estimated_clawback": 0
        }
    ],
    "ts": 1603852879216
}
```

### Returning Parameter 

|   Parameter Name                |  Mandatory   |  Type   |   Desc              |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| contract_code    |   true      | string   | e.g. "BTC-USD" |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| estimated_clawback | true  | decimal | Estimated Clawback Rate |  |
| \</data\> |  |  |  |  |

## Query history records of insurance fund balance

- GET `/swap-api/v1/swap_insurance_fund`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_insurance_fund?contract_code=BTC-USD"
```
 
### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type  |     Desc             |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code    | true     | string    |  contract code    | Case-Insenstive.e.g. "BTC-USD" |
| page_index  | false    | int    | page index. 1 by default    | 1       |                                          |
| page_size   | false    | int    | page size.100 by default. 100 at most | 100      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 89,
        "current_page": 1,
        "total_size": 89,
        "symbol": "BTC",
        "contract_code": "BTC-USD",
        "tick": [
            {
                "insurance_fund": 593.770630435491805966,
                "ts": 1603785600000
            }
        ]
    },
    "ts": 1603865805070
}

```

### Returning Parameter

|    Parameter Name                |    Mandatory	  |   Type  |   Desc              |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  | Dictionary Data |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code     |   true        |  string   | contract code  | e.g. "BTC-USD" |
| \<tick\> |  |  |  |  |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| ts | true  | long | Timestamp, Unit: Millisecond |  |
| \</tick\> |  |  |  |  |
total_page             | true     | int     | total page                |              |
current_page           | true     | int     | current page               |              |
total_size           | true     | int     |  total size               |              |
| \</data\> |  |  |  |  |

## Query information on Tiered Adjustment Factor

- GET `/swap-api/v1/swap_adjustfactor`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_adjustfactor"
```
 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |    Desc             |    Data Value       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             |  false     |    string        | Case-Insenstive.e.g. "BTC-USD" |


> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USD",
            "list": [
                {
                    "lever_rate": 125,
                    "ladders": [
                        {
                            "ladder": 0,
                            "min_size": 0,
                            "max_size": 1999,
                            "adjust_factor": 0.650000000000000000
                        },
                        {
                            "ladder": 1,
                            "min_size": 2000,
                            "max_size": 9999,
                            "adjust_factor": 0.800000000000000000
                        },
                        {
                            "ladder": 2,
                            "min_size": 10000,
                            "max_size": null,
                            "adjust_factor": 0.850000000000000000
                        }
                    ]
                }
            ]
        }
    ],
    "ts": 1603865852805
}

```


### Returning Parameter 

|    Parameter Name                 |    Mandatory    |    Type    |    Desc            |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code     | true     |  string | Contract Code   | e.g. "BTC-USD" |
| \<list\> |  |  |  |  |
| lever_rate   | true     | int  | Leverage               |                |
| \<ladderDetail\> |  |  |  |  |
| min_size | true | decimal | Min net position limit |  |
| max_size | true | decimal | Max net position limit |  |
| ladder | true | int | Tier |  |
| adjust_factor | true | decimal | Adjustment Factor |  |
| \</ladderDetail\> |  |  |  |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Query information on open interest

- GET `/swap-api/v1/swap_his_open_interest`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_his_open_interest?contract_code=BTC-USD&period=60min&amount_type=1"
```

### Request Parameter 

|   Parameter Name                |   Mandatory   |   Type    |    Desc             |    Data Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code      | true             | string   |   contract code     | Case-Insenstive. e.g. "BTC-USD" |
| period | true | string | Period Type | 1 hour:"60min"，4 hours:"4hour"，12 hours:"12hour"，1 day:"1day" |
| size | false | int | Request Amount | Default：48，Data Range [1,200]  |
| amount_type | true | int | Open interest unit | 1:-cont，2:-cryptocurrenty |

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "tick": [
            {
                "volume": 2428660.0000000000000000,
                "amount_type": 1,
                "ts": 1603857600000
            }
        ],
        "contract_code": "BTC-USD"
    },
    "ts": 1603865983492
}
```

### Returning Parameter 

|  Parameter Name                |   Mandatory 	 |   Type    |    Desc              |   Data Range        |
| ----------------------- | -------- | ------- | ------------------------ | --------------------- |
| status | true | string | Request Processing Result   | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  | Dictionary Data |  |
| symbol | true | string | symbol   | "BTC","ETH"... |
| contract_code     |  true    | string | Contract Code  | e.g. "BTC-USD" |
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

- GET `/swap-api/v1/swap_api_state`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_api_state"
```

### Request Parameter 

|  Parameter Name                |   Mandatory   |   Type  |   Desc              |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             | false             | string    |   contract code    | Case-Insenstive.e.g. "BTC-USD" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USD",
            "open": 1,
            "close": 1,
            "cancel": 1,
            "transfer_in": 1,
            "transfer_out": 1,
            "master_transfer_sub": 1,
            "sub_transfer_master": 1
        }
    ],
    "ts": 1603866257273
}

```

### Returning Parameter 

|   Parameter Name                |    Mandatory   |    Type   |    Desc             |    Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code   |  true   |  string   |  contract code    | e.g. "BTC-USD" |
| open | true | int | open order access：when “1”, then access available; when “0”, access unavailable"1" |  |
| close | true | int | close order access：when “1”, then access available; when “0”, access unavailable "1" |  |
| cancel | true | int | order cancellation access：when “1”, then access available; when “0”, access unavailable "1" |  |
| transfer_in | true | int |  deposit access：when “1”, then access available; when “0”, access unavailable "1" |  |
| transfer_out | true | int | withdraw access： when “1”, then access available; when “0”, access unavailable "1" |  |
| master_transfer_sub | true | int | transfer from master to sub account："1" is available，“0” is unavailable |  |
| sub_transfer_master | true | int | transfer from sub to master account："1" is available，“0” is unavailable |  |
| \</data\>  |  |  |  |  |

### Notice

- “open” is one of the trading access in “API-Open-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “close” is one of the trading access in “API-Close-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “cancel” is one of the trading access in “API-Cancel-Ordinary Order”. “On” stands for opening this access; “Off” stands for closing this access；

- “transfer_in” is one of the trading access in “Others-Transfer-Deposit”. “On” stands for opening this access; “Off” stands for closing this access；

- transfer_out refers to the corresponding access "Others- Transfer- Transfer out to exchange account" in the trading accesses, and is available when enabled, unavailable when disabled；

- master_transfer_sub refers to the corresponding access "Transfer from main account to sub-account" in the trading accesses, and is available when enabled, unavailable when disabled；

- sub_transfer_master refers to the corresponding access "Transfer from sub-account to main account" in the trading accesses, and is available when enabled, unavailable when disabled；


## Query Top Trader Sentiment Index Function-Account

- GET `/swap-api/v1/swap_elite_account_ratio`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_elite_account_ratio?contract_code=BTC-USD&period=60min"
```

### Request Parameter 

|  Parameter Name                 |   Mandatory    |    Type     |    Desc             |   Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code    | true    | string  |   Contract Code    | Case-Insenstive.e.g. "BTC-USD" |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
    "status": "ok",
    "data": {
        "list": [
            {
                "buy_ratio": 0.4700,
                "sell_ratio": 0.5200,
                "locked_ratio": 0.0100,
                "ts": 1603857300000
            },
            {
                "buy_ratio": 0.4700,
                "sell_ratio": 0.5200,
                "locked_ratio": 0.0100,
                "ts": 1603857600000
            }
        ],
        "symbol": "BTC",
        "contract_code": "BTC-USD"
    },
    "ts": 1603866026216
}

```

### Returning Parameter 

|   Parameter Name                 |  Mandatory  |   Type   |   Desc              |   Vaue Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code  | true |  string  | contract code | e.g. "BTC-USD" |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | net long accounts ratio |  |
| sell_ratio | true | decimal | net short accounts ratio |  |
| locked_ratio | true | decimal | locked accounts ratio |  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |


## Query Top Trader Sentiment Index Function-Position

- GET `/swap-api/v1/swap_elite_position_ratio`


```shell
curl "https://api.hbdm.com/swap-api/v1/swap_elite_position_ratio?contract_code=BTC-USD&period=60min"
```

### Request Parameter 

|  Parameter Name                |    Mandatory   |   Type  |       Desc             |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code    | true   | string    | Contract Code  | Case-Insenstive.e.g. "BTC-USD" |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json


{
    "status": "ok",
    "data": {
        "list": [
            {
                "buy_ratio": 0.5350,
                "sell_ratio": 0.4650,
                "ts": 1603857300000
            },
            {
                "buy_ratio": 0.5360,
                "sell_ratio": 0.4640,
                "ts": 1603857600000
            }
        ],
        "symbol": "BTC",
        "contract_code": "BTC-USD"
    },
    "ts": 1603866161191
}

```

### Returning Parameter 

|  Parameter Name                |    Mandatory   |    Type    |    Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond|  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code   | true  |  string  | contract code | e.g. "BTC-USD" |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | Net long position ratio |  |
| sell_ratio | true | decimal | Net short position ratio  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

##  Query Liquidation Orders

- GET `/swap-api/v1/swap_liquidation_orders`

```shell
curl "https://api.hbdm.com/swap-api/v1/swap_liquidation_orders?contract_code=BTC-USD&trade_type=0&create_date=7"
```

### Request Parameter 

|   Parameter Name    |  Mandatory  |  Type   |    Desc          |    Default   |    Value Range                                |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code     | true      | string  | Contract Code |  | Case-Insenstive.e.g. "BTC-USD" |
| trade_type      | true     | int  | trading types       |               | when “0”, request fully filled liquidated orders; when “5’, request liquidated close orders; when “6”, request liquidated open orders |
| create_date | true     | int    | date        |         | 7，90（ 7 days or 90 days）        |
| page_index | false     | int    | page, system sets page 1 by default without further instruction           |         |         |
| page_size | false     | int    | system sets page 20 by default without further instruction. Max page size is 50.        |         |        |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "contract_code": "BTC-USD",
                "symbol": "BTC",
                "direction": "buy",
                "offset": "close",
                "volume": 93.000000000000000000,
                "price": 13860.500000000000000000,
                "created_at": 1603865955650
            }
        ],
        "total_page": 4141,
        "current_page": 1,
        "total_size": 4141
    },
    "ts": 1603866516655
}
```

### Returning Parameter 

|   Parameter Name               |   Mandatory   |    Type   |     Desc             |   Value Range     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status                 | true     | string | Request Processing Result             |              |
| \<object\>(object name: data) |          |         |                    |              |
| \<list\>( object name: orders) |          |         |                    |              |
| symbol                 | true     | string  | symbol             |              |
| contract_code             |  true  |  string  | contract code | e.g. "BTC-USD" |
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


## Query funding rate

- GET `swap-api/v1/swap_funding_rate`

```shell
"https://api.hbdm.com/swap-api/v1/swap_funding_rate?contract_code=BTC-USD"
```

### Request Parameters

  Field name                 |   Required   |   Description    |               |   Value Range         |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  contract code   |  Case-Insenstive."BTC-USD" ...  |

> Response: 

```json

{
    "status": "ok",
    "data": {
        "estimated_rate": "0.000100000000000000",
        "funding_rate": "-0.000362360011416593",
        "contract_code": "BTC-USD",
        "symbol": "BTC",
        "fee_asset": "BTC",
        "funding_time": "1603872000000",
        "next_funding_time": "1603900800000"
    },
    "ts": 1603866304635
}
```

### Response Parameters

  field name      |   type   |   desc              |   value range        |
----------------------- |  ------- | ------------------ | -------------- |
status | string | response status  | "ok" , "error" |
ts | long | response timestamp.unit:millionSeconds. |  |
\<dict\>(attrs：data) |  |  |  |  |
symbol | string | symbol | "BTC","ETH"... |
contract_code  |  string   |  contract code | eg:"BTC-USD"  |
fee_asset | string | fee asset | eg:"BTC","ETH"... |
funding_time | string | current funding time |  |
funding_rate | string |  current funding rate |  |
estimated_rate | string | estimated funding rate of current period |  |
next_funding_time  | string |  estimated funding rate of next period     |   |
\</dict\> |  |  |  |  |

## Query historical funding rate

- GET `swap-api/v1/swap_historical_funding_rate`

```shell
"https://api.hbdm.com/swap-api/v1/swap_historical_funding_rate?contract_code=BTC-USD"
```

### Request Parameters

  parameter name                 |  Required  |   Type   |   Desc              |   Value Range        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  contract code   |  Case-Insenstive.eg:"BTC-USD" ...  |
page_index  | false    | int    | page index. 1 by default    | 1       |                                          |
page_size   | false    | int    | page size.20 by default. 50 at most | 20      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 326,
        "current_page": 1,
        "total_size": 651,
        "data": [
            {
                "avg_premium_index": "-0.000862360011416593",
                "funding_rate": "0.000100000000000000",
                "realized_rate": "0.000099999999999999",
                "funding_time": "1603843200000",
                "contract_code": "BTC-USD",
                "symbol": "BTC",
                "fee_asset": "BTC"
            },
            {
                "avg_premium_index": "-0.000154014120451130",
                "funding_rate": "0.000100000000000000",
                "realized_rate": "0.000099999999999999",
                "funding_time": "1603814400000",
                "contract_code": "BTC-USD",
                "symbol": "BTC",
                "fee_asset": "BTC"
            }
        ]
    },
    "ts": 1603866438409
}

```

### Response Parameters

  parameter name            |  type   |   desc             |   value range        |
----------------------- |  ------- | ------------------ | -------------- |
status | string | response status  | "ok" , "error" |
ts | long | response timestamp.unit:millionSeconds. |  |
\<dict\>(attrs：data) |  |  |  |  |
\<list\>(attrs：data) |  |  |  |  |
symbol | string | symbol | eg:"BTC","ETH"... |
contract_code  |  string   |  contract code  | eg: "BTC-USD
fee_asset | string | fee asset | eg:"BTC","ETH"... |
funding_time | string | funding time |  |
funding_rate | string | funding rate |  |
realized_rate |string | realized funding rate |  |
avg_premium_index | string | average premium index |  |
\</list\> |  |  |  |  |
total_page      | int     | total page                |              |
current_page    | int     | current page               |              |
total_size      | int     |  total size               |              |
\</dict\> |  |  |  |  |

## Query Premium Index Kline Data

### example

- GET `/index/market/history/swap_premium_index_kline`

```shell
"https://api.hbdm.com/index/market/history/swap_premium_index_kline?contract_code=BTC-USD&period=1min&size=1"
```

### request parameters
| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string |           |         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD","ETH-USD".                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1week,1mon     |
| size  | true     | int    | kline size         | | [1,2000] |

### response parameters：
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | true     | string | data channel          |         | eg： market.period                           |
  \<data\>    |               |    |  object    |            | 
  id    |     true          | long   |  index kline id,the same as kline timestamp, kline start timestamp    |            
  vol    |     true          | string   |  Trade Volume(Cont.) The value is 0   |            
  count    |     true          | string   |   Order Quantity The value is 0|            
  open    |     true          | string   |   Opening Price  |            
  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
  low    |     true          | string   |  Lowest Price   |            
  high    |     true          | string   |  Highest Price   |            
  amount    |     true          | string   |  Trade Amount(Coin), The value is 0. )   |            
  \</data\>    |               |     |      |          
| status  | true     | string    | process status          |   | "ok" , "error" |
| ts  | true     | long    | timestamp of the response of the server          |  |  unit：millionseconds |


- Response Example：

```json

{
    "ch": "market.BTC-USD.premium_index.5min",
    "data": [
        {
            "amount": "0",
            "close": "0.0001707736117204",
            "count": "0",
            "high": "0.0002577815537329",
            "id": 1603866300,
            "low": "0.0001098331534551",
            "open": "0.0001464728626806",
            "vol": "0"
        }
    ],
    "status": "ok",
    "ts": 1603866593134
}

```

## Query Estimated Funding Rate Kline Data

### example

- GET `/index/market/history/swap_estimated_rate_kline`

```shell
"https://api.hbdm.com/index/market/history/swap_estimated_rate_kline?contract_code=BTC-USD&period=1min&size=1"
```

### request parameters

| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string |  contract code  |         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD","ETH-USD".                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1week,1mon     |
| size  | true     | int    | kline size         | | [1,2000] |

### response parameters：
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | true     | string | data channel          |         | eg： market.period                           |
  \<data\>    |               |    |  object    |            | 
  id    |     true          | long   |  kline ID     |            
  vol    |     true          | string   |  Trade Volume(Cont.) The value is 0   |            
  count    |     true          | string   |   Order Quantity The value is 0|            
  open    |     true          | string   |   Opening Price  |            
  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
  low    |     true          | string   |  Lowest Price   |            
  high    |     true          | string   |  Highest Price   |            
  amount    |     true          | string   |  Trade Amount(Coin), The value is 0. )   |            
  \</data\>    |               |     |      |          
| status  | true     | string    | process status          |   | "ok" , "error" |
| ts  | true     | long    | timestamp of the response of the server          |  |  unit：millionseconds |


- Response Example：

```json

{
    "ch": "market.BTC-USD.estimated_rate.5min",
    "data": [
        {
            "amount": "0",
            "close": "0.0001",
            "count": "0",
            "high": "0.0001",
            "id": 1603866600,
            "low": "0.0001",
            "open": "0.0001",
            "vol": "0"
        }
    ],
    "status": "ok",
    "ts": 1603866642803
}

```

## Query Basis Data

### example

- GET `/index/market/history/swap_basis`

```shell
curl "https://api.hbdm.com/index/market/history/swap_basis?contract_code=BTC-USD&period=1min&size=150&basis_price_type=open"
```

### request parameters
| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code           |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USD"
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |
| size  | true     | int    | data size         | 150 | [1,2000] |

> Response example：

```json


{
    "ch": "market.BTC-USD.basis.5min.open",
    "data": [
        {
            "basis": "2.2525000000005093",
            "basis_rate": "0.00016353574072709766",
            "contract_price": "13776",
            "id": 1603866300,
            "index_price": "13773.7475"
        },
        {
            "basis": "9.072500000000218",
            "basis_rate": "0.0006591696787033861",
            "contract_price": "13772.6",
            "id": 1603866600,
            "index_price": "13763.5275"
        }
    ],
    "status": "ok",
    "ts": 1603866710696
}

```

### response parameters

| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| ch     | true | string | data channel，eg： market.basis |                | |
| \<data\> |  | object array |  |  |
| id | true | long | unique id |  |
| contract_price | true | string | contract last price |  |
| index_price | true | string | index price |  |
| basis | true | string | basis=contract_price - index_price |  |
| basis_rate | true | string | basis_rate=basis/index_price |  |
| \</data\> |  |  |  |  |
| status | true | string | status                          | "ok" , "error" | |
| ts | true  | long | created time |  |


- Note：
   2000 size at most per request ；




# Swap Account Interface

## Query User’s Account Information

###  Example          
                                      
- POST `/swap-api/v1/swap_account_info`  

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |    Value Range                                           |
| ------------------ | ------------- | -------- | ------------ |  ------------------------------------------------------- |
| contract_code             | false             | string    |  contract code    | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "margin_balance": 717.600960962561438668000000000000000000000000000000000000,
            "margin_position": 15.483471394286599055,
            "margin_frozen": 13.765413852951653365,
            "margin_available": 688.352075715323186248,
            "profit_real": 0,
            "profit_unreal": -6.321988896485647800000000000000000000000000000000000000,
            "risk_rate": 24.134301218550508200,
            "withdraw_available": 688.352075715323186248000000000000000000000000000000000000,
            "liquidation_price": 0.198584522842823398,
            "lever_rate": 20,
            "adjust_factor": 0.400000000000000000,
            "margin_static": 723.922949859047086468,
            "contract_code": "THETA-USD"
        }
    ],
    "ts": 1603866747447
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  |
| \<list\>(Attribute Name: data) |               |          |                                               |                 |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...  |
| contract_code                  |   true        | string   |  Contract Code  | e.g. "BTC-USD"              |                 |
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
| ts                             | true        | long     | Time of Respond Generation, Unit: Millisecond |                 |


## Query User’s Position Information

###  Example                           
                     
- POST  `/swap-api/v1/swap_position_info` 

### Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Value Range                                           |
| ------------------ | ------------- | -------- | ------------ | ------------------------------------------------------- |
| contract_code      | false             | string    |   Contract Code  | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "volume": 20.000000000000000000,
            "available": 20.000000000000000000,
            "frozen": 0,
            "cost_open": 0.604834710743801652,
            "cost_hold": 0.659310000000000000,
            "profit_unreal": -10.525756239881099200000000000000000000000000000000000000,
            "profit_rate": 1.015859675335792480,
            "lever_rate": 20,
            "position_margin": 15.693659761456371625,
            "direction": "buy",
            "profit": 16.795657677889033200000000000000000000000000000000000000,
            "last_price": 0.6372
        }
    ],
    "ts": 1603868312729
}

```

### Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                       |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | ----------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                      |
| \<list\>(Attribute Name: data) |               |          |                                               |                                     |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...                      |
| contract_code                  |  true         | string   | Contract Code                                 | e.g. "BTC-USD" |
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

#### Note

- If there are symbols in the settlement or delivery period,error code 1080(1080  In settlement or delivery. Unable to get positions) will return without request parameters. It's suggested to query the position info with request parameters to avoid raising the error code and not being able to query the position.

## Query Assets And Positions

- post `swap-api/v1/swap_account_position_info`
  
### params

field               |  Mandatory |  type  |  desc         |   range       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code | true | string | contract code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC-USD","ETH-USD".... |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "margin_balance": 713.633454962959082868000000000000000000000000000000000000,
            "margin_position": 15.681846694266716848,
            "margin_frozen": 13.765413852951653365,
            "margin_available": 684.186194415740712655,
            "profit_real": 0,
            "profit_unreal": -10.289494896088003600000000000000000000000000000000000000,
            "risk_rate": 23.834290107178404617,
            "withdraw_available": 684.186194415740712655000000000000000000000000000000000000,
            "liquidation_price": 0.198584522842823398,
            "lever_rate": 20,
            "adjust_factor": 0.400000000000000000,
            "margin_static": 723.922949859047086468,
            "positions": [
                {
                    "symbol": "THETA",
                    "contract_code": "THETA-USD",
                    "volume": 20.000000000000000000,
                    "available": 20.000000000000000000,
                    "frozen": 0,
                    "cost_open": 0.604834710743801652,
                    "cost_hold": 0.659310000000000000,
                    "profit_unreal": -10.289494896088003600000000000000000000000000000000000000,
                    "profit_rate": 1.030149581489096360,
                    "lever_rate": 20,
                    "position_margin": 15.681846694266716848,
                    "direction": "buy",
                    "profit": 17.031919021682128800000000000000000000000000000000000000,
                    "last_price": 0.63768
                }
            ]
        }
    ],
    "ts": 1603868847514
}
```

### response

attr | type | Mandatory | desc     |
-----  | -----  | -----  | -----  |
status     |  string  | true  | Request Processing Result  "ok" , "error" |
ts       | long | true    | Time of Respond Generation, Unit: Millisecond                 |
\<data\> |   object array     |  true       |                             |
symbol | string | true | contract symbol                                     |
contract_code | string | true | contract code                                     |
margin_balance | decimal | true | Balance Margin                            |
margin_static | decimal | true | Balance static                            |
margin_position | decimal | true | Postion Margin                           |
margin_frozen | decimal | true | Frozen Margin                              |
margin_available | decimal | true | Available Margin                        |
profit_real | decimal | true | Realized Profit                              |
profit_unreal | decimal | true | Unreadlized Profit                         |
risk_rate | decimal | true | risk rate                                      |
withdraw_available | decimal | true | Available Withdraw                    |
liquidation_price | decimal | true | Estimated Liquidation Price            |
lever_rate | decimal | true | Leverage Rate                                 |
adjust_factor | decimal | true | Adjustment Factor                          |
\<list\>(Attrs: positions) |              |          |                            |
symbol | string | true | Variety Code                                                    |
contract_code |  string | true  | Contract Code	"BTC-USD" ...                         |
volume  | decimal  |  true | Position Quantity                                           |
available  |  decimal |  true  | Available position quatity can be closed                |
frozen  |  decimal |  true | forzen postion Quantity                                     |
cost_open  |  decimal |  true | Opening Average Price                                    |
cost_hold | decimal  |  true | Average position price                                    |
profit_unreal | decimal  | true  | Unrealized profit                                     |
profit_rate | decimal  | true  | Profit Rate                                            |
profit |  decimal |  true | Profit                                                      |
position_margin |  decimal |  true | Position Margin                                    |
lever_rate | int | true | Leverage Rate                                               |
direction | string  | true  | "buy" "sell"	                                            |
last_price | decimal  | true  | Last Price                                              |
\</list\>                  |              |          |                            |
\</data\>            |        |         |                      |  


## Query assets information of all sub-accounts under the master account

- POST `/swap-api/v1/swap_sub_account_list`

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**    | **Value range**                                 |
| ----------- | -------- | ------ | ------------- |  ---------------------------------------- |
| contract_code             |  false     |  string   | Contract Code  | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "sub_uid": 123456789,
            "list": [
                {
                    "symbol": "THETA",
                    "margin_balance": 100.000000000000000000,
                    "liquidation_price": null,
                    "risk_rate": 63.100000000000000024,
                    "contract_code": "THETA-USD"
                }
            ]
        }
    ],
    "ts": 1603869590660
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
| contract_code    |  true  |  string | contract code    | e.g. "BTC-USD" |
| margin_balance | true | decimal | account equity |  |
| liquidation_price | true | decimal | estimated liquidation price |  |
| risk_rate | true | decimal | margin rate |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |


- Notice

 Only return data for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission). 


## Query a single sub-account's assets information

- POST `/swap-api/v1/swap_sub_account_info`

### Request Parameters


| **Parameter name**    | **Must fill or not** | **Type** |  **Value range**                                 |
| ----------- | -------- | ------ |  ---------------------------------------- |
| contract_code   |   false    |  string  | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| sub_uid | true | long | sub-account UID	 |  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "margin_balance": 100.000000000000000000,
            "margin_position": 0,
            "margin_frozen": 1.574803149606299212,
            "margin_available": 98.425196850393700788,
            "profit_real": 0,
            "profit_unreal": 0,
            "risk_rate": 63.100000000000000024,
            "withdraw_available": 98.425196850393700788000000000000000000,
            "liquidation_price": null,
            "lever_rate": 20,
            "adjust_factor": 0.400000000000000000,
            "margin_static": 100.000000000000000000,
            "contract_code": "THETA-USD"
        }
    ],
    "ts": 1603869680106
}

```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts    | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"...when the$contract_code value is "*", it will subscribe all contract types |
| contract_code             | true |  string  | contract code | e.g. "BTC-USD" |
| margin_balance                  | true     | decimal  | account equity               |                |
| margin_position                 | true     | decimal  | position margin (the margin used by current positions)               |                |
| margin_frozen                 | true     | decimal  | frozen margin               |                |
| margin_available                 | true     | decimal  | available margin               |                |
| profit_real                 | true     | decimal  | realized profits and losses               |                |
| profit_unreal                 | true     | decimal  | unrealized profits and losses               |                |
| risk_rate                 | true     | decimal  | margin rate               |                |
| liquidation_price                | true     | decimal  | estimated liquidation price               |                |
| withdraw_available                | true     | decimal  | available transfer amount               |                |
| lever_rate                | true     | int  | leverage ratios               |                |
| adjust_factor                | true     | decimal  |  Adjustment Factor               |                |  
| margin_static                | true     | decimal  | Static Margin                |                |
| \</data\> |  |  |  |  |


#### Notice:

   Only query account information for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission);

   No data return for sub-accounts which has logged in hbdm but have not gained trading permission/activated.


## Query a single sub-account's position information

- POST `/swap-api/v1/swap_sub_position_info`

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**    |
| ----------- | -------- | ------ | -------------  |
| contract_code     |  false    |  string    | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| sub_uid | true | long | sub-account UID	 |  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "volume": 2.000000000000000000,
            "available": 2.000000000000000000,
            "frozen": 0,
            "cost_open": 0.629950000000000000,
            "cost_hold": 0.629950000000000000,
            "profit_unreal": -0.016622805714717100000000000000000000000000000000000000,
            "profit_rate": -0.010471536459986040,
            "lever_rate": 20,
            "position_margin": 1.586596433331217871,
            "direction": "sell",
            "profit": -0.016622805714717100000000000000000000000000000000000000,
            "last_price": 0.63028
        }
    ],
    "ts": 1603869954515
}
```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts                       | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"... |
| contract_code                | true     | string  |  contract code             | "BTC-USD" ... |
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

- POST `/swap-api/v1/swap_financial_record`
 
### Request Parameters

| **Parameter name**                | **Must fill or not** | **Type**  | **Description**             | **Value range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| type | false | string | if not fill this parameter, it will query all types 【please use "," to seperate multiple types】 | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master;  |
| create_date | false | int |  any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.  |  |
| page_index | false | int | which page, default value is "1st page" when not fill this parameter |  |
| page_size | false | int | the default value is "20" when not fill this parameter, should ≤50 |  |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 48,
        "current_page": 1,
        "total_size": 95,
        "financial_record": [
            {
                "id": 927489216,
                "symbol": "THETA",
                "type": 34,
                "amount": -100.000000000000000000,
                "ts": 1603869236526,
                "contract_code": "THETA-USD"
            },
            {
                "id": 927289649,
                "symbol": "THETA",
                "type": 30,
                "amount": 0.152433200573441931,
                "ts": 1603843216465,
                "contract_code": "THETA-USD"
            }
        ]
    },
    "ts": 1603870180849
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
| contract_code | true | string | contract type code   | "BTC-USD",... |
| type | true  | int | transaction type | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; |
| amount | true  | decimal | amount |  |
| \</financial_record\> |  |  |  |  |
| total_page | true  | int | total page |  |
| current_page | true  | int | current page |  |
| total_size | true  | int | total size |  |
| \</data\> |  |  |  |  |


## Query financial records via multiple fields

- POST `swap-api/v1/swap_financial_record_exact`

### Request Parameter

| Parameter name         | Mandatory  | Type     | Description    | Value range  |
| ----------- | ----- | ------ | ---------------------- | ---------------------------------------- |
| contract_code      | true | string | contract code    | "BTC-USD"...                         |
| type        | false | string | if not fill this parameter, it will query all types 【please use "," to seperate multiple types】  | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; |
| start_time   | false  | long    | Start Time（Timestamp，Unit: Millisecond）        | See note    |
| end_time   | false  | long    | End Time（Timestamp，Unit: Millisecond）        |  See note   |
| from_id    | false | long    | Query start id（uses id of returned data）    |                     |
| size     | false | int    |number of data   |  it will be the default value of 20; the number should ≤50        |
| direct     | false | string    |   Query direction   |   prev ；next ；default value:prev   |

#### Note:

- Value range description of start_time and end_time:
   - start_time: value range is [(current time - 90 days)，current time] ；default value is clamp（end_time - 10 days，current time -90 days，current time -10 days）which means the furthest time is the current time minus 90 days and the most recent time is current time minus 10 days.
   - end_time: value range is [(current day - 90 days)，above++)，if the end_time is greater than the current time, use current time; if start_time is filled，the end_time shall be greater than start_time. The system will use current time by default. 
- if from_id is not filled and the query direction is prev, query from back to front from the end time; if from_id is not filled and the query direction is next, query from front to back from the start time. Query financial records with creation time greater than or equal to the start time but less than or equal to the end time. 
- Regardless of whether the query direction is prev or next, the data returned is in reverse order of creation time. 
- If the value of start_time or end_time filled in is not within the value range, the system will report that the parameter is invalid. 
- Only data within 90 days are available to query.

####  Query cases are as below (special cases are not included)：
| start_time | end_time | from_id  | size | direct | Query Result |
|-----|------|-----|-----|-----|-----|
| Default 10 days before the current time  | Default current time | Default | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | prev | Query data between 60 days ago and 50 days ago; query 20 data from back to front from 50 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time  | Default | 20 | prev | Query the data within the last 5 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | prev | Query data between 20 days ago and 10 days ago; query 20 data from back to front from 10 days ago.The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  | Default | 20 | next | Query the data within the last 10 days; query 20 data from front to back from 10 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | next | Query data between 60 days ago and 50 days ago, query 20 data from front to back from 60 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time | Default | 20 | next | Query the data within the last 5 days; query 20 data from 5 days ago. query 20 data from front to back from 5 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | next | Query data between 20 days ago and 10 days ago; query 20 data from front to back from 20 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  |  1000  | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the data with transaction id 1000 and the data with transaction id 1000 is in the first line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | 1000 | 20 | next | Query data between 20 days ago and 10 days ago, query 20 data from front to back from the data with transaction id 1000 and the data with transaction id 1000 is in the last line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |


> Response:

```json
                                
{
    "status": "ok",
    "data": {
        "financial_record": [
            {
                "id": 925052245,
                "symbol": "THETA",
                "type": 6,
                "amount": -0.027536830510808205,
                "ts": 1603587183668,
                "contract_code": "THETA-USD"
            },
            {
                "id": 924941639,
                "symbol": "THETA",
                "type": 6,
                "amount": -0.027972027972027972,
                "ts": 1603575254448,
                "contract_code": "THETA-USD"
            }
        ],
        "remain_size": 13,
        "next_id": 924900331
    },
    "ts": 1603870386931
}                                   
```

### Returning Parameter

| Parameter Name    | Mandatory | Type      | Description            |  Value Range   |
| --------------------- | ---- | ------- | ------------- | ---------------------------------------- |
| status   <img width=250/>    | true <img width=250/> | string  | request handling result  <img width=1000/> | "ok" , "error"                           |
| ts                    | true | long    | Time of Respond Generation, Unit: Millisecond |                                          |
| \<data\>              | true    |  object       | dicitionary type     |                                          |
| \<financial_record\>  | true     |  object array       |               |                                          |
| id                    | true | long    |         |                                          |
| ts                    | true | long    | create time    |                                          |
| symbol                | true | string  |  Variety code          | "BTC","ETH"...                           |
| contract_code                | true | string  | contract code          | "BTC-USD"...                           |
| type                  | true | int     | order type          | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; |
| amount                | true | decimal | amount            |                                          |
| \</financial_record\> |     |         |               |                                          |
| remain_size           | true | int  | Remaining data number（the number of data that has not been queried due to the limitation of data number in the time range）   |                                          |
| next_id           | true | long     | id for next data (only has value when query result exceeds data number limits）            |                                          |
| \</data\>             |      |         |      |     |

#### Note：

- if the query result exceeds the data limit, next_id is the id of next data. ( when the query direction is prev, next_id presents the first data on the next page; when the query direction is next, next_id  presents the last data on the next page.)



## Query user’s settlement records

 - POST `swap-api/v1/swap_user_settlement_records`

### Request Parameter

| Parameter Name        | Mandatory  | Type     | Description   | Value Range                                       |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| contract_code | true  | string | contract code     |                                          |
| start_time   | false  | long    | start time（Timestamp，Unit: Millisecond）        |  Value Range: [(current time - 90 days), current time] ，default current day - 90 days   |
| end_time   | false  | long    | end time（Timestamp，Unit: Millisecond）        |  Value Range: (start_time, current time]，default current time   |
|page_index	|false |	int	| Page | 1st page by default without given instruction		|
|page_size	|false |	int	| page size | Page 20 by default without given instruction,  ，no more than 50 |

#### Note

- The data is queried in reverse order by default; the newer the data, the closer to the front.
- If the start time or the end time is not within the value range, the system will report an error 1067 to indicate the parameter is invalid.  
- Query users' settlement records with settlement start time behind the start_time but before the end_time. 

> Response: 

```json

{
    "status": "ok",
    "data": {
        "total_page": 231,
        "current_page": 1,
        "total_size": 231,
        "settlement_records": [
            {
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "margin_balance_init": 716.910582018448810050,
                "margin_balance": 723.922949859047086468,
                "settlement_profit_real": 7.012367840598276418,
                "settlement_time": 1603843204027,
                "clawback": 0,
                "funding_fee": 0.152433200573441931,
                "offset_profitloss": 0,
                "fee": 0,
                "fee_asset": "THETA",
                "positions": [
                    {
                        "symbol": "THETA",
                        "contract_code": "THETA-USD",
                        "direction": "buy",
                        "volume": 20.000000000000000000,
                        "cost_open": 0.604834710743801652,
                        "cost_hold_pre": 0.644730000000000000,
                        "cost_hold": 0.659310000000000000,
                        "settlement_profit_unreal": 6.859934640024834487,
                        "settlement_price": 0.659310000000000000,
                        "settlement_type": "settlement"
                    }
                ]
            }
        ]
    },
    "ts": 1603870588781
}

```
### Returning Parameter

| Parameter Name                   | Mandatory | Type      | Description       | Value Range                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result             |                                          |
| \<data\> | true     |  object      |                    |                                          |
| \<settlement_records\> | true     |  object   array    |                    |                                          |
| symbol     | true   | string  | Coin Code                  | "BTC","ETH"... |
| contract_code     | true   | string  |  contract code                  |  "BTC-USD" ... |
| margin_balance_init        | true | decimal | Initial account equity for this term          |             |
| margin_balance   | true | decimal | Account equity after settlement for this term  |          |
| settlement_profit_real    | true | decimal | Realized PnL for this term      |                      |
| settlement_time     | true   | long  | Settlement time for this term; delivery time if at the delivery.           |   |
| clawback        | true | decimal |  Clawback for this term        |         |
| funding_fee        | true | decimal |  Funding for this term          |                       |
| offset_profitloss        | true | decimal |  Current term PnL of positions closed        |         |
| fee        | true | decimal | Transaction fee for this term       |                                          |
| fee_asset        | true | string | Transaction Fee Coin   |                                          |
| \<positions\> | true     |  object   array    |                    |                                          |
| symbol     | true   | string  | Coin Code                 | "BTC","ETH"... |
| contract_code     | true   | string  | contract code              |  "BTC-USD" ... |
| direction            | true | string  | Position Direction |    [buy : sell]                                     |
| volume         | true | decimal | Position volume before the settlement of this term（volume）             |          |
| cost_open            | true | decimal | Open price              |                                          |
| cost_hold_pre        | true | decimal |  Average position price before the settlement of this term        |          |
| cost_hold            | true | decimal |  Average position price after the settlement of this term        |            |
| settlement_profit_unreal        | true | decimal |  Unrealized PnL for this term     |                  |
| settlement_price        | true | decimal | Settlement price for this term; delivery price if at the delivery.  |        |
| settlement_type        | true | string |   Settlement Type      |     settlement: settlement；delivery: delivery；    |
| \</positions\>            |      |         |                    |                                          |
| \</settlement_records\>            |      |         |                    |                                          |
| total_page        | true | int | Total Pages    |                |
| current_page        | true | int | Current Page   |                |
| total_size        | true | int | otal Size    |                |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | Timestamp                |                                          |

#### Rule

 - settlement_time for this term is the start time of the settlement.
 - As long as the user has had funds, there will be settlement records. If the user queried has no settlement record, no data will be returned. (data will be an empty array)

## Query user’s available leverage

- POST `swap-api/v1/swap_available_level_rate`

### Request Parameter：

| **Parameter Name**      | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |	
| contract_code | false | string | Contract code, if not filled in, the actual available leverage of all contracts will be returned by default	 |  “BTC-USD”。。。 |

### Returning Parameter：

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| \<data\> | true  | object array |  |   |
| contract_code | true  | string |  contract code |  "BTC-USD"|
| available_level_rate | true  | string |  available level rate,splited by ','  | "1,5,10" |
| \</data\> |  |  |  |  |
| ts | true  | long | Response generation time point, unit: millisecond |  |

> Response：

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "THETA-USD",
            "available_level_rate": "1,2,3,5,10,20,30,50,75"
        }
    ],
    "ts": 1603870691811
}

```


## Query swap information on order limit

- POST `/swap-api/v1/swap_order_limit`
 
### Request Parameter

|   Parameter Name                |   Mandatory  |   Type   |    Description             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Lightning Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order, "opponent_ioc"：IOC order using the BBO price，"lightning_ioc"：lightning IOC，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"lightning_fok"：lightning FOK，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK|

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_price_type": "limit",
        "list": [
            {
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "open_limit": 6000.000000000000000000,
                "close_limit": 12000.000000000000000000
            }
        ]
    },
    "ts": 1603870733069
}

```

### Returning Parameter 

|   Parameter Name                |   Mandatory  |    Type   |    Desc              |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> | |  |  |  |    
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Lightning Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order |
| \<list\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USD",... |
| open_limit | true | decimal | Max open order limit | |
| close_limit | true | decimal | Max close order limit |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## Query information on swap trading fee
 
- POST `/swap-api/v1/swap_fee`
 
### Request Parameter 

|   Parameter Name                 |   Mandatory   |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD",... |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "open_maker_fee": "0.0002",
            "open_taker_fee": "0.0005",
            "close_maker_fee": "0.0002",
            "close_taker_fee": "0.0005",
            "fee_asset": "THETA"
        }
    ],
    "ts": 1603870760621
}

```

### Returning Parameter 

|  Parameter Name                |   Mandatory  |   Type  |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| contract_code | true | string | contract type code   | "BTC-USD",... |
| open_maker_fee | true | string | Open maker order fee, decimal | |
| open_taker_fee | true | string | Open taker order fee, decimal | |
| close_maker_fee | true | string | Close maker order fee, decimal  | |
| close_taker_fee | true | string | Close taker order fee, decimal  | |
| delivery_fee | true | string | delivery fee, decimal  | |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| \</data\> |  |  |  |  |

## Query information on Transfer Limit

- POST `/swap-api/v1/swap_transfer_limit`
 
 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "transfer_in_max_each": 301000000.000000000000000000,
            "transfer_in_min_each": 4.000000000000000000,
            "transfer_out_max_each": 30100000.000000000000000000,
            "transfer_out_min_each": 0.000001000000000000,
            "transfer_in_max_daily": 3010000000.000000000000000000,
            "transfer_out_max_daily": 602000000.000000000000000000,
            "net_transfer_in_max_daily": 1505000000.000000000000000000,
            "net_transfer_out_max_daily": 301000000.000000000000000000
        }
    ],
    "ts": 1603870908389
}
```

### Returning Parameter 

|   Parameter Name                |   Mandatory   |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USD",... |
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

- POST `/swap-api/v1/swap_position_limit`
  
### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type   |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

> Response:


```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "buy_limit": 60000.000000000000000000,
            "sell_limit": 60000.000000000000000000
        }
    ],
    "ts": 1603870983335
}

```

### Returning Parameter 

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Responding Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | Contract Code | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USD",... |
| buy_limit | true | decimal | Max long position limit, Unit: Cont |  |
| sell_limit | true | decimal | Max short position limit, Unit: Cont |  |
| \</data\> |  |  |  |  |


## Transfer between master and sub account

- post `/swap-api/v1/swap_master_sub_transfer`

> Request:

```json
{
	"sub_uid": "123123123",
	"contract_code": "BTC-USD",
	"amount": "123",
	"type": "master_to_sub"
}
```

### 请求参数

| attr   | required  | type     | desc   |     |
| ------ | ----- | ------ | ---- | ---------------------------- |
| sub_uid | true | long | uid of sub account	 |  |
| contract_code | true | string | contract code | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| amount | true | decimal | transfer amount ||
| type | true | string | transfer type | "master_to_sub" or "sub_to_master" |

### Note：
  - the rate limit between the master account and each subaccount is 10 times/ minute
  
> Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": "771036657058648064"
    },
    "ts": 1603871064225
}

```

### response

| attr          | required | type      | desc              |                                      |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | status          | "ok" , "error"                           |
| ts            | true | long    | response timestamp，millionseconds   |                                          |
| \<data\>      | true     |  object        |      |   |
| order_id        | true | string  | order id            |  |
| \</data\>     |      |         |         |   |

## Query transfer records between master and sub account

- post `/swap-api/v1/swap_master_sub_transfer_record`

> Request:


### request

| attr   | required  | type    | desc   |      |
| ------ | ----- | ------ | ---- | ---------------------------- |
| contract_code | true | string | contract code | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |
| transfer_type | false | string | All by default【multiple types need to be joined with ';'】 | 34:transfer to sub account 35:transfer from sub account  |
| create_date | true | int | days | days need to be less than or equal to 90 |
| page_index | false | int | 1 by default | 1 |
| page_size | false | int | 20 by default.less than or equal to 50. | 20 |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 2,
        "current_page": 1,
        "total_size": 4,
        "transfer_record": [
            {
                "id": 927517392,
                "symbol": "THETA",
                "transfer_type": 35,
                "amount": 10.000000000000000000,
                "ts": 1603871064212,
                "sub_uid": "123456789",
                "sub_account_name": "tom",
                "contract_code": "THETA-USD"
            },
            {
                "id": 927489221,
                "symbol": "THETA",
                "transfer_type": 34,
                "amount": -100.000000000000000000,
                "ts": 1603869236524,
                "sub_uid": "123456789",
                "sub_account_name": "tom",
                "contract_code": "THETA-USD"
            }
        ]
    },
    "ts": 1603871223290
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
| contract_code | true | string | contract code | "BTC_USD",... |
| sub_uid        | true | string  | subaccount uid            |  |
| sub_account_name        | true | string  | subaccount name            |  |
| transfer_type        | true | int  | transfer type            | transfer from subaccount：35，transfer to subaccount:34 |
| amount        | true | decimal  | amount           |  |
| \</transfer_record\>     |      |         |         |   |
| total_page        | true | int  | total page            |  |
| current_page        | true | int  | current page            |  |
| total_size        | true | int  | total size            |  |
| \</data\>     |      |         |         |   |


## Query user's API indicator disable information

- get `/swap-api/v1/swap_api_trading_status`


### request body
 
 null

### Response:

| attr          | required | type     | desc  |  |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | response status          | "ok" , "error"                           |
| ts            | true | long    | response millionseconds   |                                          |
| \<data\>      | true     |  array object        |      |   |
| is_disable        | true | int  |             | 1：is disabled，0：isn't disabled |
| order_price_types        | true | string  | order price types,such as：“limit,post_only,FOK,IOC”          |  |
| disable_reason        | true | string  | disable reason  | "COR":（Cancel Order Ratio），“TDN”：（Total Disable Number）  |
| disable_interval        | true | long  | disable millionseconds            |  |
| recovery_time        | true | long  | recovery millionseconds            |  |
| \<COR>       | true | dict object  | （Cancel Order Ratio） |
| orders_threshold        | true | long  | orders threshold           |  |
| orders        | true | long  | total pending orders           |  |
| invalid_cancel_orders        | true | long  | numbers of invalid cancel orders           |  |
| cancel_ratio_threshold        | true | decimal  | cancel ratio threshold            |  |
| cancel_ratio        | true | decimal  | cancel ratio           |  |
| is_trigger        | true | int  |            | 	1: triggered，0: not triggered |
| is_active        | true | int  |   | 1: active，0：not active
| \</COR>       |  |    |  |
| \<TDN>       | true | dict object  | Total Disable Number|
| disables_threshold        | true | long  | disable threshold        |  |
| disables        | true | long  | total disable number        |  | 
| is_trigger        | true | int  | | 	1：triggered，0：not triggered |
| is_active        | true | int  |          |   1：active，0：not active
| \</TDN>       |  |    |  |
| \</data\>     |      |         |         |   |

 > eg：

 ```json

  {
  "status": "ok",
  "data":
  [{
      "is_disable": 1,  
      "order_price_types": "limit,post_only,FOK,IOC", 
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



# Swap Trade Interface

##  Place an Order 

###  Example  

- POST `/swap-api/v1/swap_order`

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ------------------------------------------------------------ |
| contract_code      | string             | true         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |
| client_order_id    | long               | false         | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807 |
| price              | decimal            | false          | Price                                                        |
| volume             | long               | true          | Numbers of orders (volume)                                   |
| direction          | string             | true          | Transaction direction                                        |
| offset             | string             | true          | "open", "close"                                              |
| lever_rate         | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate;Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |
| order_price_type   | string             | true     |  "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,fok：FOK Order, "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK|

###  Note ： 

Post-Only orders are limit orders that will never take liquidity (also called maker-only order). There are order limit and position for post-only orders which the upper limit is 500,000 for open/close orders under weekly, bi-weekly and quarterly contract respectively.

If you’re holding a position currently, the leverage you choose when placing an order should be the same as the leverage of your current positions, otherwise, the order will fail to be placed. If you need a new leverage to place an order, you should switch the leverage of current positions first by using the Switch Leverage interface. 

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
    "data": {
        "order_id": 771038212360937472,
        "order_id_str": "771038212360937472"
    },
    "ts": 1603871435025
}
```


###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status             | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| \<data\>  |    |    |   |  |
| order_id           | true          | long     | Order ID                                                     |                 |
| order_id_str           | true          | string     | Order ID                                                     |                 |
| client_order_id    | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned | 
| \</data\>  |    |    |   |  ||
| ts                 | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.

##  Place a Batch of Orders

###  Example  

- POST `/swap-api/v1/swap_batchorder`

###  Request Parameter  

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
|  orders_data |       List\<Object\>             |   10 orders at most.            |                                                              |


- orders_data object detail

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
| contract_code      | string             | true       | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"                                                   |
| client_order_id                       | long               | false          | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807 |
| price                                 | decimal            | false          | Price                                                        |
| volume                                | long               | true          | Numbers of orders (volume)                                   |
| direction                             | string             | true          | Transaction direction                                        |
| offset                                | string             | true          | "open": "close"                                              |
| lever_rate                            | int                | true          | Leverage rate [if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate;Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |
| order_price_type   | string             | true     | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order, "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK|

###  Note  ：

Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.

If you’re holding a position currently, the leverage you choose when placing an order should be the same as the leverage of your current positions, otherwise, the order will fail to be placed. If you need a new leverage to place an order, you should switch the leverage of current positions first by using the Switch Leverage interface.

No need to transfer BBO order price(ask 1and bid 1) parameter, optimal_5: top 5 optimal BBO price, optimal_10：top 10 optimal BBO price, optimal_20：top 20 optimal BBO price (No need to transfer price data) ，limit": limit order, "post_only": maker order only (price data transfer is needed),IOC :Immediate-Or-Cancel Order,FOK:Fill-Or-Kill Order.



> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "index": 2,
                "err_code": 1034,
                "err_msg": "Incorrect field of order price type."
            }
        ],
        "success": [
            {
                "order_id": 771038739454672896,
                "index": 1,
                "order_id_str": "771038739454672896"
            }
        ]
    },
    "ts": 1603871560695
}

```

###  Returning Parameter  

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status                            | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| \<data\>                          |               |          |                                                              |                 |
| \<list\>(Attribute Name: errors)  |               |          |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| err_code                          | true          | int      | Error code                                                   |                 |
| err_msg                           | true          | string   | Error information                                            |                 |
| \</list\>                         |               |          |                                                              |                 |
| \<list\>(Attribute Name: success) |               |          |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| order_id                          | true          | long     | Order ID                                                     |                 |
| order_id_str                          | true          | string     | Order ID                                                     |                 |
| client_order_id                   | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| \</list\>                         |               |          |                                                              |                 |
| \</data\>                         |               |          |                                                              |                 |
| ts                                | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.

## Cancel an Order 

###  Example   

- POST  `/swap-api/v1/swap_cancel`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 10 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID (different IDs are separated by ",", maximum 10 orders can be withdrew at one time) |
| contract_code      |  true      |   string     | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"    |

###  Note  ：

Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

The return data from Cancel An Order Interface only means that order cancelation designation is executed successfully. To check cancelation result, please check your order status at Get Information Of An Order interface.

> Response: result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)

```json


{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "768503271974985728",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "771038212360937472"
    },
    "ts": 1603871877639
}

```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                    |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                                 | "ok" , "error"  |
| \<dict\>(Attribute Name: data) |               |          |                                                           |                 |
| \<list\>(Attribute Name: errors) |               |          |                                                           |                 |
| order_id                         | true          | string   | Order ID                                                  |                 |
| err_code                         | true          | int      | Error code                                                |                 |
| err_msg                          | true          | string   | Error information                                         |                 |
| \</list\>                        |               |          |                                                           |                 |
| successes                        | true          | string   | Successfully withdrew list of order_id or client_order_id |                 |
| \</dict\>                        |               |          |                                                           |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond             |                 |


## Cancel All Orders 

###  Example  

- POST `/swap-api/v1/swap_cancelall`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                          |
| ------------------ | ------------- | -------- | ------------------------------- |
| contract_code      | true             | string       | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD"   |



> Response:result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "769851022939828224,770281496367714304,771038739454672896"
    },
    "ts": 1603871951673
}

```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                     | "ok" , "error"  |
| data: \<dict\> |               |          |                                               |                 |
| errors: \<list\> |               |          |                                               |                 |
| order_id                         | true          | string   | Order ID                                      |                 |
| err_code                         | true          | int      | failed order error messageError code          |                 |
| err_msg                          | true          | string      | failed order information                      |                 |
| \</list\>                        |               |          |                                               |                 |
| successes                        | true          | string   | Successful order                              |                 |
| \</dict\>                        |               |          |                                               |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond |                 |


## Place Lightning Close Order

- POST ` /swap-api/v1/swap_lightning_close_position`

 
### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code      | true             | string       | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"                                                    |
| volume | true | long | Order Quantity(volume) |  |
| direction | true | string | “buy”:Open，“sell”:Close |  |
| client_order_id | false | long | Client needs to provide unique API and have to maintain the API themselves afterwards.must be Less or Equal than 9223372036854775807 |  |
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
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  | Dictionary |
| order_id | true  | long | Order ID [Different users may share the same order ID] |  |
| order_id_str | true  | string | Order ID |  |
| client_order_id | false | long | user’s own order ID |  |
| \</data\> |  |  |  |  |

> Error：

```json

{
    "status": "error",
    "err_code": 1048,
    "err_msg": "Insufficient close amount available.",
    "ts": 1603874031502
}

```


## Switch Leverage

- POST `swap-api/v1/swap_switch_lever_rate`

#### Note

- Only if a user has positions of a single token and has no open orders, the leverage is available to be switched flexibly.

- The interface limits the number of requests to 1 time per 3 seconds.

###  Request Parameter

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | String | contract code	 |  “BTC-USD” |
| lever_rate | true | int | Leverage to switch.[Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |  |

> Response:

```json

OK：
{
    "status": "ok",
    "data": {
        "contract_code": "theta-usd",
        "lever_rate": 10
    },
    "ts": 1603872234454
}

No：

{
    "status": "error",
    "err_code": 1037,
    "err_msg": "The leverage is invalid. Please contact the customer service.",
    "ts": 1603872583224
}

```

### Returning Parameter

| Parameter Name   | Mandatory | Type      | Desc    | Value Range    |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | status: ok,error            |                                          |
| \<data\> | false     |  object      |                    |                                          |
| contract_code               | false | string    | contract code      |                                          |
| lever_rate               | false | int    | Switched leverage      |                                          |
| \</data\>            |      |         |                    |                                          |
| err_code | false | int | error code | |
|err_msg| false| string | error msg | |
| ts                     | true | long    | Timestamp                |    


## Get Information of an Order

###  Example   

- POST `/swap-api/v1/swap_order_info`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time) |
| contract_code      | true             | string      | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"     |

###  Note  ：

When getting information on order cancellation via get order Information interface, users can only query last 4-hour data

Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id. The order completed( 5.partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled; ) will be deleted after the settlement of funding rate on 04:00(GMT+8), 12:00(GMT+8) and 20:00(GMT+8).

client_order_id，order status query is available for orders placed within 24 hours; Otherwise, clients cannot check orders placed beyond 24 hours.

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "THETA",
            "contract_code": "THETA-USD",
            "volume": 1,
            "price": 0.60,
            "order_price_type": "post_only",
            "order_type": 1,
            "direction": "buy",
            "offset": "open",
            "lever_rate": 20,
            "order_id": 771043577949732864,
            "client_order_id": null,
            "created_at": 1603872714279,
            "trade_volume": 0,
            "trade_turnover": 0,
            "fee": 0,
            "trade_avg_price": null,
            "margin_frozen": 0.833333333333333333,
            "profit": 0,
            "status": 3,
            "order_source": "api",
            "order_id_str": "771043577949732864",
            "fee_asset": "THETA",
            "liquidation_type": "0",
            "canceled_at": 0
        }
    ],
    "ts": 1603872729321
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                       |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | ----------------------------------- |
| status                         | true          | string   | Request Processing Result                                    | "ok" , "error"                      |
| data \<list\> |               |          |                                                              |                                     |
symbol  |  true  |  string  |  symbol  |  eg."BTC"  |  
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USD" ...                     |
| volume                         | true          | decimal  | Numbers of order                                             |                                     |
| price                          | true          | decimal  | Price committed                                              |                                     |
| order_price_type               | true          | string   | "limit", "opponent","post_only" Position limit will be applied to post_only while order limit will not. |                                     |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| direction                      | true          | string   | Transaction direction                                        |                                     |
| offset                         | true          | string   | "open": "close"                                              |                                     |
| lever_rate                     | true          | int      | Leverage rate                                                | 1\\5\\10\\20                        |
| order_id                       | true          | long     | Order ID                                                     |                                     |
| order_id_str                       | true          | string     | Order ID                                                     |                                     |
| client_order_id                | true          | long     | Client order ID                                              |                                     |
| created_at                     | true          | long     | Creation time                                             |                                     |
| canceled_at                     | true          | long     | Canceled time                                             |                                     |
| trade_volume                   | true          | decimal  | Transaction quantity                                         |                                     |
| trade_turnover                 | true          | decimal  | Transaction aggregate amount                                 |                                     |
| fee                            | true          | decimal  | Servicefee                                                   |                                     |
| trade_avg_price                | true          | decimal  | Transaction average price                                    |                                     |
| margin_frozen                  | true          | decimal  | Freeze margin                                                |                                     |
| profit                         | true          | decimal  | profit                                                       |                                     |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 10.Orders failed. 11. Orders cancelling. |                                     |
| order_source                   | true          | string   | Order source（system、web、api、m、risk、settlement、ios、android、windows、mac、trigger） |                                     |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| \</list\>                      |               |          |                                                              |                                     |
| ts                             | true          | long     | Timestamp                                                    |                                     |



## Order details acquisition

###  Example   

- POST `/swap-api/v1/swap_order_detail`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                        |
| ------------------ | ------------- | -------- | ---------------------------------- |
| contract_code  |  true   |  string   |  Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |
| order_id           | true          | long     | Order ID                      |
| created_at           | false          | long     | Timestamp                     |
| order_type         |	false         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| page_index         | false         | int      | Page number, default 1st page |
| page_size          | false         | int      | Default 20，no more than 50   |

### Note

When getting information on order cancellation via query order detail interface, users who type in parameters “created_at” and “order_type” can query last 24-hour data, while users who don’t type in parameters “created_at” and “order_type” can only query last 12-hour data.

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

created_at should use timestamp of long type as 13 bits (include Millisecond), if send the accurate timestamp for "created_at", query performance will be improved.

eg. the timestamp "2019/10/18 10:26:22" can be changed：1571365582123.It can also directly obtain the timestamp（ts) from the returned ordering interface(swap_order) to query the corresponding orders.

Please note that created_at can't send "0"

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "THETA",
        "contract_code": "THETA-USD",
        "instrument_price": 0,
        "final_interest": 0,
        "adjust_value": 0,
        "lever_rate": 20,
        "direction": "buy",
        "offset": "close",
        "volume": 10.000000000000000000,
        "price": 0.660000000000000000,
        "created_at": 1603727590740,
        "canceled_at": 0,
        "order_source": "android",
        "order_price_type": "post_only",
        "margin_frozen": 0,
        "profit": 1.080395069022201400,
        "trades": [
            {
                "trade_id": 49637561388,
                "trade_price": 0.660000000000000000,
                "trade_volume": 10.000000000000000000,
                "trade_turnover": 100.000000000000000000,
                "trade_fee": -0.030303030303030303,
                "created_at": 1603728041854,
                "role": "maker",
                "fee_asset": "THETA",
                "id": "49637561388-770434885714452480-1"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1,
        "liquidation_type": "0",
        "fee_asset": "THETA",
        "fee": -0.030303030303030303,
        "order_id": 770434885714452480,
        "order_id_str": "770434885714452480",
        "client_order_id": null,
        "order_type": "1",
        "status": 6,
        "trade_avg_price": 0.660000000000000000000000000000000000,
        "trade_turnover": 100.000000000000000000,
        "trade_volume": 10.000000000000000000
    },
    "ts": 1603872939505
}
```


###  Returning Parameter 

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                            | true          | string   | Request Processing Result                                    | "ok" , "error"                    |
| data\<object\>  |               |          |                                                              |                                   |
| symbol                            | true          | string   | Variety code                                                 |                                   |
| contract_code                     | true          | string   | Contract Code                                                | "BTC-USD" ...                   |
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
| order_id                       | true          | long     | Order ID                                                     |                                     |
| order_id_str                       | true          | string     | Order ID                                                     |                                     |
| client_order_id                | true          | long     | Client order ID                                              |                                     |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 10.Orders failed. 11. Orders cancelling. |                                     |
| trade_volume                   | true          | decimal  | Transaction quantity                                         |                                     |
| trade_turnover                 | true          | decimal  | Transaction aggregate amount                                 |                                     |
| trade_avg_price                | true          | decimal  | Transaction average price                                    |                                     |
| total_page                        | true          | int      | Page in total                                                |                                   |
| current_page                      | true          | int      | Current Page                                                 |                                   |
| total_size                        | true          | int      | Total Size                                                   |                                   |
| instrument_price                        | true          | decimal      | Liquidation price                                                  |                                   |
| final_interest                        | true          | decimal      | Account Balance After Liquidation                                                   |                                   |
| adjust_value                        | true          | decimal      | Adjustment Factor of Liquidating Order                                                 |                                   |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| fee | true  | decimal |  total amount of fees|
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| \<list\> (Attribute Name: trades) |               |          |                                                              |                                   |
| id                          | true          | string     |  the global unique ID of the trade.                                         |                                   |
| trade_id                          | true          | long     | In this interface, trade_id is the same with match_id of swap-api/v1/swap_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                              |                                   |
| trade_price                       | true          | decimal  | Match Price                                                  |                                   |
| trade_volume                      | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                    | true          | decimal  | Transaction price                                            |                                   |
| trade_fee                         | true          | decimal  | Transaction Service fee                                      |                                   |
| role                        | true          | string  |   taker or maker                              |                                                         |
| created_at                        | true          | long     | Creation time                                                |                                   |
| \</list\>                         |               |          |                                                              |                                   |
| \</object \>                      |               |          |                                                              |                                   |
| ts                                | true          | long     | Timestamp                                                    |                                   |


## Current unfilled order acquisition

###  Example  

- POST  `/swap-api/v1/swap_openorders`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | --------------- |
| contract_code      | true          | string   | Contract Code                                                | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"                 |
| page_index         | false         | int      | Page, default 1st page      | 1           |                 |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                 |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "volume": 1,
                "price": 0.60,
                "order_price_type": "post_only",
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "lever_rate": 20,
                "order_id": 771043577949732864,
                "client_order_id": null,
                "created_at": 1603872714279,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": null,
                "margin_frozen": 0.833333333333333333,
                "profit": 0,
                "status": 3,
                "order_source": "api",
                "order_id_str": "771043577949732864",
                "fee_asset": "THETA",
                "liquidation_type": null,
                "canceled_at": null
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1603873042150
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                         | true          | string   | Request Processing Result                                    |                                   |
| data: \<list\> |               |          |                                                              |                                   |
| orders: \<list\> |               |          |                                                              |                                   |
| symbol                         | true          | string   | Variety code                                                 |                                   |
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USD" ...                   |
| volume                         | true          | decimal  | Number of Order                                              |                                   |
| price                          | true          | decimal  | Price committed                                              |                                   |
| order_price_type               | true          | string   | "limit", "opponent","post_only" Position limit will be applied to post_only while order limit will not. |                                   |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| direction                      | true          | string   | Transaction direction                                        |                                   |
| offset                         | true          | string   | "open": "close"                                              |                                   |
| lever_rate                     | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| order_id                       | true          | long     | Order ID                                                     |                                   |
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
| \</orders\>                      |               |          |                                                              |                                   |
| total_page                     | true          | int      | Total Pages                                                  |                                   |
| current_page                   | true          | int      | Current Page                                                 |                                   |
| total_size                     | true          | int      | Total Size                                                   |                                   |
| \</list\>                      |               |          |                                                              |                                   |
| ts                             | true          | long     | Timestamp                                                    |                                   |

## Get History Orders

###  Example  

- POST `/swap-api/v1/swap_hisorders`

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | ------------------------------------------------------------ |
| contract_code     | true          | string   | Contract Code                |             | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD".                   |
| trade_type         | true          | int      | Transaction type            |             | 0:all,1: buy long,2: sell short,3: buy short,4: sell  long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short,11:reduce positions to close long,12:reduce positions to close short |
| type               | true          | int      | Type                        |             | 1:All Orders,2:Order in Finished Status                      |
| status             | true          | string      | Order Status                |          | support multiple query seperated by ',',such as  '3,4,5','0': all.  3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled;  |
| create_date        | true          | int      | Date                        |             | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                                     |
| page_index         | false         | int      | Page, default 1st page      | 1           |                                                              |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                                                              |

Note: 

When getting information on order cancellation via query history orders interface, users can only query last 24-hour data.

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "order_id": 771043577949732864,
                "contract_code": "THETA-USD",
                "symbol": "THETA",
                "lever_rate": 20,
                "direction": "buy",
                "offset": "open",
                "volume": 1.000000000000000000,
                "price": 0.600000000000000000,
                "create_date": 1603872714279,
                "order_source": "api",
                "order_price_type": 6,
                "order_type": 1,
                "margin_frozen": 0.833333333333333333,
                "profit": 0,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "status": 3,
                "order_id_str": "771043577949732864",
                "fee_asset": "THETA",
                "liquidation_type": "0"
            }
        ],
        "total_page": 39,
        "current_page": 1,
        "total_size": 39
    },
    "ts": 1603873186640
}
```


###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| -------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                           | true          | string   | Request Processing Result                                    |                                   |
| \<object\>(Attribute Name: data) |               |          |                                                              |                                   |
| \<list\>(Attribute Name: orders) |               |          |                                                              |                                   |
| order_id                         | true          | long     | Order ID                                                     |                                   |
| order_id_str                         | true          | string     | Order ID                                                     |                                   |
| symbol                           | true          | string   | Variety code                                                 |                                   |
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USD" ...                   |
| lever_rate                       | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| direction                        | true          | string   | Transaction direction                                        |                                   |
| offset                           | true          | string   | "open": "close"                                              |                                   |
| volume                           | true          | int  | Number of Order                                              |                                   |
| price                            | true          | decimal  | Price committed                                              |                                   |
| create_date                      | true          | long     | Creation time                                                |                                   |
| order_source                     | true          | string   | Order Source                                                 |                                   |
| order_price_type                 | true          | int   | 1：limit，2：market，3：opponent，4：lightning，5：trigger，6：post_only ，7：optimal_5 ，8：optimal_10 ，9：optimal_20，10：FOK ，11：IOC ，12：opponent_ioc，13：lightning_ioc，14：optimal_5_ioc，15：optimal_10_ioc，16：optimal_20_ioc，17：opponent_fok，18：lightning_fok，19：optimal_5_fok，40：optimal_10_fok，41：optimal_20_fok . |                                   |
| margin_frozen                    | true          | decimal  | Freeze margin                                                |                                   |
| profit                           | true          | decimal  | profit                                                       |                                   |
| trade_volume                     | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                   | true          | int  | Transaction aggregate amount                                 |                                   |
| fee                              | true          | decimal  | Servicefee                                                   |                                   |
| trade_avg_price                  | true          | decimal  | Transaction average price                                    |                                   |
| status                           | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.  |                                   |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "BTC","ETH"... |
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| \</list\>                        |               |          |                                                              |                                   |
| total_page                       | true          | int      | Total Pages                                                  |                                   |
| current_page                     | true          | int      | Current Page                                                 |                                   |
| total_size                       | true          | int      | Total Size                                                   |                                   |
| \</object\>                      |               |          |                                                              |                                   |
| ts                               | true          | long     | Timestamp                                                    |                                   |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## Query history orders via multiple fields

- POST `swap-api/v1/swap_hisorders_exact`

###  Request Parameter

| Parameter Name         | Mandatory  | Type     | Desc              | Value Range   |
| ----------- | ----- | ----------- | ---------------------------------------- | ------ |
| contract_code  <img width=250/>  | true <img width=250/> | string | contract code <img width=1000/>    |  "BTC-USD" ...                          |
| trade_type  | true  | int    | trading type        | 0:all,1: buy long,2: sell short,3: buy short,4: sell  long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short 11:reduce positions to close long，12:reduce positions to close short |
| type        | true  | int    | Type          | 1:All Orders,2:Order in Finished Status                      |
| status      | true  | string    | Order Status       | support multiple query seperated by ',',such as  '3,4,5','0': all.  3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; |
| order_price_type      | false  | string    |    order price types      | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order. "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK   |
| start_time   | false  | long    | start time（Timestamp，Unit: Millisecond）        | See note    |
| end_time   | false  | long    | end time（Timestamp，Unit: Millisecond）        |  See note   |
| from_id    | false | long    | Query start id（uses id of returned data）    |                     |
| size     | false | int    | number of data    |  it will be the default value of 20; the number should ≤50            |
| direct     | false | string    | Query direction   |   prev ；next ；default value:prev                          |

#### Note：

- Query history orders interface can only query the API order cancellation information within the last 24 hours.
- Value range description of start_time and end_time:
   - start_time: value range is [(current time - 90 days)，current time] ；default value is clamp（end_time - 10 days，current time -90 days，current time -10 days）which means the furthest time is the current time minus 90 days and the most recent time is current time minus 10 days.
   - end_time: value range is [(current day - 90 days)，above++)，if the end_time is greater than the current time, use current time; if start_time is filled，the end_time shall be greater than start_time. The system will use current time by default. 
- if from_id is not filled and the query direction is prev, query back from the end time; if from_id is not filled and the query direction is next, query from the start time. Query history orders with creation time greater than or equal to the start time but less than or equal to the end time. 
- Regardless of whether the query direction is prev or next, the data returned is in reverse order of creation time. 
- If the value of start_time or end_time filled in is not within the value range, the system will report that the parameter is invalid. 
- Only data within 90 days are available to query.


#### Query cases are as below (special cases are not included)：
| start_time | end_time | from_id  | size | direct | Query Result |
|-----|------|-----|-----|-----|-----|
| Default 10 days before the current time  | Default current time | Default | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | prev | Query data between 60 days ago and 50 days ago; query 20 data from back to front from 50 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time  | Default | 20 | prev | Query the data within the last 5 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | prev | Query data between 20 days ago and 10 days ago; query 20 data from back to front from 10 days ago.The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  | Default | 20 | next | Query the data within the last 10 days; query 20 data from front to back from 10 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | next | Query data between 60 days ago and 50 days ago, query 20 data from front to back from 60 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time | Default | 20 | next | Query the data within the last 5 days; query 20 data from 5 days ago. query 20 data from front to back from 5 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | next | Query data between 20 days ago and 10 days ago; query 20 data from front to back from 20 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  |  1000  | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the data with transaction id 1000 and the data with transaction id 1000 is in the first line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | 1000 | 20 | next | Query data between 20 days ago and 10 days ago, query 20 data from front to back from the data with transaction id 1000 and the data with transaction id 1000 is in the last line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |


> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "query_id": 49677309079,
                "order_id": 770434885714452480,
                "contract_code": "THETA-USD",
                "symbol": "THETA",
                "lever_rate": 20,
                "direction": "buy",
                "offset": "close",
                "volume": 10.000000000000000000,
                "price": 0.660000000000000000,
                "create_date": 1603727590740,
                "order_source": "android",
                "order_price_type": "post_only",
                "order_type": 1,
                "margin_frozen": 0,
                "profit": 1.080395069022201400,
                "trade_volume": 10.000000000000000000,
                "trade_turnover": 100.000000000000000000,
                "fee": -0.030303030303030303,
                "trade_avg_price": 0.66000,
                "status": 6,
                "order_id_str": "770434885714452480",
                "fee_asset": "THETA",
                "liquidation_type": "0"
            }
        ],
        "remain_size": 29,
        "next_id": 49615482779
    },
    "ts": 1603873477804
}
```

###  Returning Parameter

| Parameter Name               | Mandatory | Type      | Desc     | Value Range                                   |
| ---------------------- | ---- | ------- | ------ | ---------------------------------------- |
| status   <img width=250/>    | true <img width=250/> | string  |Request Processing Result <img width=1000/> |   |
| \<data\>| true     |   object      |        |     |
| \<orders\> |  true    |  object array       |        |     |
| query_id               | true | long    | Query id, which can be used as the from_id field for the next query request.  |       |
| order_id               | true | long    | Order ID   |       |
| order_id_str   | true | string    |  Order ID     |      |
| symbol                 | true | string  | Variety code   |   |
| contract_code          | true | string  | Contract Code  | "BTC-USD" ... |
| lever_rate             | true | int     | Leverage Rate  |   |
| direction              | true | string  | Transaction direction  | 【buy : sell】 |
| offset                 | true | string  | offset direction  |  【open : close】   |
| volume                 | true | decimal | Number of Order  |   |
| price                  | true | decimal | Price committed |    |
| create_date            | true | long    | Creation time   |     |
| order_source           | true | string  | Order Source   |    |
| order_price_type      | true  | string    |   order price types      | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order. "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK  |
| margin_frozen          | true | decimal |  Freeze margin   |   |
| profit                 | true | decimal | profit     |    |
| trade_volume           | true | decimal | Transaction quantity    |     |
| trade_turnover         | true | decimal | Transaction aggregate amount |         |
| fee                    | true | decimal | Servicefee    |      |
| trade_avg_price        | true | decimal | Transaction average price   |    |
| status                 | true | int     | order status   |   1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.   |
| order_type             | true | int     | Order type  |1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order                |
| fee_asset         | true | string  |the corresponding cryptocurrency to the given fee     |  （"BTC","ETH"...）      |
| liquidation_type              | true | string     | liquidation type        |  0:Not Forced Liquidation Type，1：Netting Type， 2: Partial Takeover，3：All Takeover  |
| \</orders\>     |      |         |        |                          |
| remain_size           | true | int  | Remaining data number（the number of data that has not been queried due to the limitation of data number in the time range）   |                                          |
| next_id           | true | long     | query_id for next data (only has value when query result exceeds data number limits）            |                                          |
| \</data\>            |      |         |        |      |
| ts                     | true | long    | Timestamp    |      |

#### Note:

- if the query result exceeds the data limit, next_id is the id of next data. ( when the query direction is prev, next_id presents the first data on the next page; when the query direction is next, next_id  presents the last data on the next page.)



## Acquire History Match Results

###  Example 

- POST `/swap-api/v1/swap_matchresults`

### Request Parameter

Parameter Name |  Mandatory  |  Type  |  Desc                    |  Default  |  Value Range   
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
 contract_code   | true          | string   | Contract Code      |             | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD".                   |
trade_type  | true     | int    | trasanction types          |         |  0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
create_date | true     | int    | date            |         | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                            |
page_index  | false    | int    | page; if not enter, it will be the default value of the 1st page.  | 1       |                                          |
page_size   | false    | int    | if not enter, it will be the default value of 20; the number should ≤50 | 20      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "match_id": 49637561388,
                "order_id": 770434885714452480,
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "direction": "buy",
                "offset": "close",
                "trade_volume": 10.000000000000000000,
                "trade_price": 0.660000000000000000,
                "trade_turnover": 100.000000000000000000,
                "trade_fee": -0.030303030303030303,
                "offset_profitloss": 1.080395069022201400,
                "create_date": 1603728041854,
                "role": "Maker",
                "order_source": "android",
                "order_id_str": "770434885714452480",
                "id": "49637561388-770434885714452480-1",
                "fee_asset": "THETA"
            }
        ],
        "total_page": 16,
        "current_page": 1,
        "total_size": 16
    },
    "ts": 1603873576705
}  
```

### Returning Parameter

 Parameter Name                |  Mandatory   |  Type  |  Desc                                                      |   Value Range                  |
---------------------- | -------- | ------- | ------------------ | ------------ |
status                 | true     | string  | request handling result            |              |
data: \<object\> |          |         |                    |              |
 trades:\<list\> |          |         |                    |              |
id               | true     | string    | the global unique ID of the trade.                |              |
match_id               | true     | long    | match_id is the same with trade_id of the websocket subscriptions: orders.$contract_code.match_id is the result of sets of order execution and trade confirmation. NOTE: match_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same match_id.             |              |
order_id               | true     | long    | order ID              |              |
order_id_str               | true     | string    | order ID              |              |
symbol                 | true     | string  | contract type code               |              |
order_source                 | true     | string  | Order Source               |              |
contract_code          | true     | string  | contract code              |  "BTC-USD" ...       |
direction              | true     | string  | "buy": to bid/ go long; "sell": to ask/ go short.         |              |
offset                 | true     | string  | "open": open positions; "close": close positions           |              |
trade_volume           | true     | int | the number of traded contract with unit of lot               |              |
trade_price                  | true     | decimal | the price at which orders get filled               |              |
trade_turnover                  | true     | int | the number of total traded amout with number of USD               |              |
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

- The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## Query history transactions via multiple fields

- POST `swap-api/v1/swap_matchresults_exact`

### Request Parameter

| Parameter Name          | Mandatory  | Type     | Desc   | Value Range                               |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| contract_code | true  | string | contract code     |                                          |
| trade_type    | true  | int    | Transaction type         | 0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
| start_time   | false  | long    | start time（timestamp，Unit: Millisecond）        | See note      |
| end_time   | false  | long    | end time（timestamp，Unit: Millisecond）        |  See note     |
| from_id    | false | long    | Query start id（uses query_id of returned data）    |                     |
| size     | false | int    | number of data    |   it will be the default value of 20; the number should ≤50          |
| direct     | false | string    |   Query direction    |   prev ；next ；default value :prev                          |

#### Note：

- Value range description of start_time and end_time:
   - start_time: value range is [(current time - 90 days)，current time] ；default value is clamp（end_time - 10 days，current time -90 days，current time -10 days）which means the furthest time is the current time minus 90 days and the most recent time is current time minus 10 days.
   - end_time: value range is [(current day - 90 days)，above++)，if the end_time is greater than the current time, use current time; if start_time is filled，the end_time shall be greater than start_time. The system will use current time by default. 
- if from_id is not filled and the query direction is prev, query from back to front from the end time; if from_id is not filled and the query direction is next, query from front to back from the start time. Query financial records with creation time greater than or equal to the start time but less than or equal to the end time. 
- Regardless of whether the query direction is prev or next, the data returned is in reverse order of creation time. 
- If the value of start_time or end_time filled in is not within the value range, the system will report that the parameter is invalid. 
- Only data within 90 days are available to query.

#### Query cases are as below (special cases are not included)：
| start_time | end_time | from_id  | size | direct | Query Result |
|-----|------|-----|-----|-----|-----|
| Default 10 days before the current time  | Default current time | Default | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | prev | Query data between 60 days ago and 50 days ago; query 20 data from back to front from 50 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time  | Default | 20 | prev | Query the data within the last 5 days; query 20 data from back to front from the current time. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | prev | Query data between 20 days ago and 10 days ago; query 20 data from back to front from 10 days ago.The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  | Default | 20 | next | Query the data within the last 10 days; query 20 data from front to back from 10 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 60 days before the current time | 50 days before the current time | Default | 20 | next | Query data between 60 days ago and 50 days ago, query 20 data from front to back from 60 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 5 days before the current time | Default current time | Default | 20 | next | Query the data within the last 5 days; query 20 data from 5 days ago. query 20 data from front to back from 5 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | Default | 20 | next | Query data between 20 days ago and 10 days ago; query 20 data from front to back from 20 days ago. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| Default 10 days before the current time  | Default current time  |  1000  | 20 | prev | Query the data within the last 10 days; query 20 data from back to front from the data with transaction id 1000 and the data with transaction id 1000 is in the first line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.     |
| 20 days before the current time | 10 days before the current time | 1000 | 20 | next | Query data between 20 days ago and 10 days ago, query 20 data from front to back from the data with transaction id 1000 and the data with transaction id 1000 is in the last line. The data returned is in reverse order based on creation time. The newer the data, the closer to the front.      |

> Response: 

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "query_id": 501121693,
                "match_id": 49637561388,
                "order_id": 770434885714452480,
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "direction": "buy",
                "offset": "close",
                "trade_volume": 10.000000000000000000,
                "trade_price": 0.660000000000000000,
                "trade_turnover": 100.000000000000000000,
                "trade_fee": -0.030303030303030303,
                "offset_profitloss": 1.080395069022201400,
                "create_date": 1603728041854,
                "role": "Maker",
                "order_source": "android",
                "order_id_str": "770434885714452480",
                "id": "49637561388-770434885714452480-1",
                "fee_asset": "THETA"
            }
        ],
        "remain_size": 30,
        "next_id": 501098364
    },
    "ts": 1603873728731
}
```
### Returning Parameter

| Parameter Name          | Mandatory | Type      | Desc                 | Value Range                         |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | request handling result         |                                          |
| \<data\> | true     |  object      |                    |                                          |
| \<trades\> | true     |  object  array     |                    |                                          |
| id               | true | string    | the global unique ID of the trade.      |   |
| query_id               | true | long    | Query id, which can be used as the from_id field for the next query request.|                                          |
| match_id               | true | long    | match_id is the same with trade_id of the websocket subscriptions: orders.$symbol and matchOrders.$symbol.match_id is the result of sets of order execution and trade confirmation. NOTE: match_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same match_id.      |                                          |
| order_id               | true | long    | order ID          |                                          |
| order_id_str               | true | string    | order ID              |       |
| symbol                 | true | string  | Variety code               |                                          |
| contract_code          | true | string  | Contract Code              | "BTC-USD" ...                          |
| direction              | true | string  | ransaction direction    | 【buy : sell"】                                |
| offset                 | true | string  | offset direction    |    【open : close】        |
| trade_volume           | true | decimal | Transaction quantity                |                                          |
| trade_price            | true | decimal | the price at which orders get filled     |                                          |
| trade_turnover         | true | decimal | Transaction aggregate amount              |                                          |
| create_date            | true | long    | Creation time         |                                          |
| offset_profitloss      | true | decimal | profits and losses generated from closing positions  |                                          |
| traded_fee             | true | decimal | fees charged by platform              |                                          |
| role                   | true | string  | taker or maker        |                                          |
| fee_asset         | true | string  | the corresponding cryptocurrency to the given fee     |  （"BTC","ETH"...）      |
| order_source           | true | string  |  Order Source    |                                          |
| \</trades\>            |      |         |                    |                                          |
| remain_size           | true | int  | Remaining data number（the number of data that has not been queried due to the limitation of data number in the time range）  |                                          |
| next_id           | true | long     | uery_id for next data (only has value when query result exceeds data number limits）            |                                          |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | timestamp                |                                          |

#### Note：

- if the query result exceeds the data limit, next_id is the id of next data. ( when the query direction is prev, next_id presents the first data on the next page; when the query direction is next, next_id  presents the last data on the next page.)


## Place Trigger Order

- POST `swap-api/v1/swap_trigger_order`

### body

|  Params                |   Mandatory  |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | contract code | BTC-USD |
| trigger_type | true | string | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to |  |
| trigger_price | true | decimal | Trigger Price |  |
| order_price | false | decimal | Order Price |  |
| order_price_type | false | string | order price type： "limit" by default;"optimal_5", "optimal_10"，"optimal_20" |  |
| volume | true | long | volume |  |
| direction | true | string | buy sell |  |
| offset | true | string | open close |  |
| lever_rate | false | int | Long leverage shall be equal to short leverage.[Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |  |

### Note
  
  - optimal_5: top 5 optimal BBO price. optimal_10: top 10 optimal BBO price. optimal_20: top 20 optimal BBO price. limit: the limit order, order_price needed.
 
  - If you’re holding a position currently, the leverage you choose when placing an order should be the same as the leverage of your current positions, otherwise, the order will fail to be placed. If you need a new leverage to place an order, you should switch the leverage of current positions first by using the Switch Leverage interface. 

> Request:

```json

{
    "contract_code": "BTC-USD",
    "trigger_type": "ge",
    "trigger_price": 1111,
    "order_price": 1000,
    "order_price_type":"limit",
    "volume": 111,
    "direction": "buy",
    "offset": "open",
    "lever_rate": 10
}

```

> Return:

```json

{
    "status": "ok",
    "data": {
        "order_id": 7002240,
        "order_id_str": "7002240"
    },
    "ts": 1603874184554
}
```

### Response Desc

| field | type | Mandatory | Desc
| -----  | -----  | -----  | -----
| status | string | true | status: ok,error
| err_code | int | false | error code
| err_msg | string| false | error message
| data | List<OrderInsertRspInfo>| false | list info
| ts | long| true | timestamp

- OrderInsertRspInfo

| field | type | Mandatory | Desc
| -----  | -----  | -----  | -----
| order_id | int | true | order id. order id may be same among different users
| order_id_str | string | true | order id str 


> Error：

```json

{
    "status": "error",
    "err_code": 1037,
    "err_msg": "The leverage is invalid. Please contact the customer service.",
    "ts": 1603874230776
}
```

## Cancel Trigger Order

- POST `/swap-api/v1/swap_trigger_cancel`

### request params

| field | type | Mandatory |  desc  |
| -----  | -----  | -----  | ----- |
|  contract_code |  string  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported.BTC-USD...  |
|  order_id  |  string  |  true  |  order id. multiple orderids need to be joined by ",".Max number of order ids is 10 once.|

> Request :

```json

{
	"contract_code": "BTC-USD",
	"order_id": "7002236,7002242",
}
```

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "7002236",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "7002242"
    },
    "ts": 1603874307323
}

```

### response

| field             | Mandatory | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | response status               | "ok" , "error" |
| \<data\>                  |              |          |                            |                |
| successes                  | true         | string   | successful orders                 |                |
| \<list\>(field name: errors) |              |          |                            |                |
| order_id                   | true         | string   | order id                     |                |
| err_code                   | true         | int      | error code             |                |
| err_msg                    | true         | string      | error messages               |                |
| \</list\>                  |              |          |                            |                |
| \</data\>                  |              |          |                            |                |
| ts                         | true         | long     | response timestamp millseconds |  |


## Cancel All Trigger Orders

- POST `/swap-api/v1/swap_trigger_cancelall`

### Params

| field | type | Mandatory | desc |
| -----  | -----  |  -----  | ----- |
|  contract_code  |  string  |  true  |  contract code,"BTC-USD" ...  |

### Note

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "7002240,7002241"
    },
    "ts": 1603874352762
}

```

### response params

| field              | Mandatory | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | status               | "ok" , "error" |
| \<data\>                  |              |          |                            |                |
| \<list\>(data name: errors) |              |          |                            |                |
| order_id                   | true         | string   | order id                    |                |
| err_code                   | true         | int      | error code            |                |
| err_msg                    | true         | string      | error message               |                |
| \</list\>                  |              |          |                            |                |
| successes                  | true         | string   | successful orders                 |                |
| \</data\>                  |              |          |                            |                |
| ts                         | true         | long     | response timestamp in millseconds |   |


> response error：

```json

{
    "status": "error",
    "err_code": 1051,
    "err_msg": "No orders to cancel.",
    "ts": 1603874380781
}
```

## Query Trigger Order Open Orders

- POST `swap-api/v1/swap_trigger_openorders`

### Request Parameter
 
|Parameter Name	| Type | Mandatory | Description |
| -----  | -----   | -----  | ----- |
|  contract_code|  string  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported..contract code  |
|  page_index  |  int   |  false  |  page number，default page 1 if no given instruction| 
|  page_size   |  int   |  false  |  default 20 if no given instruction ，no more than 50 |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "trigger_type": "ge",
                "volume": 25.000000000000000000,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 20,
                "order_id": 7002243,
                "order_id_str": "7002243",
                "order_source": "api",
                "trigger_price": 0.720000000000000000,
                "order_price": 0.720000000000000000,
                "created_at": 1603874414476,
                "order_price_type": "limit",
                "status": 2
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1603874421778
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
| total_page   | int | true | total page
| current_page | int | true | current page
| total_size   | int | true | total size
| \<list\> (Attribute Name: orders)   |              |          |                            |                |
| symbol |string| true | Cryptocurrency
| contract_code | string | true | contract code
| trigger_type | string | true | trigger type： `ge`great than or equal to；`le`less than or equal to
| volume | decimal | true | trigger order volume
| order_type | int | true | Transaction Type 1. Place orders 2. cancel orders
| direction | string | true | order direction [buy,sell]
| offset | string | true | offset direction [open,close]
| lever_rate | int | true | Leverage 1\5\10\20
| order_id | long | true | trigger order ID
| order_id_str | string | true | the order ID with string
| order_source | string | true | source
| trigger_price | decimal | true | trigger price
| order_price | decimal | true | the preset price by the client
| created_at | long | true | order creation time
| order_price_type | string | true | order price type "limit": limit order，"optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20
| status | int | true | order status：1:ready to submit、2:submited、3:order accepted、7:wrong order、8：canceled orders but not found、9：canceling order、10：failed'
| \</list\>                  |              |          |                            |                |


## Query Trigger Order History

- POST `/swap-api/v1/swap_trigger_hisorders`

### Request Parameter

|   Parameter Name    |   Mandatory |   Type |     Desc             |   Default   |   Value Range |
| ------- | ------- | ------- | -------- | ------- | -------- |
| contract_code | true        | string   | Contract Code            |            | BTC-USD         |
| trade_type        | true         | int      |    Transaction type            |            | 0: All ,1: Open Long,2: Close Short,3: Open Short,4: Close Long；the system will transfer these parameters into offset and direction and query the requested data. Please note that no data can be requested with parameter out of this range. |
| status        | true         | string      | Order Status              |            | data divided with several commas, trigger orders ready to be submitted：0: All (All filled orders),4: Trigger orders successfully submitted,5: Trigger orders failed being submitted, 6: Trigger orders cancelled |
| create_date   | true         | int      | Date                 |            | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.    |
| page_index    | false        | int      | Page, 1st page by default without given instruction  | 1          | page，1st page by default without given instruction|
| page_size     | false        | int      | Page 20 by default without given instruction,  ，no more than 50 | 20         | Page 20 by default without given instruction,  ，no more than 50  |

### NOTE

- System will query the filled trigger order history by default 

> Request:

```json

{
  "contract_code": "BTC-USD",
  "create_date": 3,
  "trade_type": 0,
  "status":"4,6",
  "page_index":1,
  "page_size":10
}

```

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "THETA",
                "contract_code": "THETA-USD",
                "trigger_type": "ge",
                "volume": 25.000000000000000000,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 20,
                "order_id": 7002242,
                "order_id_str": "7002242",
                "relation_order_id": "-1",
                "order_price_type": "limit",
                "status": 6,
                "order_source": "api",
                "trigger_price": 0.720000000000000000,
                "triggered_price": null,
                "order_price": 0.720000000000000000,
                "created_at": 1603874287699,
                "triggered_at": null,
                "order_insert_at": 0,
                "canceled_at": 1603874307539,
                "fail_code": null,
                "fail_reason": null
            }
        ],
        "total_page": 7,
        "current_page": 1,
        "total_size": 7
    },
    "ts": 1603874865911
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
| total_page   | int | true | Total page
| current_page | int | true | Current page
| total_size   | int | true | Total Size
| \ <list\>(Attribute Name: orders)|              |          |                            |                |
| symbol |string| true | Cryptocurrency
| contract_code | string | true | Contract Code
| trigger_type | string | true | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to
| volume | decimal | true | Numbers of order placed
| order_type | int | true | Transaction type：1、Place orders  2、Cancel orders
| direction | string | true | order direction, [Buy (buy), Sell(sell)]
| offset | string | true | offset direction [Open(open), Close(lose)]
| lever_rate | int | true | leverage 1\5\10\20
| order_id | long | true | Trigger order ID
| order_id_str | string | true | the order ID with string 
| relation_order_id | string | true | Relation order ID is the string related to the limit orders， The value is -1 before the trigger orders executed. 
| order_price_type | string | true | order type "limit": Limit order price，"optimal_5": Optimal 5  price level，"optimal_10":Optimal 10 price level，"optimal_20": the Optimal 20 price level
| order_price_type | string | true | order price type "limit": limit order，"optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20
| status | int | true | Order status (4:Orders accepted、5: Orders failing being placed、6: Orders canceled )
| order_source | string | true | Order source
| trigger_price | decimal | true | trigger price
| triggered_price | decimal | true | the price when trigger orders executed
| order_price | decimal | true | the order price preset by the client
| created_at | long | true | the order creation time
| triggered_at | long | true | the execution time when orders getting triggered. 
| order_insert_at | long | true | the time when the triggered orders filled successfully.
| canceled_at | long | true | Order cancelation time
| fail_code | int | true | the error code when the triggered orders failed to be filled
| fail_reason | string | true | the error message with failure reason when triggered orders failed to filled.
| \</list\>                  |              |          |                            |                |



# Swap Transferring Interface

##  Transfer margin between Spot account and Coin Margined Swap account 

### Example

- POST `https://api.huobi.pro/v2/account/transfer`

### Notice

This interface is used to transfer assets between Spot account and Coin Margined Swap account.

API rate limit for this interface is 1 times/second.

Transferring margin between Spot account and Coin Margined Swap account Interface, sets 8 decimal places for transferring amount of all coins.

### Request Parameter

| Parameter Name  |  Mandatory  |  Type  |  Desc                    |  Default   |  Value Range  |  
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| from  |    true  |  string  |  source，value：spot、swap  |   e.g. spot  |
| to  |    true  |  string  |  destination，value：spot、swap |   e.g. swap  |
| currency      | true     | string | currency.Both uppercase and lowercase are supported.          |         | e.g. btc                          |
| amount  | true     | decimal    | Transferring amount         |         |   |

> Response:

```json

{
   "code":200,
   "data":113423809,
   "message":"Succeed",
   "success":true
}
 ```
> Error response

```json

 {
    "code":1303,
    "data":null,
    "message":"The single transfer-out amount must be no less than 0.0008BTC",
    "success":false
}

 ```

### Returning Parameter

|  Parameter Name                |  Mandatory  |  Type  |  Desc         |  Value Range                    |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
code  |  true  |   long  | response code  |    |  
success  |    true  |   boolean    |    true/false  |  |
message  |    true  |   string    |     response messsage  |  |
data  |    true  |   long    |    Transfer ID ,If status="error", data will be null.|  |


## Response Code Table

Response Code | Desc in Chinese |  Desc in English  | 
------------------------------------  |  --------------------------------  |  ------------------------- |
|200 | 成功 | Succeed |
|403| 拒绝访问 | Access denied |
|404|访问的资源不存在 | The resource being accessed does not exist|
|429|太多的请求 | too many requests|
|500|系统错误 | System error |
|501|无效请求 |Invalid request|
|502|无效参数 | Invalid parameter | 
|504|缺少参数 | Lack of parameter |
|512|拒绝匿名请求 | Reject anonymous requests |
|513|无效的签名 | Invalid signature | 
|10000|币种不存在 | Currency does not exist |
|10001|不支持同业务划转 | Does not support  transfer within single business|
|10002|不支持此划转业务 | This transfer is not supported| 
|10003|from方check校验不通过 | check rejected by the from party|
|10004|to方check校验不通过 |to check rejected by the to party|
|10005|个人账户平账检查不通过  | Personal account balance check failed |
|10006|系统账户检查失败 | System account check failed|
|10008|黑名单校验不通过 | Blacklist check failed|
|10009|用户有未安全上账资产，禁止划转 | No transfer is allowed if the user has any asset that has not been charged to the account safely |
|10010|用户被锁定 | User locked
|10011|24小时内修改过安全策略 | Security policy has been modified within 24 hours
|20001|OTC 人脸识别   | OTC Face Recognition 
|1030 | 服务异常，请稍后再试 | Abnormal service. Please try again later.
|1010 | 用户不存在 | Abnormal service. Please try again later.
| 1012 | 账户不存在 | Abnormal service. Please contact customer service.
| 1013 | 合约品种不存在 | This contract type doesn't exist.
| 1018 | 主账号不存在 | Main account doesn't exist.
| 1089 | {0}合约暂时限制划转,请联系客服  | {0} contract is restricted of transfer.  Please contact customer service.
| 1102 | 您没有转入权限,请联系客服 |  Unable to transfer in currently. Please contact customer service.
| 1103 | 您没有转出权限,请联系客服 | Unable to transfer out currently. Please contact customer service.
| 1106 | 合约状态异常,暂时无法划转 | Abnormal contracts status. Can’t transfer.
| 1111 | 子账号没有转入权限,请联系客服 | Sub-account doesn't own the permissions to transfer in. Please contact customer service.
| 1112 | 子账号没有转出权限,请联系客服 |  sub-account doesn't own the permissions to transfer out. Please contact customer service.
| 1114 | 子账号没有划转权限,请登录主账号授权 | The sub-account does not have transfer permissions. Please login main account to authorize.
| 1300 | 划转失败 | Transfer failed.
| 1301 | 可划转余额不足 | Insufficient amount available.
| 1302 | 系统划转错误 | Transfer failed.
| 1303 | 单笔转出的数量不能低于{0}{1} | The single transfer-out amount must be no less than {0}{1}.
| 1304 | 单笔转出的数量不能高于{0}{1} | The single transfer-out amount must be no more than {0}{1}.
| 1305 | 单笔转入的数量不能低于{0}{1} | The single transfer-in amount must be no less than {0}{1}.
| 1306 | 单笔转入的数量不能高于{0}{1}  | The single transfer-in amount must be no more than {0}{1}.
| 1307 | 您当日累计转出量超过{0}{1}, 暂无法转出 | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1308 | 您当日累计转入量超过{0}{1}, 暂无法转入 | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1309 | 您当日累计净转出量超过{0}{1}, 暂无法转出  | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1310 | 您当日累计净转入量超过{0}{1}, 暂无法转入 | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1311 | 超过平台当日累计最大转出量限制, 暂无法转出 | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1312 | 超过平台当日累计最大转入量限制, 暂无法转入 | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1313 | 超过平台当日累计最大净转出量限制, 暂无法转出 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1314 | 超过平台当日累计最大净转入量限制, 暂无法转入 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1315 | 划转类型错误 | Wrong transfer type.
| 1316 | 划转冻结失败 | Failed to freeze the transfer.
| 1317 | 划转解冻失败 | Failed to unfreeze the transfer.
| 1318 | 划转确认失败 | Failed to confirm the transfer.
| 1319 | 查询可划转金额失败 | Failed to acquire the available transfer amount.
| 1320 | 此合约在非交易状态中, 无法进行系统划 | The contract status is abnormal. Transfer is unavailable temporarily.
| 1321 | 划转失败, 请稍后重试或联系客服 | Transfer failed. Please try again later or contact customer service.
| 1322 | 划转金额必须大于0 | Invalid amount. Must be more than 0.
| 1323 | 服务异常, 划转失败, 请稍后再试 | Abnormal service, transfer failed. Please try again later.
| 1327 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1328 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1329 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1330 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1331 | 超出划转精度限制(8位), 请修改后操作 | Exceeds limit of transfer accuracy (8 digits). Please modify it.


# Swap WebSocket Reference 

## API List

  Permission |   Content Type   | Request Method |  Type  |  Description                 |  Authentication Required      |                                                                                                                                            
----------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |---------- |---------------------------- |--------------|
 Read  |  Market Data Interface |         market.$contract_code.kline.$period  |      sub        |    Subscribe KLine data           |  No |
 Read  |  Market Data Interface |           market.$contract_code.kline.$period  |              req        |     Request Kline Data|  No  |
 Read  |     Market Data Interface      |  market.$contract_code.depth.$type  |               sub        |       Subscribe Market Depth Data | No | 
 Read  |      Market Data Interface       |  market.$contract_code.detail  |               sub        |    Subscribe Market Detail Data    |   No  |
 Read  |      Market Data Interface       |  market.$contract_code.bbo  |               sub        |    Subscribe market BBO data push    |   No  |
 Read   |     Market Data Interface        |  market.$contract_code.trade.detail  |               req        |    Request Trade Detail Data |  No|
 Read  |    Market Data Interface         |  market.$contract_code.trade.detail  |        sub |  Subscribe Trade Detail Data | No  | 
 Read   |  System Status Interface         |  public.$service.heartbeat  |    sub  |Subscribe system status updates   | No  | 
 Read|        Trade Interface      |  orders.$contract_code   | sub| Subscribe Order Data  | Yes | 
 Read |     Account Interface        |  accounts.$contract_code  |        sub  |  Subscribe asset change Information of a given coin  | Yes  | 
 Read |      Account Interface      |  positions.$contract_code  |        sub  |  Subscribe position change Information of a given coin  | Yes | 
 Read |      Account Interface      |  trigger_order.$contract_code  |        sub  |  Subscribe trigger orders updates  | Yes | 

## WebSocket Subscription Address

Market Data Request and Subscription: wss://api.hbdm.com/swap-ws 

Order Push Subscription: wss://api.hbdm.com/swap-notification

Index Kline Data and Basis Data Subscription: wss://api.hbdm.com/ws_index

System status updates subscription ：wss://api.hbdm.com/center-notification

If the url: api.hbdm.com can't be accessed, please use the url below:

Market Data Request and Subscription Address: wss://api.btcgateway.pro/swap-ws;

Order Push Subscription：wss://api.btcgateway.pro/swap-notification

Index Kline Data and Basis Data Subscription: wss://api.btcgateway.pro/ws_index

System status updates subscription ：wss://api.btcgateway.pro/center-notification

If you have further queries about Huobi Coin Margined Swap order push subscription, please refer to [Demo](https://github.com/hbdmapi/hbdm_Python)

### Note:

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

## API Rate Limit Illustration

There is rate limit for both public and private interfaces. More details are laid out as below:

- Generally, for the private interfaces, users need to user API keys. The rate limit for each UID is 45 times at most every 3 seconds. (Please note that the 45 times/3s of rate limit mentioned above are shared by all contracts (all coins and contracts types expiring at different date).

- For public interfaces used to get information of non-market data (such as request information of index, price limit, delivery and settlement, positions, etc.), the rate limit for each IP is 120 times every 3 seconds. (Please note that the 120 times/3s rate limit is shared by all the requests for non-market data under this UID)

- For public interface to get market data such as  Get Kline data, Get Market Data Overview, Get Contract Information,Get market in-depth data, Get premium index Kline, Get real-time forecast capital rate kline, Get basis data, Get the last Trade of a Contract and so on：

   (1) For restful interface：800 times/second for one IP at most 
　　
   (2)  The rate limit for “req” request is 50 times/s at most. No limit for “sub” request as the data will be pushed by server voluntarily. 

- The order push private WebSocket interface requires API Key for authentication.

    Each UID can create 30 WS connections at most for private order push at the same time. The user under this UID only need to subscribe one WS order push for the contracts of the same underlying coins. For example, users only need to create one WS order push connection for BTC Contract, which our system will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly contracts via this connection.

Note: The rate limit of WS order push and RESTFUL private interface are separated from each other with no relations.

- 40 subscriptions at most can be sent in one second in websocket connections.

Response the following strings for “Header” via API

- ratelimit-limit： the upper request limit per time, unit: times

- ratelimit-interval： reset interval(reset the number of request ), unit: ms

- ratelimit-remaining： available request number left in this round, unit: times

- ratelimit-reset： upper limit of reset time used to request number， unit: ms
 
# WebSocket Heartbeat and Authentication Interface

## Market Heartbeat
WebSocket API supports two-way heartbeat. Both Server and Client can send ping message, which the opposite side can return with pong message.

- WebSocket Server sends heartbeat：

`{"ping": 18212558000}`

- WebSocket Client should respond:：

`{"pong": 18212558000}`

Note: Once the WebSocket Client and WebSocket Server get connected, the server will send a heartbeat every 5 seconds (the frequency might change). The connection will get disconnected automatically if the WebSocket Client ignores the heartbeat message for 5 times. The server will remain connection if the WebSocket Client responds one “ping” value within the latest 2 heartbeat messages.

## Order Push Heartbeat

### WebSocket API supports one-way heartbeat. The Server initiates ping message and the Client will return pong message. The Server sends back a heartbeat:

`{`

  `"op": "ping",`
  
  `"ts": "1492420473058"`
  
`}`

- WebSocket Client should return:

`{`

  `"op": "pong",`
  
  `"ts": "1492420473058"`
  
`}`

### Note

- "ts" value in the return "pong" message is the "ts" value from "ping" push Once the WebSocket Client and WebSocket Server connected, Websocket Server will send a heartbeat every 5 seconds (the frequency might change) to Wesocket Client. If WebSocket Client ignores the heartbeat message for 5 times, it will get disconnected with Websocket Sever automatically. Under abnormal conditions, WebSocket Server will return error message like:

`{`

  `"op": "pong"`

  `"ts": "1492420473027",`
  
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

- Huobi Coin Margined Swap uses one official address:
  `wss://api.hbdm.com/swap-notification`

### Note:

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

Please note that the WS request connection should not go over 30 normally.

### Data Compression

All response data from WebSocket server are compressed into GZIP format. Clients have to decompress them for further use.

### Illustration of Request(req and rep) Data

- Character Encoding：UTF-8

- Case sensitive，including parameter name and return parameter

- Data type： use JSON to transmit data

- All request data has fixed format. Please note that Huobi Coin Margined Swap API document will only focus on data illustration in non-fixed format.

> Request data format is laid out as below:

```

  {
  "op": string, // Required; Client requests operator name (Server will returns the same value), For detailed operator name list, please refer to the appendix
  "cid": string, // Optional;Request unique ID( Client generate a unique ID which server will return the same value)
  // Others required/ Optional string
  }

```

> All responses push data will be returned in fixed format，Huobi Coin Margined Swap API document will only focus on data illustration， Response data format is laid out as below；

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

  `"op": "close", // represents server disconnect connection voluntarily`
   
  `"ts": long   // Server pushes local timestamp`
  
`}`


## Server return error code but remain connection

After authentication, if clients encountered internal error or request data out from Operator List, WebSocket server will return error message. But server will remain connection

`{`

  `"op": "error", // means server receive data out from Operator List or clients got internal error`
  
  `"ts": long// Server pushes local timestamp`
  
`}`

## Authentication

Clients can create Access Key and Secret Key on Huobi which Access Key is the API access key kept by the client.  The Secret Key is used to sign the request (available only for request). To apply/change API key, please go to “Account-API Management” on Huobi Swap. Make name for the API Key and click “create” to finish. It’s optional to bind IP address to the API Key.

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

- Request code requirement for signature computing. Because it can return to total different data with different content when using HMAC for signature computing; Before signature computing, clients need to sign by following the standard format.


- Request Method (GET or POST), add newline character `\n` after URL

  `GET\n`

- add visit address with lowercase letters, add newline characters `\n` after URL

  `api.hbdm.com\n`

- Access path, adding newline character `\n` after URL

  `/swap-notification\n`

- Sequence the parameter name according to ASCII code (use UTF-8 and transfer into URI encoding, capital letters for hexadecimal characters. E.G.: ‘:’ will be encoded into '%3A', blank will be encoded into '%20'). Here is an encoding example below for request parameters

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`
  

- Connect all parameters with ’&’ according to the sequence above.
 
- The final strings for signature computing created by following the steps as below:
  
 Signature Computing, transmit the two parameters below into cryptographic hash: strings needed to be computed, API SecretKey. Get the signature computing result and get it encoded with Base 64 code standard. 

Add computed value into the Signature parameter in API request. Please note  the computed value SHOULD NOT be encoded into URL cdoe.
  
  

### Authentication Response Format Illustration

| Field    | type    | description                                                |
| ------- | ------ | --------------------------------------------------- |
| op       | string  | required； Operator type， Authentication response type is auth                    |
| type     | string  | required； Return data according to the requested parameters                       |
| cid      | string  | optional； Return data when “cid” string requested                          |
| err-code | int | 0 means successfully response, others means response failure  return 0 if success , For detailed Response code（Err-Code）, please refer to appendix  |
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

## Subscribe Kline data

### To subscribe Kline data, clients have to connect WebSocket API server and send subscribe request with the format below：

`{`

  `"sub": "market.$contract_code.kline.$period",`

  `"id": "id generate by client"`

`}`

> Example of a successful subscription request：

```json

    {
    "sub": "market.BTC-USD.kline.1min",
    "id": "id1"
    }

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.kline.$period，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules

  Parameter Name |   Mandatory   |     Type |   Description   |   Default  |   Value Range
--------------| -----------------| ---------- |----------| ------------  | --------------------------------------------------------------------------------  |
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD"|
  period    |     true          | string   |    Kline Period   |            |  1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon  |

> After subscription, clients can receive updates upon any change. Example:

```json

{
    "ch":"market.BTC-USD.kline.1min",
    "ts":1603875561883,
    "tick":{
        "id":1603875540,
        "mrid":50996000395,
        "open":13694.9,
        "close":13693,
        "high":13695,
        "low":13693,
        "amount":312.9728861001688758677955889119153928594,
        "vol":42858,
        "count":312
    }
}

```

### Return Parameter 

 Parameter Name |    Mandatory   |   Type |   Description  |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   Request Parameter  | 
  ts    |     true          | long   |  Time of Respond Generation，Unit：Millisecond   |           
  \<tick\>    |               |    |      |            | 
  id    |     true          | long   | kline id,the same as kline timestamp, kline start timestamp    |            
  mrid    |     true          | long   | ID Order ID    |            
  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
  count    |     true          | decimal   |   Order Quantity  |            
  open    |     true          | decimal   |   Open Price  |            
  close    |     true          | decimal   |  Clos Price,  the price in the last kline is the latest order price   |            
  low    |     true          | decimal   |  Low  Price  |            
  high    |     true          | decimal   |  High Price  |            
  amount    |     true          | decimal   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of the coin/order price)   |            
  \</tick\>    |               |     |      |          




## Request Kline data

### To request Kline data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：


`{`
   
  `"req": "market.$contract_code.kline.$period",`
        
  `"id": "id generated by client",`

  `"from": " type: long, the time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00, unit: s",`
        
  `"to": "type: long, the time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00, unit: s , the 'to' value should be larger than 'from' value"`

`}`

> Example of Kline Data Subscription Request：

```json

    {
    "req": "market.BTC-USD.kline.1min",
    "id": "id4",
    "from": 1571000000,
    "to": 1573106298
    }
    
```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.kline.$period，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| from   | true | long  |  Start Time | 
| to      | true | long | End Time | 

### req Subscribe Parameter Rules

  Parameter Name |    Mandatory   |   Type  |  Description  |    Default   |   Value Range
-------- | -------- | ------ | ------ | ------- |---------------------------------------- 
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
  period | false | string | Kline Period | | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|

  
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

> After subscription, Clients can receive the most recent data upon any update：

```json

{
    "id":"id4",
    "rep":"market.BTC-USD.kline.60min",
    "wsid":2039465711,
    "status":"ok",
    "data":[
        {
            "id":1603296000,
            "open":12749.9,
            "close":12845.6,
            "low":12732.1,
            "high":12934.8,
            "amount":43196.9577789250315338541275592828832798052,
            "vol":5547880,
            "count":38975
        },
        {
            "id":1603299600,
            "open":12845.7,
            "close":12789.1,
            "low":12745.9,
            "high":12873,
            "amount":15726.1236463554636877306837818573368430868,
            "vol":2014958,
            "count":16302
        }
    ]
}

```

### Return Parameter

 Parameter Name |    Mandatory   |   Type |    Description |
-------------- | -----------------  | ---------- |  -------------- |
  rep  |       true         |  string  |   Request Parameter  | 
  status  |       true         |  string  |   status   | 
  id  |       true         |  string  |   Request ID  | 
  wsid    |     true          | long   |    wsid |           
  \<data\>    |               |    |      |            | 
  id    |     true          | long   | kline id,the same as kline timestamp, kline start timestamp |            
  vol    |     true          | decimal   |    Trade Volume(Cont.)   |            
  count    |     true          | decimal   |  Order quantity   |            
  open    |     true          | decimal   |      Open Price  |            
  close    |     true          | decimal   |    Clos Price, the price in the latest Kline is the last order price   |            
  low    |     true          | decimal   |  Low Price  |            
  high    |     true          | decimal   |  High Price  |            
  amount    |     true          | decimal   |  Trade Amount(Coin), trade Amount(coins)=sum(order quantity of a single order * face value of the coin/order price)   |            
  \</data\>    |               |     |      |          



## Subscribe Market Depth Data

### To subscribe market depth data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：

`{`

  `"sub": "market.$contract_code.depth.$type",`

  `"id": "id generated by client"`

`}`

> Example of a successful request ：

```json

    {
    "sub": "market.BTC-USD.depth.step0",
    "id": "id5"
    }

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.depth.$type，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules

 Parameter Name   |  Mandatory   |  Type   |  Description      |    Default   |  Value Range  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
  type           |  true           |  string     |    Depth Type      |        |  Get depth data within step 150, use step0, step1, step2, step3, step4, step5, step14, step15（merged depth data 0-5,14-15）；when step is 0，depth data will not be merged; Get depth data within step 20, use step6, step7, step8, step9, step10, step11, step12, step13(merged depth data 7-13); when step is 6, depth data will not be merged. |

### Note:

- When clients choose merged depth data, WebSocket server will only display the merged price within price steps in order book. Please note that the merged depth price will not make any change on the actual order price.

- steps between step1 and step5, step14, step15 are merged orderbook data of step 150. 
steps between step7 and step13 are merged orderbook data of step 20. 
Details are below:

| Depth | precision |
|----|----|
|step1、step7|0.00001|
|step2、step8|0.0001|
|step3、step9|0.001|
|step4、step10|0.01|
|step5、step11|0.1|
|step14、step12|1|
|step15、step13|10|

> Clients can receive data if there is any update upon market depth. Example：

```json

{
    "ch":"market.BTC-USD.depth.step6",
    "ts":1603875911358,
    "tick":{
        "mrid":50996800648,
        "id":1603875911,
        "bids":[
            [
                13706.8,
                12670
            ],
            [
                13706.7,
                77
            ]
        ],
        "asks":[
            [
                13706.9,
                3297
            ],
            [
                13707,
                12
            ]
        ],
        "ts":1603875911351,
        "version":1603875911,
        "ch":"market.BTC-USD.depth.step6"
    }
}

```

### Return Parameter

Parameter Name   |  Mandatory  |   Type  |      Description |    Value Range  |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ts | true | long | Time of Respond Generation, Unit: Millisecond  | |
ch | true |  string | Data channel, Format： market.period | | 
 \<tick\>    |               |    |      |            | 
mrid  | true| long | Order ID| 
id  | true| long | tick ID | 
asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
ts | true | long | Timestamp for depth generation; generated once every 100ms, unit: millisecond   | |
version | true | long | version ID  | |
ch | true |  string | Data channel, Format： market.period | | 
 \</tick\>    |               |    |      |            | | 



## Subscribe Incremental Market Depth Data

### To subscribe incremental market depth data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：

`{`

`"sub": "market.$contract_code.depth.size_${size}.high_freq",`

`"data_type":"incremental",`

`"id": "id generated by client"`

`}`

> Example of a successful request ：

```json
{
"sub": "market.btc-usd.depth.size_20.high_freq",
"data_type":"incremental",
"id": "id generated by client"
}

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.depth.size_${size}.high_freq，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| data_type           |  false          |  string     |    data type. `snapshot` by default. `incremental`: incremental data.`snapshot`: full data.|

### sub Subscribe Parameter Rules

 Parameter Name   |  Mandatory   |  Type   |  Description      |    Default   |  Value Range  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  contract_code         |  true           |  string     |    contract code          |        | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |
  size           |  true           |  int     |    Depth size      |        |  `20`: stands for 20 unmerged data. `150`:stands for 150 unmerged data.|

> Response example:

```json

{
    "ch":"market.BTC-USD.depth.size_20.high_freq",
    "tick":{
        "asks":[
            [
                13698.2,
                25633
            ],
            [
                13698.3,
                52
            ]
        ],
        "bids":[
            [
                13698.1,
                35
            ],
            [
                13698,
                2
            ]
        ],
        "ch":"market.BTC-USD.depth.size_20.high_freq",
        "event":"snapshot",
        "id":50997041503,
        "mrid":50997041503,
        "ts":1603875997119,
        "version":315515215
    },
    "ts":1603875997120
}

```

### Return Parameter

Parameter Name   |  Mandatory  |   Type  |      Description |    Value Range  |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ts | true | long | Timestamp of Respond Generation, Unit: Millisecond  | |
ch | true |  string | Data channel, Format：`market.$contract_code.depth.size_${size}.high_freq`  | | 
 \<tick\>    |               |    |      |            | 
mrid  | true| long | Order ID| 
id  | true| long | tick ID，system timestamp.seconds | 
asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
ts | true | long | Timepoint for system detecting orderbook, unit: millisecond  | |
version | true | long | version ID,auto increment ID.  | |
event | true | string | event type: `update` or `snapshot`  | |
ch | true |  string | Data channel, Format： `market.$contract_code.depth.size_${size}.high_freq` | | 
 \</tick\>    |               |    |      |            | | 

### Note:

- when `data_type` is `incremental`,`snapshot` data wil be pushed for the first time. When re-connection occurs, `snapshort` data will be pushed for the first time. 
- `version`: auto increment in single websocket connection. `version` may be different among several websocket subscription connections.
-  orderbook will be pushed if orderbook is updated whenever `incremental` or `snapshot`.   
-  orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.
- you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.



## Subscribe Market Detail Data

### To subscribe market details, the clients have to make connection to WebSocket Server and send subscribe request in the format below:

`{`

`"sub": "market.$contract_code.detail",`

`"id": "id generated by client"`

`}`

> Example of Subscribe Market Detail Data：

```json

    {
     "sub": "market.BTC-USD.detail",
     "id": "id6"
    }

```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.detail，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules

Parameter Name  |  Mandatory  |    Type  |     Description   |  Default   |  Value Range |
-------------- |  -------------- |  ---------- |  ------------ |  ------------ |  --------------------------------------------------------------------------------  |
  contract_code  |       true         |  string  |   swap code  |               |Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |

> Example of a successful return data：

```json

{
    "ch":"market.BTC-USD.detail",
    "ts":1603876084386,
    "tick":{
        "id":1603876080,
        "mrid":50997295506,
        "open":13616.9,
        "close":13687.4,
        "high":13873.5,
        "low":13531.2,
        "amount":417937.4329829694553863034758900558413900854,
        "vol":56697298,
        "count":488112
    }
}

```

### Return Parameter

Parameter Name   |    Mandatory  |  Type     |  Description  |
-------------- |  -------------- |  -------------- |  ----------------------------------------------------------  |
ch  |  true  |  string  |   Data channel，Format： market.$contract_code.detail   |     
ts  |  true  |  long  |   Time of Respond Generation, Unit: Millisecond |    
 \<tick\>    |               |    |      |           
id  |  true  |  long  |    ID  |    
mrid  |  true  |  long  |   Order ID  |    
open  |  true  |  decimal  |    Open Price |     
close  |  true  |  decimal  |    Clos Price, the price from the latest kline is the last order price |    
high  |  true  |  decimal  |   High Price |     
low  |  true  |  decimal  |    Low Price |     
amount  |  true  |  decimal  |   Trade Amount(Coins), Trade amount(Coin)=SUM(quantity(cont.)*face value/ order price  |   
vol  |  true  |  decimal  |   Trade volume(Cont.)， the sum volume of both buy and sell sides  |     
count  |  true  |  decimal  |   fulfilled order quantity  |     
 \</tick\>    |               |    |      |           



## Subscribe market BBO data push

### clients have to make connection to WebSocket API Server and send subscribe request in the format below：

  `{`
  
  `"req": "market.$contract_code.bbo", `
  
  `"id": "id generated by client" `
  
  `}`

> Example of a successful request：

```json

    {
     "sub": "market.BTC-USD.bbo",
     "id": "id8"
    }

```

### Request Parameter

| Parameter Name | Mandotary   | Type   | Desc  |
| ------ | ------ | ------ | ------ | 
| sub | true | string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.bbo，For parameter details please check sub Subscribe Parameter Rules	 | 
| id | false | string | id automatically generated by the business party  |  |

### sub Subscribe Parameter Rules

| Parameter Name | Mandotary| Type   | Desc  |   Value Range |
| ------- | ----- | ----- | ------- | ------- | 
| contract_code   |  true    |  string     |    contract code         |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD"   |

> **Return example**:

```json

{
    "ch":"market.BTC-USD.bbo",
    "ts":1603876157423,
    "tick":{
        "mrid":50997449846,
        "id":1603876157,
        "bid":[
            13684.5,
            10615
        ],
        "ask":[
            13684.6,
            3440
        ],
        "ts":1603876157421,
        "version":50997449846,
        "ch":"market.BTC-USD.bbo"
    }
}

```

### **Return Parameter**：

| Parameter Name   |   Mandotary  |   Type   |   Desc   |   Value Range   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- |
| ch | true |  string | Data channel, Format： market.$contract_code.bbo | |
| ts | true | long | Timestamp of Respond Generation, Unit: Millisecond | |
| \<tick\> | true | object |  | |
| ch | true |  string | Data channel, Format： market.$contract_code.bbo | |
| mrid  | true| string | Order ID | |
| id  | true| long | tick ID | |
| ask | true | array | Best Ask Quotation,[price(Ask price), vol(Ask order (cont.) )] | |
| bid | true| array | Best Bid Quotation,[price(Bid price), vol(Bid order(Cont.))] | |
| version | true| long | version ID. | |
| ts | true | long |  Time of Respond Generation, Unit: Millisecond  | |
| \<\tick\> | | |  | |

####  **Rules**：
- When any one of the buy_one price, buy_one quantity, sell_one price and sell_one quantity changes, the system will push BBO price.  
- If there are multiple changes in the price or quantity of buy_one or sell_one at the same time, the system will push the latest price and quantity of buy_one and sell one with the intermediate data discarded. 
- When the data received by the client is failed or delayed, the old data buffer in the server will be discarded.The latest BBO will be pushed.
- version（version number). Use match id directly to ensure it is globally unique and the value of version number pushed is the largest.




## Request Trade Detail Data

### To request Trade detail data, Clients have to make connection to the WebSocket Server and send request data in the format below：

`{`
     
   `"req": "market.$contract_code.trade.detail",`
    
   `"id": "id generated by client"` // “id” string is optional currently. Server will return with null because client ID is not necessary
    
`}`

Return to the current trade detail data only

> Example of requesting trade detail data：

```json


    {
     "req": "market.BTC-USD.trade.detail",
     "size": 10,
     "id": "id8"
    }

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.trade.detail，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| size  |  false  | string | number of data; no more than 50; default 50 if not filled                         |


### req Subscribe Parameter Rules

Parameter Name  |  Mandatory  |    Type  |     Description   |  Default   |  Value Range |
-------------- |  -------------- |  ---------- |  ------------ |  ------------ |  --------------------------------------------------------------------------------  |
  contract_code  |       true         |  string  |   swap code  |               |Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USD" |


> Example of a successful return data：

```json

{
    "data":[
        {
            "amount":"2",
            "ts":1603876250774,
            "id":509977028010022,
            "price":"13689.8",
            "direction":"sell"
        }
    ],
    "id":"id8",
    "rep":"market.BTC-USD.trade.detail",
    "status":"ok",
    "ts":1603876266723
}
    
```

### Return Parameter

Parameter Name     |    Mandatory |  Type  | Description |  Default   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  Data Channel，Format： market.$contract_code.trade.detail  |  |   
status  |  true  |  string  |  Request Status  |   |    
id  |  true  |  long  |  ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  long  |  ID  |   |    
price  |  true  |  string  |  Price |   |    
amount  |  true  |  string  |  Quantity(Cont.)  |   |    
direction  |  true  |  string  |  Order Direction  |   |    
ts  |  true  |  long  |  Order Creation Time |   |    
 \</data\>    |               |    |      | 
ts  |  true  |  long  |  server response time |   | 


## Subscribe Trade Detail Data 

### To subscribe trade detail data, the Client has to make connection to the Server and send subscribe request in the format below：

`{`
 
  `"sub": "market.$contract_code.trade.detail",`
    
  `"id": "id generated by client"`
    
`}`

> Example of a successful subscribe request：

```json

    {
     "sub": "market.BTC-USD.trade.detail",
     "id": "id7"
    }
    
```


###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.trade.detail，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules

  Parameter Name    | Mandatory   |  Type    |   Description   |   Default     |   Value Range  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------|
  contract_code  |       true         |  string  |   swap code  |               |  contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |


> When there is any update upon trade detail data, clients will receive notification from server. Example：

```json

{
    "ch":"market.BTC-USD.trade.detail",
    "ts":1603876416535,
    "tick":{
        "id":50998035853,
        "ts":1603876416513,
        "data":[
            {
                "amount":4,
                "ts":1603876416513,
                "id":509980358530000,
                "price":13686,
                "direction":"sell"
            }
        ]
    }
}

```

### Return Parameter

Parameter Name     | Mandatory | Type  |  Description |  Default  | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
ch  |  true  |  string  |  Data channel,format: market.$contract_code.trade.detail  |  |   
ts  |  true  |  long  |  Request time  |   |    
 \<tick\>    |               |    |      | 
id  |  true  |  long  |  ID  |   |    
ts  |  true  |  long  |  tick time  |   |    
 \<data\>    |               |    |      | 
amount  |  true  |  decimal  |  quantity(Cont.) |   |    
ts  |  true  |  long  |  trade timestamp  |   |    
id  |  true  |  long  |  tick id  |   |    
price  |  true  |  decimal  |  Price  |   |    
direction  |  true  |  string  |  Order direction  |   |    
 \</data\>    |               |    |      | 
 \</tick\>    |               |    |      | 



# WebSocket Index and Basis Interface

- The websocket url of Index and Basis Data is：wss://api.hbdm.com/ws_index 

## Subcribe Premium Index Kline Data

### To subscribe Premium index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.premium_index.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of premium index kline data：

```json

    {
    "sub": "market.BTC-USD.premium_index.1min",
    "id": "id1"
    }

```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.premium_index.$period，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code         |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

#### Note
 - Pushed once the index data is changed.
  
 - Periodical Push when the index data hasn't changed according to the kline period.


> results pushed by the server

```json

{
    "ch":"market.BTC-USD.premium_index.1min",
    "ts":1603876800359,
    "tick":{
        "id":1603876800,
        "open":"-0.0002521241137087",
        "close":"-0.0002521241137087",
        "high":"-0.0002521241137087",
        "low":"-0.0002521241137087",
        "amount":"0",
        "vol":"0",
        "count":"0"
    }
}
```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format： market.period |                | |
| tick |   true   |    object array    |  Details：tick parameters             |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond            |                | |

### tick parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | long | index kline id,the same as kline timestamp, kline start timestamp  |
| vol | string  | Trade volume(Cont.). The value is 0.             |
| count | string  | count. The value is 0.              |
| open | string  | open index price               |
| close | string  | close index price             |
| low | string  |  lowest index price             |
| high | string  | highest index price               |
| amount | string  | amount based on coins.            |


## Request Premium Index Kline Data

### To subscribe premium index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$contract_code.premium_index.$period",`
   
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. ",`
    
`}`

> Example of a successful subscribe request

```json

    {
    "req": "market.BTC-USD.premium_index.1min",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.premium_index.$period，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| from   | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |        
| to     | true     | long  | end time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |     


### req Subscribe Parameter Rules：

| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

### Note：
- Pushed once the index data is updated.

- response example：

```json

{
    "id":"id4",
    "rep":"market.BTC-USD.premium_index.60min",
    "wsid":2973246992,
    "status":"ok",
    "data":[
        {
            "id":1603296000,
            "open":"-0.000072347706607",
            "close":"-0.0001900268622627",
            "low":"-0.001524303608041",
            "high":"0.0021789375596989",
            "amount":"0",
            "vol":"0",
            "count":"0"
        },
        {
            "id":1603299600,
            "open":"-0.00003269469692",
            "close":"0.0002145326529248",
            "low":"-0.0011175492509934",
            "high":"0.0005228164202677",
            "amount":"0",
            "vol":"0",
            "count":"0"
        }
    ]
}

```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data channel，Format： market.period |                | |
| status | true | string | Request processing result          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond          |                | |
| data |   true   |    object array    |   Details：data parameters            |                | |

### data parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | long | index kline id,the same as kline timestamp, kline start timestamp  |
| vol | string  | Trade volume(Cont.). The value is 0.             |
| count | string  | count. The value is 0.              |
| open | string  | open index price               |
| close | string  | close index price             |
| low | string  |  lowest index price             |
| high | string  | highest index price               |
| amount | string  |amount based on coins.            |


## Subcribe Estimated Funding Rate Kline Data

### To subscribe Estimated Funding Rate kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.estimated_rate.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of estimated funding rate kline data：

```json

    {
    "sub": "market.BTC-USD.estimated_rate.1min",
    "id": "id1"
    }

```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.estimated_rate.$period，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code         |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

#### Note:
 - Pushed once the kline data is changed.
  
 - Periodical Push when the kline data hasn't changed according to the kline period.


> results pushed by the server

```json

{
    "ch":"market.BTC-USD.estimated_rate.1min",
    "ts":1603877220317,
    "tick":{
        "id":1603877220,
        "open":"0.0001",
        "close":"0.0001",
        "high":"0.0001",
        "low":"0.0001",
        "amount":"0",
        "vol":"0",
        "count":"0"
    }
}

```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format： market.period |                | |
| tick |   true   |    object array    |  Details：tick parameters             |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond            |                | |

### tick parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | long | kline id,the same as kline timestamp  |
| vol | string  | Trade volume(Cont.). The value is 0.             |
| count | string  | count. The value is 0.              |
| open | string  | open price               |
| close | string  | close  price             |
| low | string  |  low price             |
| high | string  | high price               |
| amount | string  |amount based on coins.            |


## Request Estimated Funding Rate Kline Data

### To subscribe Estimated Funding Rate kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$contract_code.estimated_rate.$period",`
    
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. ",`
    
`}`

> Example of a successful subscribe request

```json

    {
    "req": "market.btc-usd.estimated_rate.1min",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.estimated_rate.$period，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| from   | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |        
| to     | true     | long  | end time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |     


### Request Parameter：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USD","ETH-USD"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |


> response example：

```json

{
    "id":"id4",
    "rep":"market.BTC-USD.estimated_rate.60min",
    "wsid":126577326,
    "status":"ok",
    "data":[
        {
            "id":1603296000,
            "open":"0.0001",
            "close":"0.0001",
            "low":"-0.0006454418466661",
            "high":"0.0001",
            "amount":"0",
            "vol":"0",
            "count":"0"
        },
        {
            "id":1603299600,
            "open":"0.0001",
            "close":"0.0001",
            "low":"0.0001",
            "high":"0.0001",
            "amount":"0",
            "vol":"0",
            "count":"0"
        }
    ]
}

```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data channel，Format： market.period |                | |
| status | true | string | Request processing result          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond          |                | |
| data |   true   |    object array    |   Details：data parameters            |                | |

### data parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | long | kline id,the same as kline timestamp  |
| vol | string  |Trade volume(Cont.). The value is 0.             |
| count | string  | count. The value is 0.              |
| open | string  | open  price               |
| close | string  | close  price             |
| low | string  |  low price             |
| high | string  | high price               |
| amount | string  |amount based on coins.            |


## Subscribe Basis Data

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.basis.$period.$basis_price_type",`

  `"id": "id generate by client"`

`}`

> example of the subscription of basis data：

```json

    {
    "sub": "market.BTC-USD.basis.1min.open",
    "id": "id1"
    }

```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.basis.$period.$basis_price_type，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code         |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USD"                         |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |

> Response Example

```json

{
    "ch":"market.BTC-USD.basis.1min.open",
    "ts":1603877511008,
    "tick":{
        "id":1603877460,
        "index_price":"13649.7075",
        "contract_price":"13651.2",
        "basis":"1.4925",
        "basis_rate":"0.0001093430024049965905862817939505297"
    }
}
```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format： market.period |                | |
| tick |   true   |    object array    |  Details：tick parameters             |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond            |                | |

### tick Parameters
| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| id | true | long | unique id |  |
| contract_price | true | string | contract last price |  |
| index_price | true | string | index price|  |
| basis | true | string | basis=contract_price - index_price |  |
| basis_rate | true | string | basis_rate=basis/index_price |  |

## Request Basis Data

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$contract_code.basis.$period.$basis_price_type",`
    
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. "`
    
`}`

> Example of a successful subscribe request

```json

{
    "req": "market.btc-usd.basis.1min.open",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
}
```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.basis.$period.$basis_price_type，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| from   | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |        
| to     | true     | long  | end time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |     



### Request Parameter：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USD" 
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |

### Note：
 - 2000 data at most per request.

> response example：

```json

{
    "data":[
        {
            "basis":"1.4774999999990541",
            "basis_rate":"0.0001158966923161712",
            "contract_price":"12749.9",
            "id":1603296000,
            "index_price":"12748.4225"
        },
        {
            "basis":"-0.42999999999847205",
            "basis_rate":"-3.347311602782099405",
            "contract_price":"12845.7",
            "id":1603299600,
            "index_price":"12846.13"
        }
    ],
    "id":"id4",
    "rep":"market.BTC-USD.basis.60min.open",
    "status":"ok",
    "ts":1603877618020,
    "wsid":491167614
}

```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data channel，Format： market.period |                | |
| status | true | string | Request processing result          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond          |                | |
| data |   true   |    object array    |   Details：data parameters            |                | |

### data Parameters

| **parameter name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| id | true | long | unique id |  |
| contract_price | true | string | contract last price |  |
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
  
  `“topic": "orders.$contract_code”`

`}`

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders.BTC-USD"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: orders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |


> Illustration on detailed data format of orders Notification

```json

{
    "op":"notify",
    "topic":"orders.theta-usd",
    "ts":1603878749907,
    "symbol":"THETA",
    "contract_code":"THETA-USD",
    "volume":1,
    "price":0.63191,
    "order_price_type":"opponent",
    "direction":"sell",
    "offset":"open",
    "status":6,
    "lever_rate":20,
    "order_id":771068893090799616,
    "order_id_str":"771068893090799616",
    "client_order_id":null,
    "order_source":"web",
    "order_type":1,
    "created_at":1603878749878,
    "trade_volume":1,
    "trade_turnover":10,
    "fee":-0.00791251918785903,
    "trade_avg_price":0.63191,
    "margin_frozen":0,
    "profit":0,
    "trade":[
        {
            "trade_fee":-0.00791251918785903,
            "fee_asset":"THETA",
            "trade_id":49703426706,
            "id":"49703426706-771068893090799616-1",
            "trade_volume":1,
            "trade_price":0.63191,
            "trade_turnover":10,
            "created_at":1603878749883,
            "role":"taker"
        }
    ],
    "canceled_at":0,
    "fee_asset":"THETA",
    "uid":"123456789",
    "liquidation_type":"0"
}

```

### Format Illustration on return data of order push

| Filed Name               | Type   | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | Required;Operator Name，Order push value is notify ;                          |
| topic                   | string  | Required; Order push topic                                              |
| uid                   | string  | account uid                                              |
| ts                      | long    | Server responses timestamp                                           |
| symbol                  | string  | Coin                                                      |
| contract_code           | string  | Contract Code                                                     |
| volume                  | decimal | Order quantity                                                    |
| price                   | decimal | Order price                                                     |
| order_price_type        | string  | Order price type "limit":limit order  "opponent": BBO "post_only": Post Only,  Post –only order is only limited by clients position                |
| direction               | string  | "buy" Long "sell": Short                                         |
| offset                  | string  | "open": Open "close":  Close                                       |
| status                  | int     | Order status(1. Placing orders to order book; 2 Placing orders to order book; 3. Placed to order book 4. Partially fulfilled; 5 partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled; 11Cancelling) |
| lever_rate              | int     | Leverage                                                     |
| order_id                | long    | Order ID                                                      |
| order_id_str            | string   | Order ID                                                   |
| client_order_id         | long    | Client ID                                                 |
| order_source            | string     | Order source(system、web、api、m、risk、settlement、ios、android、windows、mac、trigger) |
| order_type              | int     | Order type 1Requested orders; 2. Cancelled orders; 3. Liquidated orders; 4. Delivered orders                 |
| created_at              | long    | order creation time                                                |
| trade_volume            | decimal | trade volume(volume)                                                     |
| trade_turnover          | decimal | Turnover                                                   |
| fee                     | decimal | Fees                                                       |
| trade_avg_price         | decimal | Average order price                                                     |
| margin_frozen           | decimal | Frozen Margin                                                   |
| profit                  | decimal | Profits&Losses                                                       |
| liquidation_type  | string | Liquidation type, 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| \<list\>( Attribute Name: trade) |         |                                                              |
| id            | string| 	the global unique ID of the trade.                                                       |
| trade_id                | long    | In this interface, trade_id is the same with match_id of swap-api/v1/swap_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                                  |
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
  
  `“topic": "orders.$contract_code”,`
  
  `"cid": "id generated by client”,`
  
`}`

> Example of a successful unsubscribe request：

```json

{
  "op": "unsub",
  "topic": "orders.BTC-USD",
  "cid": "40sG903yz80oDFWr"
}

```

### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; Unsubscribe Topic Name，format: orders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub ) | Rule   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | Allowed  |
| orders.contract_code1| orders.*        | Allowed|
| orders.contract_code1 | orders.contract_code2  | Allowed |
| orders.contract_code1 | orders.contract_code2  | Not Allowed |
| orders.*       | orders.contract_code1  | Not Allowed |




## Subscribe Match Order Data（sub)


To subscribe order data, Clients have to make connection to the Server and send subscribe request in the format below:

### Subscribe Request Format

`{`
  
  `“op”: “sub”,`
  
  `"cid": "cid”,`
  
  `“topic": "matchOrders.$contract_code”`

`}`

> sub example:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "matchOrders.btc-usd"
}

```

### Format of subscribe match order data

| attr | type   | desc                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: matchOrders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |


> Illustration on detailed data format of orders Notification

#### Note: 
- The order status of 'post_only' type pushed by ws is ethier '7:canceled' or '3:submitted'.
- The orders will be pushed when matched by matching engine.
- The delivery orders will not be pushed.
- The orders transfered from future or to future will not be pushed.
- The netting and forced liquidation orders will not be pushed.
- The orders will generally be pushed faster than the normal orders subscription.But It's not guranted.
- If there is an order with N trades,including 1 taker and N maker,it will push N+1 trades at most.

> response

```json

{
    "op":"notify",
    "topic":"matchOrders.theta-usd",
    "ts":1603878749900,
    "symbol":"THETA",
    "contract_code":"THETA-USD",
    "status":6,
    "order_id":771068893090799616,
    "order_id_str":"771068893090799616",
    "client_order_id":null,
    "order_type":1,
    "created_at":1603878749878,
    "trade":[
        {
            "trade_id":49703426706,
            "id":"49703426706-771068893090799616-1",
            "trade_volume":1,
            "trade_price":0.63191,
            "trade_turnover":10,
            "created_at":1603878749883,
            "role":"taker"
        }
    ],
    "uid":"123456789",
    "volume":1,
    "trade_volume":1,
    "direction":"sell",
    "offset":"open",
    "lever_rate":20,
    "price":0.63191,
    "order_source":"web",
    "order_price_type":"opponent"
}

```

### format of order data pushed

| **Parameter Name**       | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| op        | true     | string  |  notify;              |                |
| topic     | true     | string  | topic               |                |
| ts                  | true     | long  | Time of Respond Generation          |                |
| uid        | true     | string  | account uid   |                |
| symbol                  | true     | string  | symbol               |                |
| contract_code           | true     | string  | contract code               |"BTC-USD" ...         |
| status                 |  true     | int | 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; |             |
| order_id             | true      | long | order id |                |
| order_id_str             | true      | string | order id |                |
| client_order_id             | true      | long | the client ID that is filled in when the order is placed |                |
| order_type | true | string | order type |1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order |
| trade_volume    | true     | decimal  |   total filled volume of the order    |                |
| volume                  | true     | decimal  |      total volume of the order        |                |
| \<trade\>|   true       |   object array      |                    |                |
| id             | true     | string    | the global unique id of the trade.             |                |
| trade_id                | true     | long    | In this interface, trade_id is the same with match_id of swap-api/v1/swap_matchresults. trade_id is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.     |                |
| trade_price             | true     | decimal | trade price               |                |
| trade_volume            | true     | decimal | trade volume                |                |
| trade_turnover          | true     | decimal | trade turnover               |                |
| created_at              | true     | long    | created at               |                |
| role              | true     | string    | taker or maker               |                |
| \</trade\>               |          |         |                    |                |
| direction        | true     | string       | Order Direction          | "buy" or  "sell"                                         |
| offset           | true     | string       | offset direction        | "open" or "close"                                       |
| lever_rate              | true | int     | lever rate        |                  |
| price            | true     | decimal      | trigger price            |                                            |
| created_at       | true     | long         | created at                                                     |                                                              |
| order_source     | true     | string       | order source                                                     |                                                              |
| order_price_type | true     | string       | order price type          |  order price type: "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order. "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK    |


## Unsubscribe Match Order Data（unsub）

To unsubscribe order data, the clients have to make connection to the server and send unsubscribe request in the format below: 

### Format of Unsubscribe order data

`{`

  `“op”: “unsub”,`
  
  `“topic": "matchOrders.$contract_code”,`
  
  `"cid": "id generated by client”,`
  
`}`

> Example of a successful unsubscribe request：

```json

{
  "op": "unsub",
  "topic": "matchOrders.btc-usd",
  "cid": "40sG903yz80oDFWr"
}

```

### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; format: matchOrders.$contract_code; symbol is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| matchOrders.*       | matchOrders.*        | allowed   |
| matchOrders.contract_code1 | matchOrders.*        | Allowed   |
| matchOrders.contract_code1 | matchOrders.contract_code1  | allowed   |
| matchOrders.contract_code1 | matchOrders.contract_code2  | Not Allowed |
| matchOrders.*       | matchOrders.contract_code1  | Not Allowed |




## Subscribe Account Equity Updates Data(sub)

To subscribe accounts equity data updates, the client has to make connection to the server and send subscribe request in the format below:

### Request Format for Subscribe Account Equity Updates Data

`{`

  `"op": "sub",`
  
  `"cid": "id generated by client”,`
  
  `“topic": "accounts.$contract_code”`

`}`

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "accounts.BTC-USD"
}

```

### Format illustration on request subscribe account equity updates data

| Field Name | Type   | Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，Subscribe value is sub             |
| cid      | string | Optional;  Client requests unique ID                  |
| topic    | string | Required； Subscribe Topic Name，Required subscribe accounts.$contract_code   Subscribe/unsubscribe the balance change of a given coin，when the value of $contract_code is “*”, it means to subscribe/unsubscribe the balance change of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

### Note:
 - A regular push of account is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.

> When there is any balance change, the Server will send a notification with the return parameter. For example:

```json

{
    "op":"notify",
    "topic":"accounts.theta-usd",
    "ts":1603878749908,
    "event":"order.match",
    "data":[
        {
            "symbol":"THETA",
            "contract_code":"THETA-USD",
            "margin_balance":621.187560151491928452,
            "margin_static":621.879531780612432322,
            "margin_position":15.822534453568772646,
            "margin_frozen":0.833333333333333333,
            "margin_available":604.531692364589822473,
            "profit_real":-0.00791251918785903,
            "profit_unreal":-0.69197162912050387,
            "withdraw_available":604.531692364589822473,
            "risk_rate":36.895418533520262923,
            "liquidation_price":0.210454212150800748,
            "lever_rate":20,
            "adjust_factor":0.4
        }
    ],
    "uid":"123456789"
}

```

### Format Illustration of Notification 

| Field Name               | Type   | Description                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op       | string | Operator Name，Subscribe value is sub             |
| topic    | string | Subscribe Topic Name |
| uid                   | string  | account uid                                              |
| ts                        | long  | Time of Respond Generation, Unit: Millisecond                          |
| event                     | string  | notification on account asset change such as commit order(order.open), fulfill order(order.match)(excluding liquidated order and settled orders), settlement and delivery(settlement), fulfill liquidation order(order.liquidation)(including voluntarily fulfilled liquidation order and the fulfilled liquidation order taken over by system ) , cancel order(order.cancel), asset transfer（contract.transfer) (including withdraw and deposit), system (contract.system), other asset change(other), switch leverage（switch_lever_rate）, initial margin(init)                           |
| \<data\>            |   |                                                        |
| symbol                    | string    |  symbol e.g:  "BTC","ETH"...                         |
| contract_code            | string  | Contract Code                                                     |
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
| lever_rate                | int   | Leverage                                                      |
| adjust_factor                | decimal    | Adjustment Factor                                                      |
| \</data\>            |   |                                                        |


## Unsubscribe Account Equity Updates Data (ubsub)

To unsubscribe account equity updates data, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Account Equity Updates Data

`{`

  `“op”: “unsub”,`
  
  `“topic": "accounts.$contract_code”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful subscription request

```json

{
  "op": "unsub",
  "topic": "accounts.BTC-USD",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration on Unsubscribe Account Equity Updates

| Filed Name | Type | Description                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional; Client requests unique ID                          |
| topic    | string | Required;Required； Required； Subscribe Topic，Subscribe accounts.$contract_code required  unsubscribe/unsubscribe account equity change of a given coin，when the $contract_code value is *, it stands for subscribing/unsubscribing data of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)    | Unsubscribe(unsub) | Rule |
| -------------- | --------------- | ------ |
| accounts.*       | accounts.*        | Allowed  |
| accounts.contract_code1 | accounts.*        | Allowed |
| accounts.contract_code1 | accounts.contract_code1  | Allowed |
| accounts.contract_code1 | accounts.contract_code2  | Not Allowed |
| accounts.*       | accounts.contract_code1  | Not Allowed |


## Subscribe Position Updates(sub)

To subscribe position updates data, the client has to make connection to the server and send subscribe request in the format below:

### Subscribe Request Format

`{`

  `“op”: “sub”,`
  
  `"cid": "id generated by client”,`
  
  `“topic": "positions.$contract_code”`

`}`

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "positions.BTC-USD"
}

```

### Format Illustration of Subscribe Position Updates

| Filed Name |Type   | Description                                       |
| ------- | :----- | :------------------------------------------ |
| op       | string | Required；Operator Name，Subscribe value is sub             |
| cid      | string | Optional ; Client requests unique ID                 |
| topic    | string | Required； Subscribe Topic, Subscribe (positions.$contract_code) Required  Subscribe/unsubscribe the position data of a single coin, when the $contract_code value is *, it stands for subscribing the data of all coins. contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |


> When there is any position update, the server will send notification with return parameter. For example:

```json

{
    "op":"notify",
    "topic":"positions.theta-usd",
    "ts":1603878749908,
    "event":"order.match",
    "data":[
        {
            "symbol":"THETA",
            "contract_code":"THETA-USD",
            "volume":1,
            "available":1,
            "frozen":0,
            "cost_open":0.63191,
            "cost_hold":0.63191,
            "profit_unreal":-0.00250392214928847,
            "profit_rate":-0.00316450689071376,
            "profit":-0.00250392214928847,
            "position_margin":0.791126722678438632,
            "lever_rate":20,
            "direction":"sell",
            "last_price":0.63201
        }
    ],
    "uid":"123456789"
}

```

### Return Parameter Illustration


|   Filed Name           | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| op                      | string  | Required;Operator Name ;                          |
| topic                   | string  | Required;  topic                                              |
| uid                   | string  | account uid                                              |
| ts                     | long  | Time of Respond Generation, Unit: Millisecond	                           |
| event                  | string  | Related events of position change notification, such as order creation and position closing (order.close), order filled (order.match) (except for liquidation, settlement and delivery), settlement and delivery (settlement), order liquidation (order.liquidation), order cancellation (order.cancel), switch leverage（switch_lever_rate）, initial positions (init), triggered by system periodic push (snapshot).                                     |
| \<data\>            |   |                                                        |
| symbol                 | string    |  symbol  e.g:"BTC","ETH"...               |
| contract_code          | string  | Contract Code                                                      |
| volume                 | decimal  | Open Interest                                                     |
| available              | decimal | Positions available to close                                                     |
| frozen                 | decimal | Frozen Margin                                                      |
| cost_open              | decimal  | Open price           |
| cost_hold              | decimal  | Position Price                                         |
| profit_unreal          | decimal  |Unrealized Profits&Losses                                       |
| profit_rate            | decimal     | Profit/Losses Ratio |
| profit                 | decimal     | Profits/Losses                                                     |
| position_margin        | decimal    | Position Margin                                                      |
| lever_rate             | int     | Leverage                                                    |
| direction              | string    | Position direction   "buy":Long "sell":Short                                                     |
| last_price              | decimal    | Last Price                                                     |
| \</data\>            |   |                                                        |

### Note:

 - A regular push of position is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.
 
 - When switching leverage with no positions, the event "switch_lever_rate" will not be pushed by the position topic.


## Unsubscribe Position Updates Data(unsub)

To unsubscribe, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Position Updates

`{`

  `“op”: “unsub”,`
  
  `“topic": "positions.$contract_code”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful unsubscribe request:

```json

{
  "op": "unsub",
  "topic": "positions.BTC-USD",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration of Unsubscribe Position Updates

| Field Name | Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Required;Required；Required；Subscribe topic，Subscribe positions.$contract_code required  Subscribe or unsubscribe the position updates of a single coin; when $contract_code value is *, it stands for subscribing the data of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)      | Unsubscribe(ubsub) |  Rule |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | Allowed  |
| positions.contract_code1 | positions.*        | Allowed |
| positions.contract_code1 | positions.contract_code1  |  Allowed |
| positions.contract_code1 | positions.contract_code2  | Not Allowed |
| positions.*       | positions.contract_code1  | Not Allowed |

## Subscribe Liquidation Orders (no authentication) (sub)

### Subscription Request Format of Liquidation order data

`{`

  `“op”: “sub”,`
  
  `“topic": "public.$contract_code.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful subscription request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "public.BTC-USD.liquidation_orders"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.liquidation_orders. contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |


### Return Parameter

| Field Name               | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| op   | string  | value: 'notify';    |   |
| topic   | string  | topic subscribed   |   |
| ts                 | long    | Time of Respond Generation，Unit：Millisecond 	                                             |
| \<data\> | object array |  | |
| symbol          | string  | Coin                                                      |
|  contract_code      |  string  |   swap code  E.G.: "BTC-USD" |
| direction                 | string  | Long or short                                                     |
| offset              | string | Open or close                                                     |
| volume                 | decimal | quantity(volume)                                                      |
| price              | decimal  | bankruptcy price            |
| created_at              | long  | Order Creation Time                                          |
| \</data\> | object array |  | |


> When there commences any liquidation order, the server will send notification with return parameter. For example：

```json

{
    "op":"notify",
    "topic":"public.ETH-USD.liquidation_orders",
    "ts":1603879731301,
    "data":[
        {
            "symbol":"ETH",
            "contract_code":"ETH-USD",
            "direction":"sell",
            "offset":"close",
            "volume":465,
            "price":390.79,
            "created_at":1603879731275
        }
    ]
}

```

## Unsubscribe Liquidation Order Data (unsub)

### Unsubscribe Request Format

`{`

  `“op”: “unsub”,`
  
  `“topic": "public.$contract_code.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> Example of a successful unsubscribe request :

```json

{
  "op": "unsub",
  "topic": "public.BTC-USD.liquidation_orders”",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration of Unsubscribe Position Updates

| Field Name |Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，subscribe value is unsub;                 |
| cid      | string | Optional;   Client requests unique ID                        |
| topic    | string | Subscribe topic name，Require subscribe public.$contract_code.liquidation_orders  Subscribe/unsubscribe the data of a given coin; when the $contract_code value is *, it stands for subscribing/unsubscribing the data of all coins，; |


### Rules on Subscribe and Unsubscribe

|   Subscribe(sub)   | Unsubscribe(unsub) |  Rule |
| -------------- | --------------- | ------ |
| public.*.liquidation_orders       | public.*.liquidation_orders        | Allowed    |
| public.contract_code1.liquidation_orders | public.*.liquidation_orders        | Allowed   |
| public.contract_code1.liquidation_orders | public.contract_code1.liquidation_orders  |  Allowed |
| public.contract_code1.liquidation_orders | public.contract_code2. liquidation_orders  | Not Allowed  |
| public.*.liquidation_orders      | public.contract_code1.liquidation_orders  | Not Allowed |


## Subscribe funding rate (no authentication)（sub）

To subscribe funding rate data, the client has to make connection to the server and send subscribe request in the format below:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "public.$contract_code.funding_rate"`
  
  `}`


### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.funding_rate.; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |

> Response example when funding_rate is updated:

```json

{
    "op":"notify",
    "topic":"public.BTC-USD.funding_rate",
    "ts":1603879631291,
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USD",
            "fee_asset":"BTC",
            "funding_time":"1603879620000",
            "funding_rate":"0.000100000000000000",
            "estimated_rate":"0.000100000000000000",
            "settlement_time":"1603900800000"
        }
    ]
}

```

### Response data fields

| Field Name |Type   | Description                                              |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op   |  string  | value: "notify";    |   |
| topic   | string  | topic subscribed   |   |
| ts   | long  | timestamp of server response.unit: millionseconds   |   |
| \<data\>   | object array |     |    |
| symbol |string | symbol,"BTC","ETH"... |
| contract_code  | string   |  contract_code,"BTC-USD"  |
| fee_asset | string | fee asset,"BTC","ETH"... |
| funding_time | string | current funding time |
| funding_rate | string | current funding rate |
| estimated_rate | string | estimated funding rate of next period |
| settlement_time | string |  settlement timestamp.eg:"1490759594752"  |
| \</data\>   | object array |     |    |


## Unsubscribe Funding Rate Data(no authentication)(unsub)


To unsubscribe funding rate data, the client has to make connection to the server and send subscribe request in the format below:

### request format of unsubscribing funding rate

  `{`
  
  `"op": "unsub",`
  
  `"topic": "public.$contract_code.funding_rate",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> example of unsubscribing funding rate::

```json
                                
{                                    
  "op": "unsub",                     
  "topic": "public.BTC-USD.funding_rate",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### request field desc of unsubscrbing funding rate

| field | datatype  | desc                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | Required; Operator Name，subscribe value is unsub;                 |
| cid      | string | Optional;   Client requests unique ID                        |
| topic    | string | Subscribe topic name，Require subscribe public.$contract_code.funding_rate Subscribe/unsubscribe the data of a given contract code; when the $contract_code value is *, it stands for subscribing/unsubscribing all the funding rates of contract codes，; |

### Data format of subscription and unsubscription of funding rate

| subscribe(sub)      | unsubscribe(unsub) | rules   |
| -------------- | --------------- | ------ |
| public.*.funding_rate       | pubic.*.funding_rate       | allowd   |
| public.contract_code1.funding_rate | public.*.funding_rate        |allowed   |
| public.contract_code1.funding_rate | public.contract_code1.funding_rate | allowed   |
| public.contract_code1.funding_rate | public.contract_code2.funding_rate  | not allowed |
| public.*.funding_rate       | public.contract_code1.funding_rate  | not allowed |

### Note

 - Funding rate will be pushed every 60 seconds by default.Funding rate will not be calculated under conditions below:

- the contract can't be traded.eg:Pending Listing、Suspension、Delisting、In settlement、Delivering、Settlement Completed、Delivered,etc.  
- the 'update_time' field of index data hasn't been changed over 5 minutes.
- the 'update_time' field of orderbook data hasn't been changed over 5 minutes.
- If the value is equal to last value over 5 continuous counts calculated by md5 of 150 bids data and 150 asks data. 

## Subscribe Contract Info (no authentication)（sub）

To subscribe contract infodata, the client has to make connection to the server and send subscribe request in the format below:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "public.$contract_code.contract_info"`
  
  `}`

> example of unsubscribing funding rate::

```json
                                
{                                    
  "op": "sub",                     
  "topic": "public.btc-usd.contract_info",   
  "cid": "40sG903yz80oDFWr"          
}                                    
``` 

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.contract_info.; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD"  |


###  Response example：

```json

{
    "op":"notify",
    "topic":"public.BTC-USD.contract_info",
    "ts":1603879734428,
    "event":"snapshot",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USD",
            "contract_size":100,
            "price_tick":0.1,
            "settlement_date":"1603900800000",
            "create_date":"20200325",
            "contract_status":1
        }
    ]
}
```

### Response data fields

| Field Name |Type   | Description                                              |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op   |  string  | value: "notify";    |   |
| topic   | string  | topic subscribed   |   |
| ts   | long  | timestamp of server response.unit: millionseconds   |   |
| event   | string  | event ："init", "update", "snapshot"  |
| \<data\>   | object array |     |    |
| symbol |string | symbol,"BTC","ETH"... |
| contract_code  | string   |  contract_code,"BTC-USD"  |
| contract_size  | decimal | Contract Value (USD of one contract). such as 10,100| 10, 100... |
| price_tick  | decimal | Minimum Variation of Contract Price ： 0.001, 0.01... |
| settlement_date  |  string  | settlement date ：such as "1490759594752"  |
| create_date   |  string  | Contract Listing Date ：such as "20180706" |
| contract_status      |  int     | contract status：0: Delisting,1: Listing,2: Pending Listing,3: Suspension,4: Suspending of Listing,5: In Settlement,6: Delivering,7: Settlement Completed,8: Delivered |
| \</data\>   | object array |     |    |


### Note：


- The websocket subscription of contract info event is pushed every 60 seconds, and the event is "snapshot". 
- When the subscription is successful, the latest contract information will be pushed immediately, and the event is "init".
- After the subscription is successful, when the contract information changes, the latest contract information will be pushed. When multiple fields changes simultaneously, only the latest contract information will be pushed, and the event is update.
- When the contract status is "delivery completed", the next settlement time of the contract is an empty string.
- Only when the status is 1(Listing),  can it be traded normally, other statuses are not tradable;

## Unsubscribe Contract Info Data(no authentication)(unsub)

- To unsubscribe contract info data, the client has to make connection to the server and send subscribe request in the format below:

### request format of unsubscribing contract info

  `{`
  
  `"op": "unsub",`
  
  `"topic": "public.$contract_code.contract_info",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> example of unsubscribing contract info::

```json
                                 
{                                    
  "op": "unsub",                     
  "topic": "public.BTC-USD.contract_info",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### request field desc of unsubscrbing contract info

| field | datatype  | desc                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | Required; Operator Name，subscribe value is unsub;                 |
| cid      | string | Optional;   Client requests unique ID                        |
| topic    | string | Subscribe topic name，Require subscribe public.$contract_code.contract_info Subscribe/unsubscribe the data of a given contract code; when the $contract_code value is *, it stands for subscribing/unsubscribing all the funding rates of contract codes，; |

### Data format of subscription and unsubscription of contract info

| subscribe(sub)      | unsubscribe(unsub) | rules   |
| -------------- | --------------- | ------ |
| public.*.contract_info       | pubic.*.contract_info       | Allowed   |
| public.contract_code1.contract_info | public.*.contract_info        | Allowed   |
| public.contract_code1.contract_info | public.contract_code1.contract_info | Allowed   |
| public.contract_code1.contract_info | public.contract_code2.contract_info  | Not Allowed |
| public.*.contract_info       | public.contract_code1.contract_info  | Not Allowed |


## Subscribe trigger orders updates(sub)

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

  `{`
  
  `"op": "sub",`
  
  `"cid": "id generated by client",`
  
  `"topic": "trigger_order.$contract_code"`
  
  `}`
  
> Example of a successful return data:

```json

{
  "op": "sub",
  "topic": "trigger_order.BTC-USD",
  "cid": "40sG903yz80oDFWr"
}

```

### Request Parameter

| Parameter Name    | Mandotary | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | Required； Operator Name，required subscribe value is  sub	 |  |
| cid | false| string | Optional; ID Client requests unique ID	 | |
| topic | true| string | Required；format: trigger_order.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" | |

> **Return example**:

```json

{
    "op":"notify",
    "topic":"trigger_order.theta-usd",
    "ts":1603880263724,
    "event":"order",
    "uid":"123456789",
    "data":[
        {
            "symbol":"THETA",
            "contract_code":"THETA-USD",
            "trigger_type":"le",
            "volume":20,
            "order_type":1,
            "direction":"buy",
            "offset":"open",
            "lever_rate":20,
            "order_id":7002244,
            "order_id_str":"7002244",
            "relation_order_id":"-1",
            "order_price_type":"limit",
            "status":2,
            "order_source":"web",
            "trigger_price":0.59,
            "triggered_price":null,
            "order_price":0.59,
            "created_at":1603880263721,
            "triggered_at":0,
            "order_insert_at":0,
            "canceled_at":0,
            "fail_code":null,
            "fail_reason":null
        }
    ]
}

```

### Format Illustration on return data of order push：

| Parameter Name    |   Mandotary  |   Type   |   Desc   |   Value Range   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- |
| op | true |  string | Required;Operator Name，Order push value is notify | |
| topic | true |  string | Required; Order push topic | |
| ts     | true | long    | Time of Respond Generation, Unit: Millisecond  |     |
| uid     | true | string    | account uid   |     |
| event | true  | string | Event notification description |  trigger order placed successfully（order），trigger order canceled successfully（cancel），order triggered successfully（trigger_success），order failed to be triggered（trigger_fail）  |
| \<data\> |   true   |  object array   |   |   |
| symbol                 | true | string  | Variety code               |                                          |
| contract_code          | true | string  | contract code                | "BTC-USD" ...                          |
| trigger_type              | true | string  | trigger type： `ge` great than or equal to；`le` less than or equal to  |              |
| volume                 | true | decimal  | trigger order volume |      |
| order_type           | true | int | Transaction Type               |  1. Place orders    |
| direction            | true | string | order direction        |       [buy,sell]          |
| offset         | true | string | offset direction           |             [open,close]            |
| lever_rate            | true | int    | Leverage              |                         |
| order_id      | true | decimal |  trigger order ID                |                                          |
| order_id_str             | true | string | the order ID with string            |                                          |
| relation_order_id             | true | string | Relation order ID is the string related to the limit orders, The value is -1 before the trigger orders executed.  |         |
| order_price_type        | true  | string | Order price type  |     "limit": limit order，"optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20    |
| status        | true  | int | order status|   2. Ready to submit the orders;  4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched;    |
| order_source      | true | string  | Order Source      |                                          |
| trigger_price         | true | decimal  |trigger price   |       |
| triggered_price         | true | decimal  | the price when trigger orders executed     |       |
| order_price           | true | decimal  | the preset price by the client   |                                          |
| created_at        | true  | long | order creation time |                      |
| triggered_at        | true  | long | the execution time when orders getting triggered |                      |
| order_insert_at        | true  | long | the time when the triggered orders filled successfully |                      |
| canceled_at        | true  | long | Order cancelation time |                      |
| fail_code        | true  | int | the error code when the triggered orders failed to be filled |                      |
| fail_reason        | true  | string | the error message with failure reason when triggered orders failed to filled |                      |
| \</data\>   |      |         |        |       |

#### Rules:

- The intermediate states processed by the order status system will not be pushed, such as in the progress of placing an order, The descriptions of specific event notifications are as below: 
   -  when the order status is 2（Submitted），event notification is order（trigger order placed successfully）；
   -  when the order status is 4（Order placed successfully），event notification is trigger_success（trigger order triggered successfully）；
   -  when the order status is 6（Canceled），event notification is cancel（trigger order canceled successfully）；
   -  when the order status is 5（Order failed to be placed），event notification is trigger_fail（trigger order failed to be triggered）；
- Single coin cannot be re-suscribed, and all coins subscription can cover single coin subscription; single coin cannot be subscribed after subscribing all coins. 


## Unsubscribe trigger orders updates（unsub）

To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

### Format of Unsubscribe order data

  `{`
  
  `"op": "unsub",`
  
  `"topic": "trigger_order.$contract_code",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> Example of a successful unsubscribe request:

```json
                                  
{                                    
  "op": "unsub",                     
  "topic": "trigger_order.BTC-USD",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### Format illustration of unsubscribe order data

| Filed | Type   | Description                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                           |
| topic    | string | Optional; Unsubscribe Topic Name，format: trigger_order.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USD" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)     | Unsubscribe( unsub) | Rule   |
| -------------- | --------------- | ------ |
| trigger_order.*       | trigger_order.*      | Allowed   |
| trigger_order.contract_code1 | trigger_order.*       | Allowed   |
| trigger_order.contract_code1 | trigger_order.contract_code1 | Allowed   |
| trigger_order.contract_code1 | trigger_order.contract_code2  | Not Allowed |
| trigger_order.*       | trigger_order.contract_code1  | Not Allowed |

# WebSocket interface for system status updates 

 - The websocket url of system status updates is : wss://api.hbdm.com/center-notification

##  Subscribe system status updates 

### After successfully establishing a connection with the WebSocket API, users could send data in the following format to the server to request data:

  `{`
  
      `"op": "sub",`
  
      `"cid": "id generated by client",`
  
      `"topic ": "public.$service.heartbeat"`
  
  `} `

> Example on using parameters to request data: 

```json

{
	"op": "sub",
	"cid": "id generated by client",
	"topic ": "public.swap.heartbeat"
}
```

### **Request Parameter**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | The fixed value of subscription is sub	 |  |
| cid | false| string | Client requests a unique ID	 | |
| topic | true| string | Subscription topic name is required (public.$service.heartbeat), Subscribe system status information of a certain business | |

### **Subscription parameter description**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| service | true | string |Business Code	 | swap |


> **Return Parameter Example**:

```json

{
    "op": "notify",
    "topic": "public.swap.heartbeat",
    "event": "init",
    "ts":1580815422403,
    "data":{
        "heartbeat": 0,
        "estimated_recovery_time": 1408076414000
    }
}

```

### **Return Parameter Rules**：
| Name   |Mandatory | Type     | Desc   | Value Range           |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | Operation name, the fixed value of push is notify;  |   |
| topic   | true | string  | Push topic   |   |
| event   | true | string  | Description on notification related event | The initial system status information returned by a successful subscription (init), triggered by system status change (update) |
| ts   | true | long  | Server response timestamp   |   |
| \<data\> |  | |  | |
| heartbeat | true | int | System Status	 |  1 is available, 0 is not available |
| estimated_recovery_time | true | long |  Estimated system recovery time, unit: millisecond	 |  When the system status is available, return NULL |
| \</data\> | | |  | |

### Note
- Since this push is a poll query status, there may be a delay of 1-2 seconds.

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
| orders.$contract_code | sub,ubsub    | Subscribe/unsubscribe the order data of a given pair; when the $contract_code value is *, it stands for subscribing/unsubscribing the data of all pairs |

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
