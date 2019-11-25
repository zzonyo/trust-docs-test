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

Welcome to the Huobi Permanent Contract API! You can use the API to access all market data, trading, and account management endpoints.

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

### 请求参数

| 名称 | 数据类型 | 是否必需 | 描述 | 取值 |缺省值 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| symbol | string | TRUE | 合约代码 |      |      |
| orderPrice |string| TRUE |订单价格（市价单无需此字段）|      |      |
| orderSide | string | TRUE | 订单方向 | buy,sell |      |
| orderSize | long | TRUE | 订单数量（张） |      |      |
|	timeInForce	|	string	|	FALSE	|	订单有效期	|	gtc,ioc	|	gtc	|
|	orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|		|
|	stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托有效）	|		|		|
|	stopBy	|	string	|	FALSE	|	触发源（仅对计划委托有效）	|	last-trade-price,mark-price,index-price	|	last-trade-price	|

> Responds:

```json

```

### 返回字段

| 名称 | 数据类型 | 是否必需 | 描述 | 取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { orderId }	|	long	|	TRUE	|	订单编号	|		|

## 批量撤单

- POST ` /orders`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|orderIds|	string[]	|TRUE	|订单编号列表（每次最多批量撤销50张订单。）|		||

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { accepted	|	string[]	|	TRUE	|	已被接受撤销请求的订单列表（orderId列表，按请求顺序正序排列）	|		|
|	      rejected }	|	string[]	|	TRUE	|	未被接受撤销请求的订单列表（orderId列表，按请求顺序正序排列）	|		|

<aside class="warning">已接受撤单请求不意味着撤单成功，用户应订阅订单更新或查询订单状态以确认撤单成功。</aside>
## 查询特定订单

- GET ` /orders/detail`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|orderId|	long|	TRUE|	订单编号||||

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { orderId	|	long	|	TRUE	|	订单编号	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      orderPrice	|	string	|	FALSE	|	订单价格（市价单不含此字段）	|		|
|	      orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	订单数量	|		|
|	      orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托订单类型有效）	|		|
|	      stopBy	|	string	|	FALSE	|	触发价格来源（仅对计划委托订单类型有效）	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	订单状态	|	created,submitted,partial-filled,filled,partial-canceled,canceled,rejected	|
|	      cancelInitiator	|	string	|	FALSE	|	撤单发起人（仅对orderStatus = partial-canceled or canceled 有效）	|	user,exchange	|
|	      timeInForce	|	string	|	FALSE	|	订单有效期	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	订单创建时间	|		|
|	      triggerTime	|	long	|	FALSE	|	触发时间（仅对计划委托订单类型有效）	|		|
|	      lastActTime	|	long	|	TRUE	|	订单最近更新时间	|		|
|	      execAmt	|	long	|	TRUE	|	已成交订单数量	|		|
|	      remainAmt	|	long	|	TRUE	|	未成交订单数量	|		|
|	      avgExecPrc }	|	string	|	TRUE	|	成交均价	|		|

## 查询open订单

- GET ` /orders/open-orders`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|
|	orderSide	|	string	|	FALSE	|	订单方向	|	buy,sell	|	all	|
|	orderTypes	|	string	|	FALSE	|	订单类型（可多填，以逗号分隔）	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以orderCreateTime为key进行检索	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按orderCreateTime倒序排列	|		|
|	     { orderId	|	long	|	TRUE	|	订单编号	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      orderPrice	|	string	|	FALSE	|	订单价格（市价单不含此字段）	|		|
|	      orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	订单数量	|		|
|	      orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托订单类型有效）	|		|
|	      stopBy	|	string	|	FALSE	|	触发价格来源（仅对计划委托订单类型有效）	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	订单状态	|	created,submitted,partial-filled	|
|	      timeInForce	|	string	|	FALSE	|	订单有效期	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	订单创建时间	|		|
|	      triggerTime	|	long	|	FALSE	|	触发时间（仅对计划委托订单类型有效）	|		|
|	      lastActTime	|	long	|	TRUE	|	订单最近更新时间	|		|
|	      execAmt	|	long	|	TRUE	|	已成交订单数量	|		|
|	      remainAmt	|	long	|	TRUE	|	未成交订单数量	|		|
|	      avgExecPrc }	|	string	|	TRUE	|	成交均价	|		|

## 查询closed订单

- GET ` /orders/history`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|
|	orderStatus	|	string	|	FALSE	|	订单状态（可多填，以逗号分隔）	|	filled,partial-canceled,canceled,rejected	|	all	|
|	orderTypes	|	string	|	FALSE	|	订单类型（可多填，以逗号分隔）	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以lastActTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按lastActTime倒序排列	|		|
|	     { orderId	|	long	|	TRUE	|	订单编号	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      orderPrice	|	string	|	FALSE	|	订单价格（市价单不含此字段）	|		|
|	      orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	      orderSize	|	long	|	TRUE	|	订单数量	|		|
|	      orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|
|	      stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托订单类型有效）	|		|
|	      stopBy	|	string	|	FALSE	|	触发价格来源（仅对计划委托订单类型有效）	|	last-trade-price,mark-price,index-price	|
|	      orderStatus	|	string	|	TRUE	|	订单状态	|	filled,partial-canceled,canceled,rejected	|
|	      cancelInitiator	|	string	|	FALSE	|	撤单发起人（仅对orderStatus = partial-canceled or canceled 有效）	|	user,exchange	|
|	      timeInForce	|	string	|	FALSE	|	订单有效期	|	gtc,ioc	|
|	      orderCreateTime	|	long	|	TRUE	|	订单创建时间	|		|
|	      triggerTime	|	long	|	FALSE	|	触发时间（仅对计划委托订单类型有效）	|		|
|	      lastActTime	|	long	|	TRUE	|	订单最近更新时间	|		|
|	      execAmt	|	long	|	TRUE	|	已成交订单数量	|		|
|	      remainAmt	|	long	|	TRUE	|	未成交订单数量	|		|
|	      avgExecPrc }|	string	|	TRUE	|	成交均价	|		|

## 查询历史成交

- GET ` /orders/trades`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	合约代码，如不填orderId，symbol必填，如已填orderId，symbol须不填	|		|		|
|	orderId	|	long	|	FALSE	|	订单编号，如不填symbol，orderId必填，如已填symbol，orderId须不填	|		|		|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以tradeTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按tradeTime倒序排列	|		|
|	     { symbol	|	string	|	TRUE	|	合约代码	|		|
|	      tradeId	|	long	|	TRUE	|	成交编号（具平台唯一性。  同一taker订单同时产生的多笔成交按对手单成交优先级拥有不同的trade ID）	|		|
|	      tradePrice	|	string	|	TRUE	|	成交价	|		|
|	      tradeVolume	|	long	|	TRUE	|	成交量	|		|
|	      tradeTime	|	long	|	TRUE	|	成交时间	|		|
|	      execType	|	string	|	TRUE	|	成交类型	|	trade（正常成交）,liquidation（爆仓预处理系统减仓）,liquidated（爆仓平仓）,deleverage（ADL自动减仓）,funding（资金费用互换）,administration（系统平仓）	|
|	      transactFee	|	string	|	TRUE	|	交易手续费	|		|
|	      aggressor	|	boolean	|	TRUE	|	成交主动方	|	true,false	|
|	      orderId	|	long	|	TRUE	|	订单编号	|		|
|	      orderSide }|	string	|	TRUE	|	订单方向	|	buy,sell	|

# REST接口 - 仓位类（私有数据）

## 查询仓位

- GET ` /positions`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|symbol|	string	|FALSE	|合约代码||	all|


> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按symbol正序排列	|		|
|	     { symbol	|	string	|	TRUE	|	合约代码	|		|
|	      marginMode	|	string	|	TRUE	|	持仓模式（全仓或逐仓）	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	风险限额	|		|
|	      initMargin	|	string	|	TRUE	|	起始保证金率 initial margin rate （逐仓时为杠杆率倒数，全仓时为该档风险限额设定值）	|		|
|	      maintMargin	|	string	|	TRUE	|	维持保证金率 maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	预警保证金率 alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	杠杆率 leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	自动减仓队列排名	|		|
|	      liquidationPx	|	string	|	TRUE	|	爆仓价	|		|
|	      alarmPx	|	string	|	TRUE	|	预警价	|		|
|	      position	|	long	|	TRUE	|	持仓量（张），多仓为正，空仓为负	|		|
|	      positionValue	|	string	|	TRUE	|	仓位价值（以标记价格计算）	|		|
|	      positionEquity	|	string	|	TRUE	|	仓位权益	|		|
|	      positionMargin	|	string	|	TRUE	|	仓位保证金	|		|
|	      entryPrice	|	string	|	TRUE	|	开仓均价	|		|
|	      realisedPnl	|	string	|	TRUE	|	已实现盈亏 realized profit & loss ，盈为正，亏为负	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	未实现盈亏 unrealized profit & loss，盈为正，亏为负，以标记价格计算	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	未实现盈亏回报率，盈为正，亏为负，以标记价格计算	|		|
|	      markPrice	|	string	|	TRUE	|	标记价格	|		|
|	      positionStatus	|	string	|	TRUE	|	仓位状态	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	更新时间	|		|

## 调整仓位设置

- POST ` /positions/setting`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	marginMode	|	string	|	FALSE	|	持仓模式（marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项，例外：全仓转逐仓须同时指定杠杆率leverage）	|	cross,isolated	|		|
|	riskLimit	|	long	|	FALSE	|	风险限额（marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项）	|		|		|
|	leverage	|	string	|	FALSE	|	杠杆率（仅对逐仓模式有效，marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项，例外：全仓转逐仓须同时指定杠杆率leverage）	|		|		|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按symbol正序排列	|		|
|	     { symbol	|	string	|	TRUE	|	合约代码	|		|
|	      marginMode	|	string	|	TRUE	|	持仓模式（全仓或逐仓）	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	风险限额	|		|
|	      initMargin	|	string	|	TRUE	|	起始保证金率 initial margin rate （逐仓时为杠杆率倒数，全仓时为该档风险限额设定值）	|		|
|	      maintMargin	|	string	|	TRUE	|	维持保证金率 maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	预警保证金率 alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	杠杆率 leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	自动减仓队列排名	|		|
|	      liquidationPx	|	string	|	TRUE	|	爆仓价	|		|
|	      alarmPx	|	string	|	TRUE	|	预警价	|		|
|	      position	|	long	|	TRUE	|	持仓量（张），多仓为正，空仓为负	|		|
|	      positionValue	|	string	|	TRUE	|	仓位价值（以标记价格计算）	|		|
|	      positionEquity	|	string	|	TRUE	|	仓位权益	|		|
|	      positionMargin	|	string	|	TRUE	|	仓位保证金	|		|
|	      entryPrice	|	string	|	TRUE	|	开仓均价	|		|
|	      realisedPnl	|	string	|	TRUE	|	已实现盈亏 realized profit & loss ，盈为正，亏为负	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	未实现盈亏 unrealized profit & loss，盈为正，亏为负，以标记价格计算	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	未实现盈亏回报率，盈为正，亏为负，以标记价格计算	|		|
|	      markPrice	|	string	|	TRUE	|	标记价格	|		|
|	      positionStatus	|	string	|	TRUE	|	仓位状态	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	更新时间	|		|

## 仓位保证金划转

- POST ` /positions/margin`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|amount|string	|TRUE|账户与仓位间资金划转金额（转入仓位为正值，转出仓位为负值）|||

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按symbol正序排列	|		|
|	     { symbol	|	string	|	TRUE	|	合约代码	|		|
|	      marginMode	|	string	|	TRUE	|	持仓模式（全仓或逐仓）	|	cross,isolated	|
|	      riskLimit	|	long	|	TRUE	|	风险限额	|		|
|	      initMargin	|	string	|	TRUE	|	起始保证金率 initial margin rate （逐仓时为杠杆率倒数，全仓时为该档风险限额设定值）	|		|
|	      maintMargin	|	string	|	TRUE	|	维持保证金率 maintenance margin rate	|		|
|	      alarmMargin	|	string	|	TRUE	|	预警保证金率 alarm margin rate	|		|
|	      leverage	|	string	|	TRUE	|	杠杆率 leverage rate	|		|
|	      adlRank	|	integer	|	TRUE	|	自动减仓队列排名	|		|
|	      liquidationPx	|	string	|	TRUE	|	爆仓价	|		|
|	      alarmPx	|	string	|	TRUE	|	预警价	|		|
|	      position	|	long	|	TRUE	|	持仓量（张），多仓为正，空仓为负	|		|
|	      positionValue	|	string	|	TRUE	|	仓位价值（以标记价格计算）	|		|
|	      positionEquity	|	string	|	TRUE	|	仓位权益	|		|
|	      positionMargin	|	string	|	TRUE	|	仓位保证金	|		|
|	      entryPrice	|	string	|	TRUE	|	开仓均价	|		|
|	      realisedPnl	|	string	|	TRUE	|	已实现盈亏 realized profit & loss ，盈为正，亏为负	|		|
|	      unrealisedPnl	|	string	|	TRUE	|	未实现盈亏 unrealized profit & loss，盈为正，亏为负，以标记价格计算	|		|
|	      unrealisedRoe	|	string	|	TRUE	|	未实现盈亏回报率，盈为正，亏为负，以标记价格计算	|		|
|	      markPrice	|	string	|	TRUE	|	标记价格	|		|
|	      positionStatus	|	string	|	TRUE	|	仓位状态	|	normal,margin-call,liquidation,deleverage	|
|	      ts }	|	long	|	TRUE	|	更新时间	|		|

# REST接口 - 账户类（私有数据）

## 查询账户余额

- GET ` /account/balance`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|currency	|string	|FALSE	|币种		||all

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按currency正序排列	|		|
|	     { accountStatus	|	string	|	TRUE	|	账户状态	|	normal,frozen	|
|	      currency	|	string	|	TRUE	|	币种	|		|
|	      accountEquity	|	string	|	TRUE	|	账户权益（包含未实现盈亏）	|		|
|	      accountBalance	|	string	|	TRUE	|	账户余额（不包含未实现盈亏）	|		|
|	      availBalance	|	string	|	TRUE	|	可用余额（不包含累计仓位保证金，不包含累计委托保证金，不包含累计未实现盈亏。可用于开（加）仓，可转出。）	|		|
|	      positionMargin	|	string	|	TRUE	|	仓位保证金（累计）	|		|
|	      orderMargin	|	string	|	TRUE	|	委托保证金（累计）	|		|
|	      realisedPnl	|	string	|	TRUE	|	已实现盈亏（累计），盈为正，亏为负	|		|
|	      unrealisedPnl }	|	string	|	TRUE	|	未实现盈亏（累计），盈为正，亏为负	|		|

# REST接口 - 行情类（公共数据）

## K线

- GET ` /market/candlesticks`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	interval	|	string	|	TRUE	|	K线间隔	|	1m,5m,15m,30m,60m,4h,1d（基于自然日，GMT时间）,1w（基于自然周，GMT时间）,1M（基于自然月，GMT时间）,1y（基于自然年，GMT时间）	|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以ts为key进行检索	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
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

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	levels	|	integer	|	FALSE	|	MBP档位	|	5,10,20,50,100	|	5	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	    {  ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
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

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,300]	|	1	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按tradeTime倒序排列	|		|
|	     { symbol	|	string	|	TRUE	|	显示代码	|		|
|	      tradeId	|	long	|	TRUE	|	最近成交编号	|		|
|	      tradePrice	|	string	|	TRUE	|	最近成交价	|		|
|	      tradeVolume	|	string	|	TRUE	|	最近成交量（仅对合约代码有效）	|		|
|	      tradeTime	|	long	|	TRUE	|	最近成交时间	|		|
|	      aggrOrdSide }	|	string	|	TRUE	|	最近成交主动方（即taker的买卖方向，仅对合约代码有效）	|	buy,sell	|

## 市场快照

- GET ` /market/summary`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|symbol	|string|	TRUE|	合约代码	|||	


> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      open	|	string	|	TRUE	|	滚动24小时日开盘价	|		|
|	      high	|	string	|	TRUE	|	滚动24小时日最高价	|		|
|	      low	|	string	|	TRUE	|	滚动24小时日最低价	|		|
|	      close	|	string	|	TRUE	|	滚动24小时日收盘价	|		|
|	      numOfTrades	|	integer	|	TRUE	|	滚动24小时日总成交笔数	|		|
|	      totalVolume	|	string	|	TRUE	|	滚动24小时日总成交量	|		|
|	      turnover	|	string	|	TRUE	|	滚动24小时日总成交额	|		|
|	      instStatus	|	string	|	TRUE	|	合约状态 symbol status	|	normal,intraday-suspended,price-limit	|
|	      openInt }	|	long	|	TRUE	|	持仓量	|		|

# REST接口 - Benchmark（公共数据）

## 历史资金费率

- GET ` /market/funding-rate`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以fundingTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	1	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      data	|	object	|	TRUE	|	按fundingTime倒序排列	|		|
|	           { fundingRate	|	string	|	TRUE	|	结算资金费率	|		|
|	            fundingTime }}|	long	|	TRUE	|	资金费用结算时间	|		|

## 预测资金费率

- GET ` /market/indicative-funding-rate`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	    { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      indFundRate	|	string	|	TRUE	|	预估资金费率	|		|
|	      indFundTime }	|	long	|	TRUE	|	预估资金费用结算时间	|		|

## 指数价格及成分（动态）

- GET ` /market/index-constituents`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以indexTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	1	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按indexTime倒序排列	|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
|	      data	|	object	|	TRUE	|		|		|
|	           { indexPrice	|	string	|	TRUE	|	指数价格，本阶段18位，后期根据配置提供（truncate)	|		|
|	            indexTime	|	long	|	TRUE	|	指数计算时间	|		|
|	            constituents	|	array	|	TRUE	|	按constituent正序排列	|		|
|	                 { constituent	|	string	|	TRUE	|	指数成分， [Exchange Name] + [.] + [Symbol]	|		|
|	                  price	|	string	|	TRUE	|	成分价格	|		|
|	                  weight }}}	|	string	|	TRUE	|	成分权重（百分比），精度：小数点后4位	|		|

# REST接口 - 参考数据类（公共数据）

## 查询合约要素

- GET ` /reference/instruments`

```json

```

### 请求参数

|名称	|数据类型| 是否必需|描述|取值|缺省值|
| ---- | -------- | -------- | ---- | ---- |
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|

> Response:

```json

```

### 返回字段

|	名称 | 数据类型	|	是否必需 | 描述	|	取值 |
| ---- | -------- | -------- | ---- | ---- |
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按symbol正序排列	|		|
|	     { ts	|	long	|	TRUE	|	消息更新时间	|		|
|	      symbol	|	string	|	TRUE	|	合约代码	|		|
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
|	            riskLimit	|	long	|	TRUE	|	风险限额	|		|
|	            initMargin	|	string	|	TRUE	|	起始保证金率	|		|
|	            maintMargin	|	string	|	TRUE	|	维持保证金率	|		|
|	            alarmMargin }	|	string	|	TRUE	|	预警保证金率	|		|
|	      takerFeeRate	|	string	|	TRUE	|	taker交易手续费率	|		|
|	      makerFeeRate	|	string	|	TRUE	|	maker交易手续费率	|		|
|	      marginPrecision	|	string	|	TRUE	|	保证金计算精度	|		|
|	      pnlPrecision	|	string	|	TRUE	|	盈亏计算精度	|		|
|	      instStatus	|	string	|	TRUE	|	合约状态	|	pre-listing,normal,interday-suspended,delisted	|
|	      listingDate }	|	long	|	FALSE	|	开始交易日期（仅适用于instStatus=pre-listing）	|		|

