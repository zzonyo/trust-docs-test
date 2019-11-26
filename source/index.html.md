---
title: Huobi Perpetual Swap Contract API Reference v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'> Sign Up for a Huobi API key </a>
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
|2019.11.25 19:00| ||Initial version|

# Rest API List

|	Category	|	Feature	|	Path	|	API Permission	|
|--------- | --------- | -----------|-----------|
|	Orders and Trades (Private API)	|	Place an order	|	[POST /orders](#place-an-order)	|	Trade	|
|		|	Cancel orders	|	[DELETE /orders](#cancel-orders)	|	Trade	|
|		|	Query a specific order	|	[GET /orders/detail](#query-a-specific-order)	|	Trade	|
|		|	Query open orders	|	[GET /orders/open-orders](#query-open-orders)	|	Read	|
|		|	Query closed orders	|	[GET /orders/history](#query-closed-orders)	|	Read	|
|		|	Query historical trades	|	[GET /orders/trades](#query-historical-trades)	|	Read	|
| Position (Private API) |	Query position	|	[GET /positions](#query-position)	|	Read	|
|		|	Adjust position	|	[POST /positions/setting](#adjust-position)	|	Trade	|
|		|	Margin transfer	|	[POST /positions/margin](#margin-transfer)	|	Trade	|
|	Account (Private API)	|	Query account balance	|	[GET /account/balance](#query-account-balance)	|	Read	|
| Market Data (Public API) |	Query candlesticks	|	[GET /market/candlesticks](#query-candlesticks)	|	-	|
|		|	Query MBP	|	[GET /market/mbp](#query-mbp)	|	-	|
|		|	Query market trades	|	[GET /market/trades](#query-market-trades)	|	-	|
|		|	Query market picture	|	[GET /market/summary](#query-market-picture)	|	-	|
|	Benchmark (Public API)	|	Query historical funding rate	|	[GET /market/funding-rate](#query-historical-funding-rate)	|	-	|
|		|	Query indicative funding rate	|	[GET /market/indicative-funding-rate](#query-indicative-funding-rate)	|	-	|
|		|	Query index constituents and weights (dynamic)	|	[GET /market/index-constituents](#query-index-constituents-and-weights-dynamic)	|	-	|
|	Reference(Public API)	|	Query perpetual swap contract	|	[GET /reference/instruments](#query-perpetual-swap-contract)	|	-	|


# WebSocket API List

|  Category  | Feature |  Topic  |  API permission  |
| ---- | ---- | ---- | ---- |
| Orders (Private API) | Subscribe order's update - Creation | [orders#${symbol}](#subscribe-orders-update) | Read |
|		|	Subscribe order's update - Trigger	|	[orders#${symbol}](#subscribe-orders-update)	|	Read	|
|		|	Subscribe order's update - Trade	|	[orders#${symbol}](#subscribe-orders-update)	|	Read	|
|		|	Subscribe order's update - Cancellation	|	[orders#${symbol}](#subscribe-orders-update)	|	Read	|
|	Position (Private API)	|	Subscribe position's update	|	[positions#${symbol}](#subscribe-positions-update)	|	Read	|
|	Account (Private API) |	Subscribe account's update	|	[accounts#${currency}](#subscribe-accounts-update)	|	Read	|
|	Market Data (Public API)	|	Subscribe/acquire candlesticks	|	[candlestick#${symbol}@${interval}](#subscribe--acquire-candlesticks)	|	-	|
|		|	Subscribe/acquire MBP	|	[mbp#${symbol}@${levels}](#subscribe--acquire-mbp)	|	-	|
|		|	Subscribe/acquire market trades	|	[trades#${symbol}](#subscribe--acquire-market-trades)	|	-	|
|		|	Subscribe market picture	|	[summary#${symbol}](#subscribe-market-picture)	|	-	|
|	Benchmark (Public API) |	Subscribe indicative funding rate	|	[ind.funding.rate#${symbol}](#subscribe-indicative-funding-rate)	|	-	|
|		|	Subscribe index constituents and weights (dynamic)	|	[index.cons#${symbol}](#subscribe-index-constituents-and-weights-dynamic)	|	-	|

# Rest API - Orders and Trades (Private API)

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

It doesn't mean the order is cancelled if the order cancellation request is accepted by server, client should subscribe order update or query the order status to make sure the order is cancelled.

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
|	      tradeId	|	long	|	TRUE	|	Trade ID	|		|
|	      tradePrice	|	string	|	TRUE	|	Trade price	|		|
|	      tradeVolume	|	long	|	TRUE	|	Trade volume	|		|
|	      tradeTime	|	long	|	TRUE	|	Trade time	|		|
|	      execType	|	string	|	TRUE	|	Trade type	|	trade<br/>liquidation<br/>liquidated<br/>deleverage<br/>funding<br/>administration	|
|	      transactFee	|	string	|	TRUE	|	Transaction fee	|		|
|	      aggressor	|	boolean	|	TRUE	|	Aggressor of the trade	|	true,false	|
|	      orderId	|	long	|	TRUE	|	Order ID	|		|
|	      orderSide }|	string	|	TRUE	|	Order side	|	buy,sell	|

# REST API - Position (Private API)

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

# REST API - Account (Private API)

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

# REST API - Market Data (Public API)

## Query candlesticks

- GET ` /market/candlesticks`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Symbol (can be swap contract code, index symbol, mark price symbol)	|		|		|
|	interval	|	string	|	TRUE	|	Interval	|	1m, 5m, 15m, 30m, 1h, 4h, 1d (Nature day in GMT), 1w (Nature week in GMT), 1M (Nature month in GMT), 1y (Nature year in GMT)	|		|
|	start	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by ts	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	100	|

> Response:

```json

```

### Respond fields

| Field Name | Data type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descending order of ts	|		|
|	     { symbol	|	string	|	FALSE	|	Symbol	|		|
|	      open	|	string	|	FALSE	|	Open price during the period	|		|
|	      high	|	string	|	FALSE	|	High price during the period	|		|
|	      low	|	string	|	FALSE	|	Low  price during the period	|		|
|	      close	|	string	|	FALSE	|	Close price during the period	|		|
|	      numOfTrades	|	integer	|	FALSE	|	Number of trades during the period (applicable only for swap contract)	|		|
|	      volume	|	string	|	FALSE	|	Accumulated volume during the period (applicable only for swap contract)	|		|
|	      turnover	|	string	|	FALSE	|	Turnover during the period (applicable only for swap contract)	|		|
|	      ts }|	long	|	FALSE	|	Start time of the period	|		|

## Query MBP

- GET ` /market/mbp`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	levels	|	integer	|	FALSE	|	Number of best levels of MBP	|	5,10,20,50,100	|	5	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|		|		|
|	    {  ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      bid	|	array	|	TRUE	|	Bid side (in descending order of price)	|		|
|	           { price	|	string	|	TRUE	|	Level price	|		|
|	            size }	|	string	|	TRUE	|	Level size	|		|
|	      ask	|	array	|	TRUE	|	Ask side (in ascending order of price)	|		|
|	           { price	|	string	|	TRUE	|	Level price	|		|
|	            size }}|	string	|	TRUE	|	Level size	|		|

## Query market trades

- GET ` /market/trades`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Symbol (can be swap contract code, index symbol, mark price symbol)	|		|		|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,300]	|	1	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descending order of tradeTime	|		|
|	     { symbol	|	string	|	TRUE	|	Symbol	|		|
|	      tradeId	|	long	|	TRUE	|	Trade ID	|		|
|	      tradePrice	|	string	|	TRUE	|	Trade price	|		|
|	      tradeVolume	|	string	|	TRUE	|	Trade volume (applicable only for swap contract)	|		|
|	      tradeTime	|	long	|	TRUE	|	Trade time	|		|
|	      aggrOrdSide }	|	string	|	TRUE	|	Aggressive order side (applicable only for swap contract)	|	buy,sell	|

## Query market picture

- GET ` /market/summary`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
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
|	     { ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      open	|	string	|	TRUE	|	Open price within 24-hour	|		|
|	      high	|	string	|	TRUE	|	High price within 24-hour	|		|
|	      low	|	string	|	TRUE	|	Low price within 24-hour	|		|
|	      close	|	string	|	TRUE	|	Close price within 24-hour	|		|
|	      numOfTrades	|	integer	|	TRUE	|	Number of trades within 24-hour	|		|
|	      totalVolume	|	string	|	TRUE	|	Total volume within 24-hour	|		|
|	      turnover	|	string	|	TRUE	|	Turnover within 24-hour	|		|
|	      instStatus	|	string	|	TRUE	|	Instrument status	|	normal,intraday-suspended,price-limit	|
|	      openInt }	|	long	|	TRUE	|	Open interest	|		|

# REST API - Benchmark (Public API)

## Query historical funding rate

- GET ` /market/funding-rate`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	start	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by fundingTime<br/>Query window is within 48-hour	|		|	latest system time	|
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
|	     { ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      data	|	object	|	TRUE	|	in descending order of fundingTime	|		|
|	           { fundingRate	|	string	|	TRUE	|	Funding rate	|		|
|	            fundingTime }}|	long	|	TRUE	|	Funding time	|		|

## Query indicative funding rate

- GET ` /market/indicative-funding-rate`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
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
|	    { ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      indFundRate	|	string	|	TRUE	|	Indicative funding rate	|		|
|	      indFundTime }	|	long	|	TRUE	|	Indicative funding time	|		|

## Query index constituents and weights (dynamic)

- GET ` /market/index-constituents`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	start	|	long	|	FALSE	|	Near time of the query (inclusive)<br/>Searching in descending order (from near to far)<br/>Searching by indexTime<br/>Query window is within 48-hour	|		|	latest system time	|
|	limit	|	integer	|	FALSE	|	Maximum number of items in a request	|	[1,500]	|	1	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in descedning order of indexTime	|		|
|	     { ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      data	|	object	|	TRUE	|		|		|
|	           { indexPrice	|	string	|	TRUE	|	Index price	|		|
|	            indexTime	|	long	|	TRUE	|	Index calculation time	|		|
|	            constituents	|	array	|	TRUE	|	in ascending order of constituent	|		|
|	                 { constituent	|	string	|	TRUE	|	Index constituent, [Exchange Name] + [.] + [Symbol]	|		|
|	                  price	|	string	|	TRUE	|	Price of the constituent	|		|
|	                  weight }}}	|	string	|	TRUE	|	Weight of the constituent	|		|

# REST API - Reference (Public API)

## Query perpetual swap contract

- GET ` /reference/instruments`

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	FALSE	|	Trading symbol	|		|	all	|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	Status code	|		|
|	message	|	string	|	FALSE	|	Error message (applicable only when error code returns.)	|		|
|	data	|	object	|	TRUE	|	in ascending order of symbol	|		|
|	     { ts	|	long	|	TRUE	|	Update time	|		|
|	      symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	      indexId	|	string	|	TRUE	|	Index symbol	|		|
|	      markPriceId	|	string	|	TRUE	|	Mark price symbol	|		|
|	      contractSize	|	string	|	TRUE	|	Contract size	|		|
|	      contractType	|	string	|	TRUE	|	Contract type	|	swap	|
|	      baseCurrency	|	string	|	TRUE	|	Base currency	|		|
|	      quoteCurrency	|	string	|	TRUE	|	Quote currency	|		|
|	      marginCurrency	|	string	|	TRUE	|	Margin currency	|		|
|	      convertRate	|	string	|	FALSE	|	Conversion rate of margin currency (applicable only for Quanto contract)	|		|
|	      minOrderSize	|	long	|	TRUE	|	Minimum order size	|		|
|	      maxOrderSize	|	long	|	TRUE	|	Maximum order size	|		|
|	      pricePrecision	|	string	|	TRUE	|	Price precision	|		|
|	      tickSize	|	string	|	TRUE	|	Tick size	|		|
|	      riskLimitLevels	|	object	|	TRUE	|	in ascending order of riskLimitLevel	|		|
|	           { riskLimitLevel	|	integer	|	TRUE	|	Risk limit level	|		|
|	            riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	            initMargin	|	string	|	TRUE	|	Initial margin rate	|		|
|	            maintMargin	|	string	|	TRUE	|	Maintenance margin rate	|		|
|	            alarmMargin }	|	string	|	TRUE	|	Alarm margin rate	|		|
|	      takerFeeRate	|	string	|	TRUE	|	Transaction fee rate of taker	|		|
|	      makerFeeRate	|	string	|	TRUE	|	Transaction  fee rate of maker	|		|
|	      marginPrecision	|	string	|	TRUE	|	Margin  precision	|		|
|	      pnlPrecision	|	string	|	TRUE	|	Precision  of profit & loss	|		|
|	      instStatus	|	string	|	TRUE	|	Instrument  status	|	pre-listing,normal,interday-suspended,delisted	|
|	      listingDate }	|	long	|	FALSE	|	Start  trading date	|		|

# Websocket API - Orders (Private API)

## Subscribe order's update

`orders#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol (wildcard * acceptable)	|		|		|

> Response:

```json

```

### Respond fields - Order created

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	eventType	|	string	|	TRUE	|	Event type	|	creation	|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	orderId	|	long	|	TRUE	|	Order ID	|		|
|	orderPrice	|	string	|	TRUE	|	Order price	|		|
|	orderSide	|	string	|	TRUE	|	Order side	|	"buy,sell"	|
|	orderSize	|	long	|	TRUE	|	Order size	|		|
|	timeInForce	|	string	|	TRUE	|	Time in force	|	gtc,ioc	|
|	orderType	|	string	|	TRUE	|	Order type	|	limit,stop-limit	|
|	stopPrice	|	string	|	FALSE	|	Trigger price (applicabe only for stop/stop-limit order.)	|		|
|	stopBy	|	string	|	FALSE	|	Triggered by (applicabe only for stop/stop-limit order.)	|	last-trade-price,mark-price,index-price	|
|	orderStatus	|	string	|	TRUE	|	Order status	|	"created,submitted"	|
|	orderCreateTime	|	long	|	TRUE	|	Order creation time	|		|

> Response:

```json

```

### Respond fields - Order triggered

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	eventType	|	string	|	TRUE	|	Event type	|	trigger	|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	orderId	|	long	|	TRUE	|	Order ID	|		|
|	orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	orderStatus	|	string	|	TRUE	|	Order status	|	submitted,rejected	|
|	rejectReason	|	string	|	FALSE	|	Reason of rejection (applicable only when stop/stop-limit order triggering failure)	|		|
|	triggerTime	|	long	|	TRUE	|	Trigger time (applicable only for stop/stop-limit order)	|		|

> Response:

```json

```

### Respond fields - Order executed

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	eventType	|	string	|	TRUE	|	Event type	|	trade	|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	orderId	|	long	|	TRUE	|	Order ID	|		|
|	tradePrice	|	string	|	TRUE	|	Trade price	|		|
|	tradeVolume	|	long	|	TRUE	|	Trade volume	|		|
|	orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	tradeId	|	long	|	TRUE	|	Trade ID	|		|
|	tradeTime	|	long	|	TRUE	|	Trade time	|		|
|	execType	|	string	|	TRUE	|	Execution type	|	trade, liquidation, liquidated, deleverage, funding, administration	|
|	aggressor	|	boolean	|	TRUE	|	Aggressor of the trade	|	true,false	|
|	transactFee	|	string	|	TRUE	|	Transaction fee	|		|
|	orderStatus	|	string	|	TRUE	|	Order status	|	partial-filled,filled	|
|	execAmt	|	long	|	TRUE	|	Executed amount of the order	|		|
|	remainAmt	|	long	|	TRUE	|	Remaining amount of the order	|		|
|	avgExecPrc	|	string	|	TRUE	|	Average execution price of the order	|		|

> Response:

```json

```

### Respond fields - Order cancelled

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	eventType	|	string	|	TRUE	|	Event type	|	cancellation	|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	orderId	|	integer	|	TRUE	|	Order ID	|		|
|	orderSide	|	string	|	TRUE	|	Order side	|	buy,sell	|
|	orderStatus	|	string	|	TRUE	|	Order status	|	partial-canceled,canceled	|
|	execAmt	|	long	|	TRUE	|	Executed amount of the order	|		|
|	remainAmt	|	long	|	TRUE	|	Remainng amount of the order	|		|
|	avgExecPrc	|	string	|	TRUE	|	Average execution price of the order	|		|
|	lastActTime	|	long	|	TRUE	|	Latest update time of the order	|		|

# Websocket API - Position (Private API)

## Subscribe position's update

`positions#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol (wildcard * acceptable)	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	marginMode	|	string	|	TRUE	|	Margin mode	|	cross,isolated	|
|	riskLimit	|	long	|	TRUE	|	Risk limit	|		|
|	initMargin	|	string	|	TRUE	|	Initial margin rate	|		|
|	maintMargin	|	string	|	TRUE	|	Maintenance margin rate	|		|
|	alarmMargin	|	string	|	TRUE	|	Alarm margin rate	|		|
|	leverage	|	string	|	TRUE	|	Leverage rate	|		|
|	adlRank	|	integer	|	TRUE	|	ADL ranking	|		|
|	liquidationPx	|	string	|	TRUE	|	Liquidation price	|		|
|	alarmPx	|	string	|	TRUE	|	Alarm price	|		|
|	position	|	long	|	TRUE	|	Position holding (number of contracts, long in positive value, short in negative value)	|		|
|	positionValue	|	string	|	TRUE	|	Position value	|		|
|	positionEquity	|	string	|	TRUE	|	Position equity	|		|
|	positionMargin	|	string	|	TRUE	|	Position margin	|		|
|	entryPrice	|	string	|	TRUE	|	Entry price	|		|
|	realisedPnl	|	string	|	TRUE	|	Realized profit & loss	|		|
|	unrealisedPnl	|	string	|	TRUE	|	Unrealized profit & loss	|		|
|	unrealisedRoe	|	string	|	TRUE	|	Unrealized revenue on equity	|		|
|	markPrice	|	string	|	TRUE	|	Mark price	|		|
|	positionStatus	|	string	|	TRUE	|	Position status	|	normal,margin-call,liquidation,deleverage	|
|	ts	|	long	|	TRUE	|	Update time	|		|

# Websocket API - Account (Private API)

## Subscribe account's update

`accounts#${currency}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	currency	|	string	|	TRUE	|	Currency (wildcard * acceptable)	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	currency	|	string	|	TRUE	|	Currency	|		|
|	accountChange	|	string	|	TRUE	|	Amount  change	|		|
|	changeType	|	string	|	TRUE	|	Amount  change type	|	realized-pnl,transfer|
|	changeTime	|	long	|	TRUE	|	Amount  change time	|		|
|	availBalance	|	string	|	TRUE	|	Available  balance	|		|
|	accountBalance	|	string	|	TRUE	|	Account  balance	|		|

# Websocket API - Market Data (Public API)

## Subscribe / Acquire candlesticks

`candlestick#${symbol}@${interval}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Symbol  (can be swap contract code, index symbol, mark price symbol)	|		|		|
|	interval	|	string	|	TRUE	|	Interval	|	1m, 5m, 15m, 30m, 1h, 4h, 1d (Nature day in GMT), 1w (Nature week in GMT), 1M (Nature month in GMT), 1y (Nature year in GMT)	|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	id	|	long	|	FALSE	|	Start  time of the period	|		|
|	symbol	|	string	|	FALSE	|	Symbol  (can be swap contract code, index symbol, mark price symbol)	|		|
|	open	|	string	|	FALSE	|	Open  price during the period	|		|
|	high	|	string	|	FALSE	|	High  price during the period	|		|
|	low	|	string	|	FALSE	|	Low price during the period	|		|
|	close	|	string	|	FALSE	|	Close  price during the period	|		|
|	numOfTrades	|	integer	|	FALSE	|	Number  of trades during the period (applicable only for swap contract)	|		|
|	volume	|	string	|	FALSE	|	Accumulated  volume during the period (applicable only for swap contract)	|		|
|	turnover	|	string	|	FALSE	|	Turnover  during the period (applicable only for swap contract)	|		|

## Subscribe / Acquire MBP

`mbp#${symbol}@${levels}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|
|	levels	|	integer	|	TRUE	|	Number  of best levels of MBP	|	5,10,20,50,100	|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	ts	|	long	|	TRUE	|	Update  time	|		|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	delta	|	bool	|	TRUE	|	Incremental  update	|	true,false	|
|	bids	|	array	|	TRUE	|	Bid side  (in descending order of price)	|		|
|	     { price	|	string	|	TRUE	| Level  price                             |		|
|	      size }|	string	|	TRUE	|	Level  size	|		|
|	asks	|	array	|	TRUE	|	Ask side  (in ascending order of price)	|		|
|	     { price	|	string	|	TRUE	|	Level  price	|		|
|	      size }	|	string	|	TRUE	|	Level  size	|		|

## Subscribe / Acquire market trades

`trades#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Symbol  (can be swap contract code, index symbol, mark price symbol)	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Symbol  (can be swap contract code, index symbol, mark price symbol)	|		|
|	tradeId	|	long	|	TRUE	|	Trade ID	|		|
|	tradeTime	|	long	|	TRUE	|	Trade time	|		|
|	tradePrice	|	string	|	TRUE	|	Trade  price	|		|
|	tradeVolume	|	string	|	TRUE	|	Trade  volume (applicable only for swap  contract)）	|		|
|	aggrOrdSide	|	string	|	TRUE	|	Aggressive  order side (applicable only for swap contract)	|	buy,sell	|

## Subscribe market picture

`summary#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	open	|	string	|	TRUE	|	Open  price within 24-hour	|		|
|	high	|	string	|	TRUE	|	High  price within 24-hour	|		|
|	low	|	string	|	TRUE	|	Low  price within 24-hour	|		|
|	close	|	string	|	TRUE	|	Close  price within 24-hour	|		|
|	numOfTrades	|	integer	|	TRUE	|	Number  of trades within 24-hour	|		|
|	totalVolume	|	string	|	TRUE	|	Total  volume within 24-hour	|		|
|	turnover	|	string	|	TRUE	|	Turnover  within 24-hour	|		|
|	instStatus	|	string	|	TRUE	|	Instrument  status	|	normal,intraday-suspended,price-limit	|
|	openInt	|	long	|	TRUE	|	Open  interest	|		|

# Websocket API - Benchmark (Public API)

## Subscribe indicative funding rate

`ind.funding.rate#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	ts	|	long	|	TRUE	|	Update  time	|		|
|	symbol	|	string	|	TRUE	|	Trading symbol	|		|
|	indFundRate	|	string	|	TRUE	|	Indicative  funding rate	|		|
|	indFundTime	|	long	|	TRUE	|	Indicative  funding time	|		|

## Subscribe index constituents and weights (dynamic)

`index.cons#${symbol}`

> Subscribe request

```json

```

### Request parameters

| Field Name | Data type | Mandatory | Description | Enumerated Value |Default value |
| ---- | -------- | -------- | ---- | ---- | ------ |
|	symbol	|	string	|	TRUE	|	Index  symbol	|		|		|

> Response:

```json

```

### Respond fields

| Field Name | Data Type | Mandatory | Description | Enumerated Value |
| ---- | -------- | -------- | ---- | ---- |
|	ts	|	long	|	TRUE	|	Update  time	|		|
|	symbol	|	string	|	TRUE	|	Update  time	|		|
|	indexPrice	|	string	|	TRUE	| Index  price |		|
|	indexTime	|	long	|	TRUE	|	Index  calculation time	|		|
|	constituents	|	array	|	TRUE	|	in  ascending order of constituent	|		|
|	     { constituent	|	string	|	TRUE	|	Index constituent, [Exchange Name] + [.] + [Symbol]	|		|
|	      price	|	string	|	TRUE	|	Price of  the constituent	|		|
|	      weight }	|	string	|	TRUE	|	Weight  of the constituent	|		|



