---
title: Huobi Permanent Contract API Reference v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Introduction

## API Introduction

Welcome to the Huobi Perpetual Swap Contract API! You can use the API to access all market data, trading, and account management endpoints.

We have code example in Shell! You can view code examples in the dark area to the right.

You can use the drop down list above to change the API version. You can also use the language option at the top right to switch documentation language.

# Change Log

| Effective Time（Beijing Time UTC+8) | Interface | New / Update | Summary |
|-----|-----|-----|-----|
|2019.11.25 19:00| ||Initial draft|



# API Access

## Access URLs

**REST API**

**`https://api.huobi.pro`**
or
**`https://api-aws.huobi.pro`**

<aside class="notice">
Please initiate API calls with non-China IP.
</aside>

<aside class="notice">
It is not recommended to use proxy to access Huobi API because it will introduce high latency and low stability.
</aside>

<aside class="notice">In this document, only the fields under "data" will be explained and shown in query example.</aside>
## Endpoint Rate Limit

Each API Key can send maximum of 100 https requests within 10 seconds. Please contact customer support if you believe you need higher limit rate.

## Authentication

To protect API communication from unauthorized change, all non-public API calls are required to be signed.

### Create API Key

To be able to create signature you should first acquire an API key and the corresponding secret key. You can manage you API keys by login to your account at huobi.com and go to "API Management" under "Account" section. On June 5th, 2019, Huobi introduced API Key permission management, allow user to assign 3 permissions to each of their API Keys: Read-only, Withdraw, and Trade. Please check each endpoint below for its permission type. Only the API Key with proper permission could access the respective endpoints requiring authentication.

<aside class="notice">You can bind an API key with an IP to prevent the key from expiring, otherwise a key will expire in 90 days</aside>
<aside class="warning">You should never disclose your key to others</aside>
### Signature Method

To sign a call, you need to a few key components of the call to generate a query string, and then a hash is generated with this string, finally the hash is added to the call.

In order to successfully sign a request, you need to follow below steps

1. Generate the "Query String" for your query

2. Use "Query String" and your secret key to to created a signature

3. Add the signature as a path parameter to your query

### Generate the "Query String" for your query

> Add the query path section of the query string

```shell
[HTTP Method]\n[URL Root]\n[Query Path]\n
```

> For example below

```shell
GET\napi.huobi.pro\n/v1/order/orders\n
```

> Add the authentication section of the query string

```shell
AccessKeyId=[Your API key]&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=[Your Request Timestamp]
```

> For example below

```shell
AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30
```

> Add the parameter section of the query string, for example

```shell
&order-id=1234567890
```

> The final query string will be this

```shell
GET\napi.huobi.pro\n/v1/order/orders\nAccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890
```

1. Add the query path to the query string

2. Add mandatory authentication parameters to the query string

3. Add other path parameters to the query string ordered by parameter name (asc)

<aside class="notice">
The timestamp should be in YYYY-MM-DDThh:mm:ss format with URL encoding.
</aside>

### Use "Query String" and your secret key to to created a signature

> The result signature will look like

```shell
4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=
```

1. Apply HmacSHA256 hash function with inputs (query string, secret key) to get the hashed string

2. Encode the hashed string with base-64

### Add the signature as a path parameter to your query

> The final request with signature will look like

```shell
https://api.huobi.pro/v1/order/orders?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

```

1. Add all mandatory authentication parameters to your path parameter

2. Add "&Signature=[Your request signature with URL encode]" to your path parameter

## Request Format

All API requests are in either GET or POST method. For GET request, all parameters are path parameters. For POST request, all parameters are in POST body and in JSON format.

## Response Format

All response will be returned in JSON format. The top level JSON is a wrapper object which provides three metadata in "status", "ch", and "ts". The actual per API response data is in "data" field.

### Response JSON Wrapper Content

> Response wrapper content example:

```json
{
  "status": "ok",
  "ch": "market.btcusdt.kline.1day",
  "ts": 1499223904680,
  "data": // per API response data in nested JSON object
}
```

Field     | Data Type | Description
--------- | --------- | -----------
status    | string    | The overall API call result status
ch        | string    | The data channel this response was originated from. Some API return does not have this field.
ts        | int       | The timestamp in milliseconds for when the response is created
data      | object    | The actual response content per API

# Rest Interface


|	Category	|	Feature	|	Path	|	API Permission	|
|--------- | --------- | -----------|-----------|
|	Orders and Trades (Private API)	|	Place an order	|	POST /orders	|	Trade	|
|		|	Cancel orders	|	DELETE /orders	|	Trade	|
|		|	Query a specific order	|	GET /orders/detail	|	Trade	|
|		|	Query open orders	|	GET /orders/open-orders	|	Read	|
|		|	Query closed orders	|	GET /orders/history	|	Read	|
|		|	Query historical trades	|	GET /orders/trades	|	Read	|
| Position (Private API) |	Query position	|	GET /positions	|	Read	|
|		|	Adjust position	|	POST /positions/setting	|	Trade	|
|		|	Margin transfer	|	POST /positions/margin	|	Trade	|
|	Account (Private API)	|	Query account balance	|	GET /account/balance	|	Read	|
| Market Data (Public API) |	Query candlesticks	|	GET /market/candlesticks	|	-	|
|		|	Query MBP	|	GET /market/mbp	|	-	|
|		|	Query market trades	|	GET /market/trades	|	-	|
|		|	Query market picture	|	GET /market/summary	|	-	|
|	Benchmark (Public API)	|	Query historical funding rate	|	GET /market/funding-rate	|	-	|
|		|	Query indicative funding rate	|	GET /market/indicative-funding-rate	|	-	|
|		|	Query index constituents and weights (dynamic)	|	GET /market/index-constituents	|	-	|
|	Reference(Public API)	|	Query perpetual swap contract	|	GET /reference/instruments	|	-	|


# WebSocket Interface

|  Category  | Feature |  Topic  |  API permission  |
| ---- | ---- | ---- | ---- |
| Orders (Private API) | Subscribe order's update - Creation | orders#${symbol} | Read |
|		|	Subscribe order's update - Trigger	|	orders#${symbol}	|	Read	|
|		|	Subscribe order's update - Trade	|	orders#${symbol}	|	Read	|
|		|	Subscribe order's update - Cancellation	|	orders#${symbol}	|	Read	|
|	Position (Private API)	|	Subscribe position's update	|	positions#${symbol}	|	Read	|
|	Account (Private API) |	Subscribe account's update	|	accounts#${currency}	|	Read	|
|	Market Data (Public API)	|	Subscribe/acquire candlesticks	|	candlestick#${symbol}@${interval}	|	-	|
|		|	Subscribe/acquire MBP	|	mbp#${symbol}@${levels}	|	-	|
|		|	Subscribe/acquire market trades	|	trades#${symbol}	|	-	|
|		|	Subscribe market picture	|	summary#${symbol}	|	-	|
|	Benchmark (Public API) |	Subscribe indicative funding rate	|	ind.funding.rate#${symbol}	|	-	|
|		|	Subscribe index constituents and weights	|	index.cons#${symbol}	|	-	|

# Rest Interface - Orders and Trades (Private API)

## Place an order

- POST ` /orders`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | ---- | ---- | ---- | ---- | ---- |
| symbol | string | TRUE | Trading symbol |      |      |
| orderPrice |string| TRUE |Order price (Inapplicable for market order & stop order)|      |      |
| orderSide | string | TRUE | Order side | buy,sell |      |
| orderSize | long | TRUE | Order size (number of contracts) |      |      |
|	timeInForce	|	string	|	FALSE	|	Time in force	|	gtc,ioc	|	gtc	|
|	orderType	|	string	|	TRUE	|	Order type	|	limit,stop-limit	|		|
|	stopPrice	|	string	|	FALSE	|	Trigger price (applicable only for stop/stop-limit order)	|		|		|
|	stopBy	|	string	|	FALSE	|	Triggered by (applicable only for stop/stop-limit order)	|	last-trade-price,mark-price,index-price	|	last-trade-price	|

> Responds:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns)	|		|
|	data	|	object	|	TRUE	|		|		|
|	{ orderId }	|	long	|	TRUE	|	Order ID	|		|

## Cancel orders

- DELETE ` /orders`

```json

```

### Request parameters

|Field Name	|Data Type| Mandatory |Description|Enumerated Value|Default Value|
| ---- | -------- | -------- | ---- | ---- |------|
|orderIds|	string[]	|TRUE	|Order ID list (Maximum 50 orders are allowed in a request.)|		||

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { accepted	|	string[]	|	TRUE	|	Accepted order list (orderId list, in ascending order of the request.)	|		|
|	      rejected }	|	string[]	|	TRUE	|	Rejected order list (orderId list, in ascending order of the request.)	|		|

<aside class="warning">已接受撤单请求不意味着撤单成功，用户应订阅订单更新或查询订单状态以确认撤单成功。</aside>
## Query a specific order

- GET ` /orders/detail`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|orderId|	long|	TRUE| Order ID |||

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { orderId	|	long	|	TRUE	|	Order ID	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      orderPrice	|	string	|	FALSE	|	Order price (inapplicable for market order & stop order.)	|		|
|	      orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	Order size	|		|
|	      orderType	|	string	|	TRUE	|	Order type	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	Trigger price (applicable only for stop/stop-limit order.)	|		|
|	      stopBy	|	string	|	FALSE	|	Triggered by (applicable only for stop/stop-limit order.)	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	Order status	|	created,submitted,partial-filled,filled,partial-canceled,canceled,rejected	|
|	      cancelInitiator	|	string	|	FALSE	|	Initiator of the cancellation (only applicable if orderStatus = partial-canceled or canceled）	|	user,exchange	|
|	      timeInForce	|	string	|	FALSE	|	Time in force	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	Order creation time	|		|
|	      triggerTime	|	long	|	FALSE	|	Trigger time (applicable only for stop/stop-limit order.)	|		|
|	      lastActTime	|	long	|	TRUE	|	Latest update time of the order	|		|
|	      execAmt	|	long	|	TRUE	|	Executed amount of the order	|		|
|	      remainAmt	|	long	|	TRUE	|	Remaining amount of the order	|		|
|	      avgExecPrc }	|	string	|	TRUE	|	Average execution price of the order	|		|

## Query open orders

- GET ` /orders/open-orders`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	Trading symbol	|		|	all	|
|	orderSide	|	string	|	FALSE	|	Order side	|	buy,sell	|	all	|
|	orderTypes	|	string	|	FALSE	|	Order types (multiple input allowed, separated by comma)	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by orderCreateTime	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	100	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descending order of orderCreateTime	|		|
|	     { orderId	|	long	|	TRUE	|	Order ID	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      orderPrice	|	string	|	FALSE	|	Order price (inapplicable for market order and stop order.)	|		|
|	      orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	Order size	|		|
|	      orderType	|	string	|	TRUE	|	Order status	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	Trigger price (applicable only for stop/stop-limit order.)	|		|
|	      stopBy	|	string	|	FALSE	|	Triggered by (applicable only for stop/stop-limit order.)	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	Order status	|	created,submitted,partial-filled	|
|	      timeInForce	|	string	|	FALSE	|	Time in force	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	Order creation time	|		|
|	      triggerTime	|	long	|	FALSE	|	Trigger time (applicabe only for stop/stop-limit order.)	|		|
|	      lastActTime	|	long	|	TRUE	|	Latest update time of the order	|		|
|	      execAmt	|	long	|	TRUE	|	executed amount of the order	|		|
|	      remainAmt	|	long	|	TRUE	|	remaining amount of the order	|		|
|	      avgExecPrc }	|	string	|	TRUE	|	average execution price of the order	|		|

## Query closed orders

- GET ` /orders/history`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	Trading symbol	|		|	all	|
|	orderStatus	|	string	|	FALSE	|	Order status (multiple input allowed, separated by comma)	|	filled,partial-canceled,canceled,rejected	|	all	|
|	orderTypes	|	string	|	FALSE	|	Order types (multiple input allowed, separated by comma)	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by lastActTime<br/>Query window is within 48-hour	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	100	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descending order of lastActTime	|		|
|	     { orderId	|	long	|	TRUE	|	Order ID	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      orderPrice	|	string	|	FALSE	|	Order price (inapplicable for market order and stop order.)	|		|
|	      orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	Order size	|		|
|	      orderType	|	string	|	TRUE	|	Order type	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	Trigger price (applicable only for stop/stop-limit order.)	|		|
|	      stopBy	|	string	|	FALSE	|	Triggered by (applicable only for stop/stop-limit order.)	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	Order status	|	filled,partial-canceled,canceled,rejected	|
|	      cancelInitiator	|	string	|	FALSE	|	Initiator of the cancellation (applicable only when orderStatus = partial-canceled or canceled)	|	user,exchange	|
|	      timeInForce	|	string	|	FALSE	|	Time in force	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	Order creation time	|		|
|	      triggerTime	|	long	|	FALSE	|	Trigger time (applicabe only for stop/stop-limit order.)	|		|
|	      lastActTime	|	long	|	TRUE	|	Latest update time of the order	|		|
|	      execAmt	|	long	|	TRUE	|	executed amount of the order	|		|
|	      remainAmt	|	long	|	TRUE	|	remaining amount of the order	|		|
|	      avgExecPrc }|	string	|	TRUE	|	average execution price of the order	|		|

## Query historical trades

- GET ` /orders/trades`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	Trading symbol, If orderId isn't filled, symbol is mandatory field. If orderId is filled, symbol should not be filled.	|		|		|
|	orderId	|	long	|	FALSE	|	Order ID, If symbol is not filled, orderId must be filled. If symbol is filled, orderId shouldn't be filled.	|		|		|
|	traceFrom	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by tradeTime<br/>Query window is within 48-hour	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	100	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descending order of tradeTime	|		|
|	     { symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      tradeId	|	long	|	TRUE	|	Trade ID (Unique in the platform.  同一taker订单同时产生的多笔成交按对手单成交优先级拥有不同的trade ID)	|		|
|	      tradePrice	|	string	|	TRUE	|	Trade price	|		|
|	      tradeVolume	|	long	|	TRUE	|	Trade volume	|		|
|	      tradeTime	|	long	|	TRUE	|	Trade time	|		|
|	      execType	|	string	|	TRUE	|	Trade type	|	trade<br/>liquidation<br/>liquidated<br/>deleverage<br/>funding<br/>administration	|
|	      transactFee	|	string	|	TRUE	|	Transaction fee	|		|
|	      aggressor	|	boolean	|	TRUE	|	Aggressor of the trade	|	true,false	|
|	      orderId	|	long	|	TRUE	|	Order ID	|		|
|	      orderSide }|	string	|	TRUE	|	Order side	|	buy,sell	|

# REST Interface - Position (Private AP)

## Query position

- GET ` /positions`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------|
|symbol|	string	|FALSE	|Trading symbol||	all|


> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in ascending order of symbol	|		|
|	     { symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      marginMode	|	string	|	TRUE	|	Margin mode	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	      initMargin	|	string	|	TRUE	|	Initial margin rate（逐仓时为杠杆率倒数，全仓时为该档风险限额设定值）	|		|
|	      maintMargin	|	string	|	TRUE	|	Maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	Alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	Leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	ADL ranking	|		|
|	      liquidationPx	|	string	|	TRUE	|	Liquidation price	|		|
|	      alarmPx	|	string	|	TRUE	|	Alarm price	|		|
|	      position	|	long	|	TRUE	|	Position holding (number of contracts, long in positive value, short in negative value)	|		|
|	      positionValue	|	string	|	TRUE	|	Position value	|		|
|	      positionEquity	|	string	|	TRUE	|	Position equity	|		|
|	      positionMargin	|	string	|	TRUE	|	Position margin	|		|
|	      entryPrice	|	string	|	TRUE	|	Entry price	|		|
|	      realisedPnl	|	string	|	TRUE	|	Realized profit & loss	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	Unrealized profit & loss	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	Unrealized revenue on equity	|		|
|	      markPrice	|	string	|	TRUE	|	Mark price	|		|
|	      positionStatus	|	string	|	TRUE	|	Position status	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	Update time	|		|

## Adjust position

- POST ` /positions/setting`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	marginMode	|	string	|	FALSE	|	Margin mode (marginMode, riskLimit, leverage can only be adjusted separately. Exceptional case: while converting cross margin mode to isolated margin mode, leverage is mandatory field.)	|	cross,isolated	|		|
|	riskLimit	|	long	|	FALSE	|	Risk limit (marginMode, riskLimit, leverage can only be adjusted separately.)	|		|		|
|	leverage	|	string	|	FALSE	|	Leverage rate (marginMode, riskLimit, leverage can only be adjusted separately. Exceptional case: while converting cross margin mode to isolated margin mode, leverage is mandatory field.)	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in ascending order of symbol	|		|
|	     { symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      marginMode	|	string	|	TRUE	|	Margin mode	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	      initMargin	|	string	|	TRUE	|	Initial margin rate	|		|
|	      maintMargin	|	string	|	TRUE	|	Maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	Alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	Leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	ADL ranking	|		|
|	      liquidationPx	|	string	|	TRUE	|	Liquidation price	|		|
|	      alarmPx	|	string	|	TRUE	|	Alarm price	|		|
|	      position	|	long	|	TRUE	|	Position holding (number of contracts, long in positive value, short in negative value)	|		|
|	      positionValue	|	string	|	TRUE	|	Position value	|		|
|	      positionEquity	|	string	|	TRUE	|	Position equity	|		|
|	      positionMargin	|	string	|	TRUE	|	Position margin	|		|
|	      entryPrice	|	string	|	TRUE	|	Entry price	|		|
|	      realisedPnl	|	string	|	TRUE	|	Realized profit & loss	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	Unrealized profit & loss	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	Unrealized revenue on equity	|		|
|	      markPrice	|	string	|	TRUE	|	Mark price	|		|
|	      positionStatus	|	string	|	TRUE	|	Position status	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	Update time	|		|

## Margin transfer

- POST ` /positions/margin`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|amount|string	|TRUE|Transfer amount|||

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in ascending order of symbol	|		|
|	     { symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      marginMode	|	string	|	TRUE	|	Margin mode	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	      initMargin	|	string	|	TRUE	|	Initial margin rate	|		|
|	      maintMargin	|	string	|	TRUE	|	Maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	Alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	Leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	ADL ranking	|		|
|	      liquidationPx	|	string	|	TRUE	|	Liquidation price	|		|
|	      alarmPx	|	string	|	TRUE	|	Alarm price	|		|
|	      position	|	long	|	TRUE	|	Position holding (number of contracts, long in positive value, short in negative value)	|		|
|	      positionValue	|	string	|	TRUE	|	Position value	|		|
|	      positionEquity	|	string	|	TRUE	|	Position equity	|		|
|	      positionMargin	|	string	|	TRUE	|	Position margin	|		|
|	      entryPrice	|	string	|	TRUE	|	Entry price	|		|
|	      realisedPnl	|	string	|	TRUE	|	Realized profit & loss	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	Unrealized profit & loss	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	Unrealized revenue on equity	|		|
|	      markPrice	|	string	|	TRUE	|	Mark price	|		|
|	      positionStatus	|	string	|	TRUE	|	Position status	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	Update time	|		|

# REST Interface - Account (Private AP)

## Query account balance

- GET ` /account/balance`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|currency	|string	|FALSE	|Currency		||all|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in ascending order of currency	|		|
|	     { accountStatus	|	string	|	TRUE	|	Account status	|	normal,frozen	|
|	      currency	|	string	|	TRUE	|	Currency	|		|
|	      accountEquity	|	string	|	TRUE	|	Account equity	|		|
|	      accountBalance	|	string	|	TRUE	|	Account balance	|		|
|	      availBalance	|	string	|	TRUE	|	Available balance	|		|
|	      positionMargin	|	string	|	TRUE	|	Position margin	|		|
|	      orderMargin	|	string	|	TRUE	|	Order margin	|		|
|	      realisedPnl	|	string	|	TRUE	|	Realized profit & loss	|		|
|	      unrealisedPnl }	|	string	|	TRUE	|	Unrealized profit & loss	|		|

# REST Interface - Market Data (Public API)

## K线

- GET ` /market/candlesticks`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	interval	|	string	|	TRUE	|	K线间隔	|	1m,5m,15m,30m,60m,4h,1d（基于自然日，GMT时间）,1w（基于自然周，GMT时间）,1M（基于自然月，GMT时间）,1y（基于自然年，GMT时间）	|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以ts为key进行检索	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	100	|

> Response:

```json

```

### Respond fields

| Field Name | Data type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	按ts倒序排列	|		|
|	     { symbol	|	string	|	FALSE	|	代码	|		|
|	      open	|	string	|	FALSE	|	K线区间内开盘价	|		|
|	      high	|	string	|	FALSE	|	K线区间内最高价	|		|
|	      low	|	string	|	FALSE	|	K线区间内最低价	|		|
|	      close	|	string	|	FALSE	|	K线区间内收盘价	|		|
|	      numOfTrades	|	integer	|	FALSE	|	K线区间内总成交笔数（仅对合约代码有效）	|		|
|	      volume	|	string	|	FALSE	|	K线区间内总成交量（仅对合约代码有效）	|		|
|	      turnover	|	string	|	FALSE	|	K线区间内总成交额（仅对合约代码有效）	|		|
|	      ts }|	long	|	FALSE	|	K线区间开始时间	|		|

## 有限档位MBP

- GET ` /market/mbp`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	levels	|	integer	|	FALSE	|	MBP档位	|	5,10,20,50,100	|	5	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	    {  ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      bid	|	array	|	TRUE	|	买盘，按price降序排列	|		|
|	           { price	|	string	|	TRUE	|	订单价格	|		|
|	            size }	|	string	|	TRUE	|	订单量（在该价格上所有订单量orderSize总和）	|		|
|	      ask	|	array	|	TRUE	|	卖盘，按price升序排列	|		|
|	           { price	|	string	|	TRUE	|	订单价格	|		|
|	            size }}|	string	|	TRUE	|	订单量（在该价格上所有订单量orderSize总和）	|		|

## 市场成交

- GET ` /market/trades`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,300]	|	1	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	按tradeTime倒序排列	|		|
|	     { symbol	|	string	|	TRUE	|	显示代码	|		|
|	      tradeId	|	long	|	TRUE	|	最近成交编号	|		|
|	      tradePrice	|	string	|	TRUE	|	最近Trade price	|		|
|	      tradeVolume	|	string	|	TRUE	|	最近成交量（仅对合约代码有效）	|		|
|	      tradeTime	|	long	|	TRUE	|	最近成交时间	|		|
|	      aggrOrdSide }	|	string	|	TRUE	|	最近成交主动方（即taker的买卖方向，仅对合约代码有效）	|	buy,sell	|

## 市场快照

- GET ` /market/summary`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|symbol	|string|	TRUE|	Trading symbol	|||


> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      open	|	string	|	TRUE	|	滚动24小时日开盘价	|		|
|	      high	|	string	|	TRUE	|	滚动24小时日最高价	|		|
|	      low	|	string	|	TRUE	|	滚动24小时日最低价	|		|
|	      close	|	string	|	TRUE	|	滚动24小时日收盘价	|		|
|	      numOfTrades	|	integer	|	TRUE	|	滚动24小时日总成交笔数	|		|
|	      totalVolume	|	string	|	TRUE	|	滚动24小时日总成交量	|		|
|	      turnover	|	string	|	TRUE	|	滚动24小时日总成交额	|		|
|	      instStatus	|	string	|	TRUE	|	合约状态 symbol status	|	normal,intraday-suspended,price-limit	|
|	      openInt }	|	long	|	TRUE	|	持仓量	|		|

# REST Interface - Benchmark (Public API)

## 历史资金费率

- GET ` /market/funding-rate`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以fundingTime为key进行检索，最远可查询48小时内历史记录	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	1	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      data	|	object	|	TRUE	|	按fundingTime倒序排列	|		|
|	           { fundingRate	|	string	|	TRUE	|	结算资金费率	|		|
|	            fundingTime }}|	long	|	TRUE	|	资金费用结算时间	|		|

## 预测资金费率

- GET ` /market/indicative-funding-rate`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	    { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      indFundRate	|	string	|	TRUE	|	预估资金费率	|		|
|	      indFundTime }	|	long	|	TRUE	|	预估资金费用结算时间	|		|

## 指数价格及成分（动态）

- GET ` /market/index-constituents`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以indexTime为key进行检索，最远可查询48小时内历史记录	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	1	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	按indexTime倒序排列	|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      data	|	object	|	TRUE	|		|		|
|	           { indexPrice	|	string	|	TRUE	|	指数价格，本阶段18位，后期根据配置提供（truncate)	|		|
|	            indexTime	|	long	|	TRUE	|	指数计算时间	|		|
|	            constituents	|	array	|	TRUE	|	按constituent正序排列	|		|
|	                 { constituent	|	string	|	TRUE	|	指数成分， [Exchange Name] + [.] + [Symbol]	|		|
|	                  price	|	string	|	TRUE	|	成分价格	|		|
|	                  weight }}}	|	string	|	TRUE	|	成分权重（百分比），精度：小数点后4位	|		|

# REST Interface - Reference (Public API)

## 查询合约要素

- GET ` /reference/instruments`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	Trading symbol	|		|	all	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	按symbol正序排列	|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      indexId	|	string	|	TRUE	|	标的指数代码	|		|
|	      markPriceId	|	string	|	TRUE	|	标记价格代码	|		|
|	      contractSize	|	string	|	TRUE	|	合约面值	|		|
|	      contractType	|	string	|	TRUE	|	合约类型	|	swap	|
|	      baseCurrency	|	string	|	TRUE	|	基础币种	|		|
|	      quoteCurrency	|	string	|	TRUE	|	计价币种	|		|
|	      marginCurrency	|	string	|	TRUE	|	保证金币种	|		|
|	      convertRate	|	string	|	FALSE	|	保证金币种折算率（仅对quanto合约有效）	|		|
|	      minOrderSize	|	long	|	TRUE	|	最小订单数量	|		|
|	      maxOrderSize	|	long	|	TRUE	|	最大订单数量	|		|
|	      pricePrecision	|	string	|	TRUE	|	价格精度	|		|
|	      tickSize	|	string	|	TRUE	|	最小报价阶梯步长	|		|
|	      riskLimitLevels	|	object	|	TRUE	|	按档位正序排列	|		|
|	           { riskLimitLevel	|	integer	|	TRUE	|	风险限额档位	|		|
|	            riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	            initMargin	|	string	|	TRUE	|	起始保证金率	|		|
|	            maintMargin	|	string	|	TRUE	|	维持保证金率	|		|
|	            alarmMargin }	|	string	|	TRUE	|	预警保证金率	|		|
|	      takerFeeRate	|	string	|	TRUE	|	taker交易手续费率	|		|
|	      makerFeeRate	|	string	|	TRUE	|	maker交易手续费率	|		|
|	      marginPrecision	|	string	|	TRUE	|	保证金计算精度	|		|
|	      pnlPrecision	|	string	|	TRUE	|	盈亏计算精度	|		|
|	      instStatus	|	string	|	TRUE	|	合约状态	|	pre-listing,normal,interday-suspended,delisted	|
|	      listingDate }	|	long	|	FALSE	|	开始交易日期（仅适用于instStatus=pre-listing）	|		|

