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

|  生效时间（北京时间 UTC+8) | 接口 | 新增 / 修改 | 摘要 |
|-----|-----|-----|-----|
|2019.11.25 19:00| ||初版|



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


|	类别	|	接口	|	路径	|	API权限	|
|--------- | --------- | -----------|-----------|
|	订单类接口（私有数据）	|	下单	|	[POST /orders](#下单逐一下单)	|	交易	|
|		|	批量撤单	|	DELETE /orders	|	交易	|
|		|	查询特定订单	|	GET /orders/detail	|	交易	|
|		|	查询open订单	|	GET /orders/open-orders	|	读取	|
|		|	查询历史订单	|	GET /orders/history	|	读取	|
|		|	查询历史成交	|	GET /orders/trades	|	读取	|
|	仓位类接口（私有数据）|	查询仓位	|	GET /positions	|	读取	|
|		|	调整仓位设置	|	POST /positions/setting	|	交易	|
|		|	仓位保证金划转	|	POST /positions/margin	|	交易	|
|	账户类接口（私有数据）	|	查询账户余额	|	GET /account/balance	|	读取	|
|	行情类接口（公共数据）|	K线	|	GET /market/candlesticks	|	-	|
|		|	有限档位MBP	|	GET /market/mbp	|	-	|
|		|	市场成交	|	GET /market/trades	|	-	|
|		|	市场快照	|	GET /market/summary	|	-	|
|	Benchmark接口（公共数据）	|	资金费率	|	GET /market/funding-rate	|	-	|
|		|	预测资金费率	|	GET /market/indicative-funding-rate	|	-	|
|		|	指数价格及成分（动态）	|	GET /market/index-constituents	|	-	|
|	参考数据类接口（公共数据）	|	查询合约要素	|	GET /reference/instruments	|	-	|


# WebSocket Interface

|  类别    | 接口     |  主题    |  API权限    |
| ---- | ---- | ---- | ---- |
| 订单类接口（私有数据） | 订阅订单更新 - 创建 | orders#${symbol} | 读取 |
|		|	订阅订单更新 - 触发	|	orders#${symbol}	|	读取	|
|		|	订阅订单更新 - 成交	|	orders#${symbol}	|	读取	|
|		|	订阅订单更新 - 撤销	|	orders#${symbol}	|	读取	|
|	仓位类接口（私有数据）	|	订阅仓位更新	|	positions#${symbol}	|	读取	|
|	账户类接口（私有数据） |	订阅账户流水	|	accounts#${currency}	|	读取	|
|	行情类接口（公共数据）	|	订阅&请求K线	|	candlestick#${symbol}@${interval}	|	-	|
|		|	订阅&请求有限档位MBP	|	mbp#${symbol}@${levels}	|	-	|
|		|	订阅&请求市场成交	|	trades#${symbol}	|	-	|
|		|	订阅市场快照	|	summary#${symbol}	|	-	|
|	Benchmark类接口（公共数据） |	订阅预测资金费率	|	ind.funding.rate#${symbol}	|	-	|
|		|	订阅指数价格及成分（动态）	|	index.cons#${symbol}	|	-	|