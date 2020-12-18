---
title: Huobi USDT Margined Swap API Reference

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

Welcome to the Huobi USDT Margined Swap API! You can use our API to access all market data, trading, and account management endpoints.

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

## 1.0.5 2020-12-18 【Newly added：Added WS interface for subscribing system status updates push】

### 1.Added WS interface for subscribing system status updates push
  - Interface name: [General]subscribe system status updates
  - Interface type: public
  - Subscription topic：public.$service.heartbeat

## 1.0.4 2020-12-11 【1-33 Added interfaces for cross margin mode. 34-60 Added fields to modify interface】

### 1、Added Cross Margin Mode Query Information On Tiered Adjustment Factor

  - Interface Name：[Cross]Query Information On Tiered Adjustment Factor

  - Interface Type：public

  - Interface URL：/linear-swap-api/v1/swap_cross_adjustfactor

### 1、Added Cross Margin Mode Query Information On Transfer State

  - Interface Name：[Cross]Query Information On Transfer State

  - Interface Type：public

  - Interface URL：/linear-swap-api/v1/swap_cross_transfer_state  

### 1、Added Cross Margin Mode Query Information On Trade State

  - Interface Name：[Cross]Query Information On Trade State

  - Interface Type：public

  - Interface URL：/linear-swap-api/v1/swap_cross_trade_state 

### 1、Added Cross Margin Mode Query User's Account Information

  - Interface Name：[Cross]Query User's Account Information

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_account_info     

### 1、Added Cross Margin Mode Query User's Position Information

  - Interface Name：[Cross]Query User's Position Information

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_position_info 

### 1、Added Cross Margin Mode Query Assets Information Of All Sub-Accounts Under The Master Account

  - Interface Name：[Cross]Query Assets Information Of All Sub-Accounts Under The Master Account

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_sub_account_list  

### 7、Added Cross Margin Mode Query A Sub-Account's Assets Information

  - Interface Name：[Cross]Query A Sub-Account's Assets Information

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_sub_account_info 

### 8、Added Cross Margin Mode Query A Sub-Account's Position Information

  - Interface Name：[Cross]Query A Sub-Account's Position Information

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_sub_position_info   

### 9、Added Cross Margin Mode Query Information On Transfer Limit

  - Interface Name：[Cross]Query Information On Transfer Limit

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_transfer_limit 

### 10、Added Cross Margin Mode Query Information On Position Limit

  - Interface Name：[Cross]Query Information On Position Limit

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_position_limit

### 11、Added Cross Margin Mode Query Assets And Positions

  - Interface Name：[Cross]Query Assets And Positions

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_account_position_info 

### 12、Added Cross Margin Mode Query User’s Available Leverage

  - Interface Name：[Cross]Query User’s Available Leverage

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_available_level_rate  

### 13、Added Cross Margin Mode Switch Leverage

  - Interface Name：[Cross]Switch Leverage

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_switch_lever_rate  

### 14、Added Cross Margin Mode Place An Order 

  - Interface Name：[Cross]Place An Order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_order  

### 15、Added Cross Margin Mode Place A Batch Of Orders

  - Interface Name：[Cross]Place A Batch Of Orders

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_batchorder 

### 16、Added Cross Margin Mode Cancel An Order

  - Interface Name：[Cross]Cancel An Order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_cancel  

### 17、Added Cross Margin Mode Cancel All Orders

  - Interface Name：[Cross]Cancel All Orders

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_cancelall 

### 18、Added Cross Margin Mode Get Information of order

  - Interface Name：[Cross]Get Information of order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_order_info  

### 19、Added Cross Margin ModeGet Detail Information of order

  - Interface Name：[Cross]Get Detail Information of order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_order_detail  

### 20、Added Cross Margin Mode Current unfilled order acquisition

  - Interface Name：[Cross]Current unfilled order acquisition

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_openorders  

### 21、Added Cross Margin Mode Get History Orders

  - Interface Name：[Cross]Get History Orders

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_hisorders 

### 22、Added Cross Margin Mode Get History Match Results

  - Interface Name：[Cross]Get History Match Results

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_matchresults   

### 23、Added Cross Margin Mode Place Lightning Close Position

  - Interface Name：[Cross]Place Lightning Close Position

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_lightning_close_position 

### 24、Added Cross Margin Mode Place Trigger Order

  - Interface Name：[Cross]Place Trigger Order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_trigger_order   

### 25、Added Cross Margin Mode Cancel Trigger Order

  - Interface Name：[Cross]Cancel Trigger Order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_trigger_cancel 

### 26、Added Cross Margin Mode Cancel All Trigger Orders

  - Interface Name：[Cross]Cancel All Trigger Orders

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_trigger_cancelall  

### 27、Added Cross Margin Mode Query Open Trigger Order

  - Interface Name：[Cross]Query Open Trigger Order

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_trigger_openorders  

### 28、Added Cross Margin Mode Query Trigger Order History

  - Interface Name：[Cross]Query Trigger Order History

  - Interface Type：private

  - Interface URL：/linear-swap-api/v1/swap_cross_trigger_hisorders 

### 29、Added Cross Margin Mode Subscribe Order Data

  - Interface Name：[Cross]Subscribe Order Data

  - Interface Type：private

  - Subscription topic：orders_cross.$contract_code 

### 30、Added Cross Margin Mode Subscribe Account Equity Updates Data

  - Interface Name：[Cross]Subscribe Account Equity Updates Data

  - Interface Type：private

  - Subscription topic：accounts_cross.$margin_account  

### 31、Added Cross Margin Mode Subscribe Position Updates

  - Interface Name：[Cross]Subscribe Position Updates

  - Interface Type：private

  - Subscription topic：positions_cross.$contract_code   

### 32、Added Cross Margin Mode Subscribe Match Order Data

  - Interface Name：[Cross]Subscribe Match Order Data

  - Interface Type：private

  - Subscription topic：matchOrders_cross.$contract_code 

### 33、Added Cross Margin Mode Subscribe trigger orders updates

  - Interface Name：[Cross]Subscribe trigger orders updates

  - Interface Type：private

  - Subscription topic：trigger_order_cross.$contract_code

### 34、Query Swap Info Added fields (added “support_margin_mode” parameter; added “support_margin_mode” in return parameter “data” to represent the margin mode that a contract supports.)

  - Interface Name：Query Swap Info

  - Interface Type：public

  - Interface URL：linear-swap-api/v1/swap_contract_info

### 35、Query information on Tiered Adjustment Factor Added fields for return parameters ( added “margin_mode” to represent margin mode) 

  - Interface Name：Query information on Tiered Adjustment Factor

  - Interface Type：public

  - Interface URL：/linear-swap-api/v1/swap_adjustfactor

### 36、Query information on system status Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query information on system status

  - Interface Type：public

  - Interface URL：/linear-swap-api/v1/swap_api_state

### 37、Query User’s Account Information Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query User’s Account Information

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_account_info

### 38、Query a single sub-account's assets information Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query a single sub-account's assets information

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_sub_account_info

### 39、Query Assets And Positions Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query Assets And Positions

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_account_position_info

### 40、Query assets information of all sub-accounts under the master account Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query assets information of all sub-accounts under the master account

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_sub_account_list

### 41、Query User’s Position Information Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query User’s Position Information

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_position_info

### 42、Query a single sub-account's position information Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query a single sub-account's position information

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_sub_position_info

### 43、Query account financial records Added fields (added “contract_code” to represent contract code) 

  - Interface Name：Query account financial records

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_financial_record

### 44、Order details acquisition Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Order details acquisition

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_order_detail

### 45、Current unfilled order acquisition Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Current unfilled order acquisition

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_openorders

### 46、Get History Orders Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Get History Orders

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_hisorders

### 47、Acquire History Match Results Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Acquire History Match Results

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_matchresults

### 48、Query Trigger Order Open Orders Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query Trigger Order Open Orders

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_trigger_openorders

### 49、Query Trigger Order History Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query Trigger Order History

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_trigger_hisorders

### 50、Query information on Transfer Limit Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Query information on Transfer Limit

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_transfer_limit  

### 51、Query information on position limit Added fields for return parameters ( added “margin_mode” to represent margin mode) 

  - Interface Name：Query information on position limit

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_position_limit

### 52、Query user’s available leverage Added fields for return parameters ( added “margin_mode” to represent margin mode) 

  - Interface Name：Query user’s available leverage

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_available_level_rate  

### 53、Switch Leverage Added fields for return parameters ( added “margin_mode” to represent margin mode) 

  - Interface Name：Switch Leverage

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_switch_lever_rate

### 54、Subscribe Order Data Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Subscribe Order Data

  - Interface Type：private

  - Subscription topic：orders.$contract_code

### 55、Subscribe Match Order Data Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Subscribe Match Order Data

  - Interface Type：private

  - Subscription topic：matchOrders.$contract_code

### 56、Subscribe trigger orders updates Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Subscribe trigger orders updates

  - Interface Type：private

  - Subscription topic：trigger_order.$contract_code

### 57、Subscribe Position Updates Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Subscribe Position Updates

  - Interface Type：private

  - Subscription topic：positions.$contract_code

### 58、Subscribe Account Equity Updates Data Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Subscribe Account Equity Updates Data

  - Interface Type：private

  - Subscription topic：accounts.$contract_code

### 59、Subscribe Contract Info (no authentication) Added fields for return parameters ( added “support_margin_mode” to represent support margin mode) 

  - Interface Name：Subscribe Contract Info (no authentication)

  - Interface Type：public

  - Subscription topic：public.$contract_code.contract_info

### 60、Get Information of an Order Added fields for return parameters (added “margin_account” for return parameters to represent margin account; added “margin_mode” to represent margin mode) 

  - Interface Name：Get Information of an Order

  - Interface Type：private

  - Interface URL：linear-swap-api/v1/swap_order_info


## 1.0.3 2020-12-02 【Modified “Order details acquisition” interface (When querying cancelation data of orders that have not been partially filled, if “created_at” and “order_type” parameters are not uploaded, the data that can be queried reduced from last 12 hours to last 2 hours.); modified “Query history orders” interface (When querying cancelation data of orders that have not been partially filled, the data that can be retained reduced from last 24 hours to last 2 hours.)】

### 1、Modified “Order details acquisition” interface (When querying cancelation data of orders that have not been partially filled, if “created_at” and “order_type” parameters are not uploaded, the data that can be queried reduced from last 12 hours to last 2 hours.)

   - Interface Name：Order details acquisition

   - Interface Type：private

   - Interface URL：linear-swap-api/v1/swap_order_detail

### 2、modified “Query history orders” interface (When querying cancelation data of orders that have not been partially filled, the data that can be retained reduced from last 24 hours to last 2 hours.)

   - Interface Name：Get History Orders

   - Interface Type：private

   - Interface URL：linear-swap-api/v1/swap_hisorders

## 1.0.2 2020-11-24 【 Added: Query historical settlement records of the platform interface. Modified:  Added fields of return parameter for "Query Liquidation Orders" interface and "Subscribe Liquidation Order Data" interface】

### 1、Added “Query historical settlement records of the platform” interface 

  - Interface Name: Query historical settlement records of the platform
  
  - Interface Type: public
  
  - Interface URL: linear-swap-api/v1/swap_settlement_records

### 2、Added fields of return parameter for "Query Liquidation Orders" interface（“amount” and “trade_turnover”  are added for return parameter “data". "amount" represents the liquidation amount (token); “trade_turnover” represents the liquidation amount (quotation token) ）
 
  - Interface Name: Query Liquidation Orders
 
  - Interface Type: public
 
  - Interface URL: linear-swap-api/v1/swap_liquidation_orders


### 3、Added fields of return parameter for "Subscribe Liquidation Order Data" interface（“amount” and “trade_turnover”  are added for return parameter “data". "amount" represents the liquidation amount (token); “trade_turnover” represents the liquidation amount (quotation token)）
 
  - Interface Name: Subscribe Liquidation Order Data
 
  - Interface Type: public
 
  - Subscription topic: public.$contract_code.liquidation_orders

## 1.0.1 2020-10-29 【Updated: websocket messages of account topic will be pushed when leverage switch succeeds; websocket messages of position topic will be pushed when leverage switch succeeds;】

### 1、Subscribe Account Equity Updates Data（Return parameters added “switch_lever_rate” event type to represent switching leverages. When the leverage is successfully switched, a latest information on assets will be pushed with event “switch_lever_rate".）
   
   -  Interface Name：Subscribe Account Equity Updates Data

   - Interface Type：private

   - Subscribe topic：accounts.$contract_code

### 2、Subscribe Position Updates（Return parameters added “switch_lever_rate” event type to represent switching leverages. When the leverage is successfully switched, a latest information on positions will be pushed with event “switch_lever_rate" (the information will not be pushed when the user's position is 0).）
   
   - Interface Name：Subscribe Position Updates

   - Interface Type：private

   - Subscribe topic：positions.$contract_code

## 1.0.0 2020-10-26 14:00(GMT+8)
 
# Swap API Access Guide

##  API List

permission type  |  Content Type  | Interface Mode |  Context           |   Request Type   |   Desc          | Signature Required   |
---------------- |  ------------- | ---------------|------------------- |  --------------- |---------------- |  ------------------  |
 Read  | Market Data | general | linear-swap-api/v1/swap_contract_info                             | GET    |      Get Contracts Information                          |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_index                                     | GET    |      Get contract Index Price Information                    |       No          |                     
 Read  | Market Data | general | linear-swap-api/v1/swap_price_limit                               | GET    |      Get Contract Price Limits           |       No          |           
 Read  | Market Data | general | linear-swap-api/v1/swap_open_interest                             | GET    |      Get Contract Open Interest Information             |       No          |            
 Read  | Market Data | general | linear-swap-api/v1/swap_risk_info                                 | GET    |      Query information on contract insurance fund balance and estimated clawback rate     |       No          |
 Read  | Market Data | general | inear-swap-api/v1/swap_insurance_fund                            | GET    |      Query history records of insurance fund balance               |       No          |
 Read  | Market Data | isolated margin | linear-swap-api/v1/swap_adjustfactor                              | GET    |      Query information on Tiered Adjustment Factor                |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_his_open_interest                         | GET    |      Query information on open interest                      |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_elite_account_ratio                       | GET    |      Query Top Trader Sentiment Index Function-Account          |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_elite_position_ratio                      | GET    |      Query Top Trader Sentiment Index Function-Position        |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_liquidation_orders                        | GET    |      Query Liquidation Order Information       |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_settlement_records                       | GET    |      Query historical settlement records of the platform interface       |       No          |
 Read  | Market Data | isolated margin | linear-swap-api/v1/swap_api_state                                 | GET    |      Query information on system status                      |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_funding_rate                              | GET    |      Query funding rate                 |       No          |
 Read  | Market Data | general | linear-swap-api/v1/swap_historical_funding_rate                   | GET    |      Query Historical Funding Rate             |       No          |
 Read  | Market Data | general | linear-swap-ex/market/depth                                       | GET    |      Get Market Depth                     |       No          |
 Read  | Market Data | general | linear-swap-ex/market/history/kline                               | GET    |      Get KLine Data                          |       No          |
 Read  | Market Data | general | linear-swap-ex/market/detail/merged                               | GET    |      Get Market Data Overview                        |       No          |
 Read  | Market Data | general | index/market/history/linear_swap_basis                            | GET    |      Query Basis Data                        |       No          |
 Read  | Market Data | general | index/market/history/linear_swap_premium_index_kline              | GET    |      Query Liquidation Order Information                 |       No          |
 Read  | Market Data | general | index/market/history/linear_swap_estimated_rate_kline             | GET    |      Query Swap Market Data interface           |       No          |
 Read  | Market Data | general | linear-swap-ex/market/trade                                       | GET    |      Query The Last Trade of a Contract                |       No          |
 Read  | Market Data | general | linear-swap-ex/market/history/trade                               | GET    |      Query a Batch of Trade Records of a Contract               |     No         |
 Read  | Market Data | cross margin | linear-swap-api/v1/swap_cross_adjustfactor                          | GET    |     Query Information On Tiered Adjustment Factor                                                |       No          |
 Read  | Market Data | cross margin | linear-swap-api/v1/swap_cross_transfer_state                        | GET    |     Query Information On Transfer State                        |       No          |
 Read  | Market Data | cross margin | linear-swap-api/v1/swap_cross_trade_state                           | GET    |     Query Information On Trade State                        |       No          |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_account_info                              | POST   |      Query User’s Account Information                |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_position_info                             | POST   |      Query User’s position Information               |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_available_level_rate                      | POST   |      Query user’s available leverage              |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_sub_account_list                          | POST   |      Query assets information of all sub-accounts under the master account (Query by coins)       |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_sub_account_info                          | POST   |      Query a single sub-account's assets information     |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_sub_position_info                         | POST   |      Query a single sub-account's position information      |     Yes        |
 Read  | Account    | general | linear-swap-api/v1/swap_financial_record                          | POST   |      Query account financial records                     |     Yes        |
 Read  | Account    | general | linear-swap-api/v1/swap_order_limit                               | POST   |      Query contract information on order limit              |     Yes        |
 Read  | Account    | general | linear-swap-api/v1/swap_fee                                       | POST   |      Query information on contract trading fee             |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_transfer_limit                            | POST   |      Query information on Transfer Limit               |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_position_limit                            | POST   |      Query information on position limit             |     Yes        |
 Read  | Account    | isolated margin | linear-swap-api/v1/swap_account_position_info                     | POST   |      Query Assets And Positions               |     Yes        |
Trade  | Account    | general | linear-swap-api/v1/swap_master_sub_transfer                       | POST   |      Transfer between master account and sub-accounts                         |     Yes        |
 Read  | Account    | general | linear-swap-api/v1/swap_master_sub_transfer_record                | POST   |      Query transfer records of master account    |     Yes        |
Trade  | Account    | general | linear-swap-api/v1/swap_transfer_inner                            | POST   |      Transfer between different margin accounts under the same account          |     Yes        |
 Read  | Account    | general | linear-swap-api/v1/swap_api_trading_status                        | GET    |      Query user's API indicator disable information              |     Yes        |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_account_info                          | POST    |    Query User's Account Information              |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_position_info                         | POST    |    Query User's Position Information               |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_sub_account_list                      | POST    |    Query Assets Information Of All Sub-Accounts Under The Master Account       |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_sub_account_info                      | POST    |    Query A Sub-Account's Assets Information   |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_sub_position_info                     | POST    |    Query A Sub-Account's Position Information    |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_transfer_limit                        | POST    |    Query Information On Transfer Limit           |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_position_limit                        | POST    |    Query Information On Position Limit        |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_account_position_info                 | POST    |    Query Assets And Positions          |       Yes          |
 Read  | Account    | cross margin | linear-swap-api/v1/swap_cross_available_level_rate                   | POST    |    Query User’s Available Leverage        |       Yes          |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_order                                     | POST   |      Place an Order                              |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_batchorder                                | POST   |      Place a Batch of Orders                         |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_switch_lever_rate                         | POST   |      Switch Leverage               |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_cancel                                    | POST   |      Cancel an Order                          |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_cancelall                                 | POST   |      Cancel All Orders                       |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_order_info                                | POST   |      Get Information of an Order               |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_order_detail                              | POST   |      Get Trade Details of an Order           |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_openorders                                | POST   |      Get Current Orders         |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_hisorders                                 | POST   |      Get History Orders               |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_matchresults                              | POST   |      Acquire History Match Results           |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_lightning_close_position                  | POST   |      Place Lightning Close Order                    |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_trigger_order                             | POST   |      Place an Trigger Order                      |     Yes         |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_trigger_cancel                            | POST   |      Cancel a Trigger Order                     |     Yes        |
Trade  | Trade      | isolated margin | linear-swap-api/v1/swap_trigger_cancelall                         | POST   |      Cancel all trigger Orders                 |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_trigger_openorders                        | POST   |      Get all open trigger Orders                 |     Yes        |
 Read  | Trade      | isolated margin | linear-swap-api/v1/swap_trigger_hisorders                         | POST   |      Get all history trigger Orders                 |     Yes        |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_switch_lever_rate                     | POST    |    Switch Leverage         |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_order                                 | POST    |    Place An Order           |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_batchorder                            | POST    |    Place A Batch Of Orders        |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_cancel                                | POST    |    Cancel An Order       |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_cancelall                             | POST    |    Cancel All Orders     |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_order_info                            | POST    |    Get Information of order             |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_order_detail                          | POST    |    Get Detail Information of order         |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_openorders                            | POST    |    Current unfilled order acquisition       |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_hisorders                             | POST    |    Get History Orders             |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_matchresults                          | POST    |    Get History Match Results         |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_lightning_close_position              | POST    |    Place Lightning Close Position           |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_trigger_order                         | POST    |    Place Trigger Order           |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_trigger_cancel                        | POST    |    Cancel Trigger Order           |       Yes          |
Trade  | Trade    | cross margin | linear-swap-api/v1/swap_cross_trigger_cancelall                     | POST    |    Cancel All Trigger Orders       |       Yes          |
 Read  | Trade    | cross margin | linear-swap-api/v1/swap_cross_trigger_openorders                    | POST    |    Query Open Trigger Order       |       Yes          |
 Read  | Trade    | cross margin | inear-swap-api/v1/swap_cross_trigger_hisorders                     | POST    |    Query Trigger Order History       |       Yes          | 
Trade  | Account  | general |https://api.huobi.pro/v2/account/transfer                         | POST   |      Transfer margin between Spot account and USDT Margined Swap account     |     Yes       |



##  Address

Address | Applicable sites | Applicable functions | Applicable trading pairs |
------ | ---- | ---- | ------ |
https://api.hbdm.com  | Huobi USDT Margined Swap |  API       | Trading pairs provided by Huobi USDT Margined Swap  |

### Notice

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

## Signature Authentication & Verification

### Signature Guide

Considering that API requests may get tampered in the process of transmission, to keep the transmission secure, you have to use your API Key to do Signature Authentication for all private interface except for public interface (used for acuqiring basic information and market data), in this way to verify whether the parameters/ parameter value get tampered or not in the process of transmission

A legitimate request consists of following parts：

- Request address of method, i.e. visit server address--api.hbdm.com, e.g.:  api.hbdm.com/linear-swap-api/v1/swap_order

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

Normative request for Signature calculation Different contents will get totally different results when use HMAC to calculate Signature, therefore, please normalize the requests before doing Signature calculation. Take the request of inquering order details as an example:

query details of one order 

`https://api.hbdm.com/linear-swap-api/v1/swap_order?`

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
/linear-swap-api/v1/swap_order\n
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

`/linear-swap-api/v1/swap_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. Use the "request character strings" formed in the last step and your Secret Key to create a digital Signature.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. Take the request character string formed in the last step and API Secret Key as two parameters, encoding them with the Hash Function HmacSHA256 to get corresponding Hash value.

2. Encoding the Hash value with base-64 code, the result will be the digital Signature of this request.

#### 9. Add the digital Signature into the parameters of request path.

The final request sent to Server via API should be like:

`https://api.hbdm.com/linear-swap-api/v1/swap_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. Add all the must authentication parameters into the parameters of request path;

2. Add the digital Signature encoded with URL code into the path parameters with the parameter name of "Signature".

## API Rate Limit Illustration

Future, Coin Margined Swap,Option Swap and USDT Margined Swap are using separate API rate limits.

Please note that, for both public interface and private interface, there are rate limits, more details are as below:

* Generally, the private interface rate limit of API key is at most 45 times every 3 second for each UID (this 45 times every 3 second rate limit is shared by all the altcoins contracts).

* For public interface used to get information of index, price limit, settlement, delivery, open positions and so on, the rate limit is 120 times every 3 second at most for each IP (this 120 times every 3 second public interface rate limit is shared by all the requests from that IP of non-marketing information, like above).

* For public interface to get market data such as  Get Kline data, Get Market Data Overview, Get Contract Information,Get market in-depth data, Get premium index Kline, Get real-time forecast capital rate kline, Get basis data, Get the last Trade of a Contract and so on：

    （1）For restful interfaces, products,  (future, coin margined swap, usdt margined swap and option)800 times/second for one IP at most

    （2）For websocket: The rate limit for “req” request is 50 times at once. No limit for “sub” request as the data will be pushed by sever voluntarily.

* WebSocket, the private order push interface, requires API KEY Verification:

    Each UID can build at most create 30 WS connections for private order push at the same time. For each account, 
    contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS 
    order push connection for BTC Contract which will automatically push orders of BTC-USDT
    contracts. Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

* Will response following string for "header" via api 

    ratelimit-limit: the upper limit of requests per time, unit: times

    ratelimit-interval: reset interval (reset the number of request), unit: ms

    ratelimit-remaining: the left available request number for this round, unit: times

    ratelimit-reset: upper limit of reset time used to reset request number, unit: ms 

    When API Limitation on Order Cancellation Ratio is triggered,the following string for "header" via api will also be returned:

    recovery-time: recovery timestamp, whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp;

    if you are not in the prohibition period, the field is not included in returned header;

## API Limitation on Order Cancellation Ratio(unavailable now)

* The system will calculate the order cancellation ratio automatically when the total number of orders placed via certain order price types by the API user goes equal to or larger than 3,000 within 10 minutes. If the order cancellation ratio is greater than 99%, the user will be prohibited for 5 minutes from placing orders via certain API order price types which will be listed below (The response of placing orders will return: 1084  Your contract API is disabled, please try again after {0} (GMT+8).).
* A 30-minute API order placement prohibition will be triggered if the user was prohibited for 3 times within an hour (The response of placing orders will return: 1084  Your contract API is disabled, please try again after {0} (GMT+8).). After resuming access, the total number of prohibited times will be cleared during the previous period and will not be counted into the total prohibited times in the new period.
* Please note that the prohibition from placing orders will cause no effect on order cancellation via API as well as order placement and cancellation via other terminals. We’ll keep you notified on each prohibition via SMS and email.
* Only four API order price types will be prohibited which are Limit order, Post_only, FOK and IOC. Please note that you can still use freely other order price types during the banned period, such as Lightning Close, BBO, Optimal 5, Optimal 10 and Optimal 20, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok,etc.
- The response header returned by HTTP request:
    - When placing order by using the four prohibited order price types during the prohibition period, the message header returned by interface will include the field: "recovery-time: recovery timestamp" whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp; if you are not in the prohibition period, the field is not included in returned header;
    - Please note that our system calculates order cancellation ratio according to UID and therefore, the master account UID and sub-accounts UIDs will be counted separately. The calculation period is 10 min/time(The start time starts at 00:00 and the end time is 00:10. Every 10 minutes is a cycle.).
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
 
## Maintenance with service suspended
During the maintenance of the business system, in addition to the below two interfaces(<a href='https://docs.huobigroup.com/docs/usdt_swap/v1/en/#get-system-status'>Get system status</a >, <a href='https://docs.huobigroup.com/docs/usdt_swap/v1/en/#query-whether-the-system-is-available'>Query whether the system is available</a >) for users to query the system status, all “rest” interfaces of the API business will return this in a fixed manner:`{"status": "maintain"}`. During maintenance with service suspended，all websocket notify interfaces except subscribing system status updates（<a href='https://docs.huobigroup.com/docs/usdt_swap/v1/en/#query-whether-the-system-is-available'>Subscribe system status updates</a>）can't work，and will push 1006 error code to clients.

>Response

```json
{
    "status": "maintain"
}
``` 

### The two interfaces are:
- Get system status: https://status-linear-swap.huobigroup.com/api/v2/summary.json
- Query whether the system is available: https://api.hbdm.com/heartbeat/

Besides the above two rest interfaces, for getting the infomation that system maintenance with service suspended, could by subscrib system status updates websocket interface.

## Get system status

This endpoint allows users to get system status, Incidents and planned maintenance.

The system status can also be obtained through email, SMS, webhook, RSS/Atom feed. Users can You can click <a href='https://status-linear-swap.huobigroup.com/ '>here</a> to subscribe. The subscription function depends on Google services. Before you subscribe, please ensure that you can access Google services normally. 

```shell
curl "https://status-linear-swap.huobigroup.com/api/v2/summary.json"
```

### HTTP Request

- GET `https://status-linear-swap.huobigroup.com/api/v2/summary.json`

### Request Parameters

No parameter is available for this endpoint.

> Response:

```json
{
  "page": {  // Basic information of status page
    "id": "p0qjfl24znv5",  // page id
    "name": "Huobi Futures-USDT-margined Swaps",  // page name
    "url": "https://status-linear-swap.huobigroup.com", // page url
    "time_zone": "Asia/Singapore", // time zone
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
| heartbeat             | int                   | future 1: avaiable 0: not available(maintenance with service suspended)
| swap_heartbeat             | int                   | coin margined swap 1: avaiable 0: not available(maintenance with service suspended)
| estimated_recovery_time             | long                   | null: normal. estimated recovery time :millionseconds.
| swap_estimated_recovery_time             | long                   | null: normal. coin margined swap estimated recovery time millionseconds.
| option_heartbeat             | int                   | option 1: avaiable 0: not available(maintenance with service suspended)
| option_estimated_recovery_time             | long                   | null: normal. option estimated recovery time :millionseconds.
| linear_swap_heartbeat             | long                   | USDT margined swap 1: avaiable 0: not available(maintenance with service suspended)
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
1000 | System error.
1001 | System is unprepared.
1002 | Query error.
1003 | Abnormal redis operation.
1004 | System busy. Please try again later.
1010 | Account doesn't exist.
1011 | The user's session doesn't exist.
1012 | The user's account doesn't exist.
1013 | This contract symbol doesn't exist.
1014 | This contract doesn't exist.
1015 | The index price does not exist.
1016 | The bid offer does not exist. Please input the price.
1017 |  Order doesn't exist.
1018 | Main account doesn't exist.
1019 | Main account doesn't exist in the sub-account white list.
1020 | The number of your sub-account exceeds the maximum. Please contact customer service.
1021 | Account open failed. Main account hasn’t opened contract trading account yet.
1030 | Input error.
1031 | Incorrect form source.
1032 | The number of access exceeded the limit.
1033 | Incorrect field of contract period.
1034 | Incorrect field of order price type.
1035 | Incorrect field of form direction.
1036 | Incorrect field of open long form.
1037 | The leverage is invalid. Please contact the customer service.
1038 | The order price exceeds the precision limit, please modify and order again.
1039 | Buy price must be lower than {0}{1}. Sell price must exceed {2}{3}.
1040 | Invalid amount, please modify and order again.
1041 | The order amount exceeds the limit ({0}Cont), please modify and order again.
1042 | Current positions have triggered position limits ({0}Cont). Please order after changing the amount.
1043 | Current positions have triggered position limits ({0}Cont). Please order after changing the amount.
1044 | Current positions have triggered position limits of our platform. Please order after changing the amount.
1045 | Unable to switch leverage due to open orders.
1046 | Abnormal service. Please try again later.
1047 | Insufficient margin available.
1048 | Insufficient close amount available.
1049 | Open a position with market price is not available.contracts
1050 | Customer's order number is repeated. Please try again later.
1051 | No orders to cancel.
1052 | The number exceeds the batch limit.
1053 | Unable to get the latest price range.
1054 | Unable to get the latest price.
1055 | The price is not reasonable, and the account equity will be less than 0 after placing this order. Please modify the price and place the order.
1056 | In settlement. Your order can’t be placed/withdrew currently.
1057 | Your order can’t be placed due to trading halt.
1058 | Your order can’t be placed due to trade suspension.
1059 | In delivery. Your order can’t be placed/withdrew currently.
1060 | Your order can’t be placed currently due to abnormal contracts status.
1061 | This order doesn't exist.
1062 | Cancelling. Please be patient.
1063 | The order has been executed.
1064 | The main key of order conflicts.
1065 | The form number of client isn't an integer.
1066 | {0} cannot be empty.
1067 | Illegal parameter {0}.
1068 | Export error.
1069 | The price is not reasonable.
1070 | Empty data, cannot be exported.
1071 | Repeated withdraw.
1072 |  Sell price must be lower than {0}{1}.
1073 | Position abnormal. Please contact the customer service.
1074 | Unable to order currently. Please contact the customer service.
1075 | The price is not reasonable, and the margin rate will be less than 0 after placing this order. Please modify the price and place the order.
1076 | No orders, please try again later.
1077 | In settlement or delivery. Unable to get assets of current contract.
1078 | In settlement or delivery. Unable to get assets of some contracts.
1079 | In settlement or delivery. Unable to get positions of current contract.
1080 | In settlement or delivery. Unable to get positions of some contracts.
1081 | The number of your {0} contract trigger orders exceeds the limit {1}.
1082 | Trigger type parameter error.
1083 | Your position is in the process of forced liquidation. Unable to place order temporarily.
1084 | Your contract API is disabled, please try again after {0} (GMT+8).
1085 | Trigger order failed, please modify the price and place the order again or contact the customer service.
1086 | {0} contract is restricted of opening positions on {1}.  Please contact customer service.
1087 | {0} contract is restricted of closing positions on {1}.  Please contact customer service.
1088 | {0} contract is restricted of withdraw order on {1}.  Please contact customer service.
1089 | Transfer is temporarily restricted for {0} account, please contact customer service support.
1090 | Margin rate is lower than 0. Order can’t be placed.
1091 | Equity is less than 0. Order can’t be placed.
1092 | The Flash Closing Order takes the {0}th price at the order book. After placing an order, the account equity will be less than 0. Please manually enter the price or place an order with the counterparty price.
1093 | The Flash Closing Order takes the {0}th price at the order book. The margin rate will be less than 0 after placing an order. Please manually enter the price or place an order with the counterparty price.
1094 | The leverage cannot be empty, please switch the leverage or contact customer service
1095 | Non-trading state, unable to switch the leverage temporarily
1100 | Unable to open a position currently. Please contact the customer service.
1101 | Unable to close a position currently. Please contact the customer service.
1102 | Unable to transfer in currently. Please contact customer service.
1103 | Unable to transfer out currently. Please contact customer service.
1104 | Trading is prohibited due to contracts trading constraints.
1105 | Only Close is available due to contracts trading constraints.
1106 | Delivery or settlement in progress, unable to transfer.
1108 | Abnormal service. Please try again later.
1109 | Sub-account doesn't own the permissions to open positions. Please contact customer service.
1110 | Sub-account  doesn't own the permissions to close positions. Please contact customer service.
1111 | Sub-account doesn't own the permissions to transfer in. Please contact customer service.
1112 | Sub-account doesn't own the permissions to transfer out. Please contact customer service.
1113 | The sub-account does not have transaction permissions. Please login main account to authorize.
1114 | The sub-account does not have transfer permissions. Please login main account to authorize.
1115 | You have no access permissions of this sub-account.
1200 | Login error. Please try again.
1220 | You don’t have access permission as you have not opened contracts trading.
1221 | The total balances of Exchange Account can't meet the requirements for opening contracts.
1222 | The days of opening account can't meet the requirements for opening contracts.
1223 | The VIP level can't meet the requirements for opening contracts.
1224 | Your country/region can't meet the requirements for opening contracts.
1225 | Failed to open contracts.
1226 | Repeated account.
1227 | Huobi Contract does not support sub-accounts. Please log out sub-account and log in again with primary account.
1228 | You have not activated contract trading currently, please activate first. 
1229 | Cannot agree twice.
1230 | You haven't finished the risk verification.
1231 | You haven't finished the ID Verification.
1232 | The format/size of the image you uploaded does not meet the requirements. Please re-upload.
1233 | High leverage is not enabled (Please sign in the APP or web with your main account to agree to the High-Leverage Agreement)
1234 | {0} contract opening orders cannot exceed {1}
1235 | {0} contract closing orders cannot exceed {1}
1250 | Unable to get the HT_token.
1251 | Unable to get BTC assets. Please try again later.
1252 | Unable to get currency account assets. Please try again later.
1253 | Error in signature verification.
1254 | The sub-account has no permission to open futures, please go to the web side to log in the main account and open.
1300 | Transfer failed.
1301 | Insufficient amount available.
1302 | Transfer failed.
1303 | The single transfer-out amount must be no less than {0}{1}.
1304 | The single transfer-out amount must be no more than {0}{1}.
1305 | The single transfer-in amount must be no less than {0}{1}.
1306 | The single transfer-in amount must be no more than {0}{1}.
1307 | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
1308 | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
1309 | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
1310 | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
1311 | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.
1312 | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.
1313 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.
1314 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.
1315 | Wrong transfer type.
1316 | Failed to freeze the transfer.
1317 | Failed to unfreeze the transfer.
1318 | Failed to confirm the transfer.
1319 | Failed to acquire the available transfer amount.
1320 | The contract status is abnormal. Transfer is unavailable temporarily.
1321 | Transfer failed. Please try again later or contact customer service.
1322 | Invalid amount. Must be more than 0.
1323 | Abnormal service, transfer failed. Please try again later.
1325 | Failed to set trading unit
1326 | Failed to obtain trading units
1327 | No transfer permission, transfer failed, please contact customer service
1328 | No transfer permission, transfer failed, please contact customer service
1329 | No transfer permission, transfer failed, please contact customer service
1330 | No transfer permission, transfer failed, please contact customer service
1331 | Exceeds limit of transfer accuracy (8 digits). Please modify it
1332 | The contract doesn't exist.
1333 | Failed to open the Maker&Taker agreement
1334 | Failed to check the Maker&Taker agreement
1335 | Failed to check the second confirmation setting of Maker&Taker
1336 | Failed to update the second confirmation setting of Maker&Taker
1337 | Failed to check the settings of Maker&Taker
1338 | Failed to update the settings of Maker&Taker
1339 | Nickname contains illegal words, please modify it
1340 | Nickname has been used, please modify it
1341 | The enrollment has ended
1342 | You cannot set nickname for sub-account
1343 | Invalid indicator, please reset
1344 | Sorry, {0} contracts can add market reminders currently at most
1345 | Sorry, currently {0} can set up to {1} reminders
1346 | The indicator already exists, please do not set it repeatedly
1347 | {0} parameter is incorrect, please modify.
1348 | This contract does not support cross margin mode.
1349 | The leverage of the order does not match the leverage of the current position, please switch the leverage first. 
1401 | order price shall be lower than the strike price.
1403 | The number of take-profit and stop-loss orders for {0} contract shall not exceed {1}  
1404 | Take-profit and stop-loss orders can only be bound with orders for opening a position
1405 | The take-profit price shall not be {0}{1}{2} 
1406 | Your chances of lucky draw have been used up 
1407 | The stop-loss price shall not be {0}{1}{2}
12001 | Invalid submission time.
12002 | Incorrect signature version.
12003 | Incorrect signature method.
12004 | Private key is expired.
12005 | Incorrect IP address.
12006 | The submission time can't be empty.
12007 | Incorrect public key.
12008 | Verification failed.
12009 | The user is locked or doesn't exist.

## API Best Practice

### 1. Query contract history orders interface: /linear-swap-api/v1/swap_hisorders

- To ensure timelines and to reduce latency, users are highly recommended to get contract history orders information faster from server memory using interface “query contract order information” (URL: /linear-swap-api/v1/swap_order_info).

- For users who use interface “query contract history orders” (URL: /linear-swap-api/v1/swap_hisorders), please enter as many query conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, type, status, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 2. Query contract match results interface: /linear-swap-api/v1/swap_matchresults

- To improve query performance and response speed, please enter as many querying conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 3. Query contract financial record interface: /linear-swap-api/v1/swap_financial_record

- To improve query performance and response speed, please enter as many querying conditions as possible (including symbol, type(recommended to leave it blank to query all), create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 4. Query contract order detail interface: /linear-swap-api/v1/swap_order_detail

- When querying orders without parameter(such as the parameter: created_at), the query result data may be delayed. It is recommended to pass the two parameters of the interface: created_at (order timestamp) and order_type (order type, default 1), the database will be directly queried, and the query results data will be more timely.

- Querying condition “created_at” uses 13-bit long type time stamp (including milliseconds). Querying performance will be improved when accurate time stamps are entered.

- For example: the converted time stamp of "2019/10/18 10:26:22" is 1571365582123. The returned ts from interface “contract_order” can be used as time stamp to query corresponding order. 0 is not allowed in parameter “created_at”.


### 5. WebSocket subscription to Market Depth data:

- For acquiring market depth data within 150 steps, you are kindly suggested to use step0, step1, step2, step3, step4, step5, step14, step15；

- For acquiring market depth data within 20 steps, you are kindly suggested to use step6, step7, step8, step9, step10, step11, step12, step13；

- Since the large volume of pushing 150 steps data every 100ms, WebSocket disconnection may occur frequently if client’s network bandwidth is insufficient or the processing is not in time; therefore, we highly recommend users using step6, step7, step8, step9, step10, step11, step12, step13 to acquire 20 steps data. For instance, subscribing 20 steps data.

`{`

  `"sub": "market.BTC-USDT.depth.step6",`

  `"id": "id5"`

`}`

- We also suggest that you subscribe incremental market depth data.orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.You can subscribe 20 or 150 unmerged data.

`{`

  `"sub": "market.BTC-USDT.depth.size_20.high_freq",`

` "data_type":"incremental", `

` "id": "id1" `

`}`

### 6. Place order interface (URL: /linear-swap-api/v1/swap_order) and place a batch of orders interface (URL:/linear-swap-api/v1/swap_batchorder):

- We recommend to fill in the parameter “client_order_id”(should be unique from user-side),which can help users to acquire order status and other order information according to the parameter “client_order_id" from

- query order information interface (URL: /linear-swap-api/v1/swap_order_info ) when there is no returned information due to network or other problems.


## Code Demo

- <a href='https://github.com/hbdmapi/huobi_usdt_swap_Java'>Java</a>

- <a href='https://github.com/hbdmapi/hbdm_Python'>Python</a>

- <a href='https://github.com/hbdmapi/huobi_futures_Postman'>Postman</a>

- <a href='https://github.com/hbdmapi/huobi_futures_CSharp'>CSharp</a>

- <a href='https://github.com/hbdmapi/huobi_futures_Golang'>Golang</a>

PS: USDT Margined swap api is similar to Coin margined swap api and future api.

<!--
- <a href='https://github.com/hbdmapi/hbdm_swap_Rust'>Rust</a>

- <a href='https://github.com/hbdmapi/huobi_swap_Cpp'>C++</a>

-->

# Swap API FAQ

## Access and Authentication

### Q1: Is the API Key  for swap and spot the same ?
     
Yes. The Swap API key and spot API key are same. You can create API using the following link.<a href=https://www.hbg.com/zh-cn/apikey/> click here</a>

### Q2: Why are APIs  disconnected or timeout?

1. The network connection is unstable if the server locates in China mainland,it is suggested to invoke APIS from a server located in  1c area of AWS Tokyo.

2.  You can use api.btcgateway.pro or api.hbdm.vn to debug for China mainland  network.

### Q3: Why is the websocket often disconnected?

It seems that most of the abnormal websocket  issues (such as disconnect, websocket close )(websocket: close 1006 (abnormal closure))are caused by different network environment. The following measures can effectively reduce websocket issues.

It would be better if the server is located in 1c area of AWS Tokyo with url api.hbdm.vn and implement websocket re-connection mechanism. Both market heartbeat and order heartbeat should response with Pong with different format, following  Websocket market heartbeat and account heartbeat requirement.<a href=https://docs.huobigroup.com/docs/usdt_swap/v1/en/#market-heartbeat>here</a>

### Q4:  what is the difference between api.hbdm.com and api.hbdm.vn?

The api.hbdm.vn uses AWS's CDN service. it should be more stable and faster for AWS users. The api.hbdm.com uses Cloudflare's CDN service.

### Q5: What is the colocation service ? which attention points should we know ?

Actually ,colo corresponds to a vpc node, which directly connects to  private network of huobi's future, so it will reduce the latency between the client and the Huobi future server (bypassing the CDN)

huobi future and huobi swap have the same colo, so the domain name connecting the USDT Margined swap api and the future api are the same.

Note : Colo needs to use api.hbdm.com for signature(authentication) to avoid getting 403 error: Verification failure. 

### Q6: Why does signature verification return failure (403: Verification failure) ?

The signature process of USDT Margined swap is similar to huobi future and coin margined swap . In addition to the following precautions,please refer to the swap or future demo to verify whether the signature is successful. Please check your own signature code after demo verification is successful. The coin margined  swap code demo is <a href=https://docs.huobigroup.com/docs/coin_margined_swap/v1/en/#code-demo>here</a>. The future code demo is <a href=https://docs.huobigroup.com/docs/dm/v1/en/#code-demo>here</a>.The option code demo is <a href=https://docs.huobigroup.com/docs/option/v1/en/#code-demo>here</a>. The USDT Margined Swap code demo is <a href=https://docs.huobigroup.com/docs/usdt_swap/v1/en/#code-demo>here</a>.

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

Historical Kline data can be obtained through the API interface:linear-swap-ex/market/history/kline.Only the from and to parameters need to be filled in, and the size parameter is not needed.At most, only two consecutive years of data can be obtained.

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

Subscription of position event: "positions.BTC-USDT".The latest position is pushed,including the volumes, available volumes, frozen volumes.If there is no update,it will not be pushed. 

### Q9: Does websocket's position channel push data when the unrealized profit is updated?

Subscription of position event: "positions.BTC-USDT".It will not be pushed  if only unrealized profit is updated.
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

### Q14: What's the difference between "funding_rate" and "realized_rate" in the response of linear-swap-api/v1/swap_historical_funding_rate interface?

Generally, "funding_rate" is equal to "realized_rate".Only when the payment of funding fee will cause the liquidation of the user's position, the funding fee is under or not charged(And the fee is the actual funding fee:"realized_rate").The current funding rate:"funding_rate" remains unchanged.

## Order and Trade

### Q1: What is the USDT Margined Swap funding rate settlement cycle? Which interface can be used to check the status when the fund rate is settled? 

We warmly remind you that Huobi USDT Margined Swap is settled every 8 hours, and the settlement will be at the end of each period. For example, 00:00 - 08:00 is a period, and its settlement time would be at 08:00; 08:00 - 16:00 is a period, and its settlement time would be at 16:00; 16:00 - 00:00 (+1 day) is a period, and its settlement time would be at 00:00. All times mentioned above are Singapore Standard time (GMT+8).

（1）Orders can't be placed or cancelled during settlement period, error code "1056" will be returned if users place or cancel orders. You are recommended to request contract information every few seconds during settlement period: linear-swap-api/v1/swap_contract_info. It's in settlement time if there is any number of 5, 6, 7, 8 included in the returned status code of contract_status, while it indicates that settlement completed and users could place and cancel orders as usual if the returned status code is 1.

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

The field ID returned by the information interface linear-swap-api/v1/swap_order_detail is a globally unique transaction identifier. if a maker order is matched multiple times, a trade will be pushed once there is a transaction matched.

### Q4: What is the delay for the round trip of huobi USDT Margined swap?

At present,it normally takes about 30-50ms from placing the order to getting the status of the order.

### Q5: Why does the API return connection reset or Max retris or Timeout error?

Most of the network connectivity problems ,(such as Connection reset or network timeout )  are caused by network instability , you can use the server in AWS Tokyo C area with api.hbdm.vn , which can effectively reduce network timeout errors.

### Q6: How to check the order status without order_id not returned?
 
 If the order_id couldn't be returned due to network problems, you can query the status of the order by adding the custom order number(client_order_id ).

### Q7: What to do if it's diconnected after the websocket subscription of account, order and positions for a while?
  
 When subscribing private accounts, orders and positions, the heartbeat should also be maintained regularly ,which is different from the market heartbeat format . Please refer to the "websocket Heartbeat and Authentication Interface" . if it is disconnected ,please try to reconnect.

### Q8: What is the difference between order status 1 and 2 ? what is the status 3 ?
 
 Status 1 is the preparation for submission. status 2 is the sequential submission  of internal process, which can be considered that it has been accepted by the system.  Status 3 indicated that the order has been  already submitted to market.

### Q9: Is there an interface to get the total assets in BTC of my account ? 
  
 No.

### Q10: Why is the order filled after the order is withdrawed successfully by placing API cancellation ?
  
 The success return of order cancellation or placement  only represents that the command is excuted successfully and doesn't mean that the order has been cancelled . You can check the order status through the interface linear-swap-api/v1/swap_order_info.

### Q11: Does the order status of 10 mean the order is failed?

Query the order status by linear-swap-api/v1/swap_order_info.If the status is 10,the order is failed。

### Q12: How long does it generally take for an API from withdrawing to cancelling successfully ?

The order cancellation command generally takes several tens of ms. The actual status of order cancellation can be obtained by invoking an interface: linear-swap-api/v1/swap_order_info

### Q13: How to get historical liquidation orders?

To obtain historical liquidation orders, you can access the one of two api interfaces: Get History Orders (/linear-swap-api/v1/swap_hisorders【Isolated】or /linear-swap-api/v1/swap_cross_hisorders【Cross】), Get History Match Results (/linear-swap-api/v1/swap_matchresults【Isolated】or /linear-swap-api/v1/swap_cross_matchresults【Cross】) with the return field order_source (order source) to judge. When order_source returns "risk", it means that this order is a liquidated order.


## Error Codes

### Q1: What is the reason for 1030 error code?

If you encounter errors such as {"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199},indicating that your input request parameter is not correct, please print your request body and complete URL parameters, and please check the corresponding API document interface one by one.The common example is that the volume must be an integer. 

### Q2: What is the reason for 1048 error code?

If you encounter errors such as {'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available.'}, indicating that your available position is not enough.You need to query the api linear-swap-api/v1/swap_position_info to get your available position.

### Q3: What is the reason for 1032 error code? 

1032 means that your request exceeds the ratelimit. The coin margined swap, future, option swap and USDT margined swap limit the rate separately. Please check the ratelimit in the api ratelimit instructions, and you can print the current ratelimit in the header of the API response to check whether the ratelimit is exceeded. It is recommended to increase the request interval delay to avoid exceeding the ratelimit.

## The usage of and the difference between cross margin mode and isolated margin mode

1. Under the cross margin mode, all swaps share the USDT in the cross margin account as the margin, which indicates that all positions under the cross margin mode share the same account equity, and their PnL, occupied margin and margin ratio are calculated jointly. Under the isolated margin mode, the account equity for each swaps are calculated separately, and the position margin and PnL of each swaps will not affect each other. 

2. The cross margin mode and the isolated margin mode use different margin accounts, and the assets are independent of each other. Users can trade, or hold positions under the two modes at the same time. For example, in BTC/USDT swaps trading, the margin account for cross margin trading is USDT, while the margin account for isolated margin trading is BTC-USDT.


3. API users can use the support_margin_mode field (margin mode supported by the contract) of the API interface [Query Swap Info: linear-swap-api/v1/swap_contract_info] to check which mode (cross/isolated) the contract supports.


4. The API interface is divided into three modes, [Cross], [Isolated] and [General]. These three modes are marked on the API interface name and the interface list. [Cross] indicates that the API interface only supports cross margin mode. [Isolated] indicates that the API interface only supports isolated margin mode, and [General] indicates that the API interface supports both two modes, indicating that it can be called by both the cross margin mode and isolated margin mode.

## How to solve problems more effectively?

When you report an API error, you need to attach your request URL, the original complete body of the request and the complete request URL parameters, and the original complete log of the server's response. If it is a websocket subscription, you need to provide the address of the subscription, the topic of the subscription, and the original complete log pushed by the server.

If it is an order-related issue, use the API order query interface linear-swap-api/v1/swap_order_info to keep the complete log returned and provide your UID and order number.


# Swap Market Data interface

## [General] Query Swap Info 

### Example              
                                   
- GET  `linear-swap-api/v1/swap_contract_info`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_contract_info"      
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.
                                                        
### Request Parameter

  Parameter Name   |   Type   |   Mandatory   |   Description   |
------------------ | -------- | ------------- | --------------- |
contract_code | string   | false      | Case-insenstive.such as "BTC-USDT". All swaps default.|
support_margin_mode | string   | false      | support margin mode cross："cross"；isolated："isolated"；all："all"|


> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "contract_size": 0.001000000000000000,
            "price_tick": 0.100000000000000000,
            "create_date": "20201021",
            "contract_status": 1,
            "settlement_date": "1603699200000",
            "support_margin_mode": "all"
        }
    ],
    "ts": 1603694455082
}

```


### Returning Parameter

Parameter Name               |   Mandatory   |   Type   |   Description                                |   Value Range                                                |
------------------------------ | ------------- | -------- | --------------------------------------------- | ------------------------------------------------------------ |
status                         | true          | string   | Request Processing Result                     | "ok" , "error"                                               |
\<data\>|               |          |   
symbol                     |  true           |  string     |  symbol                          |  "BTC","ETH"...  |
contract_code                  | true          | string   | Contract Code                                 | "BTC-USDT" ...                                              |
contract_size                  | true          | decimal  | Contract Value (USDT of one contract)          | 10, 100...                                                   |
price_tick                     | true          | decimal  | Minimum Variation of Contract Price           | 0.001, 0.01...                                               |
settlement_date                  | true          | string   | Settlement  Date                        | eg "1490759594752"                                                |
create_date                    | true          | string   | Listing Date                         | eg "20190808"                                                |
contract_status                | true          | int      | Contract Status                               | 0: Delisting,1: Listing,2: Pending Listing,3: Suspension,4: Suspending of Listing,5: In Settlement,6: Delivering,7: Settlement Completed,8: Delivered |
support_margin_mode             | false        | string      | support margin mode              |   cross："cross"；isolated："isolated"；all："all"|
\</data\>                      |               |          |                                               |                                                              |
ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                                                              |


## [General] Query Swap Index Price Information 

### Example                                                
                                                            
- GET `linear-swap-api/v1/swap_index` 

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_index?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter

| Parameter Name | Parameter Type | Mandatory   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| contract_code      | string             | false          | Case-insenstive."BTC-USDT","ETH-USDT"... |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "index_price": 13076.329865680000000000,
            "index_ts": 1603694592011,
            "contract_code": "BTC-USDT"
        }
    ],
    "ts": 1603694596400
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  |
| \<data\> |               |          |                                               |                 |
| contract_code               | true          | string   | contract code                                        | "BTC-USDT","ETH-USDT"...  |
| index_price                    | true          | decimal  | Index Price                                   |                 |
| index_ts                    | true          | Long  | Index time                                   |                 |
| \</data\>                      |               |          |                                               |                 |
| ts                             | true          | long     | Time of Respond Generation，Unit：Millisecond |                 |

  
## [General] Query Swap Price Limitation

###  Example      
                                                                          
- GET `/linear-swap-api/v1/swap_price_limit` 
 
```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_price_limit?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| contract_code      | string             | true         | Case-insenstive.such as:BTC-USDT  ...                                    |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "high_limit": 13596.800000000000000000000000000000000000,
            "low_limit": 12550.900000000000000000000000000000000000
        }
    ],
    "ts": 1603694645979
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" ,"error"                     |
|  \<data\> |               |          |                                               |                                   |
| symbol  |  true  |  string  |  Variety code  |  "BTC","ETH" ...           |                          
| high_limit                     | true          | decimal  | Highest Buying Price                          |                                   |
| low_limit                      | true          | decimal  | Lowest Selling Price                          |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC-USDT"  ...               |
| \<data\>                       |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |


## [General] Get Swap Open Interest Information

###  Example   
                                                                                 
- GET `/linear-swap-api/v1/swap_open_interest` 

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_open_interest?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                            |
| ------------------ | ------------------ | ------------- | ------------------------------------------------- |
| contract_code      | string             | false         | Case-insenstive.such as BTC-USDT. ALL contracts by default.                                        |

> Response:


```json

{
    "status": "ok",
    "data": [
        {
            "volume": 2017.000000000000000000,
            "amount": 2.017000000000000000,
            "symbol": "BTC",
            "value": 26376.309000000000000000,
            "contract_code": "BTC-USDT"
        }
    ],
    "ts": 1603694760141
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                     |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                    |
| \<data\> |               |          |                                               |                                   |
| symbol                         | true          | string   | Variety code                                  | "BTC", "ETH" ...                  |
| volume                         | true          | decimal  | Position quantity(volume)                     |                                   |
| amount                         | true          | decimal  | Position quantity(Currency)                   |                                   |
| contract_code                  | true          | string   | Contract Code                                 | eg "BTC-USDT"   ...              |
| value               | true | decimal | Total position volume（The unit is the denominated currency of the contract. e.g:USDT）     | |
| \</data\>                      |               |          |                                               |                                   |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                   |

#### Note
 - Position volume (coin) = position quantity (cont) * contract face value
 - Total position amount = position quantity (cont)* contract face value * latest price

## [General] Get Market Depth

###  Example            
                                            
- GET `/linear-swap-ex/market/depth` 

```shell
curl "https://api.hbdm.com/linear-swap-ex/market/depth?contract_code=BTC-USDT&type=step5"
```  

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ----------------------------------------------------------------- |
| contract_code      | string             | true          | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |
| type               | string             | true          | Get depth data within step 150, use step0, step1, step2, step3, step4, step5, step14, step15（merged depth data 0-5,14-15）；when step is 0，depth data will not be merged; Get depth data within step 20, use step6, step7, step8, step9, step10, step11, step12, step13(merged depth data 7-13); when step is 6, depth data will not be merged. |

> Response:

```json

{
    "ch": "market.BTC-USDT.depth.step0",
    "status": "ok",
    "tick": {
        "asks": [
            [
                13084.2,
                168
            ],
            [
                13085.6,
                1
            ]
        ],
        "bids": [
            [
                13084,
                38
            ],
            [
                13069.9,
                1
            ]
        ],
        "ch": "market.BTC-USDT.depth.step0",
        "id": 1603694838,
        "mrid": 131471527,
        "ts": 1603694838167,
        "version": 1603694838
    },
    "ts": 1603694838240
}

```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period                |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation，Unit：Millisecond                |                 |
|  \<tick\>    |               |    |      |            | 
| mrid  | true| long | Order ID| 
| id  | true| long | tick ID | 
| asks | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
| bids | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
| ts | true | long | Time of Respond Generation, Unit: Millisecond  | |
| version | true | long | version ID  | |
| ch | true |  string | Data channel, Format： market.period | | 
|  \</tick\>    |               |    |      |            | | 


## [General] Get KLine Data

###  Example     
                                                                   
- GET `/linear-swap-ex/market/history/kline` 

```shell
curl "https://api.hbdm.com/linear-swap-ex/market/history/kline?period=1min&size=200&contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc               |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | -------------------- | ----------- | ------------------------------------------------------------ |
| contract_code       | true        | string         | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |
| period             | true          | string   | KLine Type          |             | 1min, 5min, 15min, 30min, 60min, 1hour,4hour,1day, 1mon      |
| size               | false         | int  | Acquisition Quantity | 150     | [1,2000]         |
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
        "vol": Transaction Volume(volume),
        "count": transaction count
        "open": opening Price
        "close": Closing Price, when the Kline is the latest one，it means the latest price
        "low": Lowest price
        "high": highest price
        "amount": transaction volume(currency), sum(every transaction volume(con)*every contract value/transaction price for this contract)，
        "trade_turnover": Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)
   }
]
```

> Response:

```json

{
    "ch": "market.BTC-USDT.kline.1min",
    "data": [
        {
            "amount": 0.004,
            "close": 13076.8,
            "count": 1,
            "high": 13076.8,
            "id": 1603695060,
            "low": 13076.8,
            "open": 13076.8,
            "trade_turnover": 52.3072,
            "vol": 4
        }
    ],
    "status": "ok",
    "ts": 1603695099234
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                        |   Value Range   |
| ------------------ | ------------- | ------------- | --------------------------------------------- | --------------- |
| ch                 | true          | string        | Data belonged channel，Format： market.period |                 |
| status             | true          | string        | Request Processing Result                     | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation, Unit: Millisecond |                 |
|  \<data\>    |               |kline data    |      |            | 
|  id    |     true          | long   | kline id,the same as kline timestamp, kline start timestamp    |            
|  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
|  count    |     true          | decimal   |   Order Quantity  |            
|  open    |     true          | decimal   |   Open Price  |            
|  close    |     true          | decimal   |  Clos Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | decimal   |  Low Price  |            
|  high    |     true          | decimal   |  High Price |            
|  amount    |     true          | decimal   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of  the coin/order price)   |    
| trade_turnover     | true | decimal | Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)      |                |        
|  \</data\>    |               |     |      |      


##  [General] Get Market Data Overview

###  Example            
                                         
- GET `/linear-swap-ex/market/detail/merged`
   
```shell
curl "https://api.hbdm.com/linear-swap-ex/market/detail/merged?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | ------------- | ----------- | ------------------------------------------------------------ |
| contract_code      | true           | string  | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |

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
    "ask": [price of selling one (amount)],
    "trade_turnover": Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)
  }
```

> Response:

```json

{
    "ch": "market.BTC-USDT.detail.merged",
    "status": "ok",
    "tick": {
        "amount": "12.526",
        "ask": [
            13084.2,
            131
        ],
        "bid": [
            13082.9,
            38
        ],
        "close": "13076.8",
        "count": 2920,
        "high": "13205.3",
        "id": 1603695162,
        "low": "12877.5",
        "open": "12916.2",
        "trade_turnover": "163247.3982",
        "ts": 1603695162580,
        "vol": "12526"
    },
    "ts": 1603695162580
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | ------------- | ------------------------------------------------------------ | --------------- |
| ch                 | true          | string        | Data belonged channel，format： market.$contract_code.detail.merged |                 |
| status             | true          | string        | Request Processing Result                                    | "ok" , "error"  |
| ts                 | true          | long        | Time of Respond Generation, Unit: Millisecond                |                 |
|  \<tick\>    |    true           | object   |    kline data (Start at 00:00(UTC+8) of the day)   |            | 
|  id    |     true          | long   |  kline id,the same as kline timestamp   |            
|  vol    |     true          | string   |  Trade Volume(Cont.), from nowtime - 24 hours   |            
|  count    |     true          | decimal   |   Order Quantity, from nowtime - 24 hours  |            
|  open    |     true          | string   |   Opening Price  |            
|  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | string   |  Low    |            
|  high    |     true          | string   |  High   |            
|  amount    |     true          | string   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of the coin/order price),from nowtime - 24 hours  |            
| ask | true | object |Sell,[price(Ask price), vol(Ask orders (cont.) )], price in ascending sequence | | 
| bid | true| object | Buy,[price(Bid price), vol(Bid orders(Cont.))], Price in descending sequence | | 
| trade_turnover     | true | string | Transaction amount, that is, sum (transaction quantity * contract face value * transaction price),from nowtime - 24 hours      |  
| ts                 | true          | long        |    Timestamp             |                 ||
|  \</tick\>    |               |     |      |  


## [General] Query The Last Trade of a Contract

###  Example   
                                          
- GET `/linear-swap-ex/market/trade`   

```shell
curl "https://api.hbdm.com/linear-swap-ex/market/trade?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.
 
###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc        |  
| ------------------ | ------------- | -------- | ------------- | 
| contract_code      | true            | string  | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" | 

> Tick Illustration：

```
"tick": {
  "id": Unique Order Id(symbol level).,
  "ts": Latest Transaction time,
  "data": [
    {
      "id": Unique Transaction Id(symbol level),
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
    "ch": "market.BTC-USDT.trade.detail",
    "status": "ok",
    "tick": {
        "data": [
            {
                "amount": "6",
                "ts": 1603695230083,
                "id": 1314755250000,
                "price": "13083",
                "direction": "buy"
            }
        ],
        "id": 1603695235127,
        "ts": 1603695235127
    },
    "ts": 1603695235127
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | ----------------------------------------------------------- | ----------- | --------------- |
| ch                 | true          | string   | Data belonged channel，Format： market.$contract_code.trade.detail |             |                 |
| status             | true          | string   |               |             | "ok","error"    |
| ts                 | true          | long   | Sending time                                                |             |                 |
|  \<tick\>    |               |    |      | 
| id  |  true  |  long  |  Unique Order Id(symbol level).  |   |    
| ts  |  true  |  long  |  Latest Creation Time |   |    
|  \<data\>  |               |    |      | 
| id  |  true  |  long  |  Unique Transaction Id(symbol level)  |   |    
| price  |  true  |  string  |  Price |   |    
| amount  |  true  |  string  |  Quantity(Cont.)  |   |    
| direction  |  true  |  string  |  Order Direction  |   |    
| ts  |  true  |  long  |  Order Creation Time |   |    
|  \</data\>    |               |    |      | 
|  \</tick\>    |               |    |      | 


## [General] Query a Batch of Trade Records of a Contract

###  Example  
                                                            
- GET `/linear-swap-ex/market/history/trade`
   
```shell 
curl "https://api.hbdm.com/linear-swap-ex/market/history/trade?contract_code=BTC-USDT&size=100"
```
#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                |   Default   |   Value Range                                                |
| ------------------ | ------------- | ------------- | ------------------------------------- | ----------- | ------------------------------------------------------------ |
| contract_code      | true             | string      |     Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |  |   |
| size               | true             | int        | Number of Trading Records Acquisition | 1           | [1, 2000]                                                    |

> data Illustration：

```
"data": {
  "id": Unique Order Id(symbol level).,
  "ts": Latest transaction time,
  "data": [
    {
      "id": Unique Transaction Id(symbol level),
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
    "ch": "market.BTC-USDT.trade.detail",
    "data": [
        {
            "data": [
                {
                    "amount": 2,
                    "direction": "buy",
                    "id": 1314767870000,
                    "price": 13081.3,
                    "ts": 1603695383124
                }
            ],
            "id": 131476787,
            "ts": 1603695383124
        }
    ],
    "status": "ok",
    "ts": 1603695388965
}
```

###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Data Type   |   Desc                                                      |   Value Range   |
| ------------------ | ------------- | ------------- | ----------------------------------------------------------- | --------------- 
| ch     | true | string | Data belonged channel，Format： market.$contract_code.trade.detail |            
| \<data\> | true | object array |           |      |       |
| \<data\>  | true | object array |           |      |       |
| amount     | true | decimal | Quantity(Cont.)       |      |            |
| direction     | true | string |  Order Direction       |      |            |
| id     | true | long | Unique Transaction Id(symbol level)      |      |            |
| price     | true | decimal | Price       |      |            |
| ts     | true | long |  Order Creation Time       |      |            |
|\</data\>    |  |  |              |      |            |
| id     | true | long | Unique Order Id(symbol level).     |      |            |
| ts     | true | long | Latest transaction time       |      |            |
|\</data\>    |  |  |              |      |            |
| status | true | string |                                          | "ok"，"error" |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond                    |              |


## [General] Query information on contract insurance fund balance and estimated clawback rate

- GET `/linear-swap-api/v1/swap_risk_info`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_risk_info"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

###  Request Parameter 

|  Parameter Name                 |   Mandatory  |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             | false   | string      |  contract code     | Case-Insenstive.e.g. "BTC-USDT" |


> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "BTC-USDT",
            "insurance_fund": 499937.059826600000000000,
            "estimated_clawback": 0
        }
    ],
    "ts": 1603695455942
}
```

### Returning Parameter 

|   Parameter Name                |  Mandatory   |  Type   |   Desc              |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| contract_code  | true    | string    | contract code | e.g. "BTC-USDT" |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| estimated_clawback | true  | decimal | Estimated Clawback Rate |  |
| \</data\> |  |  |  |  |

## [General] Query history records of insurance fund balance

- GET `/swap-api/v1/linear-swap-api/v1/swap_insurance_fund`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_insurance_fund?contract_code=ETH-USDT"
```
 
#### Remarks

 - The interface supports cross margin mode and isolated margin mode.
 
### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type  |     Desc             |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code   | true    | string       |  contract code | Case-Insenstive.e.g. "BTC-USDT" |
| page_index  | false    | int    | page index. 1 by default    | 1       |                                          |
| page_size   | false    | int    | page size.100 by default. 100 at most | 100      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 5,
        "current_page": 1,
        "total_size": 5,
        "symbol": "BTC",
        "contract_code": "BTC-USDT",
        "tick": [
            {
                "insurance_fund": 499937.059826600000000000,
                "ts": 1603612800000
            }
        ]
    },
    "ts": 1603695552425
}

```

### Returning Parameter

|    Parameter Name                |    Mandatory	  |   Type  |   Desc              |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  | Dictionary Data |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code   | true      | string   | contract code | e.g. "BTC-USDT" |
| \<tick\> |  |  |  |  |
| insurance_fund | true  | decimal | Insurance Fund Balance |  |
| ts | true  | long | Timestamp, Unit: Millisecond |  |
| \</tick\> |  |  |  |  |
| total_page             | true     | int     | total page                |              |
| current_page           | true     | int     | current page               |              |
| total_size           | true     | int     |  total size               |              |
| \</data\> |  |  |  |  |

## [Isolated] Query information on Tiered Adjustment Factor

- GET `/linear-swap-api/v1/swap_adjustfactor`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_adjustfactor"
```

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |    Desc             |    Data Value       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             | false        |  string      | contract code  | Case-Insenstive.e.g. "BTC-USDT" |


> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "margin_mode": "isolated",
            "list": [
                {
                    "lever_rate": 125,
                    "ladders": [
                        {
                            "ladder": 0,
                            "min_size": 0,
                            "max_size": 8999,
                            "adjust_factor": 0.650000000000000000
                        },
                        {
                            "ladder": 1,
                            "min_size": 9000,
                            "max_size": 89999,
                            "adjust_factor": 0.800000000000000000
                        },
                        {
                            "ladder": 2,
                            "min_size": 90000,
                            "max_size": null,
                            "adjust_factor": 0.850000000000000000
                        }
                    ]
                }
            ]
        }
    ],
    "ts": 1603695606565
}

```


### Returning Parameter 

|    Parameter Name                 |    Mandatory    |    Type    |    Desc            |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code    |   true   | string | contract code  | e.g. "BTC-USDT" |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| \<list\> |  |  |  |  |
| lever_rate   | true     | decimal  | Leverage               |                |
| \<ladders\> |  |  |  |  |
| min_size | true | decimal | Min net position limit |  |
| max_size | true | decimal | Max net position limit |  |
| ladder | true | int | Tier |  |
| adjust_factor | true | decimal | Adjustment Factor |  |
| \</ladders\> |  |  |  |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |


## [Cross] Query Information On Tiered Adjustment Factor

 - GET `linear-swap-api/v1/swap_cross_adjustfactor`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value           |
| ------ | ----- | ------ | ---- | ---------------------------- |
| contract_code | false | string | contract code |  Case-Insenstive.e.g. "BTC-USDT" |

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "margin_mode":"cross",
            "list":[
                {
                    "lever_rate":1,
                    "ladders":[
                        {
                            "ladder":0,
                            "min_size":0,
                            "max_size":999,
                            "adjust_factor":0.005
                        },
                        {
                            "ladder":1,
                            "min_size":1000,
                            "max_size":9999,
                            "adjust_factor":0.11
                        },
                        {
                            "ladder":2,
                            "min_size":10000,
                            "max_size":19999,
                            "adjust_factor":0.015
                        },
                        {
                            "ladder":3,
                            "min_size":20000,
                            "max_size":29999,
                            "adjust_factor":0.02
                        },
                        {
                            "ladder":4,
                            "min_size":30000,
                            "max_size":null,
                            "adjust_factor":0.025
                        }
                    ]
                }
            ]
        }
    ],
    "ts":1606905299391
}

```

### Returning Parameter

| Parameter Name     | Mandatory | Type      | Desc     | Data Value           |
| ----------------- | ---- | ------- | ------------- | -------------- |
| status            | true | string  | Request Processing Result        | "ok" , "error" |
| ts                | true | long    | Time of Respond Generation, Unit: Millisecond |                |
| \<data\>          |  true    |   object array     |               |          |
| symbol            | true | string  | symbol           | "BTC","ETH"...|
| contract_code            | true | string  | contract code       |  "BTC-USDT" ... |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| \<list\>          |   true   |   object array   |         |                |
| lever_rate        | true | decimal | leverage          |                |
| \<ladders\>  |    true  |  object array      |               |                |
| min_size          | true | decimal | min net position limit      |                |
| max_size          | true | decimal | max net position limit      |                |
| ladder            | true | int     | tier            | from 0             |
| adjust_factor     | true | decimal | adjustment factor          |                |
| \</ladders\> |      |         |           |                |
| \</list\>         |      |         |         |                |
| \</data\>         |      |         |        |                |


## [General] Query information on open interest

- GET `/linear-swap-api/v1/swap_his_open_interest`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_his_open_interest?contract_code=BTC-USDT&period=60min&amount_type=1"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter 

|   Parameter Name                |   Mandatory   |   Type    |    Desc             |    Data Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code   | true  | string     |   contract code   | Case-Insenstive. e.g. "BTC-USDT" |
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
                "volume": 2124.0000000000000000,
                "amount_type": 1,
                "ts": 1603695600000,
                "value": 27771.93720000000000000000000000000000000
            }
        ],
        "contract_code": "BTC-USDT"
    },
    "ts": 1603695899986
}

```

### Returning Parameter 

|  Parameter Name                |   Mandatory 	 |   Type    |    Desc              |   Data Range        |
| ----------------------- | -------- | ------- | ------------------------ | --------------------- |
| status | true | string | Request Processing Result   | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  | Dictionary Data |  |
| symbol | true | string | symbol   | "BTC","ETH"... |
| contract_code    |   true   | string  | contract code | e.g. "BTC-USDT" |
| \<tick\> |  |  |  |  |   
| volume | true | decimal | Open Interest |  |
| amount_type | true | int | Open Interest Unit | 1:-cont，2:- cryptocurrency  |
| value      | true | decimal | Total position volume (the unit shall be the denominated currency of the contract, eg, USDT)     | |
| ts | true | long | Recording Time |  |
| \</tick\> |  |  |  |  |
| \</data\>|  |  |  |  |

### Notice

- tick field：Tick data is arranged in reverse chronological order；


## [Isolated] Query information on system status

- GET `/linear-swap-api/v1/swap_api_state`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_api_state"
```

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter 

|  Parameter Name                |   Mandatory   |   Type  |   Desc              |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code             | false             | string   |  contract code    | Case-Insenstive.e.g. "BTC-USDT" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT",
            "open": 1,
            "close": 1,
            "cancel": 1,
            "transfer_in": 1,
            "transfer_out": 1,
            "master_transfer_sub": 1,
            "sub_transfer_master": 1,
            "master_transfer_sub_inner_in": 1,
            "master_transfer_sub_inner_out": 1,
            "sub_transfer_master_inner_in": 1,
            "sub_transfer_master_inner_out": 1,
            "transfer_inner_in": 1,
            "transfer_inner_out": 1
        }
    ],
    "ts": 1603696366019
}


```

### Returning Parameter 

|   Parameter Name                |    Mandatory   |    Type   |    Desc             |    Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status               | true | string | Request processing Result        | "ok" , "error" |
| ts                   | true | long   | Time of Respond Generation, Unit: Millisecond |                |
| \<data\> |  true    |  object array      |               |                |
| symbol       | true | string | symbol         |   "BTC","ETH"...              |
| contract_code | true | string | Contract Code         |    "BTC-USDT"...  |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| open       | true | int | open order access：when “1”, then access available; when “0”, access unavailable"1"        |             |
| close       | true | int | close order access：when “1”, then access available; when “0”, access unavailable "1"    |          |
| cancel       | true | int | order cancellation access：when “1”, then access available; when “0”, access unavailable "1"    |    |
| transfer_in       | true | int |  deposit access：when “1”, then access available; when “0”, access unavailable "1"     |              |
| transfer_out       | true | int |  withdraw access： when “1”, then access available; when “0”, access unavailable "1"        |          |
| master_transfer_sub       | true | int | transfer from master to sub account："1" is available，“0” is unavailable        |              |
| sub_transfer_master       | true | int | transfer from sub to master account："1" is available，“0” is unavailable        |         |
| master_transfer_sub_inner_in       | true | int | Transfer_in access for transfer from main account to sub-account - crossing account: "1" represents "available",  "0" represents "unavailable"      |              |
| master_transfer_sub_inner_out       | true | int | Transfer_out access for transfer from main account to sub-account - crossing account: "1" represents "available",  "0" represents "unavailable"        |              |
| sub_transfer_master_inner_in       | true | int | Transfer_in access for transfer from sub-account to main account - crossing account: "1" represents "available",  "0" represents "unavailable"      |         |
| sub_transfer_master_inner_out       | true | int | Transfer_out access for transfer from sub-account to main account - crossing account: "1" represents "available",  "0" represents "unavailable"        |         |
| transfer_inner_in       | true | int | Transfer_in access for transfer between different margin accounts under the same account："1" represents "available",  "0" represents "unavailable"       |         |
| transfer_inner_out       | true | int | Transfer_out access for transfer between different margin accounts under the same account："1" represents "available",  "0" represents "unavailable"         |         |
| \</data\>            |      |        |               |                |


## [Cross] Query Information On Transfer State

 - GET `linear-swap-api/v1/swap_cross_transfer_state`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name  | Mandatory | Type | Desc  | Data Value |
| ------------- | ------ | ----- | ---------------------------------------- | ---- |
| margin_account | false | string |  margin account, return all margin when null |   "USDT"，only support USDT now    |

> Response 

```json

{
    "status": "ok",
    "data": [
        {
            "margin_mode": "cross",
            "margin_account": "USDT",
            "transfer_in": 1,
            "transfer_out": 1,
            "master_transfer_sub": 1,
            "sub_transfer_master": 1,
            "master_transfer_sub_inner_in": 1,
            "master_transfer_sub_inner_out": 1,
            "sub_transfer_master_inner_in": 1,
            "sub_transfer_master_inner_out": 1,
            "transfer_inner_in": 1,
            "transfer_inner_out": 1
        }
    ],
    "ts": 1606905619516
}
```

###  Returning Parameter

| Parameter Name   | Mandatory | Type     | Desc            | Data Value           |
| -------------------- | ---- | ------ | ------------- | -------------- |
| status               | true | string | Request Processing Result        | "ok" , "error" |
| ts                   | true | long   | Time of Respond Generation, Unit: Millisecond |                |
| \<data\> |  true    |  object array      |               |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| transfer_in       | true | int | deposit access：when “1”, then access available; when “0”, access unavailable "1"           |              |
| transfer_out       | true | int | withdraw access： when “1”, then access available; when “0”, access unavailable "1"          |          |
| master_transfer_sub       | true | int | transfer from master to sub account："1" is available，“0” is unavailable            |              |
| sub_transfer_master       | true | int | transfer from sub to master account："1" is available，“0” is unavailable         |         |
| master_transfer_sub_inner_in       | true | int | Transfer_in access for transfer from main account to sub-account - crossing account: "1" represents "available", "0" represents "unavailable"            |              |
| master_transfer_sub_inner_out       | true | int | Transfer_out access for transfer from main account to sub-account - crossing account: "1" represents "available", "0" represents "unavailable"            |              |
| sub_transfer_master_inner_in       | true | int | Transfer_in access for transfer from sub-account to main account - crossing account: "1" represents "available", "0" represents "unavailable"         |         |
| sub_transfer_master_inner_out       | true | int | Transfer_out access for transfer from sub-account to main account - crossing account: "1" represents "available", "0" represents "unavailable"         |         |
| transfer_inner_in       | true | int | Transfer_in access for transfer between different margin accounts under the same account："1" represents "available", "0" represents "unavailable"         |         |
| transfer_inner_out       | true | int | Transfer_out access for transfer between different margin accounts under the same account："1" represents "available", "0" represents "unavailable"         |         |
| \</data\>            |      |        |               |                |

       
## [Cross] Query Information On Trade State

 - GET `linear-swap-api/v1/swap_cross_trade_state`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name  | Mandatory | Type | Desc  | Data Value |
| ------------- | ------ | ----- | ---------------------------------------- | ---- |
| contract_code | false | string | contract code |   "BTC-USDT"... ,return all contract info when null    |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "margin_mode": "cross",
            "margin_account": "USDT",
            "open": 1,
            "close": 1,
            "cancel": 1
        }
    ],
    "ts": 1606905935710
}

```
        
###  Returning Parameter

| Parameter Name   | Mandatory | Type     | Desc            | Data Value           |
| -------------------- | ---- | ------ | ------------- | -------------- |
| status               | true | string | Request Processing Result        | "ok" , "error" |
| ts                   | true | long   | Time of Respond Generation, Unit: Millisecond |                |
| \<data\> |  true    |  object array      |               |                |
| symbol       | true | string | symbol         |   "BTC","ETH"...              |
| contract_code | true | string | contract code         |    "BTC-USDT"...  |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| open       | true | int | open order access：when “1”, then access available; when “0”, access unavailable"1"         |             |
| close       | true | int | close order access：when “1”, then access available; when “0”, access unavailable "1"           |          |
| cancel       | true | int | order cancellation access：when “1”, then access available; when “0”, access unavailable "1"         |    |
| \</data\>            |      |        |               |                | 


## [General] Query Top Trader Sentiment Index Function-Account

- GET `/linear-swap-api/v1/swap_elite_account_ratio`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_elite_account_ratio?contract_code=BTC-USDT&period=60min"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter 

|  Parameter Name                 |   Mandatory    |    Type     |    Desc             |   Value Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code      | true       | string    |  contract code   | Case-Insenstive.e.g. "BTC-USDT" |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
    "status": "ok",
    "data": {
        "list": [
            {
                "buy_ratio": 0.2940,
                "sell_ratio": 0.6760,
                "locked_ratio": 0.0300,
                "ts": 1603591200000
            }
        ],
        "symbol": "BTC",
        "contract_code": "BTC-USDT"
    },
    "ts": 1603696167089
}
```

### Returning Parameter 

|   Parameter Name                 |  Mandatory  |   Type   |   Desc              |   Vaue Range        |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code    | true   |   string      | contract code  | e.g. "BTC-USDT" |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | net long accounts ratio |  |
| sell_ratio | true | decimal | net short accounts ratio |  |
| locked_ratio | true | decimal | locked accounts ratio |  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## [General] Query Top Trader Sentiment Index Function-Position

- GET `/linear-swap-api/v1/swap_elite_position_ratio`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_elite_position_ratio?contract_code=BTC-USDT&period=60min"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter 

|  Parameter Name                |    Mandatory   |   Type  |       Desc             |    Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code   | true    | string    |   contract code   | Case-Insenstive.e.g. "BTC-USDT" |
| period | true | string | period	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json


{
    "status": "ok",
    "data": {
        "list": [
            {
                "buy_ratio": 0.5000,
                "sell_ratio": 0.5000,
                "ts": 1603591200000
            }
        ],
        "symbol": "BTC",
        "contract_code": "BTC-USDT"
    },
    "ts": 1603696275437
}

```

### Returning Parameter 

|  Parameter Name                |    Mandatory   |    Type    |    Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond|  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code | true   | string    | contract code  | e.g. "BTC-USDT" |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | Net long position ratio |  |
| sell_ratio | true | decimal | Net short position ratio  |
| ts | true  | long | Time of Respond Generation |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

##  [General] Query Liquidation Orders

- GET `/linear-swap-api/v1/swap_liquidation_orders`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_liquidation_orders?contract_code=BTC-USDT&trade_type=0&create_date=7"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter 

|   Parameter Name    |  Mandatory  |  Type   |    Desc          |    Default   |    Value Range                                |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code  | true      | string     |   contract code    | | Case-Insenstive.e.g. "BTC-USDT" |
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
                "contract_code": "BTC-USDT",
                "symbol": "BTC",
                "direction": "sell",
                "offset": "close",
                "volume": 624,
                "price": 16701.4,
                "created_at": 1606380004694,
                "amount": 0.624,
                "trade_turnover": 10421.6736
            }
        ],
        "total_page": 10,
        "current_page": 1,
        "total_size": 10
    },
    "ts": 1606380004694
}

```

### Returning Parameter 

|   Parameter Name               |   Mandatory   |    Type   |     Desc             |   Value Range     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status                 | true     | string | Request Processing Result             |              |
| \<data\> |          |         |                    |              |
| \<orders\> |          |         |                    |              |
| symbol                 | true     | string  | symbol             |              |
| contract_code    |  true     |  string  | contract code  | e.g. "BTC-USDT" |
| direction              | true     | string  | "buy":buy"sell": sell     |              |
| offset              | true     | string  | "open":open "close":  close      |              
| volume           | true     | decimal |liquidation volume (cont)           |              |
| amount           | true         | decimal | liquidation amount (token)                                                   |
| trade_turnover    | true        | decimal |liquidation amount (quotation token)                                                     |
| price      | true     | decimal | bankruptcy price            |              |
| created_at            | true     | long    | liquidation time            |              |
| \</orders\>              |          |         |                    |              |
| total_page             | true     | int     | total page              |              |
| current_page           | true     | int     |   current page           |              |
| total_size             | true     | int     |   total size             |              |
| \</data\>            |          |         |                    |              |
| ts                     | true     | long    |   timestamp             |              |


## [General] Query historical settlement records of the platform interface 

 - GET `/linear-swap-api/v1/swap_settlement_records`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter

| Parameter Name        | Mandatory  | Type     | Desc   | Value Range                                    |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| contract_code        | true  | string | Contract Code        | "BTC-USDT","ETH-USDT"...                           |
| start_time   | false  | long    | Start time（timestamp，unit: millisecond）        |  Value range: [(Current time minus 90 days), Current time] ，default current time minus 90 days   |
| end_time   | false  | long    | End time（timestamp，unit: millisecond）        |  Value range: (start_time, current time)，default current time  |
| page_index        | false  | int |    Page, default page 1 if not filled       |                        |
| page_size        | false  | int | Page items, default 20, shall not exceed 50        |                          |

> Response: 

```json
{
    "status": "ok",
    "data": {
        "total_page": 108,
        "current_page": 1,
        "total_size": 108,
        "settlement_record": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "settlement_time": 1606377600000,
                "clawback_ratio": 0,
                "settlement_price": 17600.1,
                "settlement_type": "settlement"
            }
        ]
    },
    "ts": 1606383650761
}
```

### Return Parameter

| Parameter Name        | Mandatory  | Type     | Desc   | Value Range                                    |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status            | true | string  | Request Processing Result        | "ok" , "error" |
| ts                | true | long    | 	Response generation time point, unit: millisecond |                |
| \<data\>          |  true    |   object array    |               |          |
| \<settlement_record\>          |  true    |   object array    |               |          |
| symbol        | true | string | Token Code         |             |
| contract_code        | true | string | Contract Code          |   "BTC-USDT" ...             |
| settlement_time        | true | long | Settlement Time（timestamp，unit: millisecond）（when the settlement_type is delivery, the time is delivery time; when the settlement_type is settlement, the time is settlement time）          |             |
| clawback_ratio        | true | decimal | Clawback Ratio      |             |
| settlement_price        | true | decimal |  Settlement Price（when the settlement_type is delivery, the price is delivery price; when the settlement_type is settlement, the price is settlement price；）          |              |
| settlement_type        | true | string | Settlement Type         |  “delivery”：Delivery，“settlement”：Settlement            |
| \</settlement_record\>         |      |         |         |                |
| total_page        | true | int | Total Pages   |                |
| current_page        | true | int | Current Page   |                |
| total_size        | true | int | Total page items   |                |
| \</data\>         |      |         |        |                |


## [General] Query funding rate

- GET `linear-swap-api/v1/swap_funding_rate`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_funding_rate?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameters

  Parameter Name   |   Mandatory   |    Type   |     Desc             |   Value Range     |
------------ | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  contract code   |  Case-Insenstive."BTC-USDT" ...  |

> Response: 

```json

{
    "status": "ok",
    "data": {
        "estimated_rate": "0.000100000000000000",
        "funding_rate": "0.000100000000000000",
        "contract_code": "BTC-USDT",
        "symbol": "BTC",
        "fee_asset": "USDT",
        "funding_time": "1603699200000",
        "next_funding_time": "1603728000000"
    },
    "ts": 1603696494714
}

```

### Response Parameters

  field name      |   type   |   desc              |   value range        |
----------------------- |  ------- | ------------------ | -------------- |
status | string | response status  | "ok" , "error" |
ts | long | response timestamp.unit:millionSeconds. |  |
\<data\> |  |  |  |  |
symbol | string | symbol | "BTC","ETH"... |
contract_code  |  string   |  contract code,eg:"BTC-USDT"  |
fee_asset | string | fee asset | eg:"BTC","ETH"... |
funding_time | string | current funding time |  |
funding_rate | string |  current funding rate |  |
estimated_rate | string | estimated funding rate of current period |  |
next_funding_time  | string |  estimated funding rate of next period     |   |
\</data\> |  |  |  |  |


## [General] Query historical funding rate

- GET `linear-swap-api/v1/swap_historical_funding_rate`

```shell
curl "https://api.hbdm.com/linear-swap-api/v1/swap_historical_funding_rate?contract_code=BTC-USDT"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameters

  parameter name                 |  Required  |   Type   |   Desc              |   Value Range        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  contract code   |  Case-Insenstive.eg:"BTC-USDT" ...  |
page_index  | false    | int    | page index. 1 by default    | 1       |                                          |
page_size   | false    | int    | page size.20 by default. 50 at most | 20      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 14,
        "current_page": 1,
        "total_size": 14,
        "data": [
            {
                "avg_premium_index": "0.000049895833333333",
                "funding_rate": "0.000100000000000000",
                "realized_rate": "0.000100000000000000",
                "funding_time": "1603670400000",
                "contract_code": "BTC-USDT",
                "symbol": "BTC",
                "fee_asset": "USDT"
            }
        ]
    },
    "ts": 1603696680599
}

```

### Response Parameters

  parameter name            |  type   |   desc             |   value range        |
----------------------- |  ------- | ------------------ | -------------- |
status | string | response status  | "ok" , "error" |
ts | long | response timestamp.unit:millionSeconds. |  |
\<data\> |  |  |  |  |
\<data\> |  |  |  |  |
symbol | string | symbol | eg:"BTC","ETH"... |
contract_code  |  string   |  contract code  | eg: "BTC-USDT
fee_asset | string | fee asset | eg:"BTC","ETH"... |
funding_time | string | funding time |  |
funding_rate | string | funding rate |  |
realized_rate |string | realized funding rate |  |
avg_premium_index | string | average premium index |  |
\</data\> |  |  |  |  |
total_page     | int     | total page                |              |
current_page   | int     | current page               |              |
total_size     | int     |  total size               |              |
\</data\> |  |  |  |  |

## [General] Query Premium Index Kline Data

### example

- GET `/index/market/history/linear_swap_premium_index_kline`

```shell
curl "https://api.hbdm.com/index/market/history/linear_swap_premium_index_kline?contract_code=BTC-USDT&period=1min&size=1"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### request parameters
| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string |   contract code   |         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT","ETH-USDT".                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1week,1mon     |
| size  | true     | int    | kline size         | | [1,2000] |

> Response Example：

```json

{
    "ch": "market.BTC-USDT.premium_index.1min",
    "data": [
        {
            "amount": "0",
            "close": "0.0000079166666666",
            "count": "0",
            "high": "0.0000079166666666",
            "id": 1603696920,
            "low": "0.0000079166666666",
            "open": "0.0000079166666666",
            "trade_turnover": "0",
            "vol": "0"
        }
    ],
    "status": "ok",
    "ts": 1603696958348
}

```

### response parameters：

| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | true     | string | data channel          |         | eg： market.period                           |
|  \<data\>    |               |    |  object    |            | 
|  id    |     true          | long   | index kline id,the same as kline timestamp, kline start timestamp  |            
|  vol    |     true          | string   |  Trade Volume(Cont.) The value is 0   |            
|  count    |     true          | string   |   Order Quantity The value is 0|            
|  open    |     true          | string   |   Opening Price  |            
|  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | string   |  Lowest Price   |            
|  high    |     true          | string   |  Highest Price   |            
|  amount    |     true          | string   |  Trade Amount(Coin), The value is 0. )   |  
| trade_turnover     | true | string | Transaction amount, the value is 0.       |                |           
|  \</data\>    |               |     |      |          
| status  | true     | string    | process status          |   | "ok" , "error" |
| ts  | true     | long    | timestamp of the response of the server          |  |  unit：millionseconds |



## [General] Query Estimated Funding Rate Kline Data

### example

- GET `/index/market/history/linear_swap_estimated_rate_kline`

```shell
curl "https://api.hbdm.com/index/market/history/linear_swap_estimated_rate_kline?contract_code=BTC-USDT&period=1min&size=1"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### request parameters

| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string |  contract code  |         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT","ETH-USDT".                          |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1week,1mon     |
| size  | true     | int    | kline size         | | [1,2000] |

> Response Example：

```json

{
    "ch": "market.BTC-USDT.estimated_rate.1min",
    "data": [
        {
            "amount": "0",
            "close": "0.0001",
            "count": "0",
            "high": "0.0001",
            "id": 1603697100,
            "low": "0.0001",
            "open": "0.0001",
            "trade_turnover": "0",
            "vol": "0"
        }
    ],
    "status": "ok",
    "ts": 1603697104902
}
```

### response parameters：
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | true     | string | data channel          |         | eg： market.period                           |
|  \<data\>    |               |    |  object    |            | 
|  id    |     true          | long   |  kline ID     |            
|  vol    |     true          | string   |  Trade Volume(Cont.) The value is 0   |            
|  count    |     true          | string   |   Order Quantity The value is 0|            
|  open    |     true          | string   |   Opening Price  |            
|  close    |     true          | string   |  Closing Price,  the price in the last kline is the latest order price   |            
|  low    |     true          | string   |  Lowest Price   |            
|  high    |     true          | string   |  Highest Price   |            
|  amount    |     true          | string   |  Trade Amount(Coin), The value is 0. )   |  
| trade_turnover     | true | string | Transaction amount, the value is 0.       |                |                
|  \</data\>    |               |     |      |          
| status  | true     | string    | process status          |   | "ok" , "error" |
| ts  | true     | long    | timestamp of the response of the server          |  |  unit：millionseconds |



## [General] Query Basis Data

### example

- GET `/index/market/history/linear_swap_basis`

```shell
curl "https://api.hbdm.com/index/market/history/linear_swap_basis?contract_code=BTC-USDT&period=1min&size=150&basis_price_type=open"
```

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### request parameters
| **Parameter name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code name          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USDT"
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |
| size  | true     | int    | data size         | 150 | [1,2000] |

> Response example：

```json

{
    "ch": "market.BTC-USDT.basis.1min.open",
    "data": [
        {
            "basis": "15.29074235666667",
            "basis_rate": "0.001170582317307796",
            "contract_price": "13077.8",
            "id": 1603697160,
            "index_price": "13062.509257643333"
        }
    ],
    "status": "ok",
    "ts": 1603697170804
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


# Swap Account Interface

## [Isolated] Query User’s Account Information

###  Example          
                                      
 - POST /linear-swap-api/v1/swap_account_info

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |   
| ------------------ | ------------- | -------- | ------------ | 
| contract_code    | false     | string          | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

> Response:

```json

 
{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "margin_balance": 99.755058840000000000,
            "margin_position": 0,
            "margin_frozen": 12.730000000000000000,
            "margin_available": 87.025058840000000000,
            "profit_real": 0,
            "profit_unreal": 0,
            "risk_rate": 7.761218290652003142,
            "withdraw_available": 87.025058840000000000000000000000000000,
            "liquidation_price": null,
            "lever_rate": 10,
            "adjust_factor": 0.075000000000000000,
            "margin_static": 99.755058840000000000,
            "contract_code": "BTC-USDT",
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603697381238
}
```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | --------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"  
| \<list\>(Attribute Name: data) |               |          |                                               |                 |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...  |
| contract_code                  | true          | string   | contract code                                 |  "BTC-USDT" ... |
| margin_asset                   | true          | string   | Margin Asset                             |                |
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
| margin_mode                    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account                |   true   | string | margin account  | "BTC-USDT"... |
| \</list\>                      |               |          |                                               |                 |
| ts                             | true        | long     | Time of Respond Generation, Unit: Millisecond |                 |



## [Cross] Query User's Account Information

 - POST linear-swap-api/v1/swap_cross_account_info

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value         |
| ------ | ----- | ------ | ---- | ---------------------------- |
| margin_account | false | string | margin account，return all margin account info when null |  "USDT"...，but now only USDT  |

> Response

```json
{
    "status":"ok",
    "data":[
        {
            "margin_mode":"cross",
            "margin_account":"USDT",
            "margin_asset":"USDT",
            "margin_balance":0.000000549410817836,
            "margin_static":0.000000549410817836,
            "margin_position":0,
            "margin_frozen":0,
            "profit_real":0,
            "profit_unreal":0,
            "withdraw_available":0.000000549410817836,
            "risk_rate":null,
            "contract_detail":[
                {
                    "symbol":"BTC",
                    "contract_code":"BTC-USDT",
                    "margin_position":0,
                    "margin_frozen":0,
                    "margin_available":0.000000549410817836,
                    "profit_unreal":0,
                    "liquidation_price":null,
                    "lever_rate":100,
                    "adjust_factor":0.55
                },
                {
                    "symbol":"EOS",
                    "contract_code":"EOS-USDT",
                    "margin_position":0,
                    "margin_frozen":0,
                    "margin_available":0.000000549410817836,
                    "profit_unreal":0,
                    "liquidation_price":null,
                    "lever_rate":5,
                    "adjust_factor":0.06
                }
            ]
        }
    ],
    "ts":1606906200680
}

```
     
###  Returning Parameter

| Parameter Name  | Mandatory   | Type      | Desc    | Data Value           |
| -------------------- | ------ | ------- | -------------------- | -------------- |
| status               | true   | string  | Request Processing Result               | "ok" , "error" |
| ts                   | long | long    | Time of Respond Generation, Unit: Millisecond        |                |
| \<data\> |    true    |  object array       |                      |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance       | true   | decimal | account equity                 |                |
| margin_static        | true   | decimal | static margin                 |                |
| margin_position      | true   | decimal | position margin (summary of all contract)|                |
| margin_frozen        | true   | decimal | frozen margin (summary of all contract)               |                |
| profit_real          | true   | decimal | realized profits and losses (summary of all contract)             |                |
| profit_unreal        | true   | decimal | unrealized profits and losses (summary of all contract)               |                |
| withdraw_available   | true   | decimal | available transfer amount               |                |
| risk_rate            | true   | decimal | margin rate                 |                |
| \<contract_detail\> |    true    |  object array       ｜                   |                |
| symbol     | true   | string  | symbol                 | "BTC","ETH"... |
| contract_code     | true   | string  | contract code                 |  "BTC-USDT" ... |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| margin_available     | true   | decimal | available margin                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| liquidation_price | true | decimal | estimated liquidation price         |                |
| lever_rate           | true   | decimal | leverage Rate                 |                |
| adjust_factor        | true   | decimal | adjustment factor                 |                |
| \</contract_detail\>            |        |         |                      |                |
| \</data\>            |        |         |                      |                |


## [Isolated] Query User’s Position Information

###  Example                           
                     
 - POST  `/linear-swap-api/v1/swap_position_info` 

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc       |   
| ------------------ | ------------- | -------- | ------------ | 
| contract_code      | false         | string     | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "volume": 1.000000000000000000,
            "available": 1.000000000000000000,
            "frozen": 0,
            "cost_open": 13068.000000000000000000,
            "cost_hold": 13068.000000000000000000,
            "profit_unreal": 0,
            "profit_rate": 0,
            "lever_rate": 10,
            "position_margin": 1.306800000000000000,
            "direction": "buy",
            "profit": 0,
            "last_price": 13068,
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603697821846
}

```

### Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                        |   Value Range                       |
| ------------------------------ | ------------- | -------- | --------------------------------------------- | ----------------------------------- |
| status                         | true          | string   | Request Processing Result                     | "ok" , "error"                      |
| \<list\>(Attribute Name: data) |               |          |                                               |                                     |
| symbol                         | true          | string   | Variety code                                  | "BTC","ETH"...                      |
| contract_code                 |  true        |  string    |  contract code                                | e.g. "BTC-USDT" |
| volume                         | true          | decimal  | Position quantity                             |                                     |
| available                      | true          | decimal  | Available position can be closed              |                                     |
| frozen                         | true          | decimal  | frozen                                        |                                     |
| cost_open                      | true          | decimal  | Opening average price                         |                                     |
| cost_hold                      | true          | decimal  | Average price of position                     |                                     |
| profit_unreal                  | true          | decimal  | Unrealized profit and loss                    |                                     |
| profit_rate                    | true          | decimal  | Profit rate                                   |                                     |
| profit                         | true          | decimal  | profit                                        |                                     |
| margin_asset                   | true          | string   | Margin Asset                            |                |
| position_margin                | true          | decimal  | Position margin                               |                                     |
| lever_rate                     | true          | int      | Leverage rate                                 |                                     |
| direction                      | true          | string   | Transaction direction                         |                                     |
| last_price                     | true          | decimal  | Latest price                                  |                                     |
| margin_mode                    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account                |   true   | string | margin account  | "BTC-USDT"... |
| \</list\>                      |               |          |                                               |                                     |
| ts                             | true          | long     | Time of Respond Generation, Unit: Millisecond |                                     |

#### Note

- If there are symbols in the settlement or delivery period,error code 1080(1080 In settlement or delivery. Unable to get positions of some contracts.) will return without request parameters. It's suggested to query the position info with request parameters to avoid raising the error code and not being able to query the position.


## [Cross] Query User's Position Information

 - POST `linear-swap-api/v1/swap_cross_position_info`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value         |
| ------ | ----- | ------ | ---- | ---------------------------- |
| contract_code | false | string | contract code |  "BTC-USDT"... , return all contract info when null  |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "volume": 2,
            "available": 2,
            "frozen": 0,
            "cost_open": 51179.1,
            "cost_hold": 51179.1,
            "profit_unreal": 0,
            "profit_rate": 0,
            "lever_rate": 100,
            "position_margin": 10.23582,
            "direction": "sell",
            "profit": 0,
            "last_price": 51179.1,
            "margin_asset": "USDT",
            "margin_mode": "cross",
            "margin_account": "USDT"
        }
    ],
    "ts": 1606962314205
}
```
     
###  Returning Parameter

| Parameter Name  | Mandatory | Type      | Desc   | Data Value      |
| -------------------- | ---- | ------- | ---------------- | ---------------------------------------- |
| status               | true | string  | Request Processing Result           | "ok" , "error"                           |
| ts                   | true | long    | Time of Respond Generation, Unit: Millisecond    |                                          |
| \<data\> |  true    |   object array      |     |     |
| symbol               | true | string  | symbol             | "BTC","ETH"...                           |
| contract_code        | true | string  | contract code             | "BTC-USDT" ...                          |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume               | true | decimal | position quantity              |                                          |
| available            | true | decimal | available position can be closed            |                                          |
| frozen               | true | decimal | frozen quantity             |                                          |
| cost_open            | true | decimal | opening average price             |                                          |
| cost_hold            | true | decimal | average price of position             |                                          |
| profit_unreal        | true | decimal | unrealized profits and losses            |                                          |
| profit_rate          | true | decimal | profit rate              |                                          |
| profit               | true | decimal | profit               |                                          |
| margin_asset       | true   | string | margin asset                 |                |
| position_margin      | true | decimal | position margin            |                                          |
| lever_rate           | true | int     | leverage Rate             |                                          |
| direction            | true | string  | "buy"/"sell" |                                          |
| last_price           | true | decimal | latest price              |                                          |
| \</data\>            |      |         |      |              |


## [Isolated] Query Assets And Positions

 - post `linear-swap-api/v1/swap_account_position_info`
  
#### Remarks

 - This interface only supports isolated margin mode.

  
### params

field               |  Mandatory |  type  |  desc         |   range       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code | true | string | contract code	 |Case-Insenstive.Both uppercase and lowercase are supported. "BTC-USDT","ETH-USDT".... |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "margin_balance": 99.751731640000000000,
            "margin_position": 1.306990000000000000,
            "margin_frozen": 12.730000000000000000,
            "margin_available": 85.714741640000000000,
            "profit_real": -0.005227200000000000,
            "profit_unreal": 0.001900000000000000,
            "risk_rate": 7.031347702748238760,
            "withdraw_available": 85.712841640000000000000000000000000000,
            "liquidation_price": null,
            "lever_rate": 10,
            "adjust_factor": 0.075000000000000000,
            "margin_static": 99.749831640000000000,
            "positions": [
                {
                    "symbol": "BTC",
                    "contract_code": "BTC-USDT",
                    "volume": 1.000000000000000000,
                    "available": 1.000000000000000000,
                    "frozen": 0,
                    "cost_open": 13068.000000000000000000,
                    "cost_hold": 13068.000000000000000000,
                    "profit_unreal": 0.001900000000000000,
                    "profit_rate": 0.001453933272115090,
                    "lever_rate": 10,
                    "position_margin": 1.306990000000000000,
                    "direction": "buy",
                    "profit": 0.001900000000000000,
                    "last_price": 13069.9,
                    "margin_asset": "USDT",
                    "margin_mode": "isolated",
                    "margin_account": "BTC-USDT"
                }
            ],
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603697944138
}
```

### response

| attr | type | Mandatory | desc     |  Value  | 
| -----  | -----  | -----  | -----  | ----- | 
| status               | true   | string  | Request Processing Result       | "ok" , "error" |
| ts                   | true | long    | Time of Respond Generation, Unit: Millisecond       |                |
| \<data\> |    true    |  object array       |                      |                |
| symbol     | true   | string  | contract symbol                 | "BTC","ETH"... |
| contract_code        | true | string  | contract code           | "BTC-USDT" ...   |
| margin_asset       | true   | string | Margin Asset                  |                |
| margin_balance       | true   | decimal | Balance Margin                 |                |
| margin_static        | true   | decimal | Balance static                  |                |
| margin_position      | true   | decimal | Postion Margin |                |
| margin_frozen        | true   | decimal | Frozen Margin                 |                |
| margin_available     | true   | decimal | Available Margin                |                |
| profit_real          | true   | decimal | Realized Profit                |                |
| profit_unreal        | true   | decimal | Unreadlized Profit                 |                |
| risk_rate            | true   | decimal | risk rate                 |                |
| liquidation_price    | true   | decimal | Estimated Liquidation Price                |                |
| withdraw_available   | true   | decimal | Available Withdraw                 |                |
| lever_rate           | true   | decimal | Leverage Rate                 |                |
| adjust_factor        | true   | decimal | Adjustment Factor                 |                |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \<positions\> |    true    |  object array       |                      |                |
| symbol               | true | string  | Variety Code             | "BTC","ETH"...                           |
| contract_code        | true | string  | Contract Code             |"BTC-USDT" ...         |
| volume               | true | decimal | Position Quantity               |                                          |
| available            | true | decimal | Available position quatity can be closed            |                                          |
| frozen               | true | decimal | forzen postion Quantity             |                                          |
| cost_open            | true | decimal | Opening Average Price             |                                          |
| cost_hold            | true | decimal | Average position price             |                                          |
| profit_unreal        | true | decimal | Unrealized profit            |                                          |
| profit_rate          | true | decimal | Profit Rate              |                                          |
| profit               | true | decimal | Profit               |                                          |
| margin_asset       | true   | string | Margin Asset                  |                |
| position_margin      | true | decimal | Position Margin            |                                          |
| lever_rate           | true | int     | Leverage Rate             |                                          |
| direction            | true | string  | "buy" "sell" |                                          |
| last_price           | true | decimal | Last Price              |                                          |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</positions\>            |        |         |                      |                |
| \</data\>            |        |         |                      |                |


## [Cross] Query Assets And Positions

 - POST `linear-swap-api/v1/swap_cross_account_position_info`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value         |
| ------ | ----- | ------ | ---- | ---------------------------- |
| margin_account | true | string | margin account |  "USDT"...，but now only USDT  |

> Response

```json
{
    "status":"ok",
    "data":{
        "positions":[
            {
                "symbol":"BTC",
                "contract_code":"BTC-USDT",
                "volume":2,
                "available":2,
                "frozen":0,
                "cost_open":51179.1,
                "cost_hold":51179.1,
                "profit_unreal":0,
                "profit_rate":0,
                "lever_rate":100,
                "position_margin":10.23582,
                "direction":"sell",
                "profit":0,
                "last_price":51179.1,
                "margin_asset":"USDT",
                "margin_mode":"cross",
                "margin_account":"USDT"
            },
            {
                "symbol":"ETH",
                "contract_code":"ETH-USDT",
                "volume":1,
                "available":1,
                "frozen":0,
                "cost_open":50,
                "cost_hold":50,
                "profit_unreal":0,
                "profit_rate":0,
                "lever_rate":5,
                "position_margin":0.1,
                "direction":"sell",
                "profit":0,
                "last_price":50,
                "margin_asset":"USDT",
                "margin_mode":"cross",
                "margin_account":"USDT"
            }
        ],
        "margin_mode":"cross",
        "margin_account":"USDT",
        "margin_asset":"USDT",
        "margin_balance":999.488009549410817836,
        "margin_static":999.488009549410817836,
        "margin_position":10.33582,
        "margin_frozen":0,
        "profit_real":-0.511991,
        "profit_unreal":0,
        "withdraw_available":989.152189549410817836,
        "risk_rate":176.349367815895629991,
        "contract_detail":[
            {
                "symbol":"BTC",
                "contract_code":"BTC-USDT",
                "margin_position":10.23582,
                "margin_frozen":0,
                "margin_available":989.152189549410817836,
                "profit_unreal":0,
                "liquidation_price":100599.901021850363890402,
                "lever_rate":100,
                "adjust_factor":0.55
            },
            {
                "symbol":"ETH",
                "contract_code":"ETH-USDT",
                "margin_position":0.1,
                "margin_frozen":0,
                "margin_available":989.152189549410817836,
                "profit_unreal":0,
                "liquidation_price":98256.749856661148007509,
                "lever_rate":5,
                "adjust_factor":0.06
            }
        ]
    },
    "ts":1606965138763
}

```

###  Returning Parameter

| Parameter Name  | Mandatory   | Type      | Desc    | Data Value           |
| -------------------- | ------ | ------- | -------------------- | -------------- |
| status               | true   | string  | Request Processing Result               | "ok" , "error" |
| ts                   | long | long    | Time of Respond Generation, Unit: Millisecond        |                |
| \<data\> |    true    |  object array       |                      |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance       | true   | decimal | account equity                 |                |
| margin_static        | true   | decimal | static margin                 |                |
| margin_position      | true   | decimal | position margin (summary of all contract)|                |
| margin_frozen        | true   | decimal | frozen margin (summary of all contract)               |                |
| profit_real          | true   | decimal | realized profits and losses                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses (summary of all contract)               |                |
| withdraw_available   | true   | decimal | available transfer amount               |                |
| risk_rate            | true   | decimal | margin rate                 |                |
| \<contract_detail\> |    true    |  object array                         |                |
| symbol     | true   | string  | symbol                 | "BTC","ETH"... |
| contract_code     | true   | string  | contract code                 |  "BTC-USDT" ... |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| margin_available     | true   | decimal | available margin                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| liquidation_price | true | decimal | estimated liquidation price         |                |
| lever_rate           | true   | decimal | leverage Rate                 |                |
| adjust_factor        | true   | decimal | adjustment factor                 |                |
| \</contract_detail\>            |        |         |                      |                |
| \<positions\> |    true    |  object array       |                      |                |
| symbol               | true | string  | symbol             | "BTC","ETH"...                           |
| contract_code        | true | string  | contract code             | "BTC-USDT" ...                          |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume               | true | decimal | position quantity              |                                          |
| available            | true | decimal | available position can be closed            |                                          |
| frozen               | true | decimal | frozen quantity             |                                          |
| cost_open            | true | decimal | opening average price             |                                          |
| cost_hold            | true | decimal | average price of position             |                                          |
| profit_unreal        | true | decimal | unrealized profits and losses            |                                          |
| profit_rate          | true | decimal | profit rate              |                                          |
| profit               | true | decimal | profit               |                                          |
| margin_asset       | true   | string | margin asset                 |                |
| position_margin      | true | decimal | position margin            |                                          |
| lever_rate           | true | int     | leverage Rate             |                                          |
| direction            | true | string  | "buy"/"sell" |                                          |
| last_price           | true | decimal | latest price              |                                          |
| \</positions\>            |        |         |                      |                |
| \</data\>            |        |         |                      |                |



## [Isolated] Query assets information of all sub-accounts under the master account

 - POST `/linear-swap-api/v1/swap_sub_account_list`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**        |  **Value range**                                 |
| ----------- | -------- | ------ | ------------- |  ---------------------------------------- |
| contract_code    | false     |  string    | contract code | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "sub_uid": 123456789,
            "list": [
                {
                    "symbol": "BTC",
                    "margin_balance": 20,
                    "liquidation_price": null,
                    "risk_rate": null,
                    "contract_code": "BTC-USDT",
                    "margin_asset": "USDT",
                    "margin_mode": "isolated",
                    "margin_account": "BTC-USDT"
                }
            ]
        }
    ],
    "ts": 1603698380336
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
| contract_code     | true    | string    | contract code      | e.g. "BTC-USDT" |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance | true | decimal | account equity |  |
| liquidation_price | true | decimal | estimated liquidation price |  |
| risk_rate | true | decimal | margin rate |  |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

#### Notice

 - Only return data for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission). 


## [Cross] Query Assets Information Of All Sub-Accounts Under The Master Account    

 - POST `linear-swap-api/v1/swap_cross_sub_account_list`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value         |
| ------ | ----- | ------ | ---- | ---------------------------- |
| margin_account | false | string | margin account，return all margin account info when null |  "USDT"...，but now only USDT  |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "sub_uid": 123456789,
            "list": [
                {
                    "margin_balance": 163.561708129559110889,
                    "risk_rate": 78.896729392251481019,
                    "margin_asset": "USDT",
                    "margin_mode": "cross",
                    "margin_account": "USDT"
                }
            ]
        }
    ],
    "ts": 1606962745633
}

```

### Returning Parameter

| Parameter Name  | Mandatory | Type      | Desc     | Data Value           |
| ----------------- | ---- | ------- | ------------- | -------------- |
| status            | true | string  | Request Processing Result        | "ok" , "error" |
| ts                | true | long    | Time of Respond Generation, Unit: Millisecond |                |
| \<data\>          | true     |    object array     |               |                |
| sub_uid           | true | long    | sub-account UID        |                |
| \<list\>          |   true   |  object array       |               |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance    | true | decimal | account equity          |                |
| risk_rate         | true | decimal | margin rate          |                |
| \</list\>         |      |         |               |                |
| \</data\>         |      |         |               |                |           
    
#### Notice

 - Only return data for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission).


## [Isolated] Query a single sub-account's assets information

 - POST `/linear-swap-api/v1/swap_sub_account_info`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**        | 
| ----------- | -------- | ------ | ------------- | 
| contract_code   |   false   |  string    | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |
| sub_uid | true | long | sub-account UID	 |  

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "margin_balance": 20,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 20.000000000000000000,
            "profit_real": 0,
            "profit_unreal": 0,
            "risk_rate": null,
            "withdraw_available": 20.000000000000000000,
            "liquidation_price": null,
            "lever_rate": 5,
            "adjust_factor": 0.040000000000000000,
            "margin_static": 20,
            "contract_code": "BTC-USDT",
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603698523200
}

```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts                       | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"...when the$contract_code value is "*", it will subscribe all contract types |
| contract_code             |   true            | string   |  contract code     | e.g. "BTC-USDT" |
| margin_asset              | true              | string   | margin asset                 |                |
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
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</data\> |  |  |  |  |


#### Notice

  - Only query account information for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission);
  
  - No data return for sub-accounts which has logged in hbdm but have not gained trading permission/activated.


## [Cross] Query A Sub-Account's Assets Information

  - POST `linear-swap-api/v1/swap_cross_sub_account_info`  

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter*

| Parameter Name    | Mandatory  | Type     | Desc    | Data Value |
| ------- | ----- | ------ | ------- | ---------------------------- |
| sub_uid | true  | long   | sub-account UID |       |
| margin_account | false | string | margin account，return all margin account info when null |  "USDT"...，but now only USDT  |

 > Response:

 ```json

{
    "status": "ok",
    "data": [
        {
            "margin_mode": "cross",
            "margin_account": "USDT",
            "margin_asset": "USDT",
            "margin_balance": 163.561708129559110889,
            "margin_static": 163.561708129559110889,
            "margin_position": 102.3582,
            "margin_frozen": 0,
            "profit_real": 0,
            "profit_unreal": 0,
            "withdraw_available": 61.203508129559110889,
            "risk_rate": 78.896729392251481019,
            "contract_detail": [
                {
                    "symbol": "BTC",
                    "contract_code": "BTC-USDT",
                    "margin_position": 102.3582,
                    "margin_frozen": 0,
                    "margin_available": 61.203508129559110889,
                    "profit_unreal": 0,
                    "liquidation_price": 67266.205988999911443127,
                    "lever_rate": 5,
                    "adjust_factor": 0.02
                },
                {
                    "symbol": "EOS",
                    "contract_code": "EOS-USDT",
                    "margin_position": 0,
                    "margin_frozen": 0,
                    "margin_available": 61.203508129559110889,
                    "profit_unreal": 0,
                    "liquidation_price": null,
                    "lever_rate": 5,
                    "adjust_factor": 0.06
                }
            ]
        }
    ],
    "ts": 1606963336786
}

 ```  
    
###  Returning Parameter

| Parameter Name  | Mandatory   | Type      | Desc    | Data Value           |
| -------------------- | ------ | ------- | -------------------- | -------------- |
| status               | true   | string  | Request Processing Result               | "ok" , "error" |
| ts                   | long | long    | Time of Respond Generation, Unit: Millisecond        |                |
| \<data\> |    true    |  object array       |                      |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance       | true   | decimal | account equity                 |                |
| margin_static        | true   | decimal | static margin                 |                |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| profit_real          | true   | decimal | realized profits and losses                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| withdraw_available   | true   | decimal | available transfer amount               |                |
| risk_rate            | true   | decimal | margin rate                 |                |
| \<contract_detail\> |    true    |  object array       |                 |                |
| symbol     | true   | string  | symbol                 | "BTC","ETH"... |
| contract_code     | true   | string  | contract code                 |  "BTC-USDT" ... |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| margin_available     | true   | decimal | available margin                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| liquidation_price | true | decimal | estimated liquidation price         |                |
| lever_rate           | true   | decimal | leverage Rate                 |                |
| adjust_factor        | true   | decimal | adjustment factor                 |                |
| \</contract_detail\>            |        |         |                      |                |
| \</data\>            |        |         |                      |                |

#### Notice

  - Only query account information for activated contract sub-account (i.e. sub-accounts that have gained contract trading permission);
  
  - No data return for sub-accounts which has logged in hbdm but have not gained trading permission/activated.
 

## [Isolated] Query a single sub-account's position information

 - POST `/linear-swap-api/v1/swap_sub_position_info`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameters

| **Parameter name**    | **Must fill or not** | **Type** | **Description**        | 
| ----------- | -------- | ------ | ------------- | 
| contract_code  |   false     |  string    | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |
| sub_uid | true | long | sub-account UID	 | 

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "volume": 1.000000000000000000,
            "available": 1.000000000000000000,
            "frozen": 0,
            "cost_open": 13038.700000000000000000,
            "cost_hold": 13038.700000000000000000,
            "profit_unreal": 0,
            "profit_rate": 0,
            "lever_rate": 10,
            "position_margin": 1.303870000000000000,
            "direction": "buy",
            "profit": 0,
            "last_price": 13038.7,
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603699081114
}                                           
```

### Return parameters

| **Parameter name**               | **Must fill or not** | **Type**  | **Description**             | **Value range**     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status | true | string | the handling result of requests	 | "ok" , "error" |
| ts                       | true | long | the create time point of response, unit: ms |  |
| \<data\> |  |  |  |  |
| symbol                  | true     | string  | type code               | "BTC","ETH"... |
| contract_code           | true     | string  |  contract code             | "BTC-USDT" ... |
| margin_asset              | true              | string   | margin asset                 |                |
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
| margin_mode            |   true   | string | margin mode  | isolated : "isolated" |
| margin_account         |   true   | string | margin account  | "BTC-USDT"... |
| \</data\> |  |  |  |  |


## [Cross] Query A Sub-Account's Position Information

 - POST `linear-swap-api/v1/swap_cross_sub_position_info`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name    | Mandatory  | Type     | Desc    | Data Value |
| ------- | ----- | ------ |  ------------------ | ---- |
| contract_code  | false | string | contract code    |  "BTC-USDT"..., return all contract info when null |      |
| sub_uid | true  | long   | sub-account UID |                              |      |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "volume": 1,
            "available": 1,
            "frozen": 0,
            "cost_open": 26666.2,
            "cost_hold": 51179.1,
            "profit_unreal": 0,
            "profit_rate": -4.59624918436072631,
            "lever_rate": 5,
            "position_margin": 102.3582,
            "direction": "sell",
            "profit": -245.129,
            "last_price": 51179.1,
            "margin_asset": "USDT",
            "margin_mode": "cross",
            "margin_account": "USDT"
        }
    ],
    "ts": 1606964256589
}

```

###  Returning Parameter

| Parameter Name  | Mandatory | Type      | Desc   | Data Value      |
| -------------------- | ---- | ------- | ---------------- | ---------------------------------------- |
| status               | true | string  | Request Processing Result           | "ok" , "error"                           |
| ts                   | true | long    | Time of Respond Generation, Unit: Millisecond    |                                          |
| \<data\> |  true    |   object array      |     |     |
| symbol               | true | string  | symbol             | "BTC","ETH"...                           |
| contract_code        | true | string  | contract code             | "BTC-USDT" ...                          |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume               | true | decimal | position quantity              |                                          |
| available            | true | decimal | available position can be closed            |                                          |
| frozen               | true | decimal | frozen quantity             |                                          |
| cost_open            | true | decimal | opening average price             |                                          |
| cost_hold            | true | decimal | average price of position             |                                          |
| profit_unreal        | true | decimal | unrealized profits and losses            |                                          |
| profit_rate          | true | decimal | profit rate              |                                          |
| profit               | true | decimal | profit               |                                          |
| margin_asset       | true   | string | margin asset                 |                |
| position_margin      | true | decimal | position margin            |                                          |
| lever_rate           | true | int     | leverage Rate             |                                          |
| direction            | true | string  | "buy"/"sell" |                                          |
| last_price           | true | decimal | latest price              |                                          |
| \</data\>            |      |         |      |              |


## [General] Query account financial records

- POST `/linear-swap-api/v1/swap_financial_record`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameters

| **Parameter name**                | **Must fill or not** | **Type**  | **Description**             | **Value range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| margin_account      | true <img width=250/>  | string <img width=250/> | Margin currency  <img width=1100/>    | "BTC-USDT"...     |
| contract_code      | false   | string | contract code    | "BTC-USDT"...     |
| type | false | string | if not fill this parameter, it will query all types 【please use "," to seperate multiple types】 | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; 38:Transfer in from another margin account; 39:Transfer out to another margin account; |
| create_date | false | int |  any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.  |  |
| page_index | false | int | which page, default value is "1st page" when not fill this parameter |  |
| page_size | false | int | the default value is "20" when not fill this parameter, should ≤50 |  |

#### Note:

 - It needs contract_code parameter for request in cross margin mode when query the trading financial records of a certain contract market. And it not need contract_code parameter in other scenarios.

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 13,
        "current_page": 1,
        "total_size": 13,
        "financial_record": [
            {
                "id": 57408,
                "type": 34,
                "amount": -20.000000000000000000,
                "ts": 1603698366183,
                "contract_code": "BTC-USDT",
                "asset": "USDT",
                "margin_account": "BTC-USDT",
                "face_margin_account": "BTC-USDT"
            }
        ]
    },
    "ts": 1603699203087
}  
```


### Return parameters

| **Parameter name**                | **Must fill or not** | **Type**  | **Description**             | **Value range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true <img width=250/> | string <img width=250/> | processing result of requests <img width=1100/>   | "ok" , "error" |
| ts | true  | long | response create time point，unit：ms |  |
| \<data\> |  |  | dicitionary type |  |
| \<financial_record\> |  |  |  |  |
| id | true  | long |  |  |
| ts | true  | long | create time |  |
| asset | true  | string | asset | "USDT"... |
| contract_code | true | string | contract type code   | "BTC-USDT",... |
| margin_account                | true | string  | margin account          | "BTC-USDT"...                           |
| face_margin_account           | true | string  | The counterparty margin account only has value when the type transaction type are 34, 35, 36, 37, 38, 39; for other types, the field values are empty strings.         |  "BTC-USDT"...   | 
| type | true  | int | transaction type | 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; 38:Transfer in from another margin account; 39:Transfer out to another margin account;  |
| amount | true  | decimal | amount |  |
| \</financial_record\> |  |  |  |  |
| total_page | true  | int | total page |  |
| current_page | true  | int | current page |  |
| total_size | true  | int | total size |  |
| \</data\> |  |  |  |  |

<!--
## Query user’s settlement records

 - POST `swap-api/v1/swap_user_settlement_records`

### Request Parameter

| Parameter Name        | Mandatory  | Type     | Description   | Value Range       |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| contract_code | true  | string | contract_code     |                                          |
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
        "settlement_records":[
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "margin_balance_init": 10,
                "margin_balance": 2,
                "settlement_profit_real": 1.199,
                "settlement_time": 1590825600,
                "clawback": -0.001,
                "funding_fee": -0.001,
                "offset_profitloss": 0,
                "fee": 0,
                "fee_asset": "BTC",
                "positions":[
                    {
                        "symbol": "BTC",
                        "contract_code": "BTC-USDT",
                        "direction": "buy",
                        "volume": 2,
                        "cost_open": 6500,
                        "cost_hold_pre": 6500,
                        "cost_hold": 7000,
                        "settlement_profit_unreal": 2.4,
                        "settlement_price": 7000,
                        "settlement_type": "settlement"
                    },
                    {
                        "symbol": "BTC",
                        "contract_code": "BTC-USDT",
                        "direction": "sell",
                        "volume": 1,
                        "cost_open": 6500,
                        "cost_hold_pre": 6500,
                        "cost_hold": 7000,
                        "settlement_profit_unreal": -1.2,
                        "settlement_price": 7000,
                        "settlement_type": "settlement"
                    }]
            }],
        "current_page": 1,
        "total_page": 1,
        "total_size": 5
    },
    "ts": 1578124684692
}

```
### Returning Parameter

| Parameter Name                   | Mandatory | Type      | Description       | Value Range                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result             |                                          |
| \<data\> | true     |  object      |                    |                                          |
| \<settlement_records\> | true     |  object   array    |                    |                                          |
| symbol     | true   | string  | Coin Code                  | "BTC","ETH"... |
| contract_code     | true   | string  | | contract code                  |  "BTC-USDT" ... |
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
| contract_code     | true   | string  | contract code              |  "BTC-USDT" ... |
| direction            | true | string  | Position Direction |    [buy : sell]                                     |
| volume         | true | decimal | Position volume before the settlement of this term（cont）             |          |
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
-->


## [Isolated] Query user’s available leverage

 - POST `linear-swap-api/v1/swap_available_level_rate`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter：

| **Parameter Name**      | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |	
| contract_code | false | string | Contract code, if not filled in, the actual available leverage of all contracts will be returned by default	 |  “BTC-USDT”。。。 |

### Returning Parameter：

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| \<data\> | true  | object array |  |   |
| contract_code | true  | string |  contract code |  "BTC-USDT"|
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| available_level_rate | true  | string |  available level rate,splited by ','  | "1,5,10" |
| \</data\> |  |  |  |  |
| ts | true  | long | Response generation time point, unit: millisecond |  |

> Response：

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "BTC-USDT",
            "margin_mode": "isolated",
            "available_level_rate": "1,2,3,5,10,20,30,50,75,100,125"
        }
    ],
    "ts": 1603699467348
}

```


## [Cross] Query User’s Available Leverage

 - POST `linear-swap-api/v1/swap_cross_available_level_rate`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name              | Mandatory    | Type    | Desc    | Data Value |
| ---------------- | ------- | ----- | ---------------------------------------- | -----------|
| contract_code | false | string | contract code，return all contract info when null	 | “BTC-USDT”... |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "BTC-USDT",
            "available_level_rate": "1,2,3,5,10,20,30,50,75,100,125",
            "margin_mode": "cross"
        }
    ],
    "ts": 1606965620243
}

```

### Returning Parameter

| Parameter Name          | Mandatory | Type      | Desc  | Data Value |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| \<data\> | true  | object array |  |  |
| contract_code | true  | string | contract code | "BTC-USDT"... |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| available_level_rate | true  | string | available level rate,splited by ',' | "1,5,10" |
| \</data\> |  |  |  |  |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |


## [General] Query swap information on order limit

 - POST `/linear-swap-api/v1/swap_order_limit`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter

|   Parameter Name                |   Mandatory  |   Type   |    Description             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false <img width=250/> | string <img width=250/> | contract type code <img width=1000/>  | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Lightning Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order, "opponent_ioc"：IOC order using the BBO price，"lightning_ioc"：lightning IOC，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"lightning_fok"：lightning FOK，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK|

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_price_type": "limit",
        "list": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "open_limit": 70000.000000000000000000,
                "close_limit": 140000.000000000000000000
            }
        ]
    },
    "ts": 1603699658996
}
```

### Returning Parameter 

|   Parameter Name                |   Mandatory  |    Type   |    Desc              |    Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true <img width=250/> | string <img width=250/> | Request Processing Result <img width=1000/> | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> | |  |  |  |    
| order_price_type | true  | string | Order Type | "limit": Limit Order，"opponent":BBO，"lightning": Lightning Close，"optimal_5": Optimal top 5 price，"optimal_10":Optimal top 10 price，"optimal_20":Optimal top 20 price,"fok":FOK order,"ioc":ioc order, "opponent_ioc"：IOC order using the BBO price，"lightning_ioc"：lightning IOC，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"lightning_fok"：lightning FOK，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |
| \<list\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USDT",... |
| open_limit | true | decimal | Max open order limit | |
| close_limit | true | decimal | Max close order limit |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## [General] Query information on swap trading fee

 - POST `/linear-swap-api/v1/swap_fee`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter 

|   Parameter Name                 |   Mandatory   |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT",... |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "open_maker_fee": "0.0002",
            "open_taker_fee": "0.0004",
            "close_maker_fee": "0.0002",
            "close_taker_fee": "0.0004",
            "fee_asset": "USDT"
        }
    ],
    "ts": 1603699756575
}
```

### Returning Parameter 

|  Parameter Name                |   Mandatory  |   Type  |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true | string | Variety code | |
| contract_code | true | string | contract type code   | "BTC-USDT",... |
| open_maker_fee | true | string | Open maker order fee, decimal | |
| open_taker_fee | true | string | Open taker order fee, decimal | |
| close_maker_fee | true | string | Close maker order fee, decimal  | |
| close_taker_fee | true | string | Close taker order fee, decimal  | |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
| \</data\> |  |  |  |  |


## [Isolated] Query information on Transfer Limit

 - POST `/linear-swap-api/v1/swap_transfer_limit`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "transfer_in_max_each": 100000000.000000000000000000,
            "transfer_in_min_each": 1.000000000000000000,
            "transfer_out_max_each": 10000000.000000000000000000,
            "transfer_out_min_each": 0.000001000000000000,
            "transfer_in_max_daily": 1000000000.000000000000000000,
            "transfer_out_max_daily": 200000000.000000000000000000,
            "net_transfer_in_max_daily": 500000000.000000000000000000,
            "net_transfer_out_max_daily": 100000000.000000000000000000,
            "margin_mode": "isolated"
        }
    ],
    "ts": 1603699803580
}
```

### Returning Parameter 

|   Parameter Name                |   Mandatory   |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Respond Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USDT",... |
| transfer_in_max_each | true | decimal | Max limit of a single deposit |  |
| transfer_in_min_each | true | decimal | Min limit of a single deposit |  |
| transfer_out_max_each | true | decimal | Max limit of a single withdrawal |  |
| transfer_out_min_each | true | decimal | Min limit of a single withdrawal |  |
| transfer_in_max_daily | true | decimal | Max daily limit of total deposits |  |
| transfer_out_max_daily | true | decimal | Max daily limit of totally withdrawals |  |
| net_transfer_in_max_daily | true | decimal | Max daily limit of net total deposits |  |
| net_transfer_out_max_daily | true | decimal | Max daily limit of net total withdrawals |  |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| \</data\> |  |  |  |  |


## [Cross] Query Information On Transfer Limit

 - POST `linear-swap-api/v1/swap_cross_transfer_limit`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value       |
| ------ | ----- | ------ | ---- | ---------------------------- |
| margin_account | false | string | margin account, return all margin account info when null  |  "USDT"...，but now only USDT  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "transfer_in_max_each": 999999999999999999,
            "transfer_in_min_each": 0.0001,
            "transfer_out_max_each": 999999999999999999,
            "transfer_out_min_each": 0.0001,
            "transfer_in_max_daily": 900000000999999999,
            "transfer_out_max_daily": 900000099999999999,
            "net_transfer_in_max_daily": 900000000099999999,
            "net_transfer_out_max_daily": 123456789012345678.12345678,
            "margin_account": "USDT",
            "margin_mode": "cross"
        }
    ],
    "ts": 1606964432217
}

```

### Returning Parameter

| Parameter Name   | Mandatory | Type      | Desc       | Data Value           |
| -------------------------- | ---- | ------- | ------------- | -------------- |
| status                     | true | string  | Request Processing Result        | "ok" , "error" |
| ts                         | true | long    | Time of Respond Generation, Unit: Millisecond |                |
| \<data\>     |  true    |  object array       |               |                |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| transfer_in_max_each       | true | decimal | max limit of a single deposit       |                |
| transfer_in_min_each       | true | decimal | min limit of a single deposit       |                |
| transfer_out_max_each      | true | decimal | max limit of a single withdrawal       |                |
| transfer_out_min_each      | true | decimal | min limit of a single withdrawal       |                |
| transfer_in_max_daily      | true | decimal | max daily limit of total deposits     |                |
| transfer_out_max_daily     | true | decimal | max daily limit of totally withdrawals     |                |
| net_transfer_in_max_daily  | true | decimal | max daily limit of net total deposits    |                |
| net_transfer_out_max_daily | true | decimal | max daily limit of net total withdrawals    |                |
| \</data\>                  |      |         |               |                |



## [Isolated] Query information on position limit

 - POST `/linear-swap-api/v1/swap_position_limit`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter 

|  Parameter Name                |   Mandatory  |   Type   |   Desc             |   Value Range      |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | false | string | contract type code   | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

> Response:


```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "buy_limit": 700000.000000000000000000,
            "sell_limit": 700000.000000000000000000,
            "margin_mode": "isolated"
        }
    ],
    "ts": 1603699957489
}
```

### Returning Parameter 

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | Request Processing Result	 | "ok" , "error" |
| ts | true  | long | Time of Responding Generation, Unit: Millisecond |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | symbol | "BTC","ETH"... |
| contract_code | true | string | contract type code   | "BTC-USDT",... |
| buy_limit | true | decimal | Max long position limit, Unit: Cont |  |
| sell_limit | true | decimal | Max short position limit, Unit: Cont |  |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| \</data\> |  |  |  |  |


## [Cross] Query Information On Position Limit

 - POST `linear-swap-api/v1/swap_cross_position_limit`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name   | Mandatory  | Type     | Desc   | Data Value      |
| ------ | ----- | ------ | ---- | ---------------------------- |
| contract_code | false | string | contract code |   "BTC-USDT"... ,return all contract info when null |

> Response

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BSV",
            "contract_code":"BSV-USDT",
            "margin_mode":"cross",
            "buy_limit":50000,
            "sell_limit":50000
        },
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "margin_mode":"cross",
            "buy_limit":999999993424398,
            "sell_limit":999943243299997
        }
    ],
    "ts":1606964793311
}

```

### Returning Parameter

| Parameter Name          | Mandatory | Type      | Desc   | Data Value   |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | Request Processing Result          | "ok" , "error"                           |
| ts            | true | long    | Time of Respond Generation, Unit: Millisecond   |                                          |
| \<data\>      | true     |  object array       |      |   |
| symbol        | true | string  | symbol            | "BTC","ETH"...                           |
| contract_code | true | string  | contract code            |   "BTC-USDT" ... |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| buy_limit     | true | decimal | max long position limit, Unit: quantity |                                          |
| sell_limit    | true | decimal | max short position limit, Unit: quantity |                                          |
| \</data\>     |      |         |                 |   |


## [General] Transfer between master and sub account

 - post `/linear-swap-api/v1/swap_master_sub_transfer`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameters

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ------ | ----- | ------ | ---- | ---------------------------- |
| sub_uid | true | long | uid of sub account  |  |
| asset | true | string | asset	 |  "USDT"... |
| from_margin_account | true | string | from margin account	 |  "BTC-USDT","USDT"... |
| to_margin_account | true | string | to margin account	 |  "BTC-USDT","USDT"... |
| amount | true | decimal | transfer amount ||
| type | true | string | transfer type | "master_to_sub" or "sub_to_master" |

#### Note：
- When from_margin_account or to_margin_account is USDT, it means the transfer in or transfer out from cross margin account
- represents transfer from transfer_out margin account to transfer_in margin account. The currency transferred shall be the same as the denominated currency of the transfer_out margin account.；
- The denominated currency of the transfer_out margin account and transfer_in margin account must be the same. (eg, USDT can be transferred from BTC-USDT to ETH-USDT, but cannot be transferred from BTC-USDT to ETH-HUSD account).
- the rate limit between the master account and each subaccount is 10 times/ minute

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": "770320047276195840"
    },
    "ts": 1603700211160
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

## [General] Query transfer records between master and sub account

 - post `/linear-swap-api/v1/swap_master_sub_transfer_record`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### request

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ------ | ----- | ------ | ---- | ---------------------------- |
| margin_account | true | string | margin account	 |  "BTC-USDT","USDT"... |
| transfer_type | false | string |  All by default【multiple types need to be joined with ';'】 | 34:transfer to sub account 35:transfer from sub account |
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
        "total_size": 2,
        "transfer_record": [
            {
                "id": 57920,
                "transfer_type": 34,
                "amount": -10.000000000000000000,
                "ts": 1603700211125,
                "sub_uid": "12343678",
                "sub_account_name": "tom",
                "margin_account": "BTC-USDT",
                "asset": "USDT",
                "to_margin_account": "BTC-USDT",
                "from_margin_account": "BTC-USDT"
            }
        ]
    },
    "ts": 1603700414957
} 
```

### response

|   Parameter Name                |   Mandatory    |   Type   |   Desc              |   Value Range       |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | respone status         | "ok" , "error"                           |
| ts            | true | long    | response millionseconds.    |                                          |
| \<data\>      | true     |  object        |      |   |
| \<transfer_record\>      | true     |  object array      |      |   |
| id        | true | long  | transfer id           |  |
| ts        | true | long  | create timestamp        |  |
| asset | true | string | asset	 |  "USDT"... |
| margin_account | true | string | margin account	 |  "BTC-USDT"... |
| from_margin_account | true | string | from margin account	 |  "BTC-USDT"... |
| to_margin_account | true | string | to margin account	 |  "BTC-USDT"... |
| sub_uid        | true | string  | subaccount uid        |  |
| sub_account_name        | true | string  |  subaccount name         |  |
| transfer_type        | true | int  | transfer type            | 35:transfer from subaccount; 34:transfer to subaccount;  |
| amount        | true | decimal  | amount            |  |
| \</transfer_record\>     |      |         |         |   |
| total_page        | true | int  | total page             |  |
| current_page        | true | int  | current page            |  |
| total_size        | true | int  | total size             |  |
| \</data\>     |      |         |         |   |


## [General] Transfer between different margin accounts under the same account

- post `linear-swap-api/v1/swap_transfer_inner`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### Request Parameter

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| asset | true | string | asset	 |  "USDT"... |
| from_margin_account | true | string | from margin account	 |  "BTC-USDT","USDT"... |
| to_margin_account | true | string | to margin account	 |  "ETH-USDT","USDT"... |
| amount | true | decimal | amount（The unit is the denominated currency of the contract.）	 |  |

#### **Note:**
- When from_margin_account or to_margin_account is USDT, it means the transfer in or transfer out from cross margin account
- represents transfer from transfer_out margin account to transfer_in margin account. The currency transferred shall be the same as the denominated currency of the transfer_out margin account.；
- The denominated currency of the transfer_out margin account and transfer_in margin account must be the same. (eg, USDT can be transferred from BTC-USDT to ETH-USDT, but cannot be transferred from BTC-USDT to ETH-HUSD account)。
- API rate limit for this interface is up to 10 times per minute.

> response：

```json

{
    "status": "ok",
    "data": {
        "order_id": "770321554893758464"
    },
    "ts": 1603700570600
}
```

### Returning Parameter

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | response status	 | "ok" , "error" |
| \<data\> |  |  |  | object array  |
| order_id | true  | string | order id |  |
| \</data\> |  |  |  |  |
| ts | true  | long | response millionseconds.  |  |


## [General] Query user's API indicator disable information

- get `/linear-swap-api/v1/swap_api_trading_status`

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### request body
 
 null

### Response:

| attr          | required | type     | desc  | Value Range |
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
| \</COR>       | true | dict object  |  |
| \<TDN>       | true | dict object  | Total Disable Number|
| disables_threshold        | true | long  | disable threshold        |  |
| disables        | true | long  | total disable number        |  | 
| is_trigger        | true | int  | | 	1：triggered，0：not triggered |
| is_active        | true | int  |     | 1：active，0：not active
| \</TDN>       | true | dict object  |  |
| \</data\>     |      |         |         |   |

 > Response：

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

## [Isolated] Place an Order 

###  Example  

 - POST `/linear-swap-api/v1/swap_order`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------ | ------------------ | ------------- | ------------------------------------------------------------ |
| contract_code      | string             | true         | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |
| client_order_id    | long               | false         | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807 |
| price              | decimal            | false          | Price                                                        |
| volume             | long               | true          | Numbers of orders (volume)                                   |
| direction          | string             | true          | Transaction direction                                        |
| offset             | string             | true          | "open", "close"                                              |
| lever_rate         | int                | true          | Leverage rate [ if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate; Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time. ]|
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
        "order_id": 770323133537685504,
        "client_order_id": 57012021022,
        "order_id_str": "770323133537685504"
    },
    "ts": 1603700946949
}
```


###  Returning Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status             | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| \<data\>           |           |    |   |  |
| order_id           | true          | long     | Order ID                                                     |                 |
| order_id_str           | true          | string     | Order ID                                                     |                 |
| client_order_id    | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| \</data\>           |           |    |   |  |
| ts                 | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## [Cross] Place An Order

 - POST `linear-swap-api/v1/swap_cross_order`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name           | Mandatory  | Type | Desc                                             | Data Value                                                     |
| ---------------- | ----- | -------- | ------------------------------------------------ | ------------------------------------------------------------ |
| contract_code    | true  | string   | contract code                                         | "BTC-USDT"...                                                |
| client_order_id  | false | long     | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807                   |                                                              |
| price            | false | decimal  | price                                            |                                                              |
| volume           | true  | long     | Numbers of orders (volume)                                    |                                                              |
| direction        | true  | string   | Transaction direction                                         | "buy"/"sell"                                           |
| offset           | true  | string   | "open", "close"                                         | "open"/"close"                                        |
| lever_rate       | true  | int      | leverage [ if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate; Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time. ] |                                                              |
| order_price_type | true  | string   | type of order price                                     | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,fok：FOK Order, "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |

####  Note

 - "limit"，"post_only"，"ioc" and "fok" the four order price type need price value and the other don't need.

### direction and offset

open long: direction - buy、offset - open

close long: direction -sell、offset - close

open short: direction -sell、offset - open

close short: direction -buy、offset - close

> Response

```json

{
    "status": "ok",
    "data": {
        "order_id": 784017187857760256,
        "order_id_str": "784017187857760256"
    },
    "ts": 1606965863952
}

```

###  Returning Parameter

| Parameter Name            | Mandatory | Type     | Desc                     | Data Value           |
| --------------- | ---- | ------ | ---------------------- | -------------- |
| status          | true | string | Request Processing Result                 | "ok" , "error" |
| \<data\>      | true     |  object       |      |   |
| order_id        | true | long   | order ID                   |                |
| order_id_str        | true | string   | order ID                  |                |
| client_order_id | false | long   | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                |
| \</data\>     |      |         |                 |    |
| ts    | true | long   | Time of Respond Generation, Unit: Millisecond          |     |

#### Note
 - The return order_id is 18 bits, it will make mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.



## [Isolated] Place a Batch of Orders

###  Example  

 - POST `/linear-swap-api/v1/swap_batchorder`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
|  orders_data |       List\<Object\>             |   10 orders at most.            |                                                              |


- orders_data object detail

|   Parameter Name                      |   Parameter Type   |   Mandatory   |   Desc                                                       |
| ------------------------------------- | ------------------ | ------------- | ------------------------------------------------------------ |
| contract_code      | string             | true       | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"                                                   |
| client_order_id                       | long               | false          | Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807 |
| price                                 | decimal            | false          | Price                                                        |
| volume                                | long               | true          | Numbers of orders (volume)                                   |
| direction                             | string             | true          | Transaction direction                                        |
| offset                                | string             | true          | "open": "close"                                              |
| lever_rate                            | int                | true          | Leverage rate [ if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate; Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time. ] |
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
                "err_code": 1050,
                "err_msg": "Customers order number is repeated. Please try again later."
            }
        ],
        "success": [
            {
                "order_id": 770323847022211072,
                "client_order_id": 57012021024,
                "index": 1,
                "order_id_str": "770323847022211072"
            }
        ]
    },
    "ts": 1603701117058
}
```

###  Returning Parameter  

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range   |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------- |
| status                            | true          | string   | Request Processing Result                                    | "ok" , "error"  |
| \<data\>                          |               |  object  |                                                              |                 |
| \<errors\>                        |               |  array   |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| err_code                          | true          | int      | Error code                                                   |                 |
| err_msg                           | true          | string   | Error information                                            |                 |
| \</errors\>                         |               |          |                                                              |                 |
| \<success\> |               |          |                                                              |                 |
| index                             | true          | int      | order Index                                                  |                 |
| order_id                          | true          | long     | Order ID                                                     |                 |
| order_id_str                          | true          | string     | Order ID                                                     |                 |
| client_order_id                   | true          | long     | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                 |
| \</success\>                         |               |          |                                                              |                 |
| \</data\>                         |               |          |                                                              |                 |
| ts                                | true          | long     | Time of Respond Generation, Unit: Millisecond                |                 |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## [Cross] Place A Batch Of Orders 

 - POST `linear-swap-api/v1/swap_cross_batchorder`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name            | Mandatory | Type     | Desc                     | Data Value           |
| --------------- | ---- | ------ | ---------------------- | -------------- |
| \<orders_data\>   | true | object array |     |  |
| contract_code        | true | string   | contract code      |        "BTC-USDT"...          |
| client_order_id       |  false   |  long| Clients fill and maintain themselves.must be Less or Equal than 9223372036854775807                          |      |
| price       |false  | decimal | price|      |
| volume   | true    |  long | Numbers of orders (volume) |      |
| direction   |true   |  string | Transaction direction   | "buy"/"sell"    |
| offset   | true  |  string |   offset    | "open"/"close"    |
| lever_rate     |  true    | int  | leverage [ if“Open”is multiple orders in 10 rate, there will be not multiple orders in 20 rate; Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time. ]             |      |
| order_price_type            |  true |  string | type of order price  | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order, "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |
| \</orders_data\>     |         |       |   |      |

### Note

 - "limit"，"post_only"，"ioc" and "fok" the four order price type need price value and the other don't need.

 - 10 orders at most 

> Response:

```json
{
    "status": "ok",
    "data": {
        "errors": [
            {
                "index": 2,
                "err_code": 1045,
                "err_msg": "Unable to switch leverage due to open orders."
            }
        ],
        "success": [
            {
                "order_id": 784022175422087168,
                "index": 1,
                "order_id_str": "784022175422087168"
            }
        ]
    },
    "ts": 1606967053089
}

```

###  Returning Parameter

| Parameter Name                    | Mandatory | Type     | Desc                     | Data Value           |
| ----------------------- | ---- | ------ | ---------------------- | -------------- |
| status                  | true | string | Request Processing Result                 | "ok" , "error" |
| \<data\> |    true  |   object     |                        |                |
| \<errors\> |    true  |   object array     |                        |                |
| index                   | true | int    | order index                   |                |
| err_code                | true | int    | error code                    |                |
| err_msg                 | true | string | error message                  |                |
| \</errors\>               |      |        |                        |                |
| \<success\>|      |        |                        |                |
| index                   | true | int    | order index                   |                |
| order_id                | true | long   | order ID                   |                |
| order_id_str                | true | string   | order ID                   |                |
| client_order_id         | true | long   | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned |                |
| \</success\>               |      |        |                        |                |
| \</data\>               |      |        |                        |                |
| ts                      | true | long   | Time of Respond Generation, Unit: Millisecond          |

#### Note
 - The return order_id is 18 bits, it will make mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## [Isolated] Cancel an Order 

###  Example   

 - POST  `/linear-swap-api/v1/swap_cancel`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 10 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID (different IDs are separated by ",", maximum 10 orders can be withdrew at one time) |
| contract_code      | true          | string    | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"    |

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
                "order_id": "770323133537685504",
                "err_code": 1071,
                "err_msg": "Repeated withdraw."
            }
        ],
        "successes": "770323847022211072"
    },
    "ts": 1603701351602
}
```

###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                    |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                                 | "ok" , "error"  |
| \<data\>                         |               | object   |                                                           |                 |
| \<errors\>                       |               | array    |                                                           |                 |
| order_id                         | true          | string   | Order ID                                                  |                 |
| err_code                         | true          | int      | Error code                                                |                 |
| err_msg                          | true          | string   | Error information                                         |                 |
| \</errors\>                      |               |          |                                                           |                 |
| successes                        | true          | string   | Successfully withdrew list of order_id or client_order_id |                 |
| \</data\>                        |               |          |                                                           |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond             |                 |


## [Cross] Cancel An Order

 - POST `linear-swap-api/v1/swap_cross_cancel`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name            | Mandatory | Type     | Desc                     | Data Value           |
| --------------- | ---- | ------ | ---------------------- | -------------- |
| order_id        | false | string | order ID（different IDs are separated by ",", maximum 10 orders can be withdrew at one time） |      |
| client_order_id | false | string | Client order ID (different IDs are separated by ",", maximum 10 orders can be withdrew at one time) |      |
| contract_code          | true  | string | contract code                       |    "BTC-USDT" ...  |

### Note:

 - Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

 - The return data from Cancel An Order Interface only means that order cancelation designation is executed successfully. To check cancelation result, please check your order status at Get Information Of An Order interface.

> Response

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "784054331179532288",
                "err_code": 1062,
                "err_msg": "Cancelling. Please be patient."
            }
        ],
        "successes": "784054331179532288"
    },
    "ts": 1606974744952
}
```

###  Returning Parameter

| Parameter Name         | Mandatory | Type     | Desc                        | Data Value     |
| ---------------------- | ---- | ------ | ---------------------------------- | -------------- |
| status                 | true | string | Request Processing Result          | "ok" , "error" |
| \<data\>               | true | object |                                    |                |
| \<errors\>             | true | array  |                                    |                |
| order_id               | true | string | order ID                           |                |
| err_code               | true | int    | error code                         |                |
| err_msg                | true | string | error message                      |                |
| \</errors\>            |      |        |                                    |                |
| successes              | true | string | successfully withdrew list of order_id or client_order_id |
| \</data\>              |      |        |                                    |                |
| ts                     | true | long   | Time of Respond Generation, Unit: Millisecond       | 


## [Isolated] Cancel All Orders 

###  Example  

 - POST `/linear-swap-api/v1/swap_cancelall`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                          |
| ------------------ | ------------- | -------- | ------------------------------- |
| contract_code      | true             | string       | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT"   |

> Response:result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)
 
```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "768883002062282752,770325103371542528,770325103388319744"
    },
    "ts": 1603701437838
}
```


###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                        |   Value Range   |
| -------------------------------- | ------------- | -------- | --------------------------------------------- | --------------- |
| status                           | true          | string   | Request Processing Result                     | "ok" , "error"  |
| \<data\> |               | object     |                                               |                 |
| \<errors\> |               | array    |                                               |                 |
| order_id                         | true          | string   | Order ID                                      |                 |
| err_code                         | true          | int      | failed order error messageError code          |                 |
| err_msg                          | true          | string      | failed order information                      |                 |
| \</errors\>                        |               |          |                                               |                 |
| successes                        | true          | string   | Successful order                              |                 |
| \</data\>                        |               |          |                                               |                 |
| ts                               | true          | long     | Time of Respond Generation, Unit: Millisecond |                 |


## [Cross] Cancel All Orders

 - POST `linear-swap-api/v1/swap_cross_cancelall`

#### Remarks

 - The interface only supports cross margin mode.


###  Request Parameter

| Parameter Name  | Mandatory | Type | Desc  | Data Value |
| ------------- | ------ | ----- | ---------------------------------------- | ---- |
| contract_code | true |  string | contract code |   "BTC-USDT"    |

> Response

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "784055473531781120,784055473842159616"
    },
    "ts": 1606974998510
}
```

###  Returning Parameter

| Parameter Name                   | Mandatory | Type     | Desc            | Data Value           |
| ---------------------- | ---- | ------ | ------------- | -------------- |
| status                 | true | string | Request Processing Result        | "ok" , "error" |
| \<data\> |  true    | object      |        |    |
| \<errors\> |  true    | array       |               |                |
| order_id               | true | String | order ID          |                |
| err_code               | true | int    | error code       |                |
| err_msg                | true | string    | error message        |                |
| \</errors\>              |      |        |               |                |
| successes              | true | string | the list order which's successful         |                |
| \</data\>        |      |         |        |         |
| ts                     | true | long   | Time of Respond Generation, Unit: Millisecond |                |


## [Isolated] Switch Leverage

 - POST `/linear-swap-api/v1/swap_switch_lever_rate`

#### Note

 - This interface only supports isolated margin mode.

 - Only if a user has positions of a single token and has no open orders, the leverage is available to be switched flexibly.

 - The interface limits the number of requests to 1 time per 3 seconds.

###  Request Parameter

| **Parameter Name**                | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | contract code	 |  “BTC-USDT” |
| lever_rate | true | int | Leverage to switch [Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |  |

> Response:

```json

OK：
{
    "status": "ok",
    "data": {
        "contract_code": "btc-usdt",
        "margin_mode": "isolated",
        "lever_rate": 10
    },
    "ts": 1603699417036
}
No：
{
    "status": "error",
    "err_code": 1045,
    "err_msg": "Unable to switch leverage due to current holdings or open orders.",
    "ts": 1603701654205
}

```

### Returning Parameter

| Parameter Name   | Mandatory | Type      | Desc    | Value Range    |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | status: ok,error            |                                          |
| \<data\> | false     |  object      |                    |                                          |
| contract_code               | false | string    | contract code      |                                          |
| margin_mode                |   false   | string | margin mode  | isolated : "isolated" |
| lever_rate               | false | int    | Switched leverage      |                                          |
| \</data\>            |      |         |                    |                                          |
| err_code | false | int | error code | |
|err_msg| false| string | error msg | |
| ts                     | true | long    | Timestamp                |    


## [Cross] Switch Leverage

 - POST `linear-swap-api/v1/swap_cross_switch_lever_rate`

#### Note

 - The interface only supports cross margin mode.

 - Only if a user has positions of a single token and has no open orders, the leverage is available to be switched flexibly.

 - The interface limits the number of requests to 1 time per 3 seconds.

###  Request Parameter

| Parameter Name  | Mandatory | Type | Desc  | Data Value |
| ------------- | ------ | ----- | ---------------------------------------- | ---- |
| contract_code | true | String | contract code	 | "BTC-USDT", |
| lever_rate | true | int | Leverage to switch [Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] | |

> Response

```json

{
    "status": "ok",
    "data": {
        "contract_code": "eth-usdt",
        "lever_rate": 30,
        "margin_mode": "cross"
    },
    "ts": 1606975779177
}

```

###  Returning Parameter

| Parameter Name                   | Mandatory | Type     | Desc            | Data Value           |
| ---------------------- | ---- | ------ | ------------- | -------------- |
| status                 | true | string  | ok/error            |                                          |
| \<data\> | false     |  object      |                    |                                          |
| contract_code               | false | string    | contract code      |                                          |
| margin_mode               | false | string | margin mode  | cross: cross margin mode  |
| lever_rate               | false | int    | switched leverage      |                                          |
| \</data\>            |      |         |                    |                                          |
| err-code | false | int | error code| |
| err-msg| false| string | error message | |
| ts                     | true | long    | timestamp                |                                          |


## [Isolated] Place Lightning Close Order

 - POST `/linear-swap-api/v1/swap_lightning_close_position`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter 

|   Parameter Name                 |    Mandatory    |   Type   |   Desc             |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code      | true             | string       | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"                                                    |
| volume | true | long | Order Quantity(Cont) |  |
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
    "ts": 1603704587846
}
```


## [Cross] Place Lightning Close Position

 - POST `linear-swap-api/v1/swap_cross_lightning_close_position`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Data Value                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code          | true | String | contract code                  | "BTC-USDT"...                           |
| volume          | true  | decimal | place volume               |                                          |
| direction       | true  | String | direction      |        “buy”/“sell” |
| client_order_id | false | long | client order ID | unique ID |
| order_price_type | false | string | type of order price | "lightning" by default. "lightning_fok": lightning FOK type,"lightning_ioc": lightning IOC type |

#### Note
 - Lightning Close Position，is order with rival price and optimal 30 grades. And the unsettled part will be automatically converted into a limited price order.

 - The closing price of lightning closing position has a predictable effect, which can avoid the loss of users when the order cannot be completed when the market price rises sharply and falls sharply.

> Response

```json

{
    "status": "ok",
    "data": {
        "order_id": 784063527799226368,
        "order_id_str": "784063527799226368"
    },
    "ts": 1606976912267
}
```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | Request Processing Result                        | "ok"/"error" |
| ts              | true  | long   | Time of Respond Generation, Unit: Millisecond                 |                      |
| \<data\>        |   true    |   object     |                               | |
| order_id        | true  | long | order ID[Different users may share the same order ID] |                      |
| order_id_str        | true  | string | order ID |                      |
| client_order_id | false | int | client order ID                     |                      |
| \</data\>       |       |        |     |  |


## [Isolated] Get Information of an Order

 - POST `/linear-swap-api/v1/swap_order_info`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                                                       |
| ------------------ | ------------- | -------- | ------------------------------------------------------------ |
| order_id           | false         | string   | Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time） |
| client_order_id    | false         | string   | Client order ID Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time) |
| contract_code      | true             | string      | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"     |

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
            "symbol": "BTC",
            "contract_code": "BTC-USDT",
            "volume": 1,
            "price": 13059.8,
            "order_price_type": "opponent",
            "order_type": 1,
            "direction": "sell",
            "offset": "open",
            "lever_rate": 10,
            "order_id": 770334322963152896,
            "client_order_id": 57012021045,
            "created_at": 1603703614712,
            "trade_volume": 1,
            "trade_turnover": 13.059800000000000000,
            "fee": -0.005223920000000000,
            "trade_avg_price": 13059.800000000000000000,
            "margin_frozen": 0,
            "profit": 0,
            "status": 6,
            "order_source": "api",
            "order_id_str": "770334322963152896",
            "fee_asset": "USDT",
            "liquidation_type": "0",
            "canceled_at": 0,
            "margin_asset": "USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
        }
    ],
    "ts": 1603703631815
}

```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                       |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | ----------------------------------- |
| status                         | true   <img width=250/>       | string <img width=250/>  | Request Processing Result                  | "ok" , "error"     <img width=1000/>          |
|  \<data\> |               |          |                                                              |                                     |
| symbol  |  true  |  string  |  symbol  |  eg."BTC"  |  
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USDT" ...                     |
| volume                         | true          | decimal  | Numbers of order                                             |                                     |
| price                          | true          | decimal  | Price committed                                              |                                     |
| order_price_type               | true          | string   | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |                                     |
| order_type         |	true         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| direction                      | true          | string   | Transaction direction    "buy":"sell"                        |                                     |
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
| margin_asset       | true   | string | margin asset                 |                |
| profit                         | true          | decimal  | profit                                                       |                                     |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled;  11. Orders cancelling. |                                     |
| order_source                   | true          | string   | Order source（system、web、api、m、risk、settlement、ios、android、windows、mac、trigger） |                                     |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</data\>                      |               |          |                                                              |                                     |
| ts                             | true          | long     | Timestamp                                                    |                                     |


## [Cross] Get Information of order

 - POST `linear-swap-api/v1/swap_cross_order_info`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                                   | Data Value     |
| --------------- | ----- | ------ | ------------------------------------ | ---- |
| order_id        | false | string | order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time）   |      |
| client_order_id | false | string | client order ID Order ID（different IDs are separated by ",", maximum 50 orders can be withdrew at one time) |      |
| contract_code          | true  | string | contract code |"BTC-USDT"...                       |

####  备注：

 - When getting information on order cancellation via get order Information interface, users can only query last 4-hour data

 - Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id. The order completed( 5.partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled; ) will be deleted after the settlement of funding rate on 04:00(GMT+8), 12:00(GMT+8) and 20:00(GMT+8).
 
 - client_order_id，order status query is available for orders placed within 24 hours; Otherwise, clients cannot check orders placed beyond 24 hours.

> Response

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "ETH",
            "contract_code": "ETH-USDT",
            "volume": 1,
            "price": 17,
            "order_price_type": "optimal_10_ioc",
            "order_type": 1,
            "direction": "sell",
            "offset": "open",
            "lever_rate": 5,
            "order_id": 784056956650258432,
            "client_order_id": null,
            "created_at": 1606975345528,
            "trade_volume": 1,
            "trade_turnover": 0.5,
            "fee": -0.0002,
            "trade_avg_price": 50,
            "margin_frozen": 0,
            "profit": 0,
            "status": 6,
            "order_source": "api",
            "order_id_str": "784056956650258432",
            "fee_asset": "USDT",
            "liquidation_type": "0",
            "canceled_at": 0,
            "margin_asset": "USDT",
            "margin_account": "USDT",
            "margin_mode": "cross"
        }
    ],
    "ts": 1606975356655
}
```

### Returning Parameter

| Parameter Name                 | Mandatory | Type      | Desc     | Data Value                                     |
| -------------------- | ---- | ------- | ------ | ---------------------------------------- |
| status               | true | string  | Request Processing Result | "ok" , "error"                           |
| \<data\> |  true    |   object array      |        |    |
| symbol               | true | string  | symbol   |       |
| contract_code        | true | string  | contract code   | "BTC-USDT" ...   |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume               | true | decimal | place volume   |   |
| price                | true | decimal | place price   |            |
| order_price_type     | true | string  | type of order price | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |
| direction            | true | string  | direction  | "buy"/"sell"  |
| offset  | true | string  | offset   | "open"/"close"   |
| lever_rate           | true | int     | leverage   |    |
| order_id             | true | long    | order ID   |    |
| order_id_str             | true | string    | order ID  |    |
| client_order_id      | true | long    | client order ID |    |
| created_at           | true | long    | created time   |     |
| trade_volume         | true | decimal | trade quantity   |   |
| trade_turnover       | true | decimal | trade amount |     |
| fee                  | true | decimal | service fee   |     |
| trade_avg_price      | true | decimal | trade average price   |   |
| margin_asset       | true   | string | margin asset                 |                |
| margin_frozen        | true | decimal | frozen margin  |     |
| profit               | true | decimal | profit     |        |
| status               | true | int     | status  |  1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling. |
| order_type           | true | int  | order type  | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order|
| order_source         | true | string  | order source   | system、web、api、m、risk、settlement、ios、android、windows、mac、trigger |
| fee_asset         | true | string  | fee asset   | （"USDT"...）|
| liquidation_type               | true     | string    | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |  |
| canceled_at               | true     | long    | canceled time           |  |
| \</data\>        |      |         |        |         |
| ts                   | true | long    | timestamp    |      |


## [Isolated] Order details acquisition

- POST `/linear-swap-api/v1/swap_order_detail`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                        |
| ------------------ | ------------- | -------- | ---------------------------------- |
| contract_code  |  true   |  string   |  Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |
| order_id           | true          | long     | Order ID                      |
| created_at           | false          | long     | Timestamp                     |
| order_type         |	false         |	int     |  Order type: 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| page_index         | false         | int      | Page number, default 1st page |
| page_size          | false         | int      | Default 20，no more than 50   |

### Note

When getting information on order cancellation via query order detail interface, users who type in parameters “created_at” and “order_type” can query last 24-hour data, while users who don’t type in parameters “created_at” and “order_type” can only query last 2-hour data.

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by jaso-bigint package.

created_at should use timestamp of long type as 13 bits (include Millisecond), if send the accurate timestamp for "created_at", query performance will be improved.

eg. the timestamp "2019/10/18 10:26:22" can be changed：1571365582123.It can also directly obtain the timestamp（ts) from the returned ordering interface(swap_order) to query the corresponding orders.

Please note that created_at can't send "0"

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "contract_code": "BTC-USDT",
        "instrument_price": 0,
        "final_interest": 0,
        "adjust_value": 0,
        "lever_rate": 10,
        "direction": "sell",
        "offset": "open",
        "volume": 1.000000000000000000,
        "price": 13059.800000000000000000,
        "created_at": 1603703614712,
        "canceled_at": 0,
        "order_source": "api",
        "order_price_type": "opponent",
        "margin_frozen": 0,
        "profit": 0,
        "trades": [
            {
                "trade_id": 131560927,
                "trade_price": 13059.800000000000000000,
                "trade_volume": 1.000000000000000000,
                "trade_turnover": 13.059800000000000000,
                "trade_fee": -0.005223920000000000,
                "created_at": 1603703614715,
                "role": "taker",
                "fee_asset": "USDT",
                "id": "131560927-770334322963152896-1"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1,
        "liquidation_type": "0",
        "fee_asset": "USDT",
        "fee": -0.005223920000000000,
        "order_id": 770334322963152896,
        "order_id_str": "770334322963152896",
        "client_order_id": 57012021045,
        "order_type": "1",
        "status": 6,
        "trade_avg_price": 13059.800000000000000000,
        "trade_turnover": 13.059800000000000000,
        "trade_volume": 1.000000000000000000,
        "margin_asset": "USDT",
        "margin_mode": "isolated",
        "margin_account": "BTC-USDT"
    },
    "ts": 1603703678477
}
```


###  Returning Parameter 

|   Parameter Name                  |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| --------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                            | true    <img width=250/>      | string  <img width=250/>  | Request Processing Result                                    | "ok" , "error"  <img width=1000/>          |
| \<data\>  |               |          |                                                              |                                   |
| symbol                            | true          | string   | Variety code                                                 |                                   |
| contract_code                     | true          | string   | Contract Code                                                | "BTC-USDT" ...                   |
| lever_rate                        | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| direction                         | true          | string   | Transaction direction                                        |                                   |
| offset                            | true          | string   | "open": "close"                                              |                                   |
| volume                            | true          | decimal  | Number of Order                                              |                                   |
| price                             | true          | decimal  | Price committed                                              |                                   |
| created_at                        | true          | long     | Creation time                                             |                                   |
| canceled_at                        | true          | long     | Canceled time                                             |                                   |
| order_source                      | true          | string   | Order Source                                                 |                                   |
| order_price_type                  | true          | string   | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |                                   |
| margin_frozen                     | true          | decimal  | Freeze margin           |             |
| margin_asset                      | true   | string | margin asset                 |                |
| profit                            | true          | decimal  | profit                                                       |                                   |
| order_id                       | true          | long     | Order ID                                                     |                                     |
| order_id_str                       | true          | string     | Order ID                                                     |                                     |
| client_order_id                | true          | long     | Client order ID                                              |                                     |
| order_type                | true          | string     | order type                                            |    1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order    |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling. |                                     |
| trade_volume                   | true          | decimal  | Transaction quantity                                         |                                     |
| trade_turnover                 | true          | decimal  | Transaction aggregate amount                                 |                                     |
| trade_avg_price                | true          | decimal  | Transaction average price                                    |                                     |
| total_page                        | true          | int      | Page in total                                                |                                   |
| current_page                      | true          | int      | Current Page                                                 |                                   |
| total_size                        | true          | int      | Total Size                                                   |                                   |
| instrument_price                        | true          | decimal      | Liquidation price                                                  |                                   |
| final_interest                        | true          | decimal      | Account Balance After Liquidation                                                   |                                   |
| adjust_value                        | true          | decimal      | Adjustment Factor of Liquidating Order                                                 |                                   |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
| fee | true  | decimal |  total amount of fees|
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \<trades\>  |               |          |                                                              |                                   |
| id                          | true          | string     |  the global unique ID of the trade.                                         |                                   |
| trade_id                          | true          | long     | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                              |                                   |
| trade_price                       | true          | decimal  | Match Price                                                  |                                   |
| trade_volume                      | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                    | true          | decimal  | Transaction price                                            |                                   |
| trade_fee                         | true          | decimal  | Transaction Service fee                                      |                                   |
| role                        | true          | string  |   taker or maker                              |                                                         |
| created_at                        | true          | long     | Creation time                                                |                                   |
| \</trades\>                         |               |          |                                                              |                                   |
| \</data \>                      |               |          |                                                              |                                   |
| ts                                | true          | long     | Timestamp                                                    |                                   |


## [Cross] Get Detail Information of order

 - POST `linear-swap-api/v1/swap_cross_order_detail`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name       | Mandatory  | Type     | Desc | Data Value  |
| ---------- | ----- | ------ | ---------------------------- | ---- |
| contract_code     | true  | string | contract code| "BTC-USDT"...     |
| order_id   | true  | long   | order ID                         |      |
| created_at | false  | long   | created timestamp                        |      |
| order_type | false  | int    | order type | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order |
| page_index | false | int    | page number, default 1st page                    |      |
| page_size  | false | int    | default 20，no more than 50                |      |


> Response

```json
{
    "status": "ok",
    "data": {
        "symbol": "ETH",
        "contract_code": "ETH-USDT",
        "instrument_price": 0,
        "final_interest": 0,
        "adjust_value": 0,
        "lever_rate": 5,
        "direction": "sell",
        "offset": "open",
        "volume": 1,
        "price": 17,
        "created_at": 1606975345528,
        "canceled_at": 0,
        "order_source": "api",
        "order_price_type": "optimal_10_ioc",
        "margin_frozen": 0,
        "profit": 0,
        "trades": [
            {
                "trade_id": 33142,
                "trade_price": 50,
                "trade_volume": 1,
                "trade_turnover": 0.5,
                "trade_fee": -0.0002,
                "created_at": 1606975346393,
                "role": "taker",
                "fee_asset": "USDT",
                "id": "33142-784056956650258432-1"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1,
        "liquidation_type": "0",
        "fee_asset": "USDT",
        "fee": -0.0002,
        "order_id": 784056956650258432,
        "order_id_str": "784056956650258432",
        "client_order_id": null,
        "order_type": "1",
        "status": 6,
        "trade_avg_price": 50,
        "trade_turnover": 0.5,
        "trade_volume": 1,
        "margin_asset": "USDT",
        "margin_account": "USDT",
        "margin_mode": "cross"
    },
    "ts": 1606975532569
}
```

### Returning Parameter

| Parameter Name                    | Mandatory | Type      | Desc          | Data Value                                     |
| ----------------------- | ---- | ------- | ----------- | ---------------------------------------- |
| status                  | true | string  | Request Processing Result      | "ok" , "error"                           |
| \<data\> |  true    |  object       |             |    |
| symbol                  | true | string  | symbol        |      |
| contract_code           | true | string  | contract code     | "BTC-USDT"  |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| lever_rate              | true | int     | leverage        | |
| direction               | true | string  | direction        | "buy"/"sell"         |
| offset                  | true | string  | offset | "open"/"close"    |
| volume                  | true | decimal | place volume        | |
| price                   | true | decimal | place price        |  |
| created_at              | true | long    | created time        |  |
| order_source            | true | string  | order source        |    |
| order_price_type        | true | string  | type of order price      | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |
| margin_asset       | true   | string | margin asset                 |                |
| margin_frozen           | true | decimal | frozen margin       |    |
| profit                  | true | decimal | profit          |     |
| instrument_price        | true | decimal | liquidation price	     |     |
| final_interest          | true | decimal | account balance after liquidation     |     |
| adjust_value            | true | decimal | adjustment factor of liquidating order     |      |
| fee              | true | decimal     | total fee        |     |
| fee_asset              | true | string     | fee asset        |   （"USDT"...）                                       |
| liquidation_type              | true | string     | liquidation type    |      |
| canceled_at              | true | long     | canceled time        |        |
| order_id               | true     | long    | order ID            |  |
| order_id_str               | true     | string    | order ID             |  |
| client_order_id               | true     | long    | client order ID             |  |
| order_type               | true     | string    | order type            | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order |
| status               | true     | int    | order status           | 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.  |
| trade_avg_price               | true     | decimal    | trade average price             |  |
| trade_turnover               | true     | decimal    | trade total amount |  |
| trade_volume               | true     | decimal    | trade total amount           |  |
| total_page              | true | int     | total page       |  |
| current_page            | true | int     | current page        |    |
| total_size              | true | int     | total size         |      |
| \<trades\>  |  true    |   object array      |        |   |      |
| id                | true | string    | the global unique ID of the trade      |   |
| trade_id                | true | long    | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_cross_matchresults. trade_id is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.  |  |
| trade_price             | true | decimal | trade price        |   |
| trade_volume            | true | decimal | trade volume         |   |
| trade_turnover          | true | decimal | trade amount        |     |
| trade_fee               | true | decimal | trade fee       |      |
| role                    | true | string  | taker/maker |   |
| created_at              | true | long    | created time        |      |
| \</trades\>               |      |         |             |     |
| \</data\>            |      |         |             |         |
| ts                      | true | long    | timestamp         |      |


## [Isolated] Current unfilled order acquisition

 - POST  `/linear-swap-api/v1/swap_openorders`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range   |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | --------------- |
| contract_code       | true          | string   | Contract Code              |             | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"                 |
| page_index         | false         | int      | Page, default 1st page      | 1           |                 |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                 |

> Response:

```json


{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "volume": 1,
                "price": 13329,
                "order_price_type": "limit",
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 10,
                "order_id": 770326042832437248,
                "client_order_id": 57012021028,
                "created_at": 1603701640576,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": null,
                "margin_frozen": 1.332900000000000000,
                "profit": 0,
                "status": 3,
                "order_source": "api",
                "order_id_str": "770326042832437248",
                "fee_asset": "USDT",
                "liquidation_type": null,
                "canceled_at": null,
                "margin_asset": "USDT",
                "margin_mode": "isolated",
                "margin_account": "BTC-USDT"
            }
        ],
        "total_page": 2,
        "current_page": 1,
        "total_size": 2
    },
    "ts": 1603703993952
}

```

###  Returning Parameter  

|   Parameter Name               |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| ------------------------------ | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                         | true          | string   | Request Processing Result                                    |                                   |
|  \<data\> |               | object      |                                                              |                                   |
|  \<orders\> |               | array    |                                                              |                                   |
| symbol                         | true          | string   | Variety code                                                 |                                   |
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USDT" ...                   |
| volume                         | true          | decimal  | Number of Order                                              |                                   |
| price                          | true          | decimal  | Price committed                                              |                                   |
| order_price_type               | true          | string   | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |                                   |
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
| margin_asset                      | true   | string | margin asset                 |                |
| profit                         | true          | decimal  | profit                                                       |                                   |
| status                         | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; |                                   |
| order_source                   | true          | string   | Order Source                                                 |                                   |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
| liquidation_type                      | true   | string | liquidation type                 |                |
| canceled_at                      | true   | long | order Cancellation time               |                |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</orders\>                      |               |          |                                                              |                                   |
| total_page                     | true          | int      | Total Pages                                                  |                                   |
| current_page                   | true          | int      | Current Page                                                 |                                   |
| total_size                     | true          | int      | Total Size                                                   |                                   |
| \</data\>                      |               |          |                                                              |                                   |
| ts                             | true          | long     | Timestamp                                                    |                                   |


## [Cross] Current unfilled order acquisition

 - POST `linear-swap-api/v1/swap_cross_openorders`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name       | Mandatory  | Type     | Desc       | Data Value           |
| ---------- | ----- | ------ | ---------- | -------------- |
| contract_code     | true  | string | contract code       |   "BTC-USDT" ...  |
| page_index | false | int    | page index, default 1st page |               |
| page_size  | false | int    | page size, default 20，no more than 50          |    |

> Response

```json
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ETH",
                "contract_code": "ETH-USDT",
                "volume": 1,
                "price": 80,
                "order_price_type": "limit",
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 30,
                "order_id": 784059619752280064,
                "client_order_id": null,
                "created_at": 1606975980467,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": null,
                "margin_frozen": 0.026666666666666666,
                "profit": 0,
                "status": 3,
                "order_source": "api",
                "order_id_str": "784059619752280064",
                "fee_asset": "USDT",
                "liquidation_type": null,
                "canceled_at": null,
                "margin_asset": "USDT",
                "margin_account": "USDT",
                "margin_mode": "cross"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 2
    },
    "ts": 1606975988388
}
```

###  Returning Parameter

| Parameter Name                 | Mandatory | Type      | Desc                                       | Data Value                                     |
| -------------------- | ---- | ------- | ---------------------------------------- | ---------------------------------------- |
| status               | true | string  | Request Processing Result                                   |                                          |
| \<data\> | true     |    object     |                   |                                          |
| symbol               | true | string  | symbol                                     |                                          |
| contract_code        | true | string  | contract code                                     | "BTC-USDT" ...                          |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume               | true | decimal | place volume                                     |                                          |
| price                | true | decimal | place price                                     |                                          |
| order_price_type     | true | string  | type of order price | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |
| order_type         | true | int  | order type        | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order |
| direction            | true | string  | "buy"/"sell"                         |                                          |
| offset               | true | string  | "open"/"close"                      |                                          |
| lever_rate           | true | int     | leverage                                     |                       |
| order_id             | true | long    | order ID    | |
| order_id_str             | true | string    | order ID                                     |      |
| client_order_id      | true | long    | client order ID                                   |                                          |
| order_source         | true | string  | order source                                     |        |
| created_at           | true | long    | created time                                   |                                          |
| trade_volume         | true | decimal | trade total volume                                     |                                          |
| trade_turnover       | true | decimal | trade total amount                                    |                                          |
| fee                  | true | decimal | service fee                                     |
| fee_asset         | true | string  | fee asset       |  （"USDT"...）      ||
| trade_avg_price      | true | decimal | trade average price                                     |                                          |
| margin_asset       | true   | string | margin asset                 |                |
| margin_frozen        | true | decimal | frozen margin                                    |                                          |
| profit               | true | decimal | profit                                       |                                          |
| status               | true | int     | order status                                    | 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled         |
| liquidation_type              | true | string     | liquidation type    |      |
| canceled_at              | true | long     | canceled time        |        |
| \</data\>            |      |         |                     |      |
| total_page           | true | int     | total page                                     |                                          |
| current_page         | true | int     | current page                                      |                                          |
| total_size           | true | int     | total size                                      |                                          |
| ts                   | true | long    | timestamp                                      |                                          |


## [Isolated] Get History Orders

 - POST `/linear-swap-api/v1/swap_hisorders`

#### Remarks

 - This interface only supports isolated margin mode.

###  Request Parameter  

|   Parameter Name   |   Mandatory   |   Type   |   Desc                      |   Default   |   Value Range                                                |
| ------------------ | ------------- | -------- | --------------------------- | ----------- | ------------------------------------------------------------ |
| contract_code      | true          | string   | Contract Code               |           | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT".                   |
| trade_type         | true          | int      | Transaction type            |             | 0:all,1: buy long,2: sell short,3: buy short,4: sell  long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short,11:reduce positions to close long,12:reduce positions to close short |
| type               | true          | int      | Type                        |             | 1:All Orders,2:Order in Finished Status                      |
| status             | true          | string      | Order Status                |             | support multiple query seperated by ',',such as  '3,4,5', 0: all.  3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled;  |
| create_date        | true          | int      | Date                        |             | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                                     |
| page_index         | false         | int      | Page, default 1st page      | 1           |                                                              |
| page_size          | false         | int      | Default 20，no more than 50 | 20          |                                                              |


#### Note: 

 - When getting information on order cancellation via query history orders interface, users can only query last 2-hour data.

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "order_id": 770336866451992576,
                "contract_code": "BTC-USDT",
                "symbol": "BTC",
                "lever_rate": 10,
                "direction": "sell",
                "offset": "close",
                "volume": 1.000000000000000000,
                "price": 13100.000000000000000000,
                "create_date": 1603704221118,
                "order_source": "web",
                "order_price_type": 6,
                "order_type": 1,
                "margin_frozen": 0,
                "profit": 0,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "status": 3,
                "order_id_str": "770336866451992576",
                "fee_asset": "USDT",
                "liquidation_type": "0",
                "margin_asset": "USDT",
                "margin_mode": "isolated",
                "margin_account": "BTC-USDT"
            }
        ],
        "total_page": 10,
        "current_page": 1,
        "total_size": 10
    },
    "ts": 1603704312847
}
```


###  Returning Parameter  

|   Parameter Name                 |   Mandatory   |   Type   |   Desc                                                       |   Value Range                     |
| -------------------------------- | ------------- | -------- | ------------------------------------------------------------ | --------------------------------- |
| status                           | true          | string   | Request Processing Result                                    |                                   |
| \<data\> |               | object     |                                                              |                                   |
| \<orders\> |               | array       |                                                              |                                   |
| order_id                         | true          | long     | Order ID                                                     |                                   |
| order_id_str                         | true          | string     | Order ID                                                     |                                   |
| symbol                           | true          | string   | Variety code                                                 |                                   |
| contract_code                  | true          | string   | Contract Code                                                | "BTC-USDT" ...                   |
| lever_rate                       | true          | int      | Leverage Rate                                                | 1\\5\\10\\20                      |
| direction                        | true          | string   | Transaction direction                                        |                                   |
| offset                           | true          | string   | "open": "close"                                              |                                   |
| volume                           | true          | int  | Number of Order                                              |                                   |
| price                            | true          | decimal  | Price committed                                              |                                   |
| create_date                      | true          | long     | Creation time                                                |                                   |
| order_source                     | true          | string   | Order Source                                                 |                                   |
| order_price_type                 | true          | int   | 	1：limit，2：market，3：opponent，4：lightning，5：trigger，6：post_only ，7：optimal_5 ，8：optimal_10 ，9：optimal_20，10：FOK ，11：IOC ，12：opponent_ioc，13：lightning_ioc，14：optimal_5_ioc，15：optimal_10_ioc，16：optimal_20_ioc，17：opponent_fok，18：lightning_fok，19：optimal_5_fok，40：optimal_10_fok，41：optimal_20_fok . |                                   |
| margin_frozen                    | true          | decimal  | Freeze margin                                                |                                   |
| margin_asset                      | true         | string | margin asset                 |                |
| profit                           | true          | decimal  | profit                                                       |                                   |
| trade_volume                     | true          | decimal  | Transaction quantity                                         |                                   |
| trade_turnover                   | true          | int  | Transaction aggregate amount                                 |                                   |
| fee                              | true          | decimal  | Servicefee                                                   |                                   |
| trade_avg_price                  | true          | decimal  | Transaction average price                                    |                                   |
| status                           | true          | int      | status: 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with  partially matched; 6. Orders fully matched; 7. Orders cancelled; 11. Orders cancelling.  |                                   |
| fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
| order_type | true  | int | order type | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| liquidation_type | true  | string | Liquidation type | 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</orders\>                        |               |          |                                                              |                                   |
| total_page                       | true          | int      | Total Pages                                                  |                                   |
| current_page                     | true          | int      | Current Page                                                 |                                   |
| total_size                       | true          | int      | Total Size                                                   |                                   |
| \</data\>                      |               |          |                                                              |                                   |
| ts                               | true          | long     | Timestamp                                                    |                                   |

### Note

The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## [Cross] Get History Orders

 - POST `linear-swap-api/v1/swap_cross_hisorders`

#### Remarks

 - The interface only supports cross margin mode.

###  Request Parameter

| Parameter Name        | Mandatory  | Type     | Desc              | Data Value   |
| ----------- | ----- | ----------- | ---------------------------------------- | ------ |
| contract_code      | true  | string | contract code        |  "BTC-USDT" ...                          |
| trade_type  | true  | int    | trade type        | 0:all,1: buy long,2: sell short,3: buy short,4: sell long,5: sell liquidation,6: buy liquidation,7:Delivery long,8: Delivery short,11:reduce positions to close long,12:reduce positions to close short|        |
| type        | true  | int    | type          | 1:All Orders,2:Order in Finished Status                       |
| status      | true  | string    | order status       | support multiple query seperated by ',',such as '3,4,5', 0: all. 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; |
| create_date | true  | int    | date          | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default. |
| page_index  | false | int    | page index, default 1st page           |                               |
| page_size   | false | int    | page size, default 20 no more than 50      |  |

### Note:
 - When getting information on order cancellation via query history orders interface, users can only query last 2-hour data.

> Response

```json
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "order_id": 784059619752280064,
                "contract_code": "ETH-USDT",
                "symbol": "ETH",
                "lever_rate": 30,
                "direction": "sell",
                "offset": "open",
                "volume": 1,
                "price": 80,
                "create_date": 1606975980467,
                "order_source": "api",
                "order_price_type": 1,
                "order_type": 1,
                "margin_frozen": 0.026666666666666666,
                "profit": 0,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "status": 3,
                "order_id_str": "784059619752280064",
                "fee_asset": "USDT",
                "liquidation_type": "0",
                "margin_asset": "USDT",
                "margin_mode": "cross",
                "margin_account": "USDT"
            }
        ],
        "total_page": 6,
        "current_page": 1,
        "total_size": 12
    },
    "ts": 1606976252777
}
```

###  Returning Parameter

| Parameter Name                   | Mandatory | Type      | Desc     | Data Value                                     |
| ---------------------- | ---- | ------- | ------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result |   |
| \<data\>| true     |   object      |        |     |
| \<orders\> |  true    |  object array       |        |     |
| order_id               | true | long    | order ID   |       |
| order_id_str   | true | string    | order ID    |      |
| symbol                 | true | string  | symbol   |   |
| contract_code          | true | string  | contract code   | "BTC-USDT" ... |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| lever_rate             | true | int     | leverage   |    |
| direction              | true | string  | direction | "buy"/"sell"  |
| offset                 | true | string  | "open", "close"   | "open"/"close"  |
| volume                 | true | decimal | place volume   |   |
| price                  | true | decimal | place price   |    |
| create_date            | true | long    | created time   |     |
| order_source           | true | string  | order source   |    |
| order_price_type       | true | int  | type of order price | 1：limit，2：market，3：opponent，4：lightning，5：trigger，6：post_only ，7：optimal_5 ，8：optimal_10 ，9：optimal_20，10：FOK ，11：IOC ，12：opponent_ioc，13：lightning_ioc，14：optimal_5_ioc，15：optimal_10_ioc，16：optimal_20_ioc，17：opponent_fok，18：lightning_fok，19：optimal_5_fok，40：optimal_10_fok，41：optimal_20_fok  |
| margin_asset       | true   | string | margin asset                 |                |
| margin_frozen          | true | decimal | frozen margin  |   |
| profit                 | true | decimal | profit     |    |
| trade_volume           | true | decimal | trade quantity   |     |
| trade_turnover         | true | decimal | trade amount  |         |
| fee                    | true | decimal | service fee   |      |
| trade_avg_price        | true | decimal | trade average price   |    |
| status                 | true | int     | order status  |     |
| order_type             | true | int     | order type  | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order|
| fee_asset         | true | string  | fee asset       |  （"USDT"...）      |
| liquidation_type              | true | string     | liquidation type        |  0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| \</orders\>     |      |         |        |                          |
| current_page           | true | int     | current page    |      |
| total_page             | true | int     | total page   |    |
| total_size             | true | int     | total size    |     |
| \</data\>            |      |         |        |      |
| ts                     | true | long    | timestamp    |      |


## [Isolated] Acquire History Match Results

 - POST `/linear-swap-api/v1/swap_matchresults`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter

Parameter Name |  Mandatory  |  Type  |  Desc                    |  Default  |  Value Range   
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code     | true      | string   | Contract Code     |                 | Case-Insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT".                   |
| trade_type  | true     | int    | trasanction types          |         |  0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
| create_date | true     | int    | date            |         | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.                            |
| page_index  | false    | int    | page; if not enter, it will be the default value of the 1st page.  | 1       |                                          |
| page_size   | false    | int    | if not enter, it will be the default value of 20; the number should ≤50 | 20      |                                          |

> Response:

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "match_id": 131560927,
                "order_id": 770334322963152896,
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "direction": "sell",
                "offset": "open",
                "trade_volume": 1.000000000000000000,
                "trade_price": 13059.800000000000000000,
                "trade_turnover": 13.059800000000000000,
                "trade_fee": -0.005223920000000000,
                "offset_profitloss": 0,
                "create_date": 1603703614715,
                "role": "Taker",
                "order_source": "api",
                "order_id_str": "770334322963152896",
                "id": "131560927-770334322963152896-1",
                "fee_asset": "USDT",
                "margin_mode": "isolated",
                "margin_account": "BTC-USDT"
            }
        ],
        "total_page": 2,
        "current_page": 1,
        "total_size": 2
    },
    "ts": 1603704407235
}   
```

### Returning Parameter

 Parameter Name                |  Mandatory   |  Type  |  Desc                                                      |   Value Range                  |
---------------------- | -------- | ------- | ------------------ | ------------ |
status                 | true     | string  | request handling result            |              |
 \<data\> |          |         |                    |              |
 \<trades\> |          |         |                    |              |
id               | true     | string    | the global unique ID of the trade.                |              |
match_id               | true     | long    | match_id is the same with trade_id of the websocket subscriptions: orders.$contract_code match_id is the result of sets of order execution and trade confirmation. NOTE: match_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same match_id.             |              |
order_id               | true     | long    | order ID              |              |
order_id_str               | true     | string    | order ID              |              |
symbol                 | true     | string  | contract type code               |              |
order_source                 | true     | string  | Order Source               |              |
contract_code          | true     | string  | contract code              |  "BTC-USDT" ...       |
direction              | true     | string  | "buy": to bid/ go long; "sell": to ask/ go short.         |              |
offset                 | true     | string  | "open": open positions; "close": close positions           |              |
trade_volume           | true     | int | the number of traded contract with unit of lot               |              |
trade_price                  | true     | decimal | the price at which orders get filled               |              |
trade_turnover                  | true     | int | the number of total traded amout with number of USDT               |              |
create_date            | true     | long    | the time when orders get filled               |              |
offset_profitloss                 | true     | decimal | profits and losses generated from closing positions                 |              |
trade_fee                    | true     | decimal | fees charged by platform                |              |
role                        | true          | string |   taker or maker     |                  |
fee_asset | true  | string | the corresponding cryptocurrency to the given fee | "USDT"... |
margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
margin_account    |   true   | string | margin account  | "BTC-USDT"... |
\</trades\>              |          |         |                    |              |
total_page             | true     | int     | total pages                |              |
current_page           | true     | int     | current page                |              |
total_size             | true     | int     | total size of the list                |              |
\</data\>            |          |         |                    |              |
ts                     | true     | long    | timestamp                |              |

### Notice

- If users don’t upload/fill the page_index or page_size, it will automatically be set as the default value of the top 20 data on the first page, for more details, please follow the parameters illustration.

- The return order_id is 18 bits, it will make  mistake when nodejs and JavaScript analysed 18 bits. Because the Json.parse in nodejs and JavaScript is int by default. so the number over 18 bits need be parsed by json-bigint package.


## [Cross] Get History Match Results

 - POST `linear-swap-api/v1/swap_cross_matchresults`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name          | Mandatory  | Type     | Desc   | Data Value                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| contract_code        | true  | string | contract code          | "BTC-USDT"...                           |
| trade_type    | true  | int    | trade type        | 0:All; 1: Open long; 2: Open short; 3: Close short; 4: Close long; 5: Liquidate long positions; 6: Liquidate short positions |
| create_date   | true  | int    | date        | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.    |
| page_index    | false | int    | page index, default 1st page     |                                          |
| page_size     | false | int    | default 20，no more than 50    |                                          |

> Response

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "match_id": 33161,
                "order_id": 784059498905993216,
                "symbol": "ETH",
                "contract_code": "ETH-USDT",
                "direction": "sell",
                "offset": "open",
                "trade_volume": 1,
                "trade_price": 50,
                "trade_turnover": 0.5,
                "trade_fee": -0.0002,
                "offset_profitloss": 0,
                "create_date": 1606975951808,
                "role": "Taker",
                "order_source": "api",
                "order_id_str": "784059498905993216",
                "id": "33161-784059498905993216-1",
                "fee_asset": "USDT",
                "margin_mode": "cross",
                "margin_account": "USDT"
            }
        ],
        "total_page": 6,
        "current_page": 1,
        "total_size": 6
    },
    "ts": 1606976521624
}
```

### Returning Parameter

| Parameter Name                   | Mandatory | Type      | Desc                 | Data Value                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result             |   |
| \<data\> | true     |  object       |                    |     |
| \<trades\>| true     |  object array       |                    |    |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| id               | true | string    | the global unique ID of the trade.      |   |
| match_id               | true | long    | match_id is the same with trade_id of the websocket subscriptions: orders_cross.$contract_code match_id is the result of sets of order execution and trade confirmation. NOTE: match_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same match_id.   |   |
| order_id               | true | long    | order ID               |   |
| order_id_str      | true | string    | order ID   |       |
| symbol                 | true | string  | symbol               | |
| order_source           | true | string  | order source   |   |
| contract_code          | true | string  | contract code               | "BTC-USDT" ...                          |
| direction              | true | string  | direction | "buy"/"sell" |
| offset                 | true | string  | offset | "open"/"close" |
| trade_volume           | true | decimal | trade quantity               |     |
| trade_price            | true | decimal | trade price               |  |
| trade_turnover         | true | decimal | trade amount       |       |
| create_date            | true | long    | trade time               |  |
| offset_profitloss      | true | decimal | profits and losses generated from closing positions	               |    |
| trade_fee             | true | decimal | trade fee              |    |
| role                   | true | string  | taker/maker        |    |
| fee_asset         | true | string  | fee asset   | （"USDT"...）  |
| \</trades\>              |      |         |                    |   |
| current_page           | true | int     | current page                |  |
| total_page             | true | int     | total page               |    |
| total_size             | true | int     | total size                |      |
| \</data\>            |      |         |                    |     |
| ts                     | true | long    | timestamp                |    |


## [Isolated] Place Trigger Order

 - POST `linear-swap-api/v1/swap_trigger_order`

#### Remarks

 - This interface only supports isolated margin mode.

> Request:

```json

{
    "contract_code": "BTC-USDT",
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

### body
|  Params                |   Mandatory  |   Type    |    Desc              |   Value Range       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | contract type | BTC-USDT |
| trigger_type | true | string | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to |  |
| trigger_price | true | decimal | Trigger Price |  |
| order_price | false | decimal | Order Price |  |
| order_price_type | false | string | order price type： "limit" by default;"optimal_5", "optimal_10"，"optimal_20" |  |
| volume | true | long | volume |  |
| direction | true | string | buy sell |  |
| offset | true | string | open close |  |
| lever_rate | false | int | Long leverage shall be equal to short leverage.[Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |  |

#### Note
  
  - optimal_5: top 5 optimal BBO price. optimal_10: top 10 optimal BBO price. optimal_20: top 20 optimal BBO price. limit: the limit order, order_price needed.

  -  If you’re holding a position currently, the leverage you choose when placing an order should be the same as the leverage of your current positions, otherwise, the order will fail to be placed. If you need a new leverage to place an order, you should switch the leverage of current positions first by using the Switch Leverage interface. 

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
    "err_code": 1014,
    "err_msg": "This contract doesnt exist.",
    "ts": 1603704820880
}
```


## [Cross] Place Trigger Order

 - POST `linear-swap-api/v1/swap_cross_trigger_order`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Data Value                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code | true | String | contract code |BTC-USDT |
| trigger_type | true | String | trigger type | ge: Equal to or Greater than；le: Less than or Equal to |
| trigger_price | true | decimal | trigger price |  |
| order_price | false | decimal | order price |  |
| order_price_type | false | string | order price type | "limit" by default;"optimal_5", "optimal_10"，"optimal_20" |
| volume | true | decimal | Numbers of orders (volume)|  |
| direction | true | String | direction | buy/sell |
| offset | true | String | offset | open/close |
| lever_rate | false | int | leverage rate | Long leverage shall be equal to short leverage.[Using Leverage greater than 20 times requires prior approval of high-leverage agreement for the first time.] |

> Response

```json

Success：
{
    "status": "ok",
    "data": {
        "order_id": 1880,
        "order_id_str": "1880"
    },
    "ts": 1606977456766
}

Error：
{
    "status": "error",
    "err_code": 1085,
    "err_msg": "Trigger order failed, please modify the price and place the order again or contact the customer service.",
    "ts": 1606977396756
}
```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | Request Processing Result               | "ok" , "error" |
| ts |  true  | long | timestamp | |
| \<data\> |  true  | object |   | |
| order_id  |  true  | int | order ID order id may be same among different users  | |
| order_id_str |  true  | string | order id   | |
| \</data\> |   | |  | |


## [Isolated] Cancel Trigger Order

- POST `/linear-swap-api/v1/swap_trigger_cancel`

#### Remarks

 - This interface only supports isolated margin mode.

### request params

| field | type | Mandatory |  desc  |
| -----  | -----  | -----  | ----- |
|  contract_code |  string  |  true  |  Case-Insenstive.Both uppercase and lowercase are supported.BTC-USDT...  |
|  order_id  |  string  |  true  |  order id. multiple orderids need to be joined by ",".Max number of order ids is 20 once.|


> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "34",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "1"
    },
    "ts": 1603704887184
}
```

### response

| field             | Required | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | response status               | "ok" , "error" |
| \<data\> |              |          |                            |                |
| \<errors\> |              |          |                            |                |
| order_id                   | true         | string   | order id                     |                |
| err_code                   | true         | int      | error code             |                |
| err_msg                    | true         | string      | error messages               |                |
| \</errors\>                  |              |          |                            |                |
| successes |   true    |   string  |     successful orders         |                |
| \</data\> |              |          |                            |                |
| ts                         | true         | long     | response timestamp millseconds |  |


## [Cross] Cancel Trigger Order

 - POST `linear-swap-api/v1/swap_cross_trigger_cancel`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Data Value                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code | true | String | contract code | BTC-USDT |
| order_id | true | String | order id. multiple orderids need to be joined by ",".Max number of order ids is 10 once. |  |

> Response

```json
{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "1888",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "1880"
    },
    "ts": 1606977508308
}
```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | Request Processing Result               | "ok" , "error" |
| \<data\> |  true  | object |   | |
| \<errors\>|   true          |    object array      |                       |                |
| order_id                   | false         | string   | order ID                     |                |
| err_code                   | false         | int      | error code             |                |
| err_msg                    | false         | string      | error message               |                |
| \</errors\>                  |              |          |                            |                |
| successes                  | true        | string   | the list order which's successful，joined by ","                 |                |
| \</data\> |   | |  | |
| ts                         | true         | long     | Time of Respond Generation, Unit: Millisecond |  |


## [Isolated] Cancel All Trigger Orders

- POST `/linear-swap-api/v1/swap_trigger_cancelall`

#### Remarks

 - This interface only supports isolated margin mode.

### Params

| field | type | Mandatory |desc
| -----  | -----  |  -----  | ----- |
|  contract_code  |  string  |  true  |  contract code,"BTC-USDT" ...  |

### Note

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "2"
    },
    "ts": 1603704998960
}

```

### response params

| field              | Mandatory | type | desc                 | value range   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | status               | "ok" , "error" |
| \<data\>                   |              |          |                            |                |
| \<errors\>  |              |          |                            |                |
| order_id                   | true         | string   | order id                    |                |
| err_code                   | true         | int      | error code            |                |
| err_msg                    | true         | string      | error message               |                |
| \</errors\>                  |              |          |                            |                |
| successes                  | true         | string   | successful orders                 |                |
| \</data\>                  |              |          |                            |                |
| ts                         | true         | long     | response timestamp in millseconds |   |


> response error：

```json

{
    "status": "error",
    "err_code": 1051,
    "err_msg": "No orders to cancel.",
    "ts": 1603705063592
}
```


## [Cross] Cancel All Trigger Orders

 - POST ‘linear-swap-api/v1/swap_cross_trigger_cancelall’

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Data Value                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code | true | String | contract code | BTC-USDT |

> Response

```json
{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "1879,1878"
    },
    "ts": 1606977712328
}
```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | Request Processing Result               | "ok" , "error" |
| \<data\> |  true  | object |  | |
| \<errors\> |   true          |    object array      |                           |                |
| order_id                   | false         | string   | order ID                     |                |
| err_code                   | false         | int      | error code             |                |
| err_msg                    | false         | string      | error message               |                |
| \</errors\>                  |              |          |                            |                |
| successes                  | true        | string   | the list order which's successful，joined by ","                 |                |
| \</data\> |   | |  | |
| ts                         | true         | long     | Time of Respond Generation, Unit: Millisecond |  |


## [Isolated] Query Trigger Order Open Orders

 - POST `linear-swap-api/v1/swap_trigger_openorders`

#### Remarks

 - This interface only supports isolated margin mode.

### Request Parameter
 
|Parameter Name	| Type | Mandatory | Description
| -----  | -----   | -----  | ----- |
|  contract_code|  string  |  true  |  contract code  "BTC-USDT"... |
|  page_index  |  int   |  false  |  page number，default page 1 if no given instruction| 
|  page_size   |  int   |  false  |  default 20 if no given instruction ，no more than 50 |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "trigger_type": "ge",
                "volume": 1.000000000000000000,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 10,
                "order_id": 4,
                "order_id_str": "4",
                "order_source": "api",
                "trigger_price": 13900.000000000000000000,
                "order_price": 13900.000000000000000000,
                "created_at": 1603705215654,
                "order_price_type": "limit",
                "status": 2,
                "margin_mode": "isolated",
                "margin_account": "BTC-USDT"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1603705219567
}

```

### Returning Parameter

| Parameter Name      | Mandatory | Type | Description            |  Value Range  |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status   | true   | string   | Request Processing Result    | "ok" , "error" |
| data    |    true   |      object    |    Returned data          |               |
| ts     | true         | long     | Time stamp of response, Unit: millisecond   |   |

- data details

| Parameter Name      | Type | Mandatory | Description            |  Value Range  |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| total_page   | int    | true | total page
| current_page | int | true | current page
| total_size   | int | true | total size
| \<orders\>   |              |          |                            |                |
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
| status | int | true | order status：1:ready to submit、2:submited、3:order accepted 、8：canceled orders but not found、9：canceling order、10：failed'
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</orders\>                  |              |          |                            |                |


## [Cross] Query Trigger Order Open Orders

 - POST `linear-swap-api/v1/swap_cross_trigger_openorders`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Data Value                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code | true | String | contract code |BTC-USDT |
| page_index | false | int | page index, default 1st | |
| page_size | false | int | page size default 20，no more than 50 | |

> Response

```json
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ETH",
                "contract_code": "ETH-USDT",
                "trigger_type": "ge",
                "volume": 1,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 30,
                "order_id": 1881,
                "order_id_str": "1881",
                "order_source": "api",
                "trigger_price": 90,
                "order_price": 90,
                "created_at": 1606978152937,
                "order_price_type": "limit",
                "status": 2,
                "margin_mode": "cross",
                "margin_account": "USDT"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1606978195074
}
```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | Request Processing Result               | "ok" , "error" |
| \<data\> |  true  | object |  | |
| total_page |true | int | total page | |
| current_page | true |int | current page | |
| total_size | true |int | total size | |
| \<orders\>|   true          |    object array      |                            |                |
| symbol |true |string | symbol | |
| contract_code |true | string  | contract code | |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| trigger_type | true |string  | trigger type： gegreat than or equal to；leless than or equal to | |
| volume | true |decimal  | place volume | |
| order_type | true |int  | order type 1. Place orders 2. cancel orders | |
| direction | true |string  | direction [buy/sell] | |
| offset | true |string  | offset [open/close] | |
| lever_rate | true |int | leverage  | |
| order_id | true |long  | order id | |
| order_id_str | true | string  | order id  | |
| order_source | true | string | order source | |
| trigger_price | true | decimal | trigger price | |
| order_price | true | decimal | order price | |
| created_at | true | long | created time | |
| order_price_type | true | string | type of order price  "limit": limit order，"optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20 | |
| status | true | int | order status：1:ready to submit、2:submited、3:order accepted 、8：canceled orders but not found、9：canceling order、10：failed' | |
| \</orders\>                  |              |          |                            |                |
| \</data\> |   | |  | |
| ts                         | true         | long     | Time of Respond Generation, Unit: Millisecond |  |


## [Isolated] Query Trigger Order History

 - POST `/linear-swap-api/v1/swap_trigger_hisorders`

#### Remarks

 - This interface only supports isolated margin mode.

> Request:

```json

{
  "contract_code": "BTC-USDT",
  "create_date": 3,
  "trade_type": 0,
  "status":"4,6",
  "page_index":1,
  "page_size":10
}

```

### Request Parameter

|   Parameter Name    |   Mandatory |   Type |     Desc             |   Default   |   Value Range |
| ------- | ------- | ------- | -------- | ------- | -------- |
| contract_code | true        | string   | Contract Code            |            | BTC-USDT         |
| trade_type        | true         | int      |    Transaction type            |            | 0: All ,1: Open Long,2: Close Short,3: Open Short,4: Close Long；the system will transfer these parameters into offset and direction and query the requested data. Please note that no data can be requested with parameter out of this range. |
| status        | true         | string      | Order Status              |            | data divided with several commas, trigger orders ready to be submitted：0: All (All filled orders),4: Trigger orders successfully submitted,5: Trigger orders failed being submitted, 6: Trigger orders cancelled |
| create_date   | true         | int      | Date                 |            | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.    |
| page_index    | false        | int      | Page, 1st page by default without given instruction  | 1          | page，1st page by default without given instruction|
| page_size     | false        | int      | Page 20 by default without given instruction,  ，no more than 50 | 20         | Page 20 by default without given instruction,  ，no more than 50  |

### NOTE

- System will query the filled trigger order history by default 


> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT",
                "trigger_type": "ge",
                "volume": 1.000000000000000000,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 10,
                "order_id": 3,
                "order_id_str": "3",
                "relation_order_id": "-1",
                "order_price_type": "limit",
                "status": 6,
                "order_source": "api",
                "trigger_price": 13900.000000000000000000,
                "triggered_price": null,
                "order_price": 13900.000000000000000000,
                "created_at": 1603705155231,
                "triggered_at": null,
                "order_insert_at": 0,
                "canceled_at": 1603705159520,
                "fail_code": null,
                "fail_reason": null,
                "margin_mode": "isolated",
                "margin_account": "BTC-USDT"
            }
        ],
        "total_page": 3,
        "current_page": 1,
        "total_size": 3
    },
    "ts": 1603705603369
}

```


### Returning Parameter

| Parameter Name             | Type | Mandatory |Desc                 | Value Range |
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
| \<orders\> |              |          |                            |                |
| symbol |string| true | symbol
| contract_code | string | true | Contract Code
| trigger_type | string | true | trigger： `ge` Equal to or Greater than；`le` Less than or Equal to
| volume | decimal | true | Numbers of order placed
| order_type | int | true | Transaction type：1、Place orders  2、Cancel orders
| direction | string | true | order direction, [Buy (buy), Sell(sell)]
| offset | string | true | offset direction [Open(open), Close(lose)]
| lever_rate | int | true | leverage 1\5\10\20
| order_id | long | true | Trigger order ID
| order_id_str | string | true | the order ID with string 
| relation_order_id | string | true | Relation order ID is the string related to the limit orders  The value is -1 before the trigger orders executed. 
| order_price_type | string | true | order type "limit": Limit order price，"optimal_5": Optimal 5  price level，"optimal_10":Optimal 10 price level，"optimal_20": the Optimal 20 price level
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
| margin_mode    |  string    | true | margin mode  | isolated : "isolated" |
| margin_account    |  string    | true | margin account  | "BTC-USDT"... |
| \</orders\>                  |              |          |                            |                |


## [Cross] Query Trigger Order History

 - POST `linear-swap-api/v1/swap_cross_trigger_hisorders`

#### Remarks

 - The interface only supports cross margin mode.

### Request Parameter

| Parameter Name            | Mandatory  | Type     | Desc                    | Value Range                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| contract_code | true        | string   | contract code |  BTC-USDT|
| trade_type        | true         | int      | trade type            | 0: All ,1: Open Long,2: Close Short,3: Open Short,4: Close Long；the system will transfer these parameters into offset and direction and query the requested data. Please note that no data can be requested with parameter out of this range. |
| status        | true         | String      | order status           | data divided with several commas, trigger orders ready to be submitted：0: All (All filled orders),4: Trigger orders successfully submitted,5: Trigger orders failed being submitted, 6: Trigger orders cancelled |
| create_date   | true         | int      | date           | any positive integer available. Requesting data beyond 90 will not be supported, otherwise, system will return trigger history data within the last 90 days by default.      |
| page_index    | false        | int      | page index, default 1st page         | page index, default 1st |
| page_size     | false        | int      | default 20，no more than 50    | default 20，no more than 50 |

#### Notice：
  - query closed trigger order（status is 4、5、6）；

> Response

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ETH",
                "contract_code": "ETH-USDT",
                "trigger_type": "ge",
                "volume": 1,
                "order_type": 1,
                "direction": "sell",
                "offset": "open",
                "lever_rate": 30,
                "order_id": 1880,
                "order_id_str": "1880",
                "relation_order_id": "-1",
                "order_price_type": "limit",
                "status": 6,
                "order_source": "api",
                "trigger_price": 90,
                "triggered_price": null,
                "order_price": 90,
                "created_at": 1606977456761,
                "triggered_at": null,
                "order_insert_at": 0,
                "canceled_at": 1606977508571,
                "fail_code": null,
                "fail_reason": null,
                "margin_mode": "cross",
                "margin_account": "USDT"
            }
        ],
        "total_page": 2,
        "current_page": 1,
        "total_size": 2
    },
    "ts": 1606978565722
}

```

### Returning Parameter

| Parameter Name            | Mandatory  | Type     | Desc                            | Data Value                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | Request Processing Result               | "ok" , "error" |
| \<data\> |  true  | object |  | |
| total_page |true | int | total page | |
| current_page | true |int | current page | |
| total_size | true |int | total size | |
| \<orders\>|   true          |    object array      |     订单信息                       |                |
| symbol |true |string | symbol | |
| contract_code |true | string  | contract code | |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| trigger_type | true |string  | trigger type： ge: Equal to or Greater than；le: Less than or Equal to | |
| volume | true |decimal  | place volume | |
| order_type | true |int  | order type：1、Place orders 2、Cancel orders | |
| direction | true |string  | direction [buy/sell] | |
| offset | true |string  | offset [open/close] | |
| lever_rate | true |int | leverage  | |
| order_id | true |long  | order id | |
| order_id_str | true |string  | order id  | |
| **relation_order_id** | true | string  | **relation order ID is the string related to the limit orders The value is -1 before the trigger orders executed**| |
| order_price_type | true |string | order type "limit": Limit order price，"optimal_5": Optimal 5 price level，"optimal_10":Optimal 10 price level，"optimal_20": the Optimal 20 price level | |
| status | true |int  | status (4:Orders accepted、5: Orders failing being placed、6: Orders canceled ) | |
| order_source | true |string | order source | |
| trigger_price | true |decimal | trigger price | |
| triggered_price | true |decimal  | triggered price | |
| order_price | true |decimal  | order price | |
| created_at | true | long  | created time | |
| triggered_at | true |long  | trigger time | |
| order_insert_at | true |long  | insert time | |
| canceled_at | true |long | canceled time| |
| fail_code | true |int | fail code | |
| fail_reason | true |string | fail reason | |
| \</orders\>                  |              |          |                            |                |
| \</data\> |   | |  | |
| ts                         | true         | long     | Time of Respond Generation, Unit: Millisecond |  |


# Swap Transferring Interface

##  [General] Transfer margin between Spot account and USDT Margined Swap account 

### Example

- POST `https://api.huobi.pro/v2/account/transfer`

### Notice

The interface supports cross margin mode and isolated margin mode.

This interface is used to transfer assets between Spot account and USDT Margined Swap account.

API rate limit for this interface is 1 times/second.

Transferring margin between Spot account and USDT Margined Swap account Interface, sets 8 decimal places for transferring amount of all coins.

### Request Parameter

| Parameter Name  |  Mandatory  |  Type  |  Desc                    |   Value Range  |  
| ----------- | -------- | ------ | ------------- | ------- | 
| from  |    true  |  string  |  source，value：spot、linear-swap  |   e.g. spot  |
| to  |    true  |  string  |  destination，value：spot、linear-swap |   e.g. linear-swap  |
| currency      | true     | string | currency.Both uppercase and lowercase are supported.          |       e.g. USDT                          |
| amount  | true     | decimal    | Transferring amount         |         |   |
| margin-account  | true     | string    | margin account        |  e.g. BTC-USDT，ETH-USDT, USDT           |   |

#### note
- when "margin-account" is USDT，it means the transfer in or transfer out from cross margin account.

> Response:

```json

 Yes：
{
    "code": 200,
    "data": 176104252,
    "message": "Succeed",
    "success": true
}
No：
 {
   "code":1303,
   "data":null,
   "message":"The single transfer-out amount must be no less than 0.0008BTC",
   "success":false
}
 ```

### Returning Parameter

  Parameter Name                |  Mandatory  |  Type  |  Desc         |  Value Range                    |
 ---------------------- | -------- | ------- | ------------------ | ------------ |
success  |  true  |   string  | status  | true/false   |  
data  |    true  |   long    |    The generated transfer order id  |  |
code  |    true  |   long    |     Response code  |  |
message  |    true  |   string    |   Response  message |  |


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

| Permission |   Content Type   | Interface Mode | Request Method |  Type  |  Description        |  Authentication Required   |
|----------- | ---------------- | ---------------|--------------- |--------| ------------------- |----------------------------|
| Read    |  Market Data Interface | general | market.$contract_code.kline.$period                    | sub  | Subscribe KLine data               |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.kline.$period                    | req  | Request Kline Data              |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.depth.$type                      | sub  | Subscribe Market Depth Data      |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.depth.size_${size}.high_freq     | sub  | Subscribe Incremental Market Depth Data |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.bbo                              | sub  | Subscribe market BBO data push    |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.detail                           | sub  | Subscribe Market Detail Data     |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.trade.detail                     | req  | Request Trade Detail Data        |       No      |
| Read    |  Market Data Interface | general | market.$contract_code.trade.detail                     | sub  | Subscribe Trade Detail Data       |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.index.$period  | sub  | Subscribe Index Kline Data                  |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.index.$period  | sub  | Request Index Kline Data                  |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.basis.$period.$basis_price_type  | sub  | Subscribe Basis Data                  |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.basis.$period.$basis_price_type  | req  | Request Basis Data                  |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.premium_index.$period            | sub  | Subscribe Premium Index Kline Data          |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.premium_index.$period            | req  | Request Premium Index Kline Data       |       No      |
| Read    |  Index and Basis Interface| general | market.$contract_code.estimated_rate.$period           | sub  | Subscribe Estimated Funding Rate Kline Data     |       No      |
| Read    |  Index and Basis Interface | general | market.$contract_code.estimated_rate.$period           | req  | Request Estimated Funding Rate Kline Data     |       No      |
| Read    |  Trade Interface | general | public.$contract_code.liquidation_orders               | sub  | Subscribe Liquidation Orders (no authentication) (sub)    |       No      |
| Read    |  Trade Interface | general | public.$contract_code.funding_rate                     | sub  | Subscribe funding rate (no authentication)（sub）|       No      |
| Read    |  Trade Interface | general | public.$contract_code.contract_info                    | sub  | Subscribe Contract Info (no authentication)（sub） |       No      |
| Read    |  Trade Interface	 | Isolated Margin | orders.$contract_code                                  | sub  | Subscribe Order Data(sub)              |    Yes      |
| Read    |  Account Interface	 | Isolated Margin | accounts.$contract_code                                | sub  | Subscribe Account Equity Updates Data(sub)             |    Yes      |
| Read    |  Account Interface	 | Isolated Margin | positions.$contract_code                               | sub  | Subscribe Position Updates(sub)      |    Yes      |
| Read    |  Trade Interface	 | Isolated Margin | matchOrders.$contract_code                             | sub  | Subscribe Match Order Data（sub)    |    Yes      |
| Read    |  Trade Interface	 | Isolated Margin | trigger_order.$contract_code                             | sub  | Subscribe trigger orders updates(sub)    |    Yes      |  
| Read  | Account Interface | cross margin | orders_cross.$contract_code                               | sub    |   Subscribe Order Data         |       Yes          |
| Read  | Account Interface | cross margin | accounts_cross.$margin_account                            | sub    |   Subscribe Account Equity Updates Data         |       Yes          |
| Read  | Trade Interface | cross margin | positions_cross.$contract_code                            | sub    |   Subscribe Position Updates     |       Yes          |
| Read  | Trade Interface | cross margin | matchOrders_cross.$contract_code                          | sub    |   Subscribe Match Order Data     |       Yes          |
| Read  | Trade Interface | cross margin | trigger_order_cross.$contract_code                        | sub    |   Subscribe trigger orders updates(sub)     |       Yes          |                                                                                                                                    
| Read   |  System Status Interface | cross margin  |  public.$service.heartbeat                    |    sub  | Subscription system status updates   | No  | 

## WebSocket Subscription Address

Market Data Request and Subscription: wss://api.hbdm.com/linear-swap-ws 

Order Push Subscription: wss://api.hbdm.com/linear-swap-notification

Index Kline Data and Basis Data Subscription: wss://api.hbdm.com/ws_index

System status updates subscription ：wss://api.hbdm.com/center-notification

If the url: api.hbdm.com can't be accessed, please use the url below:

Market Data Request and Subscription Address: wss://api.btcgateway.pro/linear-swap-ws;

Order Push Subscription：wss://api.btcgateway.pro/linear-swap-notification

Index Kline Data and Basis Data Subscription: wss://api.btcgateway.pro/ws_index

System status updates subscription ：wss://api.btcgateway.pro/center-notification

If you have further queries about Huobi USDT Margined Swap order push subscription, please refer to [Demo](https://docs.huobigroup.com/docs/usdt_swap/v1/en/#code-demo)

### Note:

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

## API Rate Limit Illustration

There is rate limit for both public and private interfaces. More details are laid out as below:

- Generally, for the private interfaces, users need to user API keys. The rate limit for each UID is 45 times at most every 3 seconds. (Please note that the 45 times/3s of rate limit mentioned above are shared by all contracts (all coins and contracts types expiring at different date).

- For public interfaces used to get information of non-market data (such as request information of index, price limit, delivery and settlement, positions, etc.), the rate limit for each IP is 120 times every 3 seconds. (Please note that the 120 times/3s rate limit is shared by all the requests for non-market data under this UID)

- For public interface to get market data such as  Get Kline data, Get Market Data Overview, Get Contract Information,Get market in-depth data, Get premium index Kline, Get real-time forecast capital rate kline, Get basis data, Get the last Trade of a Contract and so on：

   (1) For restful interfaces, products,  (future, coin margined swap, usdt margined swap and option)800 times/second for one IP at most
　　
   (2) The rate limit for “req” request is 50 times/s at most. No limit for “sub” request as the data will be pushed by server voluntarily. 

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

- Huobi USDT Margined Swap uses one official address:

  `wss://api.hbdm.com/linear-swap-notification`

### Note

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

Please note that the WS request connection should not go over 30 normally.

### Data Compression

All response data from WebSocket server are compressed into GZIP format. Clients have to decompress them for further use.

### Illustration of Request(req and rep) Data

- Character Encoding：UTF-8

- Case sensitive，including parameter name and return parameter

- Data type： use JSON to transmit data

- All request data has fixed format. Please note that Huobi USDT Margined Swap API document will only focus on data illustration in non-fixed format.

> Request data format is laid out as below:

```

  {
  "op": string, // Required; Client requests operator name (Server will returns the same value), For detailed operator name list, please refer to the appendix
  "cid": string, // Optional;Request unique ID( Client generate a unique ID which server will return the same value)
  // Others required/ Optional string
  }

```

> All responses push data will be returned in fixed format，Huobi USDT Margined Swap API document will only focus on data illustration， Response data format is laid out as below；

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
  "data": object // required;return data object
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

Clients can create Access Key and Secret Key on Huobi which Access Key is the API access key kept by the client.  The Secret Key is used to sign the request (available only for request). To apply/change API key, please go to “Account-API Management” on Huobi USDT Margined Swap. Make name for the API Key and click “create” to finish. It’s optional to bind IP address to the API Key.

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

  `/linear-swap-notification\n`

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

## [General] Subscribe Kline data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe Kline data, clients have to connect WebSocket API server and send subscribe request with the format below：

`{`

  `"sub": "market.$contract_code.kline.$period",`

  `"id": "id generate by client"`

`}`

> Example of a successful subscription request：

```json

    {
    "sub": "market.BTC-USDT.kline.1min",
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
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT"|
  period    |     true          | string   |    Kline Period   |            |  1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon  |

> After subscription, clients can receive updates upon any change. Example:

```json

{
    "ch":"market.BTC-USDT.kline.1min",
    "ts":1603707124366,
    "tick":{
        "id":1603707120,
        "mrid":131592424,
        "open":13067.7,
        "close":13067.7,
        "high":13067.7,
        "low":13067.7,
        "amount":0.004,
        "vol":4,
        "trade_turnover":52.2708,
        "count":1
    }
}

```

### Return Parameter 

 Parameter Name |    Mandatory   |   Type |   Description  |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   Request Parameter  | 
  ts    |     true          | long   |  Time of Respond Generation，Unit：Millisecond   |           
  \<tick\>    |               |    |      |            | 
  id    |     true          | long   |  kline id,the same as kline timestamp, kline start timestamp   |            
  mrid    |     true          | long   | ID Order ID    |            
  vol    |     true          | decimal   |  Trade Volume(Cont.)    |            
  count    |     true          | decimal   |   Order Quantity  |            
  open    |     true          | decimal   |   Open Price  |            
  close    |     true          | decimal   |  Clos Price,  the price in the last kline is the latest order price   |            
  low    |     true          | decimal   |  Low Price   |            
  high    |     true          | decimal   |  High Price  |            
  amount    |     true          | decimal   |  Trade Amount(Coin),  trade amount(coin)=sum(order quantity of a single order * face value of the coin/order price)   |           
  trade_turnover    |     true          | decimal   |  Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)  |    
  \</tick\>    |               |     |      |          




## [General] Request Kline data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
    "req": "market.BTC-USDT.kline.1min",
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
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |
  period | true | string | Kline Period | | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|

  
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
    "rep":"market.BTC-USDT.kline.60min",
    "wsid":467277265,
    "status":"ok",
    "data":[
        {
            "id":1603270800,
            "open":12198,
            "close":12196.7,
            "low":11715.8,
            "high":12300,
            "amount":0.276,
            "vol":276,
            "trade_turnover":3315.9104,
            "count":39
        },
        {
            "id":1603274400,
            "open":12196.7,
            "close":12277.9,
            "low":12111,
            "high":12289.9,
            "amount":0.198,
            "vol":198,
            "trade_turnover":2420.7728,
            "count":21
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
  id    |     true          | long   | kline id,the same as kline timestamp, kline start timestamp   |            
  vol    |     true          | decimal   |    Trade Volume(Cont.)   |            
  count    |     true          | decimal   |  Order quantity   |            
  open    |     true          | decimal   |      Open Price  |            
  close    |     true          | decimal   |    Clos Price, the price in the latest Kline is the last order price   |            
  low    |     true          | decimal   |  Low Price  |            
  high    |     true          | decimal   |  High Price  |            
  amount    |     true          | decimal   |  Trade Amount(Coin), trade amount(coins)=sum(order quantity of a single order * face value of the coin/order price)   |      
  trade_turnover    |     true          | decimal   |  Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)  |          
  \</data\>    |               |     |      |          



## [General] Subscribe Market Depth Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe market depth data, clients have to make connection to WebSokcet API Server and send subscribe request in the format below：

`{`

  `"sub": "market.$contract_code.depth.$type",`

  `"id": "id generated by client"`

`}`

> Example of a successful request ：

```json

    {
    "sub": "market.BTC-USDT.depth.step0",
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
  contract_code  |       true         |  string  |   swap code  |               |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |
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
    "ch":"market.BTC-USDT.depth.step6",
    "ts":1603707576468,
    "tick":{
        "mrid":131596447,
        "id":1603707576,
        "bids":[
            [
                13071.9,
                38
            ],
            [
                13068,
                5
            ]
        ],
        "asks":[
            [
                13081.9,
                197
            ],
            [
                13099.7,
                371
            ]
        ],
        "ts":1603707576467,
        "version":1603707576,
        "ch":"market.BTC-USDT.depth.step6"
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



## [General] Subscribe Incremental Market Depth Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe incremental market depth data, clients have to make connection to WebSokcet API Server and send subscribe request in the format below：

`{`

`"sub": "market.$contract_code.depth.size_${size}.high_freq",`

`"data_type":"incremental",`

`"id": "id generated by client"`

`}`

> Example of a successful request ：

```json
{
"sub": "market.btc-usdt.depth.size_20.high_freq",
"data_type":"incremental",
"id": "id generated by client"
}

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.depth.size_${size}.high_freq，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| data_type   |  false          |  string     |    data type. `snapshot` by default. `incremental`: incremental data.`snapshot`: full data.|

### sub Subscribe Parameter Rules

 Parameter Name   |  Mandatory   |  Type   |  Description      |    Default   |  Value Range  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  contract_code         |  true           |  string     |    contract code          |        | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |
  size           |  true           |  int     |    Depth size      |        |  `20`: stands for 20 unmerged data. `150`:stands for 150 unmerged data.|

> Response example:

```json

{
    "ch":"market.BTC-USDT.depth.size_20.high_freq",
    "tick":{
        "asks":[
            [
                13081.9,
                206
            ],
            [
                13099.7,
                371
            ]
        ],
        "bids":[
            [
                13071.9,
                38
            ],
            [
                13060,
                400
            ]
        ],
        "ch":"market.BTC-USDT.depth.size_20.high_freq",
        "event":"snapshot",
        "id":131597620,
        "mrid":131597620,
        "ts":1603707712356,
        "version":1512467
    },
    "ts":1603707712357
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



## [General] Subscribe Market Detail Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe market details, the clients have to make connection to WebSocket Server and send subscribe request in the format below:

`{`

`"sub": "market.$contract_code.detail",`

`"id": "id generated by client"`

`}`

> Example of Subscribe Market Detail Data：

```json

    {
     "sub": "market.BTC-USDT.detail",
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
  contract_code  |       true         |  string  |   swap code  |               | Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |

> Example of a successful return data：

```json

{
    "ch":"market.BTC-USDT.detail",
    "ts":1603707870528,
    "tick":{
        "id":1603707840,
        "mrid":131599205,
        "open":12916.2,
        "close":13065.8,
        "high":13205.3,
        "low":12852.8,
        "amount":30.316,
        "vol":30316,
        "trade_turnover":395073.4918,
        "count":2983
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
trade_turnover  |  true  |  decimal  |  Transaction amount, that is, sum (transaction quantity * contract face value * transaction price)  | 
 \</tick\>    |               |    |      |           



## [General] Subscribe market BBO data push

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### clients have to make connection to WebSocket API Server and send subscribe request in the format below：

  `{`
  
  `"req": "market.$contract_code.bbo", `
  
  `"id": "id generated by client"`
  
  `}`

> Example of a successful request：

```json

    {
     "sub": "market.BTC-USDT.bbo",
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
| contract_code   |  true    |  string     |    Pairs         |  Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT"   |

> **Return example**:

```json

{
    "ch":"market.BTC-USDT.bbo",
    "ts":1603707934525,
    "tick":{
        "mrid":131599726,
        "id":1603707934,
        "bid":[
            13064,
            38
        ],
        "ask":[
            13072.3,
            205
        ],
        "ts":1603707934525,
        "version":131599726,
        "ch":"market.BTC-USDT.bbo"
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




## [General] Request Trade Detail Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To request Trade detail data, Clients have to make connection to the WebSocket Server and send request data in the format below：

`{`
     
   `"req": "market.$contract_code.trade.detail",`
    
   `"id": "id generated by client"` // “id” string is optional currently. Server will return with null because client ID is not necessary
    
`}`

Return to the current trade detail data only

> Example of requesting trade detail data：

```json


    {
     "req": "market.BTC-USDT.trade.detail",
     "size": 10,
     "id": "id8"
    }

```

### Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.trade.detail，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| size  |  false  | int | number of data; no more than 50; default 50 if not filled                         |


### req Subscribe Parameter Rules

Parameter Name  |  Mandatory  |    Type  |     Description   |  Default   |  Value Range |
-------------- |  -------------- |  ---------- |  ------------ |  ------------ |  --------------------------------------------------------------------------------  |
  contract_code  |       true         |  string  |   swap code  |               |Case-Insenstive.Both uppercase and lowercase are supported..e.g. "BTC-USDT" |


> Example of a successful return data：

```json

{
    "data":[
        {
            "amount":"22",
            "ts":1603706942240,
            "id":1315909380000,
            "price":"13068.4",
            "direction":"sell"
        },
        {
            "amount":"2",
            "ts":1603706947767,
            "id":1315909430000,
            "price":"13068.5",
            "direction":"buy"
        }
    ],
    "id":"id8",
    "rep":"market.BTC-USDT.trade.detail",
    "status":"ok",
    "ts":1603708046534
}
    
```

### Return Parameter

Parameter Name     |    Mandatory |  Type  | Description |  Default   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  Data Channel，Format： market.$contract_code.trade.detail  |  |   
status  |  true  |  string  |  Request Status  |   |    
id  |  true  |  long  |  Request ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  long  |  Unique Transaction Id(symbol level)  |   |    
price  |  true  |  string  |  Price |   |    
amount  |  true  |  string  |  Quantity(Cont.)  |   |    
direction  |  true  |  string  |  Order Direction  |   |    
ts  |  true  |  long  |  Order Creation Time |   |    
 \</data\>    |               |    |      | 
ts  |  true  |  long  |  server response time |   | 


## [General] Subscribe Trade Detail Data 

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe trade detail data, the Client has to make connection to the Server and send subscribe request in the format below：

`{`
 
  `"sub": "market.$contract_code.trade.detail",`
    
  `"id": "id generated by client"`
    
`}`

> Example of a successful subscribe request：

```json

    {
     "sub": "market.BTC-USDT.trade.detail",
     "id": "id7"
    }
    
```

### Note:

  Clients can only access the recent 300 trade detail data 

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.trade.detail，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules

  Parameter Name    | Mandatory   |  Type    |   Description   |   Default     |   Value Range  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------|
  contract_code  |       true         |  string  |   swap code  |               |  contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |


> When there is any update upon trade detail data, clients will receive notification from server. Example：

```json

{
    "ch":"market.BTC-USDT.trade.detail",
    "ts":1603708208346,
    "tick":{
        "id":131602265,
        "ts":1603708208335,
        "data":[
            {
                "amount":2,
                "ts":1603708208335,
                "id":1316022650000,
                "price":13073.3,
                "direction":"buy"
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
id  |  true  |  long  |  Unique Order Id(symbol level).  |   |    
ts  |  true  |  long  |  tick time  |   |    
 \<data\>    |               |    |      | 
amount  |  true  |  decimal  |  quantity(Cont.) |   |    
ts  |  true  |  long  |  trade timestamp  |   |    
id  |  true  |  long  |  Unique Transaction Id(symbol level)  |   |    
price  |  true  |  decimal  |  Price  |   |    
direction  |  true  |  string  |  Order direction  |   |    
 \</data\>    |               |    |      | 
 \</tick\>    |               |    |      | 



# WebSocket Index and Basis Interface

 - The websocket url of Index and Basis Data is：wss://api.hbdm.com/ws_index 


## [General] Subscribe Index Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.index.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of index kline data：

```json

    {
    "sub": "market.BTC-USD.index.1min",
    "id": "id1"
    }

```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  sub |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.index.$period，For parameter details please check sub Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |

### sub Subscribe Parameter Rules
| **Parameter Name**    | **Mandatory** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | index symbol          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |

###  Note
 - Pushed once the index data is changed.
  
 - Periodical Push when the index data hasn't changed according to the kline period.


> results pushed by the server

```json

{
    "ch":"market.BTC-USDT.index.15min",
    "ts":1607309592214,
    "tick":{
        "id":1607309100,
        "open":"19213.505",
        "close":"19242.05",
        "high":"19248.31",
        "low":"19213.505",
        "amount":"0",
        "vol":"0",
        "count":0
    }
}
```
### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format：market.$contract_code.index.$period |                | |
| tick |   true   |    object array    |  Details：tick parameters             |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond            |                | |

### tick parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | string | index kline id,the same as kline timestamp,kline start timestamp  |
| vol | string  | Trade Volume. The value is 0.             |
| count | decimal  | count. The value is 0.              |
| open | string  | open index price               |
| close | string  | close index price             |
| low | string  |  lowest index price             |
| high | string  | highest index price               |
| amount | string  |amount based on coins.            |


## [General] Request Index Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`
     
   `"req": "market.$contract_code.index.$period",`
    
   `"id": "id generated by client",`

   `"from": "type: long, from 2017-07-28T00:00:00+08:00  to 2050-01-01T00:00:00+08:00",`
   
   `"to": "type: long, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00 .Larger than 'from' value. ",`
    
`}`

> example of the subscription of index kline data：

```json

  {
    "req": "market.btc-usd.index.1min",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
  }
```

###  Request Parameter
|  Parameter Name |   Mandatory   |     Type |    Desc |
|  ------- |  -------  |  ------- |  ------- |
|  req |  true  |  string |  the themes that need to be subscribed; the interface is fixed at: market.$contract_code.index.$period，For parameter details please check req Subscribe Parameter Rules |
|  id |  false  |  string |  id automatically generated by the business party |
| from          | true     | long  | start time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds               |         |
| to          | true     | long  | end time, from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00. timestamp unit：seconds. larger than 'from' value              |         |


### req Subscribe Parameter Rules：
| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |

### Note：

- Pushed once the index data is changed.

> response example：

```json

{
    "id":"id4",
    "rep":"market.BTC-USDT.index.15min",
    "wsid":3673570133,
    "ts":1607310136031,
    "status":"ok",
    "data":[
        {
            "id":1607309100,
            "open":19213.505,
            "close":19207.245,
            "low":19207.245,
            "high":19248.31,
            "amount":0,
            "vol":0,
            "count":0
        },
        {
            "id":1607310000,
            "open":19199.655,
            "close":19174.48,
            "low":19174.48,
            "high":19208.11,
            "amount":0,
            "vol":0,
            "count":0
        }
    ]
}
```

### Returning Parameter
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| req     | true | string | Data channel，Format：market.$contract_code.index.$period |                | |
| status | true | string | Request processing result          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond          |                | |
| data |   true   |    object array    |   Details：data parameters            |                | |

### data parameters
| **parameter name** | **type** | **desc**        |                                  |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| id | int | index kline id,the same as kline timestamp,kline start timestamp  |
| vol | decimal  | Trade Volume. The value is 0.             |
| count | decimal  | count. The value is 0.              |
| open | decimal  | open index price               |
| close | decimal  | close index price             |
| low | decimal  |  lowest index price             |
| high | decimal  | highest index price               |
| amount | decimal  |amount based on coins.            |


## [General] Subscribe Premium Index Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe Premium index kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.premium_index.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of premium index kline data：

```json

    {
    "sub": "market.BTC-USDT.premium_index.1min",
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
| contract_code      | true     | string |     contract code        |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

#### Note
 - Pushed once the index data is changed.
  
 - Periodical Push when the index data hasn't changed according to the kline period.


> results pushed by the server

```json

{
    "ch":"market.BTC-USDT.premium_index.1min",
    "ts":1603708380380,
    "tick":{
        "id":1603708380,
        "open":"0.000068125",
        "close":"0.000068125",
        "high":"0.000068125",
        "low":"0.000068125",
        "amount":"0",
        "vol":"0",
        "count":"0",
        "trade_turnover":"0"
    }
}
```
###  Return Parameter

| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format： market.period |                | |
| \<tick\> |   true   |    object array    |               |                | |
| id     | true | long | index kline id,the same as kline timestamp, kline start timestamp      |                | |
| vol     | true | string |  Trade Volume(Cont.). The value is 0.        |                | |
| count     | true | string |  count. The value is 0.       |                | |
| open     | true | string | open index price        |                | |
| close     | true | string | close index price       |                | |
| low     | true | string | lowest index price        |                | |
| high     | true | string | highest index price         |                | |
| amount     | true | string |amount based on coins.       |                | |
| trade_turnover   | true | string | Transaction amount, the value is 0.        |                | |
| \</tick\>            |      |        |               |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond            |                | |


## [General] Request Premium Index Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
    "req": "market.BTC-USDT.premium_index.1min",
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
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

### Note：
- Pushed once the index data is updated.

> response example：

```json

{
    "id":"id4",
    "rep":"market.BTC-USDT.premium_index.15min",
    "wsid":1524762738,
    "ts":1603782744066,
    "status":"ok",
    "data":[
        {
            "id":1603641600,
            "open":"0",
            "close":"0.0000970833333333",
            "low":"0",
            "high":"0.0000997916666666",
            "amount":"0",
            "vol":"0",
            "count":"0",
            "trade_turnover":"0"
        }
    ]
}

```
### data parameters
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data channel，Format： market.period |                | |
| status | true | string | Request processing result          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, Unit: Millisecond          |                | |
| \<data\> |   true   |    object array    |               |                | |
| id     | true | long | index kline id,the same as kline timestamp, kline start timestamp       |                | |
| vol     | true | string | Trade Volume(Cont.). The value is 0.       |                | |
| count     | true | string | count. The value is 0.      |                | |
| open     | true | string | open index price       |                | |
| close     | true | string | close index price    |                | |
| low     | true | string | lowest index price       |                | |
| high     | true | string | highest index price    |                | |
| amount     | true | string | amount based on coins.      |                | |
| trade_turnover     | true | string | Transaction amount, the value is 0.       |                | |
| \</data\>            |      |        |               |                | |


## [General] Subscribe Estimated Funding Rate Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe Estimated Funding Rate kline data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.estimated_rate.$period",`

  `"id": "id generate by client"`

`}`

> example of the subscription of estimated funding rate kline data：

```json

    {
    "sub": "market.BTC-USDT.estimated_rate.1min",
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
| contract_code      | true     | string | contract code        |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |

#### Note:
 - Pushed once the kline data is changed.
  
 - Periodical Push when the kline data hasn't changed according to the kline period.


> results pushed by the server

```json

{
    "ch":"market.BTC-USDT.estimated_rate.1min",
    "ts":1603708560233,
    "tick":{
        "id":1603708560,
        "open":"0.0001",
        "close":"0.0001",
        "high":"0.0001",
        "low":"0.0001",
        "amount":"0",
        "vol":"0",
        "count":"0",
        "trade_turnover":"0"
    }
}
```

###  parameters
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | Data channel，Format： market.period |                | |
| \<tick\> |   true   |    object array    |               |                | |
| id     | true | long | index kline id,the same as kline timestamp       |                | |
| vol     | true | string | Trade Volume(Cont.). The value is 0.       |                | |
| count     | true | string | count. The value is 0.      |                | |
| open     | true | string | open index price       |                | |
| close     | true | string | close index price    |                | |
| low     | true | string | lowest index price       |                | |
| high     | true | string | highest index price    |                | |
| amount     | true | string | amount based on coins.      |                | |
| trade_turnover     | true | string | Transaction amount, the value is 0.      |                | |
| \</tick\>            |      |        |               |                | |
| ts     | true | long |  Time of Respond Generation, Unit: Millisecond                   |                | |


## [General] Request Estimated Funding Rate Kline Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
    "req": "market.btc-usdt.estimated_rate.1min",
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


### req Request Parameter：

| **Parameter Name**    | **Mandotary** | **Type** | **Desc**        | **Default** | **Value Range**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| contract_code      | true     | string | contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported.."BTC-USDT","ETH-USDT"...                           |
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |


> response example：

```json

{
    "id":"id4",
    "rep":"market.BTC-USDT.estimated_rate.15min",
    "wsid":3674722864,
    "ts":1603782867314,
    "status":"ok",
    "data":[
        {
            "id":1603641600,
            "open":"0.0001",
            "close":"0.0001",
            "low":"0.0001",
            "high":"0.0001",
            "amount":"0",
            "vol":"0",
            "count":"0",
            "trade_turnover":"0"
        }
    ]
}
```
###  parameters
| **parameter name** | **Mandatory** | **type** | **desc**        |    **Value Range**             |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data channel, Format： market.period |                | |
| status | true | string | Request status                          | "ok" , "error" | |
| id     | true | string | ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, unit: millisecond                   |                | |
| \<data\> |   true   |    object array    |               |                | |
| id     | true | long | index kline id,the same as kline timestamp       |                | |
| vol     | true | string | Trade Volume(Cont.). The value is 0.       |                | |
| count     | true | string | count. The value is 0.      |                | |
| open     | true | string | open index price       |                | |
| close     | true | string | close index price    |                | |
| low     | true | string | lowest index price       |                | |
| high     | true | string | highest index price    |                | |
| amount     | true | string | amount based on coins.      |                | |
| trade_turnover     | true | string | Transaction amount, the value is 0.       |                | |
| \</data\>            |      |        |               |                | |


## [General] Subscribe Basis Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

`{`

  `"sub": "market.$contract_code.basis.$period.$basis_price_type",`

  `"id": "id generate by client"`

`}`

> example of the subscription of basis data：

```json

    {
    "sub": "market.BTC-USDT.basis.1min.open",
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
| contract_code      | true     | string | contract code         |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USDT"                         |
| period          | true     | string  | kline period               |         | 1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |

> Response Example

```json

{
    "ch":"market.BTC-USD.basis.15min.open",
    "ts":1603709195504,
    "tick":{
        "id":1603709100,
        "index_price":"13101.595",
        "contract_price":"13100.9",
        "basis":"-0.695",
        "basis_rate":"-0.0000530469763414301846454572897422031"
    }
}

```

### Response Parameters

| **parameter name**     | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| -----------  | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | string | Data belonged channel	Format: market.period |                | |
| \<tick\>    |    object array    |               |                | |
| id  | long | unique id |  |
| contract_price  | string | contract last price |  |
| index_price  | string | index price |  |
| basis  | string | basis=contract_price - index_price |  |
| basis_rate | string | basis_rate=basis/index_price |  |
| \</tick\>            |      |        |               |                | |
| ts      | long | Time of Respond Generation, unit: millisecond        |                | |

## [General] Request Basis Data

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
    "req": "market.btc-usdt.basis.1min.open",
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
| contract_code      | true     | string |  contract code          |         | Case-Insenstive.Both uppercase and lowercase are supported..e.g."BTC-USDT" 
| period          | true     | string  | kline type               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| basis_price_type          | false     | string  | use basis price type to calculate the basis data       |    Using open price default   |    open price："open"，close price："close"，highest price："high"，lowest price："low"，avg=（high price +low price）/2："average"   |

### Note：
 - 2000 data at most per request.

> response example：

```json

{
    "data":[
        {
            "basis":"-27.593412766666006",
            "basis_rate":"-0.0021317871729511838",
            "contract_price":"12916.2",
            "id":1603641600,
            "index_price":"12943.793412766667"
        }
    ],
    "id":"id4",
    "rep":"market.BTC-USDT.basis.15min.open",
    "status":"ok",
    "ts":1603783024207,
    "wsid":1308653018
}

```

### Response Parameters

| **parameter name**      | **Mandatory** | **Type**  | **Desc**             | **Value Range**       |
| -----------  | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | Data belonged channel	Format: market.basis |                | |
| status | true | string | Return Statu                          | "ok" , "error" | |
| id     | true | string | Request ID       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | Time of Respond Generation, unit: millisecond                   |                | |
| \<data\>    |    object array    |               |                | |
| id | true  | long | unique id |  |
| contract_price | true  | string | contract last price |  |
| index_price | true  | string | index price |  |
| basis | true  | string | basis=contract_price - index_price |  |
| basis_rate | true  | string | basis_rate=basis/index_price |  |
| \</data\>            |      |        |               |                | |


# Orders and Accounts WebSocket Interfaces

## [Isolated] Subscribe Order Data(sub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "orders.BTC-USDT"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: orders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |


> Illustration on detailed data format of orders Notification

```json

{
    "op": "notify", 
    "topic": "orders.btc-usdt", 
    "ts": 1489474082831, 
    "uid": "123456789",
    "symbol": "BTC", 
    "contract_code": "BTC-USDT", 
    "volume": 111, 
    "price": 1111, 
    "order_price_type": "limit",
    "direction": "buy", 
    "offset": "open", 
    "status": 6,
    "lever_rate": 10, 
    "order_id":758684042347171840,
    "order_id_str":"758684042347171840", 
    "client_order_id": 10683, 
    "order_source": "web", 
    "order_type": 1, 
    "created_at": 1408076414000,
    "trade_volume": 1,
    "trade_turnover": 1200, 
    "fee": 0, 
    "liquidation_type": "0",
    "trade_avg_price": 10, 
    "margin_asset": "USDT",
    "margin_frozen": 10, 
    "profit": 2,
    "canceled_at": 1408076414000, 
    "fee_asset": "USDT",
    "margin_mode": "isolated",
    "margin_account": "BTC-USDT",
    "trade": [{
        "trade_id":14469,
        "id":"14469-758684042347171840-1",
        "trade_volume": 1, 
        "trade_price": 123.4555, 
        "trade_fee": 0.234,
        "fee_asset": "USDT", 
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
| uid                   | string  | account uid                                              |
| ts                      | long    | Server responses timestamp                                           |
| symbol                  | string  | symbol                                                      |
| contract_code           | string  | Contract Code                                                     |
| volume                  | decimal | Order quantity                                                    |
| price                   | decimal | Order price                                                     |
| order_price_type        | string  | Order price type "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok      |
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
| trade_volume            | decimal | trade volume(coin))                                                     |
| trade_turnover          | decimal | Turnover                                                   |
| fee                     | decimal | Fees                                                       |
| trade_avg_price         | decimal | Average order price                                                     |
| margin_frozen           | decimal | Frozen Margin                                                   |
| margin_asset           | string | margin_asset                                              |
| profit                  | decimal | Profits&Losses                                                       |
| liquidation_type  | string | Liquidation type, 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated |
| canceled_at  | long   |  Canceled time  |
| fee_asset  | string   |  the corresponding cryptocurrency to the given fee  |
| margin_mode     | string | margin mode   isolated : "isolated" |
| margin_account    | string | margin account  "BTC-USDT"... |
| \<list\>( Attribute Name: trade) |         |                                                              |
| id            | string| 	the global unique ID of the trade.                                                       |
| trade_id                | long    | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.                                                  |
| trade_volume            | decimal | trade volume                                                      |
| trade_price             | decimal | trade price                                                    |
| trade_fee               | decimal | trading fees                                                   |
| trade_turnover          | decimal | turnover                                                    |
| created_at              | long    | trade creation time                                                 |
| role             | string  | taker or maker                                                |
| fee_asset  | string   |  the corresponding cryptocurrency to the given fee  |
| \</list\>                  |         |                                                             |


## [Isolated] Unsubscribe Order Data（unsub）

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "orders.BTC-USDT",
  "cid": "40sG903yz80oDFWr"
}

```

### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; Unsubscribe Topic Name，format: orders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub ) | Rule   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | Allowed  |
| orders.contract_code1| orders.*        | Allowed|
| orders.contract_code1 | orders.contract_code2  | Allowed |
| orders.contract_code1 | orders.contract_code2  | Not Allowed |
| orders.*       | orders.contract_code1  | Not Allowed |


## [Cross] Subscribe Order Data（sub）

#### Remarks

 - The interface only supports cross margin mode.

To subscribe order data, Clients have to make connection to the Server and send subscribe request in the format below:

### Subscribe Request Format

  `{ `
  
  `"op": "sub",`
  
  `"cid": "cid",`
  
  `"topic": "orders_cross.$contract_code"`
  
  `} `

> Example of a successful subscribe request:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders_cross.btc-usdt"
}
```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: orders_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |

> Illustration on detailed data format of orders Notification

```json

{
    "op":"notify",
    "topic":"orders_cross.btc-usdt",
    "ts":1606878438414,
    "symbol":"BTC",
    "contract_code":"BTC-USDT",
    "volume":8,
    "price":50000,
    "order_price_type":"limit",
    "direction":"buy",
    "offset":"close",
    "status":6,
    "lever_rate":100,
    "order_id":783650498317316098,
    "order_id_str":"783650498317316098",
    "client_order_id":null,
    "order_source":"risk",
    "order_type":3,
    "created_at":1606878438320,
    "trade_volume":8,
    "trade_turnover":4000,
    "fee":0,
    "trade_avg_price":50000,
    "margin_frozen":0,
    "profit":-1866.704,
    "trade":[
        {
            "trade_fee":0,
            "fee_asset":"USDT",
            "trade_id":783650498317316098,
            "id":"783650498317316098-783650498317316098-1",
            "trade_volume":8,
            "trade_price":50000,
            "trade_turnover":4000,
            "created_at":1606878438320,
            "role":"taker"
        }
    ],
    "canceled_at":0,
    "fee_asset":"USDT",
    "margin_asset":"USDT",
    "uid":"123456789",
    "liquidation_type":"1",
    "margin_mode":"cross",
    "margin_account":"USDT"
}
```

###  Pushed Data Parameter

| Parameter Name   | Mandatory | Type  | Desc   |取值范围           |
| -------------- | ---- | ------- | -------------------------- | ----- |
| op   | true | string  | operation name, fixed as notify   |    |
| topic   | true | string  | topic   |    |
| ts   | true | long  | server response timestamp   |    |
| uid   | true | string  | uid  |    |
| symbol   | true | string  | symbol   |  "BTC","ETH"...  |
| contract_code   | true | string  | contract code   |    |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume   | true | decimal  | place volume   |    |
| price   | true | decimal  | place price   |    |
| order_price_type   | true | string  | type of order price    | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok  |
| direction   | true | string  | direction  | "buy"/"sell"  |
| offset   | true | string  | offset  | "open"/"close" |
| status   | true | int  | order status  | 1. Placing orders to order book; 2 Placing orders to order book; 3. Placed to order book 4. Partially fulfilled; 5 partially fulfilled but cancelled by client; 6. Fully fulfilled; 7. Cancelled; 11Cancelling |
| lever_rate   | true | int  | leverage   |     |
| order_id   | true | bingint  | order ID   |    |
| order_id_str   | true | string  | order ID   |    |
| client_order_id   | true | long  | client order ID   |    |
| order_source   | true | string  | order source   | system、web、api、m、risk、settlement、ios、android、windows、mac、trigger |
| order_type   | true | int  | order type   | 1. Requested orders; 2. Cancelled orders; 3. Liquidated orders; 4. Delivered orders |
| created_at   | true | long  | created time   |    |
| trade_volume   | true | decimal  | trade total amount   |    |
| trade_turnover   | true | decimal  | trade amount   |    |
| fee   | true | decimal  | service fee  |    |
| trade_avg_price   | true | decimal  | trade average price   |    |
| margin_asset       | true   | string | margin asset                 |                |
| margin_frozen   | true | decimal  | frozen margin   |    |
| profit   | true | decimal  | profit   |    |
| liquidation_type   | true | decimal  | liquidation type 0: Non-liquidated,1: Long and short netting,2: Partial liquidated,3: Full liquidated   |    |
| canceled_at               | true     | long    | canceled time   |  |
| fee_asset               | true     | string    | fee asset          | “USDT” |
| \<trade\>   | true | object array |     |    |
| id   | true | string  | the global unique ID of the trade.    |    |
| trade_id | true | long  | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_cross_matchresults. trade_id is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.    |    |
| trade_volume   | true | decimal  | trade quantity    |    |
| trade_price   | true | decimal  | trade price    |    |
| trade_fee   | true | decimal  | trade fee    |    |
| trade_turnover   | true | decimal  | trade amount    |    |
| created_at   | true | long  | trade time   |    |
| role   | true | string  | taker/maker    |    |
| fee_asset   | true | string  | fee asset   |  “USDT”  |
| \</trade\>   |  |   |     |


## [Cross] Unsubscribe Order Data（unsub）

#### Remarks

 - The interface only supports cross margin mode.

To unsubscribe order data, the clients have to make connection to the server and send unsubscribe request in the format below: 

### Format of Unsubscribe order data

  `{`

  `"op": "unsub",`
  
  `"topic": "orders_cross.$contract_code", `
  
  `"cid": "id generated by client",`
  
  `}`

> Example of a successful unsubscribe request：

```json

{                                
  "op": "unsub",                   
  "topic": "orders_cross.BTC-USDT",       
  "cid": "40sG903yz80oDFWr"        
}                                  
```                                


### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; Unsubscribe Topic Name，format: orders_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub ) | Rule   |
| -------------- | --------------- | ------ |
| orders_cross.*       | orders_cross.*        | Allowed  |
| orders_cross.contract_code1| orders_cross.*        | Allowed|
| orders_cross.contract_code1 | orders_cross.contract_code2  | Allowed |
| orders_cross.contract_code1 | orders_cross.contract_code2  | Not Allowed |
| orders_cross.*       | orders_cross.contract_code1  | Not Allowed |


## [Isolated] Subscribe Match Order Data（sub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "matchOrders.btc-usdt"
}

```

### Format of subscribe match order data

| attr | type   | desc                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: matchOrders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

#### Note: 
- The order status of 'post_only' type pushed by ws is ethier '7:canceled' or '3:submitted'.
- The orders will be pushed when matched by matching engine.
- The delivery orders will not be pushed.
- The orders transfered from future or to future will not be pushed.
- The netting and forced liquidation orders will not be pushed.
- The orders will generally be pushed faster than the normal orders subscription.But It's not guranted.
- If there is an order with N trades,including 1 taker and N maker,it will push N+1 trades at most.

> Illustration on detailed data format of orders Notification

> response

```json

{
    "op":"notify",
    "topic":"matchOrders.btc-usdt",
    "ts":1600926986125,
    "symbol":"BTC",
    "contract_code":"BTC-USDT",
    "status":6,
    "order_id":758688290195656704,
    "order_id_str":"758688290195656704",
    "client_order_id":null,
    "order_type":1,
    "created_at":1600926984112,
    "trade":[
        {
            "trade_id":14470,
            "id":"14470-758688290195656704-1",
            "trade_volume":1,
            "trade_price":10329.11,
            "trade_turnover":103.2911,
            "created_at":1600926986046,
            "role":"taker"
        }
    ],
    "uid":"123456789",
    "volume":1,
    "trade_volume":1,
    "direction":"buy",
    "offset":"open",
    "lever_rate":5,
    "price":10329.11,
    "order_source":"web",
    "order_price_type":"opponent",
    "margin_mode": "isolated",
    "margin_account": "BTC-USDT"
}

```

### format of order data pushed

| Parameter Name	   | Mandatory | Type  | Desc   |  Value Range   |
| -------------- | ---- | ------- | -------------------------- |  ---- |
| op   | true | string  | notify   |   |
| topic   | true | string  | topic   |   |
| ts   | true | long  | server response timestamp    |   |
| uid   | true | string  | account uid  |    |
| symbol   | true | string  | symbol  |  "BTC","ETH"...  |
| contract_code   | true | string  | contract code  |   |
| status   | true | int  | 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; |    |
| order_id   | true | long  | order id |    |
| order_id_str   | true | string  |order id  |   |
| client_order_id               | true     | long    | client order id            |  |
| order_type   | true | int  | order_type  | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order   |
| trade_volume    | true     | decimal  |   trade volume    |                |
| volume         | true     | decimal  |      volume        |                |
| direction   | true | string  |  direction  |  "buy" : "sell"   |
| offset   | true | string  |  offset  |    "open" : "close" |
| lever_rate              | true | int     | lever rate        |                  |
| price            | true     | decimal      | price                                                     |                                                              |
| created_at       | true     | long         | created time                                                     |                                                              |
| order_source     | true     | string       | order source                                                     |                                                              |
| order_price_type | true     | string       | order price type     | "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok  |
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \<trade\>   | true | object array |     |    |
| id   | true | string  | the global unique id of the trade. |   |
| trade_id   | true | long  | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_matchresults. trade_id  is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.  |   |
| trade_price   | true | decimal  | trade price  |   |
| trade_volume   | true | decimal  | trade volume（cont）  |   |
| trade_turnover   | true | decimal  | trade turnover  |   |
| created_at   | true | long  | created time  |   |
| role   | true | string  | taker or maker  |   |
| \</trade\>   |  |  |     |    |

## [Isolated] Unsubscribe Match Order Data（unsub）

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "matchOrders.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}

```

### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; format: matchOrders.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| matchOrders.*       | matchOrders.*        | allowed   |
| matchOrders.contract_code1 | matchOrders.*        | Allowed   |
| matchOrders.contract_code1 | matchOrders.contract_code1  | allowed   |
| matchOrders.contract_code1 | matchOrders.contract_code2  | Not Allowed |
| matchOrders.*       | matchOrders.contract_code1  | Not Allowed |


## [Cross] Subscribe Match Order Data（sub）

#### Remarks

 - The interface only supports cross margin mode.

To subscribe order data, Clients have to make connection to the Server and send subscribe request in the format below:

### Subscribe Request Format

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "matchOrders_cross.$contract_code"`
  
  `}`
  
> Example of a successful ubscribe request：

```json

{                                    
  "op": "sub",                     
  "topic": "matchOrders_cross.BTC-USDT",      
  "cid": "40sG903yz80oDFWr"          
}                                    
``` 

### Format of subscribe match order data

| attr | type   | desc                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；format: matchOrders_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

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
    "topic":"matchOrders_cross.btc-usdt",
    "ts":1606981093177,
    "uid":"123456789",
    "symbol":"BTC",
    "contract_code":"BTC-USDT",
    "status":6,
    "order_id":784081061787873280,
    "order_id_str":"784081061787873280",
    "client_order_id":null,
    "order_type":1,
    "volume":1,
    "trade_volume":1,
    "created_at":1606981092647,
    "direction":"sell",
    "offset":"open",
    "lever_rate":100,
    "price":51179.1,
    "order_source":"web",
    "order_price_type":"opponent",
    "trade":[
        {
            "trade_id":33380,
            "id":"33380-784081061787873280-1",
            "trade_volume":1,
            "trade_price":51179.1,
            "trade_turnover":511.791,
            "created_at":1606981093104,
            "role":"taker"
        }
    ],
    "margin_mode":"cross",
    "margin_account":"USDT"
}

```

###  Pushed Data Parameter

| Parameter Name   | Mandatory | Type  | Desc   |  取值范围   |
| -------------- | ---- | ------- | -------------------------- |  ---- |
| op   | true | string  | operaton name, fixed as  notify;    |   |
| topic   | true | string  | topic   |   |
| ts   | true | long  | server response timestamp   |   |
| uid   | true | string  | uid  |    |
| symbol   | true | string  | symbol  |  "BTC","ETH"...  |
| contract_code   | true | string  | contract code  |   |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| status   | true | int  | 1. Ready to submit the orders; 2. Ready to submit the orders; 3. Have sumbmitted the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; 7. Orders cancelled; |    |
| order_id   | true | long  | order ID |    |
| order_id_str   | true | string  | order ID  |   |
| client_order_id               | true     | long    | client order ID             |  |
| order_type   | true | int  | order type | 1. Quotation; 2. Cancelled order; 3. Forced liquidation; 4. Delivery Order  |
| trade_volume    | true     | decimal  |   trade volume    |                |
| volume                  | true     | decimal  |      order volume        |                |
| direction   | true | string  | direction  | "buy"/"sell"  |
| offset   | true | string  | offset  |    "open"/"close" |
| lever_rate              | true | int     | leverage        |                  |
| price            | true     | decimal      | place price                                                     |                                                              |
| created_at       | true     | long         | created time                                                     |                                                              |
| order_source     | true     | string       | order source                                                     |                                                              |
| order_price_type | true     | string       | type of order price                                                 |  "limit":Limit,"opponent":opponent,"post_only":Post-Only Order, No order limit but position limit for post-only orders.，"lightning":lightning, "optimal_5":optimal 5，"optimal_10":optimal 10，"optimal_20":optimal 20，"fok":FOK Order，"ioc":IOC Order, "opponent_ioc": opponent ioc，"lightning_ioc": lightning ioc，"optimal_5_ioc": optimal_5 ioc，"optimal_10_ioc": optimal_10 ioc，"optimal_20_ioc"：optimal_20 ioc，"opponent_fok"： opponent fok，"lightning_fok"：lightning fok，"optimal_5_fok"：optimal_5 fok，"optimal_10_fok"：optimal_10 fok，"optimal_20_fok"：optimal_20 fok |
| \<trade\>   | true | object array |     |    |
| id   | true | string  | the global unique id of the trade  |   |
| trade_id   | true | long  | In this interface, trade_id is the same with match_id of linear-swap-api/v1/swap_cross_matchresults. trade_id is the result of sets of order execution and trade confirmation. NOTE: trade_id is not unique, which includes all trade records of a taker order and N maker orders. If the taker order matches with N maker orders, it will create N trades with same trade_id.  |   |
| trade_price   | true | decimal  | trade price  |   |
| trade_volume   | true | decimal  | trade volume  |   |
| trade_turnover   | true | decimal  | trade amount  |   |
| created_at   | true | long  | created time  |   |
| role   | true | string  | taker/maker  |   |
| \</trade\>   |  |  |     |    |


## [Cross] Unsubscribe Match Order Data（unsub）

#### Remarks

 - The interface only supports cross margin mode.

To unsubscribe order data, the clients have to make connection to the server and send unsubscribe request in the format below: 

### Format of Unsubscribe order data

  `{`
  
  `"op": "unsub",`
  
  `"topic": "matchOrders_cross.$contract_code",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> Example of a successful unsubscribe request：

```json
                                  
{                                    
  "op": "unsub",                     
  "topic": "matchOrders_cross.BTC-USDT",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### Format illustration of unsubscribe order data

| Filed  | Type   | Description                                              |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Optional; format: matchOrders_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)   | Unsubscribe( unsub) ) | Rule   |
| -------------- | --------------- | ------ |
| matchOrders_cross.*       | matchOrders_cross.*       | allowed   |
| matchOrders_cross.contract_code1 | matchOrders_cross.*        | allowed   |
| matchOrders_cross.contract_code1 | matchOrders_cross.contract_code1 | allowed   |
| matchOrders_cross.contract_code1 | matchOrders_cross.contract_code2  | Not Allowed |
| matchOrders_cross.*       | matchOrders_cross.contract_code1  | Not Allowed |


## [Isolated] Subscribe Account Equity Updates Data(sub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "accounts.BTC-USDT"
}

```

### Format illustration on request subscribe account equity updates data

| Field Name | Type   | Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，Subscribe value is sub             |
| cid      | string | Optional;  Client requests unique ID                  |
| topic    | string | Required； Subscribe Topic Name，Required subscribe accounts.$contract_code   Subscribe/unsubscribe the balance change of a given coin，when the value of $contract_code is “*”, it means to subscribe/unsubscribe the balance change of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Note:
 - A regular push of account is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.

> When there is any balance change, the Server will send a notification with the return parameter. For example:

```json

{
    "op":"notify",
    "topic":"accounts.btc-usdt",
    "ts":1603711370689,
    "event":"order.open",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "margin_balance":79.72434662,
            "margin_static":79.79484662,
            "margin_position":1.31303,
            "margin_frozen":4.0662,
            "margin_available":74.34511662,
            "profit_real":0.03405608,
            "profit_unreal":-0.0705,
            "withdraw_available":74.34511662,
            "risk_rate":14.745772976801512484,
            "liquidation_price":92163.420962779156327543,
            "lever_rate":10,
            "adjust_factor":0.075,
            "margin_asset":"USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
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
| event                     | string  | notification on account asset change such as commit order(order.open), fulfill order(order.match)(excluding liquidated order and settled orders), settlement and delivery(settlement), fulfill liquidation order(order.liquidation)(including voluntarily fulfilled liquidation order and the fulfilled liquidation order taken over by system ) , cancel order(order.cancel), asset transfer（contract.transfer) (ncluding transfer with exchange accounts, transfer between main account and sub-account, and tranfer between different margin accounts.), system (contract.system), other asset change(other), switch leverage(switch_lever_rate), initial margin(init)        |
| \<data\>            |   |                                                        |
| symbol                    | string    | Coins. "BTC","ETH"...                     |
| contract_code           | string  | Contract Code                                                       |
| margin_asset            | string  | margin asset                                                       |
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
| margin_mode              | string | margin mode   isolated : "isolated" |
| margin_account           | string | margin account   "BTC-USDT"... |
| \</data\>            |   |                                                        |


## [Isolated] Unsubscribe Account Equity Updates Data (ubsub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "accounts.BTC-USDT",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration on Unsubscribe Account Equity Updates

| Filed Name | Type | Description                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional; Client requests unique ID                          |
| topic    | string | Required;Required； Required； Subscribe Topic，Subscribe accounts.$contract_code required  unsubscribe/unsubscribe account equity change of a given coin，when the $contract_code value is *, it stands for subscribing/unsubscribing data of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |


### Rules on Subscribe and Unsubscribe

| Subscribe(sub)    | Unsubscribe(unsub) | Rule |
| -------------- | --------------- | ------ |
| accounts.*       | accounts.*        | Allowed  |
| accounts.contract_code1 | accounts.*        | Allowed |
| accounts.contract_code1 | accounts.contract_code1  | Allowed |
| accounts.contract_code1 | accounts.contract_code2  | Not Allowed |
| accounts.*       | accounts.contract_code1  | Not Allowed |


## [Cross] Subscribe Account Equity Updates Data（sub）

#### Remarks

 - The interface only supports cross margin mode.

To subscribe accounts equity data updates, the client has to make connection to the server and send subscribe request in the format below:

### Request Format for Subscribe Account Equity Updates Data

  `{`
  
  `"op": "sub",`
  
  `"topic": "accounts_cross.$margin_account",`
  
  `"cid": "id generated by client",`
  
  `}`


> Example of a successful subscribe request:                        
                                    
```json                             
                                    
{                                   
  "op": "sub",                      
  "cid": "40sG903yz80oDFWr",        
  "topic": "accounts_cross.USDT"       
}                                   
                                    
```                                 

#### Subscribe Request Parameter

| Field Name| Type   | Description                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | Mandatory；Operator Name，required subscribe value is sub             |
| cid      | string | Optional; Client requests unique ID                     |
| topic    | string | Mandatory；topic name: accounts_cross.$margin_account，$margin_account now only（USDT） |

### Note:

 - A regular push of account is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.

> When there is any balance change, the Server will send a notification with the return parameter. For example:

```json

{
    "op":"notify",
    "topic":"accounts_cross.usdt",
    "ts":1606878438415,
    "event":"order.liquidation",
    "data":[
        {
            "margin_mode":"cross",
            "margin_account":"USDT",
            "margin_asset":"USDT",
            "margin_balance":1591.122082549410817836,
            "margin_static":1591.122082549410817836,
            "margin_position":47.99916,
            "margin_frozen":0,
            "profit_real":-1866.704,
            "profit_unreal":0,
            "withdraw_available":1543.122922549410817836,
            "risk_rate":59.270830593679738555,
            "contract_detail":[
                {
                    "symbol":"BTC",
                    "contract_code":"BTC-USDT",
                    "margin_position":47.99916,
                    "margin_frozen":0,
                    "margin_available":1497.561881274705408918,
                    "profit_unreal":0,
                    "liquidation_price":42160.036464495601721318,
                    "lever_rate":100,
                    "adjust_factor":0.55
                }
            ]
        }
    ],
    "uid":"123456789"
}

```

#### Pushed Data Parameter

| Parameter Name   | Mandatory | Type  | Desc   | Data Value   |
| -------------- | ---- | ------- | -------------------------- |---- |
| op   | true | string  | operaton name, fixed as  notify;    |   |
| topic   | true | string  | topic   |   |
| ts   | true | long  | server response timestamp   |   |
| uid   | true | string  | uid  |    |
| event   | true | string  | event of margin account update |  order.open 、order.match)、settlement、order.liquidation、order.cancel)、contract.transfer、ontract.system、other)、init、napshot |
| \<data\>   | true | object array |     |   |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| margin_asset       | true   | string | margin asset                 |                |
| margin_balance       | true   | decimal | account equity                 |                |
| margin_static        | true   | decimal | static margin                 |                |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| profit_real          | true   | decimal | realized profits and losses                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| withdraw_available   | true   | decimal | available transfer amount               |                |
| risk_rate            | true   | decimal | margin rate                 |                |
| \<contract_detail\> |    true    |  object array       |                      |                |
| symbol     | true   | string  | symbol                 | "BTC","ETH"... |
| contract_code     | true   | string  | contract code                 |  "BTC-USDT" ... |
| margin_position      | true   | decimal | position margin (the margin used by current positions)	 |                |
| margin_frozen        | true   | decimal | frozen margin                |                |
| margin_available     | true   | decimal | available margin                |                |
| profit_unreal        | true   | decimal | unrealized profits and losses                |                |
| liquidation_price | true | decimal | estimated liquidation price         |                |
| lever_rate           | true   | decimal | leverage Rate                 |                |
| adjust_factor        | true   | decimal | adjustment factor                 |                |
| \</contract_detail\>            |        |         |                      |                |
| \</data\>   |  |   |     |   |


## [Cross] Unsubscribe Account Equity Updates Data（unsub）

#### Remarks

 - The interface only supports cross margin mode.

To unsubscribe account equity updates data, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Account Equity Updates Data

  `{`
  
  `"op": "unsub",`
  
  `"topic": "accounts_cross.$margin_account",`
  
  `"cid": "id generated by client",`
  
  `}`

> Example of a successful subscription request

```json
                               
{                                 
  "op": "unsub",                  
  "topic": "accounts_cross.USDT",    
  "cid": "40sG903yz80oDFWr"       
}   
                                 
```  
                             
#### Unsubscribe Request Parameter

| Field Name| Type   | Description                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | Mandatory;Operator Name，required subscribe value is unsub                 |
| cid      | string | Optional; Client requests unique ID                            |
| topic    | string | Mandatory;topic name: accounts_cross.$margin_account，$margin_account now only（USDT） |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)    | Unsubscribe(unsub) | Rule |
| -------------- | --------------- | ------ |
| accounts_cross.*       | accounts_cross.*        | Allowed   |
| accounts_cross.margin_account1 | accounts_cross.*        | Allowed   |
| accounts_cross.margin_account1 | accounts_cross.margin_account1  | Allowed   |
| accounts_cross.margin_account1 | accounts_cross.margin_account2  | Not Allowed |
| accounts_cross.*       | accounts_cross.margin_account1  | Not Allowed |


## [Isolated] Subscribe Position Updates(sub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "positions.BTC-USDT"
}

```

### Format Illustration of Subscribe Position Updates

| Filed Name |Type   | Description                                       |
| ------- | :----- | :------------------------------------------ |
| op       | string | Required；Operator Name，Subscribe value is sub             |
| cid      | string | Optional ; Client requests unique ID                 |
| topic    | string | Required； Subscribe Topic, Subscribe (positions.$contract_code) Required  Subscribe/unsubscribe the position data of a single coin, when the $contract_code value is *, it stands for subscribing the data of all coins. contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |


> When there is any position update, the server will send notification with return parameter. For example:

```json


{
    "op":"notify",
    "topic":"positions",
    "ts":1603711371803,
    "event":"snapshot",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "volume":1,
            "available":0,
            "frozen":1,
            "cost_open":13059.8,
            "cost_hold":13059.8,
            "profit_unreal":-0.0705,
            "profit_rate":-0.05398244996094886,
            "profit":-0.0705,
            "position_margin":1.31303,
            "lever_rate":10,
            "direction":"sell",
            "last_price":13130.3,
            "margin_asset":"USDT",
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
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
| event                  | string  | Related events of position change notification, such as order creation and position closing (order.close), order filled (order.match) (except for liquidation, settlement and delivery), settlement and delivery (settlement), order liquidation (order.liquidation), order cancellation (order.cancel), switch leverage(switch_lever_rate),  initial positions (init), triggered by system periodic push (snapshot).     |
| \<data\>            |   |                                                        |
| symbol                 | string    | Coin. "BTC","ETH"...                     |
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
| margin_asset              | string    | Margin Asset                                                    |
| margin_mode        | string | margin mode    isolated : "isolated" |
| margin_account     | string | margin account   "BTC-USDT"... |
| \</data\>            |   |                                                        |

### Note:

 - A regular push of position is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.
 
 - When switching leverage with no positions, the event "switch_lever_rate" will not be pushed by the position topic.


## [Isolated] Unsubscribe Position Updates Data(unsub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "positions.BTC-USDT",
  "cid": "40sG903yz80oDFWr"
}

```

### Format Illustration of Unsubscribe Position Updates

| Field Name | Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Required;Required；Required；Subscribe topic，Subscribe positions.$contract_code required  Subscribe or unsubscribe the position updates of a single coin; when $contract_code value is *, it stands for subscribing the data of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)      | Unsubscribe(ubsub) |  Rule |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | Allowed  |
| positions.contract_code1 | positions.*        | Allowed |
| positions.contract_code1 | positions.contract_code1  |  Allowed |
| positions.contract_code1 | positions.contract_code2  | Not Allowed |
| positions.*       | positions.symbol1  | Not Allowed |


## [Cross] Subscribe Position Updates（sub）

#### Remarks

 - The interface only supports cross margin mode.

To subscribe position updates data, the client has to make connection to the server and send subscribe request in the format below:

### Subscribe Request Format

  `{`
  
  `"op": "sub",`
  
  `"topic": "positions_cross.$contract_code",`
  
  `"cid": "topic to sub"`
  
  `}`

> Example of a successful subscribe request:

```json
                               
{                                 
  "op": "sub",                    
  "cid": "40sG903yz80oDFWr",      
  "topic": "positions_cross.BTC-USDT"    
}
                                 
```                               

### Format Illustration of Subscribe Position Updates

| Filed Name |Type   | Description                                       |
| ------- | :----- | :------------------------------------------ |
| op       | string | Required；Operator Name，Subscribe value is sub             |
| cid      | string | Optional ; Client requests unique ID                 |
| topic    | string | Required； Subscribe Topic, Subscribe (positions_cross.$contract_code) Required  Subscribe/unsubscribe the position data of a single coin, when the $contract_code value is *, it stands for subscribing the data of all coins. contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

> When there is any position update, the server will send notification with return parameter. For example:

```json

{
    "op":"notify",
    "topic":"positions_cross.btc-usdt",
    "ts":1606878438415,
    "event":"order.liquidation",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "volume":18,
            "available":18,
            "frozen":0,
            "cost_open":19361.088515384615384611,
            "cost_hold":26666.2,
            "profit_unreal":0,
            "profit_rate":-37.7308924485864104,
            "profit":-1314.92006723076923077,
            "margin_asset":"USDT",
            "position_margin":47.99916,
            "lever_rate":100,
            "direction":"sell",
            "last_price":26666.2,
            "margin_mode":"cross",
            "margin_account":"USDT"
        }
    ],
    "uid":"123456789"
}

```


 
### Pushed Data Parameter

| Parameter Name   | Mandatory | Type  | Desc   | Data Value   |
| -------------- | ---- | ------- | -------------------------- | ----- |
| op   | true | string  | operaton name, fixed as  notify;    |    |
| topic   | true | string  | topic   |    |
| ts   | true | long  | server response timestamp   |    |
| uid   | true | string  | uid  |    |
| event   | true | string  | event | order.close 、order.match、settlement、order.liquidation、order.cancel、init、snapshot   |
| \<data\>   | true | object array |     |    |
| symbol   | true | string  | symbol    | "BTC","ETH"...   |
| contract_code   | true | string  | contract code  |    |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| volume   | true | decimal  | position quantity  |    |
| available   | true | decimal  | positions available to close  |    |
| frozen   | true | decimal  |  positions frozen |    |
| cost_open   | true | decimal  | opening average price  |    |
| cost_hold   | true | decimal  | average price of position  |    |
| profit_unreal   | true | decimal  | unrealized profits and losses  |    |
| profit_rate   | true | decimal  | profit rate  |    |
| profit   | true | decimal  | profit  |    |
| margin_asset       | true   | string | margin asset                 |                |
| position_margin   | true | decimal  | position margin  |    |
| lever_rate   | true | int  | leverage  |    |
| direction   | true | string  | Transaction direction|   "buy"/"sell"    |
| last_price   | true | decimal  | latest trade price  |    |
| \</data\>   |  |   |     |    |


### Note:

 - A regular push of position is performed every 5 sedconds.The event field of the reponse is "snapshot".If there is a push in 5 seconds, snapshot push will be skipped.

 - When switching leverage with no positions, the event "switch_lever_rate" will not be pushed by the position topic.


## [Cross] Unsubscribe Position Updates Data（unsub）

#### Remarks

 - The interface only supports cross margin mode.

To unsubscribe, the client has to make connection to the server and send unsubscribe request in the format below:

### Request Format of Unsubscribe Position Updates

  `{`
  
  `"op": "unsub",`
  
  `"topic": "positions_cross.$contract_code",`
  
  `"cid": "id generated by client", `
  
  `} `

> Example of a successful unsubscribe request:

```json
                                 
{                                    
  "op": "unsub",                     
  "topic": "positions_cross.BTC-USDT",      
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  

### Format Illustration of Unsubscribe Position Updates

| Field Name | Type   | Description                                              |
| ------- | ------- | ------------------------------------------------- |
| op       | string | Required; Operator Name，Subscribe value is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                        |
| topic    | string | Required;Required；Required；Subscribe topic，Subscribe positions_cross.$contract_code required  Subscribe or unsubscribe the position updates of a single coin; when $contract_code value is *, it stands for subscribing the data of all coins; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)      | Unsubscribe(ubsub) |  Rule |
| -------------- | --------------- | ------ |
| positions_cross.*       | positions_cross.*        | Allowed  |
| positions_cross.contract_code1 | positions_cross.*        | Allowed |
| positions_cross.contract_code1 | positions_cross.contract_code1  |  Allowed |
| positions_cross.contract_code1 | positions_cross.contract_code2  | Not Allowed |
| positions_cross.*       | positions_cross.contract_code1  | Not Allowed |


## [General] Subscribe Liquidation Orders (no authentication) (sub)

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.


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
  "topic": "public.BTC-USDT.liquidation_orders"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.liquidation_orders. contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |

> When there commences any liquidation order, the server will send notification with return parameter. For example：

```json

{
    "op":"notify",
    "topic":"public.BTC-USDT.liquidation_orders",
    "ts":1580815422403,
    "data":[
        {
            "contract_code": "BTC-USDT",
            "symbol": "BTC",
            "direction": "sell",
            "offset": "close",
            "volume": 624,
            "price": 16701.4,
            "created_at": 1606380004694,
            "amount": 0.624,
            "trade_turnover": 10421.6736
        }
    ]
}

```

### Return Parameter

| Field Name               | Type    | Description                                                        |
| ----------------------- | ------- | ------------------------------------------------------- |
| op   | string  | value: 'notify';    |   |
| topic   | string  | topic subscribed   |   |
| ts                 | long    | Time of Respond Generation，Unit：Millisecond 	                                             |
| \<data\> | object array |  | |
| symbol          | string  | symbol                                                      |
|  contract_code      |  string  |   swap code    E.G.: "BTC-USDT" |
| direction                 | string  | Long or short                                                     |
| offset              | string | Open or close                                                     |
| volume                 | decimal | liquidation volume (Cont.)                                                      |
| amount                 | decimal | liquidation amount (token)                                                   |
| trade_turnover                 | decimal |liquidation amount (quotation token)                                                     |
| price              | decimal  | bankruptcy price             |
| created_at              | long  | Order Creation Time                                          |
| \</data\> | object array |  | |



## [General] Unsubscribe Liquidation Order Data (unsub)

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
  "topic": "public.BTC-USDT.liquidation_orders”",
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


## [General] Subscribe funding rate (no authentication)（sub）

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

To subscribe funding rate data, the client has to make connection to the server and send subscribe request in the format below:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "public.$contract_code.funding_rate"`
  
  `}`


> Request

```json

{
  "op": "sub",
  "topic": "public.BTC-USDT.funding_rate",
  "cid": "40sG903yz80oDFWr"
}

```

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.funding_rate.; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |

> Response example when funding_rate is updated:

```json

{
    "op":"notify",
    "topic":"public.BTC-USDT.funding_rate",
    "ts":1603778748166,
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "fee_asset":"USDT",
            "funding_time":"1603778700000",
            "funding_rate":"-0.000220068774978695",
            "estimated_rate":"-0.000684397270167616",
            "settlement_time":"1603785600000"
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
| contract_code  | string   |  contract_code,"BTC-USDT"  |
| fee_asset | string | fee asset,"USDT"... |
| funding_time | string | current funding time |
| funding_rate | string | current funding rate |
| estimated_rate | string | estimated funding rate of next period |
| settlement_time | string |  settlement timestamp.eg:"1490759594752"  |
| \</data\>   |  |     |    |


## [General] Unsubscribe Funding Rate Data(no authentication)(unsub)

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
  "topic": "public.BTC-USDT.funding_rate",   
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


## [General] Subscribe Contract Info (no authentication)（sub）

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

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
  "topic": "public.btc-usdt.contract_info",   
  "cid": "40sG903yz80oDFWr"          
}                                    
``` 

### Data format illustration of orders subscription

|Field Name | Type  |Description                                       |
| ------- | ----- | ------------------------------------------ |
| op       | string | Required； Operator Name，required subscribe value is  sub             |
| cid      | string | Optional; ID Client requests unique ID                    |
| topic    | string | Required；Topic name format: public.$contract_code.contract_info.; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT"  |


###  Response example：

```json

{
    "op":"notify",
    "topic":"public.BTC-USDT.contract_info",
    "ts":1603778748167,
    "event":"init",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT",
            "contract_size":0.001,
            "price_tick":0.1,
            "settlement_date":"1603785600000",
            "create_date":"20201021",
            "contract_status":1,
            "support_margin_mode": "all"
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
| event   | string  | event： "init", "update", "snapshot"  |
| \<data\>   | object array |     |    |
| symbol |string | symbol,"BTC","ETH"... |
| contract_code  | string   |  contract_code,"BTC-USDT"  |
| contract_size  | decimal | Contract Value (USDT of one contract). such as 10,100| 10, 100... |
| price_tick  | decimal | Minimum Variation of Contract Price | 0.001, 0.01... |
| settlement_date  |  string  | settlement date：such as "1490759594752"  |
| create_date   |  string  | Contract Listing Date ：such as "20180706" |
| contract_status      |  int     | contract status ： 0: Delisting,1: Listing,2: Pending Listing,3: Suspension,4: Suspending of Listing,5: In Settlement,6: Delivering,7: Settlement Completed,8: Delivered |
| support_margin_mode   | string      | support margin mode   cross："cross"；isolated："isolated"；all："all"|
| \</data\>   | object array |     |    |


### Note：

- The websocket subscription of contract info event is pushed every 60 seconds, and the event is "snapshot". 
- When the subscription is successful, the latest contract information will be pushed immediately, and the event is "init".
- After the subscription is successful, when the contract information changes, the latest contract information will be pushed. When multiple fields changes simultaneously, only the latest contract information will be pushed, and the event is update.
- When the contract status is "delivery completed", the next settlement time of the contract is an empty string.
- Only when the status is 1(Listing),  can it be traded normally, other statuses are not tradable;

## [General] Unsubscribe Contract Info Data(no authentication)(unsub)

#### Remarks

 - The interface supports cross margin mode and isolated margin mode.

To unsubscribe contract info data, the client has to make connection to the server and send subscribe request in the format below:

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
  "topic": "public.BTC-USDT.contract_info",   
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


## [Isolated] Subscribe trigger orders updates(sub)

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "trigger_order.BTC-USDT",
  "cid": "40sG903yz80oDFWr"
}

```

### Request Parameter

| Parameter Name    | Mandotary | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | Required； Operator Name，required subscribe value is  sub	 |  |
| cid | false| string | Optional; ID Client requests unique ID	 | |
| topic | true| string | Required；format: trigger_order.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" | |

> **Return example**:

```json

{
    "op":"notify",
    "topic":"trigger_order.btc-usdt",
    "ts":1603778055069,
    "event":"order",
    "uid":"123456789",
    "data":[
        {
            "symbol":"BTC-USDT",
            "contract_code":"BTC-USDT",
            "trigger_type":"ge",
            "volume":1,
            "order_type":1,
            "direction":"sell",
            "offset":"open",
            "lever_rate":10,
            "order_id":5,
            "order_id_str":"5",
            "relation_order_id":"-1",
            "order_price_type":"limit",
            "status":2,
            "order_source":"web",
            "trigger_price":15000,
            "triggered_price":null,
            "order_price":15000,
            "created_at":1603778055064,
            "triggered_at":0,
            "order_insert_at":0,
            "canceled_at":0,
            "fail_code":null,
            "fail_reason":null,
            "margin_mode": "isolated",
            "margin_account": "BTC-USDT"
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
| contract_code          | true | string  | contract code                | "BTC-USDT" ...                          |
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
| margin_mode    |   true   | string | margin mode  | isolated : "isolated" |
| margin_account    |   true   | string | margin account  | "BTC-USDT"... |
| \</data\>   |      |         |        |       |

#### Rules:

- The intermediate states processed by the order status system will not be pushed, such as in the progress of placing an order, The descriptions of specific event notifications are as below: 
   -  when the order status is 2（Submitted），event notification is order（trigger order placed successfully）；
   -  when the order status is 4（Order placed successfully），event notification is trigger_success（trigger order triggered successfully）；
   -  when the order status is 6（Canceled），event notification is cancel（trigger order canceled successfully）；
   -  when the order status is 5（Order failed to be placed），event notification is trigger_fail（trigger order failed to be triggered）；
- Single coin cannot be re-suscribed, and all coins subscription can cover single coin subscription; single coin cannot be subscribed after subscribing all coins. 


## [Isolated] Unsubscribe trigger orders updates（unsub）

#### Remarks

 - This interface only supports isolated margin mode.

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
  "topic": "trigger_order.BTC-USDT",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### Format illustration of unsubscribe order data

| Filed | Type   | Description                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                           |
| topic    | string | Optional; Unsubscribe Topic Name，format: trigger_order.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)     | Unsubscribe( unsub) | Rule   |
| -------------- | --------------- | ------ |
| trigger_order.*       | trigger_order.*      | Allowed   |
| trigger_order.contract_code1 | trigger_order.*       | Allowed   |
| trigger_order.contract_code1 | trigger_order.contract_code1 | Allowed   |
| trigger_order.contract_code1 | trigger_order.contract_code2  | Not Allowed |
| trigger_order.*       | trigger_order.contract_code1  | Not Allowed |


## [Cross] Subscribe trigger orders updates(sub)

#### Remarks

 - The interface only supports cross margin mode.

### To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

  `{`
  
  `"op": "sub",`
  
  `"cid": "id generated by client",`
  
  `"topic": "trigger_order_cross.$contract_code"`
  
  `}`
  
> Example of a successful return data:

```json

{
  "op": "sub",
  "topic": "trigger_order_cross.BTC-USDT",
  "cid": "40sG903yz80oDFWr"
}

```

### Request Parameter

| Parameter Name    | Mandotary | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | Required； Operator Name，required subscribe value is  sub	 |  |
| cid | false| string | Optional; ID Client requests unique ID	 | |
| topic | true| string | Required；format: trigger_order_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" | |

> **Return example**:

```json

{
    "op":"notify",
    "topic":"trigger_order_cross.btc-usdt",
    "ts":1603778055069,
    "event":"order",
    "uid":"123456789",
    "data":[
        {
            "symbol":"BTC-USDT",
            "contract_code":"BTC-USDT",
            "trigger_type":"ge",
            "volume":1,
            "order_type":1,
            "direction":"sell",
            "offset":"open",
            "lever_rate":10,
            "order_id":5,
            "order_id_str":"5",
            "relation_order_id":"-1",
            "order_price_type":"limit",
            "status":2,
            "order_source":"web",
            "trigger_price":15000,
            "triggered_price":null,
            "order_price":15000,
            "created_at":1603778055064,
            "triggered_at":0,
            "order_insert_at":0,
            "canceled_at":0,
            "fail_code":null,
            "fail_reason":null
        }
    ]
}
```

###  Pushed Data Parameter

| Parameter Name   |   Mandatory  |   Type   |   Desc   |   Data Value    |
| -------- | -------- | -------- |  --------------------------------------- | -------------- |
| op | true |  string | operaton name, fixed as  notify | |
| topic | true |  string | topic | |
| ts     | true | long    | Time of Respond Generation, Unit: Millisecond    |     |
| uid     | true | string    | uid    |     |
| event | true  | string | event |   order，cancel，trigger_success，trigger_fail  |
| \<data\> |   true   |  object array   |   |   |
| symbol                 | true | string  | symbol               |                                          |
| contract_code          | true | string  | contract code               | "BTC-USDT" ...                          |
| margin_mode | true | string | margin mode  | cross: cross margin mode  |
| margin_account | true | string | margin account  | "USDT"... |
| trigger_type              | true | string  | trigger type： ge great than or equal to；le less than or equal to  |              |
| volume                 | true | decimal  | place volume |      |
| order_type           | true | int | order type             |  1. Place orders     |
| direction            | true | string | direction               | "buy"/"sell" |
| offset         | true | string | "open", "close"             | "open"/"close" |
| lever_rate            | true | int    | leverage              |                         |
| order_id      | true | decimal | order ID                |                                          |
| order_id_str             | true | string | order ID              |                                          |
| relation_order_id             | true | string | Relation order ID is the string related to the limit orders, The value is -1 before the trigger orders executed.  |         |
| order_price_type        | true  | string | type of order price | "limit"，"optimal_5"，"optimal_10"，"optimal_20"    |
| status        | true  | int | order status | 2. Ready to submit the orders; 4. Orders partially matched; 5. Orders cancelled with partially matched; 6. Orders fully matched; |
| order_source      | true | string  | order source         |                                          |
| trigger_price         | true | decimal  | trigger price       |       |
| triggered_price         | true | decimal  | triggered price       |       |
| order_price           | true | decimal  | order price   |                                          |
| created_at        | true  | long | created time |                      |
| triggered_at        | true  | long | triggered time |                      |
| order_insert_at        | true  | long | insert time |                      |
| canceled_at        | true  | long | canceled time |                      |
| fail_code        | true  | int | fail code |                      |
| fail_reason        | true  | string | fail reason |                      |
| \</data\>   |      |         |        |       |

#### Rules:

- The intermediate states processed by the order status system will not be pushed, such as in the progress of placing an order, The descriptions of specific event notifications are as below: 
   -  when the order status is 2（Submitted），event notification is order（trigger order placed successfully）；
   -  when the order status is 4（Order placed successfully），event notification is trigger_success（trigger order triggered successfully）；
   -  when the order status is 6（Canceled），event notification is cancel（trigger order canceled successfully）；
   -  when the order status is 5（Order failed to be placed），event notification is trigger_fail（trigger order failed to be triggered）；
- Single coin cannot be re-suscribed, and all coins subscription can cover single coin subscription; single coin cannot be subscribed after subscribing all coins. 


## [Cross] Unsubscribe trigger orders updates（unsub）

#### Remarks

 - The interface only supports cross margin mode.

To subscribe basis data, the Client has to make connection to the Server and send subscribe request in the format below:

### Format of Unsubscribe order data

  `{`
  
  `"op": "unsub",`
  
  `"topic": "trigger_order_cross.$contract_code",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> Example of a successful unsubscribe request:

```json
                                  
{                                    
  "op": "unsub",                     
  "topic": "trigger_order_cross.BTC-USDT",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### Format illustration of unsubscribe order data

| Filed | Type   | Description                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | Required;Operator Name，value for unsubscribe is unsub;                 |
| cid      | string | Optional;  Client requests unique ID                           |
| topic    | string | Optional; Unsubscribe Topic Name，format: trigger_order_cross.$contract_code; contract_code is case-insenstive.Both uppercase and lowercase are supported.e.g. "BTC-USDT" |

### Rules on Subscribe and Unsubscribe

| Subscribe(sub)     | Unsubscribe( unsub) | Rule   |
| -------------- | --------------- | ------ |
| trigger_order_cross.*       | trigger_order_cross.*      | Allowed   |
| trigger_order_cross.contract_code1 | trigger_order_cross.*       | Allowed   |
| trigger_order_cross.contract_code1 | trigger_order_cross.contract_code1 | Allowed   |
| trigger_order_cross.contract_code1 | trigger_order_cross.contract_code2  |  Not Allowed |
| trigger_order_cross.*       | trigger_order_cross.contract_code1  |  Not Allowed |



# WebSocket interface for system status updates 

 - The websocket url of system status updates is : wss://api.hbdm.com/center-notification

##  [General]Subscribe system status updates 

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
	"topic ": "public.linear-swap.heartbeat"
}
```

### **Request Parameter**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | The fixed value of subscription is sub	 |  |
| cid | false| string | Client requests a unique ID	 | |
| topic | true| string | Subscription topic name is required (public.$service.heartbeat), Subscribe system status information of a certain business | |

### **subscription parameter description**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| service | true | string |Business Code	 | linear-swap : USDT Margined Swap |


> **Return Parameter Example**:

```json

{
    "op": "notify",
    "topic": "public.linear-swap.heartbeat",
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
| \<data\> |  |  |  | |
| heartbeat | true | int | System Status	 |  1 is available, 0 is not available(maintenance with service suspended) |
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
