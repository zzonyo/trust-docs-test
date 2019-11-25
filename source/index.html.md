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

