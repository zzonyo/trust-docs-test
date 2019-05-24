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

Welcome to the Huobi API! You can use our API to access all market data, trading, and account management endpoints.

We have code example in Shell! You can view code examples in the dark area to the right.

You can use the drop down list above to change the API version. You can also use the language option at the top right to switch documentation language.

## Market Maker Program

Market maker program gives clients with good market making strategy an opportunity to access customized trading fee structure.

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotion.
</aside>

### Eligibility Criteria as a Market Maker on Huobi Global

1. You should possess good market strategy
2. You must have at least 20 BTC or equivalent assets, not including rebates in your account with Huobi Global

### Application Process as Market Maker on Huobi Global

If you satisfied our eligibility criteria and is interested to participate in our market-making project, please email to MM_service@huobi.com with following information:

1. UIDs (not linked to any rebate program in any accounts)
2. Provide screenshot of trading volume for the past 30 days or VIP/corporate status with other Exchanges
3. A brief description in writing of your market-making strategy

## Sub Account

Sub account can be used to isolate asset and trading. Asset can be transferred between master account and sub accounts, then sub account user can trade with asset in sub account only. Asset cannot be withdraw from sub account directly.

Sub account has its individual login credential and API key.

<aside class="notice">
An API Key of a sub users can also be boundled with IP addresses. The API Key without boundled IP address will expire in 90 days. 
</aside>

Sub account API can access all reference data and market data endpoints. In addition, sub account API can also access below listed endpoints.

Request Mehtod    | Description
----------------  |-----------------------
[POST/v1/order/orders/place](https://huobiapi.github.io/docs/v1/en/#place-a-new-order) | Place an order |
[POST/v1/order/orders/{order-id}/submitcancel](https://huobiapi.github.io/docs/v1/en/#submit-cancel-for-an-order) | Request to cancel an order |
[POST /v1/order/orders/batchcancel](https://huobiapi.github.io/docs/v1/en/#submit-cancel-for-multiple-orders-by-ids) | Request to cancel a batch of orders |
[POST /v1/order/orders/batchCancelOpenOrders](https://huobiapi.github.io/docs/v1/en/#submit-cancel-for-multiple-orders-by-criteria) | Request to cancel a batch of orders with criteria |
[GET /v1/account/accounts](https://huobiapi.github.io/docs/v1/en/#get-all-accounts-of-the-current-user) | get the status of an account|
[GET /v1/account/accounts/{account-id}/balance](https://huobiapi.github.io/docs/v1/en/#get-account-balance-of-a-specific-account) | Get the balance of an account |
[GET /v1/order/orders/{order-id}](https://huobiapi.github.io/docs/v1/en/#get-the-order-detail-of-an-order) |Get the details of an order|
[GET /v1/order/orders/{order-id}/matchresults](https://huobiapi.github.io/docs/v1/en/#get-the-match-result-of-an-order) |Get detail match results of an order |
[GET /v1/order/orders](https://huobiapi.github.io/docs/v1/en/#search-past-orders) | Search for a group of orders, which meet certain criteria (up to 100) |
[GET /v1/order/matchresults](https://huobiapi.github.io/docs/v1/en/#search-match-results) | Search for the trade records of an account|
[GET /v1/order/openOrders](https://huobiapi.github.io/docs/v1/en/#get-all-open-orders) | Get the open orders of an account (up to 500)|
[POST /v1/futures/transfer](https://huobiapi.github.io/docs/v1/en/#transfer-fund-between-spot-account-and-future-contract-account) | Transfer fund between spot account and future contract account of a user.

<aside class="notice">
When sub users tries to access the other APIs not on this list, the system will return error-code 403.
</aside>

# Changelog

| Live Date Time (UTC+8) | Change Detail |
|-----                   | -----         |
| 2019.05.15 10:30| Add a new endpoint to allow a user to tranfer fund between spot account and future contract account. 
| 2019.04.29 20:30| Add new interface for historical order querying within 48 hours. With the launching of this new endpoint, the existing REST endpoint “v1/order/orders” will be kept in service. However, the new endpoint “/v1/order/history” will have better service level than the “/v1/order/orders”, especially when the service loading exceeds the threshold of our system, which means in some extremely cases, “v1/order/orders” would become unavailable, but “/v1/order/history” would be kept alive. Meanwhile, Huobi is planning to have a delegated data service to support users’ demands on long-term history data. Once this new service become available, the “v1/order/orders” will be deprecated. We will keep you informed promptly once the timeline determined.
| 2019.04.17 20:30| Add clarification on the value range for start-date for GET /v1/order/orders
| 2019.04.16 10:00 | Correct the error. Both account-id and symbol are required for GET /v1/order/openOrders
| 2019.01.17 07:00 | Add subscription parameter `model`. <br> Subscription does not return frozen balance of sub-account anymore.
| 2018.07.10 11:00 | In `/market/history/kline` the `size` parameter value range changes from [1-1000] to [1-2000].
| 2018.07.06 16:00 | In `/v1/order/orders/place` add `buy-limit-maker` and `sell-limit-maker` order types. <br> Add new endpoint: `/v1/order/openOrders`. <br> Add new endpint: `/v1/order/orders/batchCancelOpenOrders`
| 2018.07.02 16:00 | ETF endpints now support transfer in/out of HB10.
| 2018.06.20 16:00 | Add new endpoint: `/market/tickers`.

# API Access

## Access URLs

**REST API**

**`https://api.huobi.pro`**

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

To be able to create signature you should first acquire an API key and the corresponding secret key. You can manage you API keys by login to your account at huobi.com and go to "API Management" under "Account" section.

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

## Error Information

Each error will have a code and err-msg which explain the details of the error.

### Market Data API Error Message

| Error Code  | Description |
|-----|-----|
| bad-request | Bad request |
| invalid-parameter | Request parameter is invalid |
| invalid-command | Request options are wrong |

### Trading API Error Message

| Error Code  | Description |
|-----        | -----|
| base-symbol-error |  trading symbol does not exist |
| base-currency-error |  Trading currency does not exist |
| base-date-error | Bad date format |
| account-frozen-balance-insufficient-error | Insufficient balance |
| account-transfer-balance-insufficient-error | Insufficient balance for transfer |
| bad-argument | Bad arguments |
| api-signature-not-valid | API signature not valid |
| gateway-internal-error | System is busy |
| ad-ethereum-addresss| Ethereum address is needed |
| order-accountbalance-error| Account balance insufficient |
| order-limitorder-price-error| Price of limit order is invalid |
|order-limitorder-amount-error| Amount of limit order is invalid |
|order-orderprice-precision-error| Price precision not supported |
|order-orderamount-precision-error| Amount prevision not supported |
|order-marketorder-amount-error| Market order amount is invalid|
|order-queryorder-invalid| Cannot find queried order|
|order-orderstate-error|Order status is invalid|
|order-datelimit-error|Order query timeout|
|order-update-error| Order update error|

## SDK & Code Demo

**SDK(recommended)**

[Java](https://github.com/huobiapi/huobi_Java)

[Python3](https://github.com/huobiapi/huobi_Python)

[C++](https://github.com/huobiapi/huobi_Cpp)



**Websocket**

[Python3](https://github.com/huobiapi/Websocket-Python3-demo)

[Node.js](https://github.com/huobiapi/WebSocket-Node.js-demo)

[PHP](https://github.com/huobiapi/WebSocket-PHP-demo)

**REST**

[Python3](https://github.com/huobiapi/REST-Python3-demo)

[Java](https://github.com/huobiapi/REST-Java-demo)

[Node.js](https://github.com/huobiapi/REST-Node.js-demo)

[C#](https://github.com/huobiapi/REST-CSharp-demo)

[go](https://github.com/huobiapi/REST-GO-demo)

[PHP](https://github.com/huobiapi/REST-PHP-demo)

[C++](https://github.com/huobiapi/REST-Cpp-demo)

[Objective-C](https://github.com/huobiapi/REST-ObjectiveC-demo)

[QTC++](https://github.com/huobiapi/REST-QTCpp-demo)

[Python2.7](https://github.com/huobiapi/REST-Python2.7-demo)

[Ruby](https://github.com/huobiapi/REST-Ruby-demo)

[易语言](https://github.com/huobiapi/REST-YiYuyan-demo)

## Issue and Solution

### Unstable Connection to API Service

* Make sure you are using api.huobi.pro as the URL root to access the API
* Choose to use AWS Tokyo as your hosting server should help

### Fail to Sign API Request

* Check if API key is correct and is still valid (not expired)
* Check if you have previously set whitelist with your API key and your hosting server is in the whitelist
* Check if you are using the correct timestamp in your signature
* Check if you are using the correct encoding in your signature, e.g. base64 for initial signature and URI for final request
* Check if you added parameters in ASCII order when creating the signature string

### Receive "login-required"

* Check for parameter `account-id` if you are using account-id from `/v1/account/accounts`. Make sure you are using those id not your UID.

### Receive "gateway-internal-error"

* Check if your post request have set header `Content-Type:application/json`

# Reference Data

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
    {
        "base-currency": "btc",
        "quote-currency": "usdt",
        "price-precision": 2,
        "amount-precision": 4,
        "symbol-partition": "main",
        "symbol": "btcusdt"
    }
    {
        "base-currency": "eth",
        "quote-currency": "usdt",
        "price-precision": 2,
        "amount-precision": 4,
        "symbol-partition": "main",
        "symbol": "ethusdt"
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
symbol-partition| string    | Trading section, possible values: [main，innovation，bifurcation]

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

## Get Current System Time

This endpoint returns the current system time in milliseconds adjusted to Beijing time zone.

```shell
curl "https://api.huobi.pro/v1/common/timestamp"
```

### HTTP Request

`GET /v1/common/timestamp`

### Request Parameters

No parameter is needed for this endpoint.

> Response:

```json
  "data": 1494900087029
```

### Response Content

The returned "Data" field contains an integer represents the timestamp in milliseconds adjusted to Beijing time.

# Market Data

## Get Klines(Candles)

This endpoint retrieves all klines in a specific range.

### HTTP Request

`GET https://api.huobi.pro/market/history/kline`

```shell
curl "https://api.huobi.pro/market/history/kline?period=1day&size=200&symbol=btcusdt"
```

### Query Parameters

Parameter | Data Type | Required | Default | Description                 | Value Range
--------- | --------- | -------- | ------- | -----------                 | -----------
symbol    | string    | true     | NA      | The trading symbol to query | All trading symbol supported, e.g. btcusdt, bccbtc
period    | string    | true     | NA      | The period of each candle   | 1min, 5min, 15min, 30min, 60min, 1day, 1mon, 1week, 1year
size      | integer   | false    | 150     | The number of data returns  | [1, 2000]

<aside class="notice">To query hb10, put "hb10" at symbol position.</aside>

> The above command returns JSON structured like this:

```json
"data": [
  {
    "id": 1499184000,
    "amount": 37593.0266,
    "count": 0,
    "open": 1935.2000,
    "close": 1879.0000,
    "low": 1856.0000,
    "high": 1940.0000,
    "vol": 71031537.97866500
  }
]
```

### Response Content

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | The UNIX timestamp in seconds as response id
amount    | float     | The aggregated trading volume in USDT
count     | integer   | The number of completed trades
open      | float     | The opening price
close     | float     | The closing price
low       | float     | The low price
high      | float     | The high price
vol       | float     | The trading volume in base currency

## Get Latest Aggregated Ticker

This endpoint retrieves the latest ticker with some important 24h aggregated market data.

### HTTP Request

`GET https://api.huobi.pro/market/detail/merged`

```shell
curl "https://api.huobi.pro/market/detail/merged?symbol=ethusdt"
```

### Request Parameters

Parameter | Data Type | Required | Default | Description                  | Value Range
--------- | --------- | -------- | ------- | -----------                  | --------
symbol    | string    | true     | NA      | The trading symbol to query  | All supported trading symbol, e.g. btcusdt, bccbtc

> The above command returns JSON structured like this:

```json
"data": {
  "id":1499225271,
  "ts":1499225271000,
  "close":1885.0000,
  "open":1960.0000,
  "high":1985.0000,
  "low":1856.0000,
  "amount":81486.2926,
  "count":42122,
  "vol":157052744.85708200,
  "ask":[1885.0000,21.8804],
  "bid":[1884.0000,1.6702]
}
```

### Response Content

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | The UNIX timestamp in seconds as response id
amount    | float     | The aggregated trading volume in USDT
count     | integer   | The number of completed trades
open      | float     | The opening price of last 24 hours
close     | float     | The last price of last 24 hours
low       | float     | The low price of last 24 hours
high      | float     | The high price of last 24 hours
vol       | float     | The trading volume in base currency of last 24 hours
bid       | object    | The current best bid in format [price, quote volume]
ask       | object    | The current best ask in format [price, quote volume]

## Get Latest Tickers for All Pairs

This endpoint retrieves the latest tickers for all supported pairs.

<aside class="notice">The returned data object can contain large amount of tickers.</aside>

### HTTP Request

`GET https://api.huobi.pro/market/tickers`

```shell
curl "https://api.huobi.pro/market/tickers"
```

### Request Parameters

No parameters are needed for this endpoint.

> The above command returns JSON structured like this:

```json
"data": [  
    {  
        "open":0.044297,
        "close":0.042178,
        "low":0.040110,
        "high":0.045255,
        "amount":12880.8510,  
        "count":12838,
        "vol":563.0388715740,
        "symbol":"ethbtc"
    },
    {  
        "open":0.008545,
        "close":0.008656,
        "low":0.008088,
        "high":0.009388,
        "amount":88056.1860,
        "count":16077,
        "vol":771.7975953754,
        "symbol":"ltcbtc"
    }
]
```

### Response Content

Response content is an array of object, each object has below fields.

Field     | Data Type | Description
--------- | --------- | -----------
amount    | float     | The aggregated trading volume in USDT of last 24 hours
count     | integer   | The number of completed trades of last 24 hours
open      | float     | The opening price of last 24 hours
close     | float     | The last price of last 24 hours
low       | float     | The low price of last 24 hours
high      | float     | The high price of last 24 hours
vol       | float     | The trading volume in base currency of last 24 hours
symbol    | string    | The trading symbol of this object, e.g. btcusdt, bccbtc

## Get Market Depth

This endpoint retrieves the current order book of a specific pair.

### HTTP Request

`GET https://api.huobi.pro/market/depth`

```shell
curl "https://api.huobi.pro/market/depth?symbol=btcusdt&type=step1"
```

### Request Parameters

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | The trading symbol to query                       | All supported trading symbols, e.g. btcusdt, bccbtc
depth     | integer   | false    | 20                    | The number of market depth to return on each side | 5, 10, 20
type      | string    | true     | step0                 | Market depth aggregation level, details below     | step0, step1, step2, step3, step4, step5

<aside class="notice">when type is set to "step0", the default value of "depth" is 150 instead of 20.</aside>

**"type" Details**

Value     | Description
--------- | ---------
step0     | No market depth aggregation
step1     | Aggregation level = precision*10
step2     | Aggregation level = precision*100
step3     | Aggregation level = precision*1000
step4     | Aggregation level = precision*10000
step5     | Aggregation level = precision*100000

> The above command returns JSON structured like this:

```json
"tick": {
    "version": 31615842081,
    "ts": 1489464585407,
    "bids": [
      [7964, 0.0678],
      [7963, 0.9162],
      [7961, 0.1],
      [7960, 12.8898],
      [7958, 1.2],
      [7955, 2.1009],
      [7954, 0.4708],
      [7953, 0.0564],
      [7951, 2.8031],
      [7950, 13.7785],
      [7949, 0.125],
      [7948, 4],
      [7942, 0.4337],
      [7940, 6.1612],
      [7936, 0.02],
      [7935, 1.3575],
      [7933, 2.002],
      [7932, 1.3449],
      [7930, 10.2974],
      [7929, 3.2226]
    ],
    "asks": [
      [7979, 0.0736],
      [7980, 1.0292],
      [7981, 5.5652],
      [7986, 0.2416],
      [7990, 1.9970],
      [7995, 0.88],
      [7996, 0.0212],
      [8000, 9.2609],
      [8002, 0.02],
      [8008, 1],
      [8010, 0.8735],
      [8011, 2.36],
      [8012, 0.02],
      [8014, 0.1067],
      [8015, 12.9118],
      [8016, 2.5206],
      [8017, 0.0166],
      [8018, 1.3218],
      [8019, 0.01],
      [8020, 13.6584]
    ]
  }
```

### Response Content

<aside class="notice">The returned data object is under 'tick' object instead of 'data' object in the top level JSON</aside>

Field     | Data Type | Description
--------- | --------- | -----------
ts        | integer   | The UNIX timestamp in milliseconds adjusted to Beijing time
version   | integer   | Internal data
bids      | object    | The current all bids in format [price, quote volume]
asks      | object    | The current all asks in format [price, quote volume]

## Get the Last Trade

This endpoint retrieves the latest trade with its price, volume, and direction.

### HTTP Request

`GET https://api.huobi.pro/market/trade`

```shell
curl "https://api.huobi.pro/market/trade?symbol=ethusdt"
```

### Request Parameters

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | The trading symbol to query                       | All supported trading symbols, e.g. btcusdt, bccbtc

> The above command returns JSON structured like this:

```json
"tick": {
    "id": 600848670,
    "ts": 1489464451000,
    "data": [
      {
        "id": 600848670,
        "price": 7962.62,
        "amount": 0.0122,
        "direction": "buy",
        "ts": 1489464451000
      }
    ]
}
```

### Response Content

<aside class="notice">The returned data object is under 'tick' object instead of 'data' object in the top level JSON</aside>

Parameter | Data Type | Description
--------- | --------- | -----------
id        | integer   | The unique trade id of this trade
amount    | float     | The trading volume in base currency
price     | float     | The trading price in quote currency
ts        | integer   | The UNIX timestamp in milliseconds adjusted to Beijing time
direction | string    | The direction of the taker trade: 'buy' or 'sell'

## Get the Most Recent Trades

This endpoint retrieves the most recent trades with their price, volume, and direction.

### HTTP Request

`GET https://api.huobi.pro/market/history/trade`

```shell
curl "https://api.huobi.pro/market/history/trade?symbol=ethusdt&size=2"
```

### Request Parameters

Parameter | Data Type | Required | Default Value    | Description                   | Value Range
--------- | --------- | -------- | -------------    | ----------                    | -----------
symbol    | string    | true     | NA               | The trading symbol to query   | All supported trading symbols, e.g. btcusdt, bccbtc
size      | integer   | false    | 1                | The number of data returns    | [1, 2000]

> The above command returns JSON structured like this:

```json
"data": [  
   {  
      "id":31618787514,
      "ts":1544390317905,
      "data":[  
         {  
            "amount":9.000000000000000000,
            "ts":1544390317905,
            "id":3161878751418918529341,
            "price":94.690000000000000000,
            "direction":"sell"
         },
         {  
            "amount":73.771000000000000000,
            "ts":1544390317905,
            "id":3161878751418918532514,
            "price":94.660000000000000000,
            "direction":"sell"
         }
      ]
   },
   {  
      "id":31618776989,
      "ts":1544390311353,
      "data":[  
         {  
            "amount":1.000000000000000000,
            "ts":1544390311353,
            "id":3161877698918918522622,
            "price":94.710000000000000000,
            "direction":"buy"
         }
      ]
   }
]
```

### Response Content

<aside class="notice">The returned data object is an array represents one recent timestamp; each timestamp object again is an array represents all trades occurred at this timestamp.</aside>

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | The unique trade id of this trade
amount    | float     | The trading volume in base currency
price     | float     | The trading price in quote currency
ts        | integer   | The UNIX timestamp in milliseconds adjusted to Beijing time
direction | string    | The direction of the taker trade: 'buy' or 'sell'

## Get the Last 24h Market Summary

This endpoint retrieves the summary of trading in the market for the last 24 hours.

### HTTP Request

`GET https://api.huobi.pro/market/detail/`

```shell
curl "https://api.huobi.pro/market/detail?symbol=ethusdt"
```

### Request Parameters

Parameter | Data Type | Required | Default Value    | Description                   | Value Range
--------- | --------- | -------- | -------------    | ----------                    | -----------
symbol    | string    | true     | NA               | The trading symbol to query   | All supported trading symbols, e.g. btcusdt, bccbtc

> The above command returns JSON structured like this:

```json
"tick": {  
   "amount":613071.438479561,
   "open":86.21,
   "close":94.35,
   "high":98.7,
   "id":31619471534,
   "count":138909,
   "low":84.63,
   "version":31619471534,
   "vol":5.6617373443873316E7
}
```

### Response Content

<aside class="notice">The returned data object is under 'tick' object instead of 'data' object in the top level JSON</aside>

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | The UNIX timestamp in seconds as response id
amount    | float     | The aggregated trading volume in USDT
count     | integer   | The number of completed trades
open      | float     | The opening price of last 24 hours
close     | float     | The last price of last 24 hours
low       | float     | The low price of last 24 hours
high      | float     | The high price of last 24 hours
vol       | float     | The trading volume in base currency of last 24 hours
version   | integer   | Internal data

# Account

<aside class="notice">All endpoints in this section require authentication</aside>

## Get all Accounts of the Current User

This endpoint returns a list of accounts owned by this API user.

### HTTP Request

`GET https://api.huobi.pro/v1/account/accounts`

```shell
curl "https://api.huobi.pro/v1/account/accounts"
```

### Request Parameters

<aside class="notice">No parameter is available for this endpoint</aside>

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "id": 100009,
      "type": "spot",
      "state": "working",
      "user-id": 1000
    }
  ]
```

### Response Content

Field               | Data Type | Description              | Value Range
---------           | --------- | -----------              | -----------
id                  | integer   | Unique account id        | NA
state               | string    | Account state            | working, lock
type                | string    | The type of this account | spot, margin, otc, point

<aside class="notice">Margin account will only be created after the first margin loan order.</aside>

## Get Account Balance of a Specific Account

This endpoint returns the balance of an account specified by account id.

### HTTP Request

`GET https://api.huobi.pro/v1/account/accounts/{account-id}/balance`

'account-id': The specified account id to get balance for, can be found by query '/account/accounts' endpoint.

```shell
curl "https://api.huobi.pro/v1/account/accounts/100009/balance"
```

### Request Parameters

<aside class="notice">No parameter is needed for this endpoint</aside>

> The above command returns JSON structured like this:

```json
"data": {
    "id": 100009,
    "type": "spot",
    "state": "working",
    "list": [
      {
        "currency": "usdt",
        "type": "trade",
        "balance": "500009195917.4362872650"
      },
      {
        "currency": "usdt",
        "type": "frozen",
        "balance": "328048.1199920000"
      },
     {
        "currency": "etc",
        "type": "trade",
        "balance": "499999894616.1302471000"
      }
    ],
  }
}
```

### Response Content

Field               | Data Type | Description              | Value Range
---------           | --------- | -----------              | -----------
id                  | integer   | Unique account id        | NA
state               | string    | Account state            | working, lock
type                | string    | The type of this account | spot, margin, otc, point
list                | object    | The balance details of each currency

**Per list item content**

Field               | Data Type | Description                           | Value Range
---------           | --------- | -----------                           | -----------
currency            | string    | The currency of this balance          | NA
type                | string    | The balance type                      | trade, frozen
balance             | string    | The balance in the main currency unit | NA

## Get Account Balance of a Sub-Account

This endpoint returns the balance of a sub-account specified by sub-account uid.

### HTTP Request

`GET https://api.huobi.pro/v1/account/accounts/{sub-account-uid}`

'sub-account-uid': The specified sub account id to get balance for.

```shell
curl "https://api.huobi.pro/v1/account/accounts/10758899"
```

### Request Parameters

<aside class="notice">No parameter is needed for this endpoint</aside>

> The above command returns JSON structured like this:

```json
"data": [
  {
    "id": 9910049,
    "type": "spot",
    "list": [
              {
        "currency": "btc",
          "type": "trade",
          "balance": "1.00"
      },
      {
        "currency": "eth",
        "type": "trade",
        "balance": "1934.00"
      }
      ]
  },
  {
    "id": 9910050,
    "type": "point",
    "list": []
  }
]
```

### Response Content

<aside class="notice">The returned "data" object is a list of accounts under this sub-account</aside>

Field               | Data Type | Description                           | Value Range
---------           | --------- | -----------                           | -----------
id                  | integer   | Unique account id                     | NA
type                | string    | The type of this account              | spot, margin, otc, point
list                | object    | The balance details of each currency  | NA

**Per list item content**

Field               | Data Type | Description                           | Value Range
---------           | --------- | -----------                           | -----------
currency            | string    | The currency of this balance          | NA
type                | string    | The balance type                      | trade, frozen
balance             | string    | The balance in the main currency unit | NA

## Get the Aggregated Balance of all Sub-accounts of the Current User

This endpoint returns the balances of all the sub-account aggregated.

### HTTP Request

`GET https://api.huobi.pro/v1/subuser/aggregate-balance`

```shell
curl "https://api.huobi.pro/v1/subuser/aggregate-balance"
```

> The above command returns JSON structured like this:

```json
  "data": [
      {
        "currency": "eos",
        "balance": "1954559.809500000000000000"
      },
      {
        "currency": "btc",
        "balance": "0.000000000000000000"
      },
      {
        "currency": "usdt",
        "balance": "2925209.411300000000000000"
      }
   ]
```

### Request Parameters

<aside class="notice">No parameter is needed for this endpoint</aside>

### Response Content

<aside class="notice">The returned "data" object is a list of aggregated balances</aside>

Field               | Data Type | Description
---------           | --------- | -----------
currency            | string    | The currency of this balance
balance             | string    | The total balance in the main currency unit including all balance and frozen banlance

## Transfer Asset between Parent and Sub Account

This endpoint allows user to transfer asset between parent and sub account.

### HTTP Request

`POST https://api.huobi.pro/v1/subuser/transfer`

```shell
curl -X POST "https://api.huobi.pro/v1/subuser/transfer" -H "Content-Type: application/json" -d '{"sub-uid": 12345, "currency": "btc", "amount": 123.5, "type": "master-transfer-in"}'
```

### Request Parameters

Parameter  | Data Type | Required | Description                                       | Value Range
---------  | --------- | -------- | -----------                                       | -----------
sub-uid    | integer   | true     | The target sub account uid to transfer to or from | NA
currency   | string    | true     | The crypto currency to transfer                   | NA
amount     | decimal   | true     | The amount of asset to transfer                   | NA
type       | string    | true     | The type of transfer                              | master-transfer-in, master-transfer-out, master-point-transfer-in, master-point-transfer-out

> The above command returns JSON structured like this:

```json
  "data": 12345
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Unique transfer id

# Wallet (Deposit and Withdraw)

<aside class="notice">All endpoints in this section require authentication</aside>

## Create a Withdraw Request

This endpoint creates a withdraw request from your spot trading account to an external address.

<aside class="notice">Only supported the existed addresses in your withdraw address list</aside>

### HTTP Request

`POST https://api.huobi.pro/v1/dw/withdraw/api/create`

```shell
curl -X POST -H "Content-Type: application/json" "https://api.huobi.pro/v1/dw/withdraw/api/create" -d
'{
  "address": "0xde709f2102306220921060314715629080e2fb77",
  "amount": "0.05",
  "currency": "eth",
  "fee": "0.01"
}'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
address    | string    | true     | NA      | The desination address of this withdraw
currency   | string    | true     | NA      | The crypto currency to withdraw
amount     | string    | true     | NA      | The amount of currency to withdraw
fee        | string    | false    | NA      | The fee to pay with this withdraw
chain      | string    | false    | NA      | set "usdterc20" to withdraw USDT(erc20)
addr-tag   | string    | false    | NA      | A tag specified for this address

> The above command returns JSON structured like this:

```json
{  
  "data": 1000
}
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Transfer id

<aside class="notice">All new transfer id will be incremental to the previous ids. This allows search by transfer id sequences</aside>


## Cancel a Withdraw Request

This endpoint cancels a previously created withdraw request by its transfer id.

### HTTP Request

`POST https://api.huobi.pro/v1/dw/withdraw-virtual/{withdraw-id}/cancel`

```shell
curl -X POST "https://api.huobi.pro/v1/dw/withdraw-virtual/1000/cancel"
```

'withdraw-id': the id returned when previously created a withdraw request

### Request Parameters

<aside class="notice">No parameter is needed for this endpoint</aside>

> The above command returns JSON structured like this:

```json
  "data": 700
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Parameter           | Data Type | Description
---------           | --------- | -----------
data                | integer   | Withdraw cancel id


## Search for Existed Withdraws and Deposits

This endpoint searches for all existed withdraws and deposits and return their latest status.

### HTTP Request

`GET https://api.huobi.pro/v1/query/deposit-withdraw`

```shell
curl "https://api.huobi.pro/v1/query/deposit-withdraw?currency=xrp&type=deposit&from=5&size=12"
```

### Request Parameters

Parameter  | Data Type | Required | Description                     | Value Range
---------  | --------- | -------- | -----------                     | ------------
currency   | string    | true     | The crypto currency to withdraw | NA
type       | string    | true     | Define transfer type to search  | deposit, withdraw
from       | string    | true     | The transfer id to begin search | NA
size       | string    | true     | The number of items to return   | NA

> The above command returns JSON structured like this:

```json
{  
    "data": [
      {
        "id": 1171,
        "type": "deposit",
        "currency": "xrp",
        "tx-hash": "ed03094b84eafbe4bc16e7ef766ee959885ee5bcb265872baaa9c64e1cf86c2b",
        "amount": 7.457467,
        "address": "rae93V8d2mdoUQHwBDBdM4NHCMehRJAsbm",
        "address-tag": "100040",
        "fee": 0,
        "state": "safe",
        "created-at": 1510912472199,
        "updated-at": 1511145876575
      }
    ]
}
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | Transfer id
type                | string    | Define transfer type to search, possible values: [deposit, withdraw]
currency            | string    | The crypto currency to withdraw
tx-hash             | string    | The on-chain transaction hash
amount              | integer   | The number of crypto asset transfered in its minimum unit
address             | string    | The deposit or withdraw source address
address-tag         | string    | The user defined address tag
fee                 | integer   | The amount of fee taken by Huobi in this crypto's minimum unit
state               | string    | The state of this transfer (see below for details)
created-at          | integer   | The timestamp in milliseconds for the transfer creation
updated-at          | integer   | The timestamp in milliseconds for the transfer's latest update

**List of possible withdraw state**

State           | Description
---------       | -----------
submitted       | Withdraw request submitted successfully
reexamine       | Under examination for withdraw validation
canceled        | Withdraw canceled by user
pass            | Withdraw validation passed
reject          | Withdraw validation rejected
pre-transfer    | Withdraw is about to be released
wallet-transfer | On-chain transfer initiated
wallet-reject   | Transfer rejected by chain
confirmed       | On-chain transfer completed with one confirmation
confirm-error   | On-chain transfer faied to get confirmation
repealed        | Withdraw terminated by system

**List of possible deposit state**

State           | Description
---------       | -----------
unknown         | On-chain transfer has not been received
confirming      | On-chain transfer waits for first confirmation
confirmed       | On-chain transfer confirmed for at least one block
safe            | Multiple on-chain confirmation happened
orphan          | Confirmed but currently in an orphan branch

# Trading

<aside class="notice">All endpoints in this section require authentication</aside>

<aside class="warning">When trade with margin loan from your margin account, "account-id" parameter should be set to margin account id, "source" parameter should be set to "margin-api".</aside>

## Place a New Order

This endpoint place a new order and send to the exchange to be matched.

### HTTP Request

`POST https://api.huobi.pro/v1/order/orders/place`

```shell
curl -X POST -H "Content-Type: application/json" "https://api.huobi.pro/v1/order/orders/place" -d
'{
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"
  }'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                               | Value Range
---------  | --------- | -------- | ------- | -----------                               | -----------
account-id | string    | true     | NA      | The account id used for this trade        | NA
symbol     | string    | true     | NA      | The trading symbol to trade               | All supported trading symbol, e.g. btcusdt, bccbtc
type       | string    | true     | NA      | The order type                            | buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
amount     | string    | true     | NA      | The amount to buy (quote currency) or to sell (base currency) | NA
price      | string    | false    | NA      | The limit price of limit order, only needed for limit order   | NA
source     | string    | false    | api     | When trade with margin use 'margin-api'   | api, margin-api

> The above command returns JSON structured like this:

```json
  "data": "59378"
```

### Response Content

<aside class="notice">The returned data object is a single string which represents the order id</aside>

## Get All Open Orders

This endpoint returns all open orders which have not been filled completely.

### HTTP Request

`GET https://api.huobi.pro/v1/order/openOrders`

```shell
curl "https://api.huobi.pro/v1/order/openOrders?account-id=100009&symbol=btcusdt&side=buy&size=5"
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                             | Value Range
---------  | --------- | -------- | ------- | -----------                             | -----------
account-id | string    | true    | NA      | The account id used for this trade      | NA
symbol     | string    | true    | NA      | The trading symbol to trade             | All supported trading symbols, e.g. btcusdt, bccbtc
side       | string    | false    | NA      | Filter on the direction of the trade    | buy, sell
size       | int       | false    | 10      | The number of orders to return          | [1, 2000]

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "id": 5454937,
      "symbol": "ethusdt",
      "account-id": 30925,
      "amount": "1.000000000000000000",
      "price": "0.453000000000000000",
      "created-at": 1530604762277,
      "type": "sell-limit",
      "filled-amount": "0.0",
      "filled-cash-amount": "0.0",
      "filled-fees": "0.0",
      "source": "web",
      "state": "submitted"
    }
  ]
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | order id
symbol              | string    | The trading symbol to trade, e.g. btcusdt, bccbtc
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the order was created
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-cash-amount  | string    | The filled total in quote currency
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app
state               | string    | submitted, partical-filled, cancelling

## Submit Cancel for an Order

This endpoint submit a request to cancel an order.

<aside class="warning">This only submit the cancel request, the actual result of the canel request needs to be checked by order status or match result endpoints</aside>

### HTTP Request

`POST https://api.huobi.pro/v1/order/orders/{order-id}/submitcancel`

'order-id': the previously returned order id when order was created

```shell
curl -X POST "https://api.huobi.pro/v1/order/orders/59378/submitcancel"
```

### Request Parameters

No parameter is needed for this endpoint.

> The above command returns JSON structured like this:

```json
  "data": "59378"
```

### Response Content

<aside class="notice">The returned data object is a single string which represents the order id</aside>

## Submit Cancel for Multiple Orders by IDs

This endpoint submit cancellation for multiple orders at once with given ids.

### HTTP Request

`POST https://api.huobi.pro/v1/order/orders/batchcancel`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/order/orders/batchcancel" -d
'{
  "order-ids": [
    "1", "2", "3"
  ]
}'
```

### Request Parameters

Parameter  | Data Type | Required | Description
---------  | --------- | -------- | -----------
order-ids  | list      | true     | The order ids to cancel. Max list size is 50.

> The above command returns JSON structured like this:

```json
{  
  "data": {
    "success": [
      "1",
      "3"
    ],
    "failed": [
      {
        "err-msg": "记录无效",
        "order-id": "2",
        "err-code": "base-record-invalid"
      }
    ]
  }
}
```

### Response Content

Field           | Data Type | Description
---------       | --------- | -----------
success         | list      | The order ids with thier cancel request sent successfully
failed          | list      | The details of the failed cancel request

## Submit Cancel for Multiple Orders by Criteria

This endpoint submit cancellation for multiple orders at once with given criteria.

### HTTP Request

`POST https://api.huobi.pro/v1/order/orders/batchcancelopenorders`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/order/orders/batchcancelopenorders" -d
'{
  "account-id": "100009",
  "symbol": "btcusdt",
  "side": "buy",
  "size": 5
}'
```

Parameter  | Data Type | Required | Default | Description                             | Value Range
---------  | --------- | -------- | ------- | -----------                             | -----------
account-id | string    | true    | NA      | The account id used for this cancel     | NA
symbol     | string    | false    | NA      | The trading symbol to cancel            | All supported trading symbols, e.g. btcusdt, bccbtc
side       | string    | false    | NA      | Filter on the direction of the trade    | buy, sell
size       | int       | false    | 100     | The number of orders to cancel          | [1, 100]

> The above command returns JSON structured like this:

```json
  "data": {
    "success-count": 2,
    "failed-count": 0,
    "next-id": 5454600
  }
```

### Response Content

Field           | Data Type | Description
---------       | --------- | -----------
success-count   | integer   | The number of cancel request sent successfully
failed-count    | integer   | The number of cancel request failed
next-id         | integer   | the next order id that can be cancelled

## Get the Order Detail of an Order

This endpoint returns the detail of one order.

### HTTP Request

`GET https://api.huobi.pro/v1/order/orders/{order-id}`

'order-id': the previously returned order id when order was created

```shell
curl "https://api.huobi.pro/v1/order/orders/59378"
```

### Request Parameters

No parameter is needed for this endpoint.

> The above command returns JSON structured like this:

```json
{  
  "data": {
    "id": 59378,
    "symbol": "ethusdt",
    "account-id": 100009,
    "amount": "10.1000000000",
    "price": "100.1000000000",
    "created-at": 1494901162595,
    "type": "buy-limit",
    "field-amount": "10.1000000000",
    "field-cash-amount": "1011.0100000000",
    "field-fees": "0.0202000000",
    "finished-at": 1494901400468,
    "user-id": 1000,
    "source": "api",
    "state": "filled",
    "canceled-at": 0,
    "exchange": "huobi",
    "batch": ""
  }
}
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | order id
symbol              | string    | The trading symbol to trade, e.g. btcusdt, bccbtc
account-id          | string    | The account id which this order belongs to
amount              | string    | The amount of base currency in this order
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the order was created
finished-at         | int       | The timestamp in milliseconds when the order was changed to a final state. This is not the time the order is matched.
canceled-at         | int       | The timestamp in milliseconds when the order was canceled, if not canceled then has value of 0
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-cash-amount  | string    | The filled total in quote currency
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app
state               | string    | Order state: submitted, partical-filled, cancelling, filled, canceled
exchange            | string    | Internal data
batch               | string    | Internal data

## Get the Match Result of an Order

This endpoint returns the match result of an order.

### HTTP Request

`GET https://api.huobi.pro/v1/order/orders/{order-id}/matchresult`

'order-id': the previously returned order id when order was created

```shell
curl "https://api.huobi.pro/v1/order/orders/59378/matchresult"
```

### Request Parameters

No parameter is needed for this endpoint.

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "id": 29553,
      "order-id": 59378,
      "match-id": 59335,
      "symbol": "ethusdt",
      "type": "buy-limit",
      "source": "api",
      "price": "100.1000000000",
      "filled-amount": "9.1155000000",
      "filled-fees": "0.0182310000",
      "created-at": 1494901400435
    }
  ]
```

### Response Content

<aside class="notice">The return data contains a list and each item in the list represents a match result</aside>

Parameter           | Data Type | Description
---------           | --------- | -----------
id                  | integer   | Internal id
symbol              | string    | The trading symbol to trade, e.g. btcusdt, bccbtc
order-id            | string    | The order id of this order
match-id            | string    | The match id of this match
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the match and fill is done
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app

## Search Past Orders

This endpoint returns orders based on a specific searching criteria.

### HTTP Request

`GET https://api.huobi.pro/v1/order/orders`

```shell
curl "https://api.huobi.pro/v1/order/orders?symbol=ethusdt&type=buy-limit&staet=filled"
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                                   | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
symbol     | string    | true     | NA      | The trading symbol to trade                   | All supported trading symbols, e.g. btcusdt, bccbtc
types      | string    | false    | NA      | The types of order to include in the search   | buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc
states     | string    | false    | NA      | The states of order to include in the search  | submitted, partial-filled, partial-canceled, filled, canceled
start-date | string    | false    | -180d    | Search starts date, in format yyyy-mm-dd      | [-180d, end-date]
end-date   | string    | false    | today   | Search ends date, in format yyyy-mm-dd        | [start-date, today]
from       | string    | false    | NA      | Search order id to begin with                 | NA
direct     | string    | false    | both    | Search direction when 'from' is used          | next, prev
size       | int       | false    | 100     | The number of orders to return                | [1, 1000]

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "id": 59378,
      "symbol": "ethusdt",
      "account-id": 100009,
      "amount": "10.1000000000",
      "price": "100.1000000000",
      "created-at": 1494901162595,
      "type": "buy-limit",
      "field-amount": "10.1000000000",
      "field-cash-amount": "1011.0100000000",
      "field-fees": "0.0202000000",
      "finished-at": 1494901400468,
      "user-id": 1000,
      "source": "api",
      "state": "filled",
      "canceled-at": 0,
      "exchange": "huobi",
      "batch": ""
    }
  ]
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | Order id
account-id          | integer   | Account id
user-id             | integer   | User id
amount              | string    | The amount of base currency in this order
symbol              | string    | The trading symbol to trade, e.g. btcusdt, bccbtc
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the order was created
canceled-at         | int       | The timestamp in milliseconds when the order was canceled, or 0 if not canceled
canceled-at         | int       | The timestamp in milliseconds when the order was finished, or 0 if not finished
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-cash-amount  | string    | The filled total in quote currency
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app
state               | string    | submitted, partical-filled, cancelling
exchange            | string    | Internal data
batch               | string    | Internal data

## Search Historical Orders within 48 Hours

This endpoint returns orders based on a specific searching criteria.

### HTTP Request

`GET https://api.huobi.pro/v1/order/history`

```json
{
   "symbol": "btcusdt",
   "start-time": "1556417645419",
   "end-time": "1556533539282",
   "direct": "prev",
   "size": "10"
}
```

### Request Parameters

Parameter  | Required | Data Type | Description | Default Value                                  | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
symbol     | false  | string | The trading symbol to trade      |all      |All supported trading symbols, e.g. btcusdt, bccbtc  |
start-time      | false | long | Start time (included)   |The time 48 hours ago      |UTC time in millisecond |
end-time | false | long | End time (included)  | The query time     |UTC time in millisecond |
direct   | false | string | Direction of the query. (Note: If the total number of items in the search result is within the limitation defined in “size”, this field does not take effect.)| next     |prev, next   |
size     | false  | int | Number of items in each response  |100      | [10,1000] |



> The above command returns JSON structured like this:

```json
{
    "status": "ok",
    "data": [
        {
            "id": 31215214553,
            "symbol": "btcusdt",
            "account-id": 4717043,
            "amount": "1.000000000000000000",
            "price": "1.000000000000000000",
            "created-at": 1556533539282,
            "type": "buy-limit",
            "field-amount": "0.0",
            "field-cash-amount": "0.0",
            "field-fees": "0.0",
            "finished-at": 1556533568953,
            "source": "web",
            "state": "canceled",
            "canceled-at": 1556533568911
        }
    ]
}
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
{account-id         | long      | Account ID
amount              | string    | Order size
canceled-at             | long   | Order cancellation time
created-at              | long    | Order creation time
field-amount              | string    | Executed order amount
field-cash-amount               | string    | Executed cash amount
field-fees          | string       | Transaction fee
finished-at         | long       | Last trade time
id         | long       | Order ID
price                | string   | Order price
source       | string    | Order source
state  | string    | Order status ( filled, partial-canceled, canceled )
symbol         | string    | Trading symbol
type}              | string    | Order type (buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker)
next-time               | long    | Next query “start-time” (in response of “direct” = prev), Next query “end-time” (in response of “direct” = next). Note: Only when the total number of items in the search result exceeded the limitation defined in “size”, this field exists. UTC time in millisecond


## Search Match Results

This endpoint returns the match results of past and open orders based on specific search criteria.

### HTTP Request

`GET https://api.huobi.pro/v1/order/matchresults`

```shell
curl "https://api.huobi.pro/v1/order/matchresults?symbol=ethusdt"
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                                   | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
symbol     | string    | true     | NA      | The trading symbol to trade                   | All supported trading symbols, e.g. btcusdt, bccbtc
types      | string    | false    | NA      | The types of order to include in the search   | buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc
states     | string    | false    | NA      | The states of order to include in the search  | submitted, partial-filled, partial-canceled, filled, canceled
start-date | string    | false    | -61d    | Search starts date, in format yyyy-mm-dd      | NA
end-date   | string    | false    | today   | Search ends date, in format yyyy-mm-dd        | NA
from       | string    | false    | NA      | Search order id to begin with                 | NA
direct     | string    | false    | both    | Search direction when 'from' is used          | next, prev
size       | int       | false    | 100     | The number of orders to return                | [1, 100]

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "id": 29553,
      "order-id": 59378,
      "match-id": 59335,
      "symbol": "ethusdt",
      "type": "buy-limit",
      "source": "api",
      "price": "100.1000000000",
      "filled-amount": "9.1155000000",
      "filled-fees": "0.0182310000",
      "created-at": 1494901400435
    }
  ]
```

### Response Content

<aside class="notice">The return data contains a list and each item in the list represents a match result</aside>

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | Internal id
symbol              | string    | The trading symbol to trade, e.g. btcusdt, bccbtc
order-id            | string    | The order id of this order
match-id            | string    | The match id of this match
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the match and fill is done
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app

## Transfer Fund Between Spot Account and Future Contract Account

This endpoint allows a user to transfer fund between spot account and futrue contract account. 

The Rate Limit for this endpoint is 10 requests per minute.

### HTTP Request

`POST /v1/futures/transfer`

```json
  {"currency":  "btc",
  "amount": 0.01,
  "type": "pro-to-futures"
  }
 
```
### Request Parameters

Parameter  | Data Type | Required | Description|Values
---------  | --------- | -------- | ------- | -----------
currency|TRUE|String|currency name|btc, eth, etc. 
amount|TRUE|Decimal|amount of fund to transfer|
type|TRUE|String|type of the transfer|“futures-to-pro” or “pro-to-futures”

> Response:

```json
  {"data":  123456,
  "status": "ok"
  }
 
```
### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
data                | Long   | Transfer id
status              |string| Request status. "ok" or "error"
err-code            |string| error code. Please refer to the err-code list below for details
err-msg             |string| error message. Please refer to the err-code and err-msg list below for details

### error code
err-code              | err-msg | Comments
---------           | --------- | -----------
base-msg||Other errors, please refer to err-msg list below for details. 
base-currency-error|The currency is invalid|
frequent-invoke|the operation is too frequent. Please try again later|Rate limit is 10/min
banned-by-blacklist|Blacklist restriction|
dw-insufficient-balance|Insufficient balance. You can only transfer {0} at most.|Insufficient balance of spot account
dw-account-transfer-unavailable|account transfer unavailable|This API endpoint is not available.
dw-account-transfer-error|account transfer error|
dw-account-transfer-failed|Failed to transfer. Please try again later.|
dw-account-transfer-failed-account-abnormality|Account abnormality, failed to transfer。Please try again later.|

### error message for 'base-msg' err-code
err-code              | err-msg | Comments
---------           | --------- | -----------
base-msg|Unable to transfer in currently. Please contact customer service.|
base-msg|Unable to transfer out currently. Please contact customer service.|
base-msg|Abnormal contracts status. Can’t transfer.|
base-msg|Sub-account doesn't own the permissions to transfer in. Please contact customer service.|
base-msg|Sub-account doesn't own the permissions to transfer out. Please contact customer service.|
base-msg|The sub-account does not have transfer permissions. Please login main account to authorize.|
base-msg|Insufficient amount available.|Insufficient amount of Future Contract Account
base-msg|The single transfer-out amount must be no less than {0}{1}.|
base-msg|The single transfer-out amount must be no more than {0}{1}.|
base-msg|The single transfer-in amount must be no less than {0}{1}.|
base-msg|The single transfer-in amount must be no more than {0}{1}.|
base-msg|Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.|
base-msg|Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.|
base-msg|Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.|
base-msg|Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.|
base-msg|The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.|
base-msg|The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.|
base-msg|The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.|
base-msg|The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.|
base-msg|Transfer failed. Please try again later or contact customer service.|
base-msg|Abnormal service, transfer failed. Please try again later.|
base-msg|You don’t have access permission as you have not opened contracts trading.|
base-msg|This contract type doesn't exist.|There is no corresponding Future Contract for the currency defined in the request.


# Margin Loan

<aside class="notice">All endpoints in this section require authentication</aside>

<aside class="notice">Currently loan only supports base currency of USDT and BTC</aside>

## Transfer Asset from Spot Trading Account to Margin Account

This endpoint transfer specific asset from spot trading account to margin account.

### HTTP Request

`POST https://api.huobi.pro/v1/dw/transfer-in/margin`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/dw/transfer-in/margin" -d
'{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | The trading symbol to borrow margin, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | The currency to borrow
amount     | string    | true     | NA      | The amount of currency to borrow

> The above command returns JSON structured like this:

```json
  "data": 1000
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Transfer id

## Transfer Asset from Margin Account to Spot Trading Account

This endpoint transfer specific asset from margin account to spot trading account.

### HTTP Request

`POST https://api.huobi.pro/v1/dw/transfer-out/margin`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/dw/transfer-out/margin" -d
'{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | The trading symbol to borrow margin, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | The currency to borrow
amount     | string    | true     | NA      | The amount of currency to borrow

> The above command returns JSON structured like this:

```json
  "data": 1000
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Transfer id

## Request a Margin Loan

This endpoint place an order to apply a margin loan.

### HTTP Request

`POST https://api.huobi.pro/v1/margin/orders`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/margin/orders" -d
'{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | The trading symbol to borrow margin, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | The currency to borrow
amount     | string    | true     | NA      | The amount of currency to borrow

> The above command returns JSON structured like this:

```json
  "data": 1000
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Margin order id

## Repay Margin Loan

This endpoint repays margin loan with you asset in your margin account.

### HTTP Request

`POST https://api.huobi.pro/v1/margin/orders/{order-id}/repay`

'order-id': the previously returned order id when loan order was created

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/v1/margin/orders/1000/repay" -d
'{
  "amount": "1.0"
}'
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
amount     | string    | true     | NA      | The amount of currency to repay

> The above command returns JSON structured like this:

```json
  "data": 1000
```

### Response Content

<aside class="notice">The return data contains a single value instead of an object</aside>

Field               | Data Type | Description
---------           | --------- | -----------
data                | integer   | Margin order id

## Search Past Margin Orders

This endpoint returns margin orders based on a specific searching criteria.

### HTTP Request

`GET https://api.huobi.pro/v1/margin/loan-orders`

```shell
curl "https://api.huobi.pro/v1/margin/load-orders?symbol=ethusdt"
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                                   | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
symbol     | string    | true     | NA      | The trading symbol to trade                   | All supported trading symbols, e.g. btcusdt, bccbtc
types      | string    | false    | NA      | The types of order to include in the search   | buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc
states     | string    | false    | NA      | The states of order to include in the search  | submitted, partial-filled, partial-canceled, filled, canceled
start-date | string    | false    | -61d    | Search starts date, in format yyyy-mm-dd      | NA
end-date   | string    | false    | today   | Search ends date, in format yyyy-mm-dd        | NA
from       | string    | false    | NA      | Search order id to begin with                 | NA
direct     | string    | false    | both    | Search direction when 'from' is used          | next, prev
size       | int       | false    | 100     | The number of orders to return                | [1, 100]

> The above command returns JSON structured like this:

```json
  "data": [
    {
      "loan-balance": "0.100000000000000000",
      "interest-balance": "0.000200000000000000",
      "interest-rate": "0.002000000000000000",
      "loan-amount": "0.100000000000000000",
      "accrued-at": 1511169724531,
      "interest-amount": "0.000200000000000000",
      "symbol": "ethbtc",
      "currency": "btc",
      "id": 394,
      "state": "accrual",
      "account-id": 17747,
      "user-id": 119913,
      "created-at": 1511169724531
    }
  ]
```

### Response Content

Field               | Data Type | Description
---------           | --------- | -----------
id                  | integer   | Order id
account-id          | integer   | Account id
user-id             | integer   | User id
symbol              | string    | The margin loan pair to trade, e.g. btcusdt, bccbtc
currency            | string    | The currency in the loan
created-at          | int       | The timestamp in milliseconds when the order was created
accrued-at          | int       | The timestamp in milliseconds when the last accure happened
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
loan-amount         | string    | The amount of the origin loan
loan-balance        | string    | The amount of the loan left
interest-rate       | string    | The loan interest rate
interest-amount     | string    | The accumulated loan interest
interest-balance    | string    | The amount of loan interest left
state               | string    | Loan state, possible values: created, accrual, cleared, invalid

## Get the Balance of the Margin Loan Account

This endpoint returns the balance of the margin loan account.

### HTTP Request

`GET https://api.huobi.pro/v1/margin/accounts/balance`

```shell
curl "https://api.huobi.pro/v1/margin/accounts/balance?symbol=btcusdt"
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | The trading symbol to borrow margin, e.g. btcusdt, bccbtc

> The above command returns JSON structured like this:

```json
"data": [
        {
            "id": 18264,
            "type": "margin",
            "state": "working",
            "symbol": "btcusdt",
            "fl-price": "0",
            "fl-type": "safe",
            "risk-rate": "475.952571086994250554",
            "list": [
                {
                    "currency": "btc",
                    "type": "trade",
                    "balance": "1168.533000000000000000"
                },
                {
                    "currency": "btc",
                    "type": "frozen",
                    "balance": "0.000000000000000000"
                },
                {
                    "currency": "btc",
                    "type": "loan",
                    "balance": "-2.433000000000000000"
                },
                {
                    "currency": "btc",
                    "type": "interest",
                    "balance": "-0.000533000000000000"
                },
                {
                    "currency": "btc",
                    "type": "transfer-out-available",//可转btc
                    "balance": "1163.872174670000000000"
                },
                {
                    "currency": "btc",
                    "type": "loan-available",//可借btc
                    "balance": "8161.876538350676000000"
                }
            ]
        }
]
```

### Response Content

Field               | Data Type     | Description
---------           | ---------     | -----------
symbol              | string        | The margin loan pair, e.g. btcusdt, bccbtc
state               | string        | Loan state, possible values: created, accrual, cleared, invalid
risk-rate           | string        | The risk rate
fl-price            | string        | The price which triggers closeout
list                | array         | The list of margin accounts and their details

# ETF (HB10)

Huobi's platform allows clients to create ETF holdings with their matching assets, and also allows clients to redempt ETF to comprised assets.

## Creation and Redemption Configuration

This endpoint will return the basic information of ETF creation and redemption, as well as ETF constituents, including max amount of creation, min amount of creation, max amount of redemption, min amount of redemption, creation fee rate, redemption fee rate, eft create/redeem status.

### HTTP Request

- GET `/etf/swap/config`

```shell
curl "https://api.huobi.pro/etf/swap/config?etf_name=hb10"
```

### Request Parameter

Parameter   | Data Type | Required | Description
-----       |-----      |-----     |------
etf_name    | string    | true     | The name of the ETF, currently only support hb10

> Response:

```json
{
  "code": 200,
  "data": {
    "purchase_min_amount": 10000,
    "purchase_max_amount": 100000,
    "redemption_min_amount": 10000,
    "redemption_max_amount": 10000,
    "purchase_fee_rate": 0.001,
    "redemption_fee_rate": 0.002,
    "etf_status":1,
    "unit_price":
    [
      {
        "currency": "eth",
        "amount": 19.9
      },
      {
        "currency": "btc",
        "amount": 9.9
      }
    ]
  },
  "message": null,
  "success": true
}
```

### Response Content

Field                 | Data Type  | Description |
-----------           |------------|-----------  |
purchase_min_amount   | integer    | Minimum creation amounts per request |
purchase_max_amount   | integer    | Max creation amounts per request |
redemption_min_amount | integer    | Minimum redemption amounts per request |
redemption_max_amount | integer    | Max redemption amounts per request |
purchase_fee_rate     | decimal    | Creation fee rate |
redemption_fee_rate   | decimal    | Redemption fee rate |
etf_status            | integer    | status of the ETF: Normal(1), Rebalancing Start(2), Creation and Redemption Suspended(3), Creation Suspended(4), Redemption Suspended(5)  |
unit_price            | array      | ETF constitution in format of {amount, currency}

## Order Creation/Redemption

This endpoint allow clients to order creation or redemption of ETF.

### HTTP Request

- POST `/etf/swap/in`

- POST `/etf/swap/out`

```shell
curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/etf/swap/in" -d
'{"etf_name": "hb10", "amount": 10000}'

curl -X POST -H 'Content-Type: application/json' "https://api.huobi.pro/etf/swap/out" -d
'{"etf_name": "hb10", "amount": 10000}'
```

### Request Parameter

Parameter  | Required | Data Type |  Description
---------  |--------- |-----------|------------  
etf_name   | true     | string    | ETF name, currently only support hb10
amount     | true     | integer   | The amount to create or redemption

> Response:

```json
{
    "code": 200,
    "data": null,
    "message": null,
    "success": true
}
```

### Response Content

Field      | Data Type | Description
-----------|-----------|-----------
code       | integer   | The overall status of the order, please find details in below table
data       | object    | The data content if available
message    | string    | The message of the order result
success    | boolean   | If the order is successful

**Response code details**

Code  | Description
--    |--
200   | Successful
10404 | Invalid ETF name
13403 | Insufficient asset to create ETF
13404 | Create and redemption disabled due to system setup
13405 | Create and redemption disabled due to configuration issue
13406 | Invalid API call
13410 | API authentication fails
13500 | System error
13601 | Create and redemption disabled during rebalance
13603 | Create and redemption disabled due to other reason
13604 | Create suspended
13605 | Redemption suspended
13606 | Amount incorrect. For the cases when creation amount or redemption amount is not in the range of min/max amount, this code will be returned.

## Show Past Creation/Redemption

This endpoints allows clients to get past creation and redemption.(up to 100 records)

### HTTP Request

- GET `/etf/swap/list `

```shell
curl "https://api.huobi.pro/etf/swap/list"
```

### Request Parameter

Parameter  | Required | Data Type |  Description |
---------  |--------- |-----------|------------  |
etf_name   | true     | string    | ETF name, currently only support hb10
offset     | true     | integer   | The offset of the records, set to 0 for the latest records
limit      | true     | integer   | The number of records to return, max is 100  

> Response:

```json
{
  "code": 200,
  "data": [
    {
      "id": 112222,
      "gmt_created": 1528855872323,
      "currency": "hb10",
      "amount": 11.5,
      "type": 1,
      "status": 2,
      "detail":
      {
        "used_ currency_list":
        [
          {
            "currency": "btc",
            "amount": 0.666
          },
          {
            "currency": "eth",
            "amount": 0.666
          }
        ],
        "rate": 0.002,
        "fee": 100.11,
        "point_card_amount":1.0,
        "obtain_ currency_list":
        [
          {
            "currency": "hb10",
            "amount": 1000
          }
        ]
      }
    }
  ],
  "message": null,
  "success": true
}
```

### Response Content

Field       | Data Type | Description
----------- |-----------|-----------
id          | integer   | Creation/Redemption id
gmt_created | integer   | Operation timestamp
currency    | string    | ETF name
amount      | decimal   | Creation/Redmption amount
type        | integer   | Creation(1), Redemption(2)
status      | integer   | Operation result
detail      | array     | Please find details below

**Fields under "Detail"**

Field                 | Data Type | Description |
-----                 |-----      |-----        |
used_currency_list    | array     | For creation this is the list and amount of underlying assets used for ETF creation. For redemption this is the amount of ETF used for redemption.
rate                  | decimal   | Fee rate
fee                   | decimal   | The actual fee amount
point_card_amount     | decimal   | Discount from point card
obtain_currency_list  | array     | For creation this is the amount for ETF created. For redemption this is the list and amount of underlying assets obtained.

# Websocket Market Data

## General

### Websocket URL

**Websocket Market Feed**

**`wss://api.huobi.pro/ws`**

### Data Format

All return data of websocket APIs are compressed with GZIP so they need to be unzipped.

### Heartbeat and Connection

After connected to Huobi's Websocket server, the server will send heartbeat periodically (currently at 5s interval). The heartbeat message will have an integer in it, e.g.

> {"ping": 1492420473027}

When client receives this heartbeat message, it should response with a matching "pong" message which has the same integer in it, e.g.

> {"pong": 1492420473027}

<aside class="warning">After the server sent two consecutive heartbeat messages without receiving at least one matching "pong" response from a client, then right before server sends the next "ping" heartbeat, the server will disconnect this client</aside>

### Subscribe to Topic

To receive data you have to send a "sub" message first.

```json
{
  "sub": "market.btccny.kline.1min",
  "id": "id1"
}
```

{
  "sub": "topic to sub",
  "id": "id generate by client"
}

After successfully subscribed, you will receive a response to confirm subscription

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btccny.kline.1min",
  "ts": 1489474081631
}
```

Then, you will received message when there is update in this topic

```json
{
  "ch": "market.btccny.kline.1min",
  "ts": 1489474082831,
  "tick": {
    "id": 1489464480,
    "amount": 0.0,
    "count": 0,
    "open": 7962.62,
    "close": 7962.62,
    "low": 7962.62,
    "high": 7962.62,
    "vol": 0.0
  }
}
```

### Unsubscribe

To unsubscribe, you need to send below message

```json
{
  "unsub": "market.btccny.trade.detail",
  "id": "id4"
}
```

{
  "unsub": "topic to unsub",
  "id": "id generate by client"
}

And you will receive a message to confirm the unsubscribe

```json
{
  "id": "id4",
  "status": "ok",
  "unsubbed": "market.btccny.trade.detail",
  "ts": 1494326028889
}
```

### Pull Data

While connected to websocket, you can also use it in pull style by sending message to the server.

To request pull style data, you send below message

```json
{
  "req": "market.ethbtc.kline.1min",
  "id": "id10"
}
```

{
  "req": "topic to req",
  "id": "id generate by client"
}

You will receive a response accordingly and immediately

```json
{
  "status": "ok",
  "rep": "market.btccny.kline.1min",
  "tick": [
    {
      "amount": 1.6206,
      "count":  3,
      "id":     1494465840,
      "open":   9887.00,
      "close":  9885.00,
      "low":    9885.00,
      "high":   9887.00,
      "vol":    16021.632026
    },
    {
      "amount": 2.2124,
      "count":  6,
      "id":     1494465900,
      "open":   9885.00,
      "close":  9880.00,
      "low":    9880.00,
      "high":   9885.00,
      "vol":    21859.023500
    }
  ]
}
```

## Market Candlestick

This topic sends a new candlestick whenever it is available.

### Topic

`market.$symbol$.kline.$period$`

> Subscribe request

```json
{
  "sub": "market.ethbtc.kline.1min",
  "id": "id1"
}
```

### Topic Parameter

Parameter | Data Type | Required | Description                      | Value Range
--------- | --------- | -------- | -----------                      | -----------
symbol    | string    | true     | Trading symbol     | All supported trading symbols, e.g. btcusdt, bccbtc
period     | string    | true     | Candlestick interval   | 1min, 5min, 15min, 30min, 60min, 1day, 1mon, 1week, 1year

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.ethbtc.kline.1min",
  "ts": 1489474081631
}
```

> Update example

```json
{
  "ch": "market.ethbtc.kline.1min",
  "ts": 1489474082831,
  "tick": {
    "id": 1489464480,
    "amount": 0.0,
    "count": 0,
    "open": 7962.62,
    "close": 7962.62,
    "low": 7962.62,
    "high": 7962.62,
    "vol": 0.0
  }
}
```

### Update Content

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | UNIX epoch timestamp in second as response id
amount    | float     | Aggregated trading volume during the interval (in base currency)
count     | integer   | Number of trades during the interval
open      | float     | Opening price during the interval
close     | float     | Closing price during the interval
low       | float     | Low price during the interval
high      | float     | High price during the interval
vol       | float     | Aggregated trading value during the interval (in quote currency)

<aside class="notice">When symbol is set to "hb10" or "huobi10", amount, count, and vol will always have the value of 0</aside>

### Pull Request

Pull request is supported with extra parameters to define the range.

```json
{
  "req": "market.$symbol.kline.$period",
  "id": "id generated by client",
  "from": "from time in epoch seconds",
  "to": "to time in epoch seconds"
}
```

Parameter | Data Type | Required | Default Value                          | Description      | Value Range
--------- | --------- | -------- | -------------                          | -----------      | -----------
from      | integer   | false    | 1501174800(2017-07-28T00:00:00+08:00)  | "From" time (epoch time in second)   | [1501174800, 2556115200]
to        | integer   | false    | 2556115200(2050-01-01T00:00:00+08:00)  | "To" time (epoch time in second)      | [1501174800, 2556115200] or ($from, 2556115200] if "from" is set

## Market Depth

This topic sends the latest market depth when it is updated.

### Topic

`market.$symbol.depth.$type`

> Subscribe request

```json
{
  "sub": "market.btcusdt.depth.step0",
  "id": "id1"
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | Trading symbol                   | All supported trading symbols, e.g. btcusdt, bccbtc
type      | string    | true     | step0                 | Market depth aggregation level, details below     | step0, step1, step2, step3, step4, step5

**"type" Details**

Value     | Description
--------- | ---------
step0     | No market depth aggregation
step1     | Aggregation level = precision*10
step2     | Aggregation level = precision*100
step3     | Aggregation level = precision*1000
step4     | Aggregation level = precision*10000
step5     | Aggregation level = precision*100000

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.depth.step0",
  "ts": 1489474081631
}
```

> Update example

```json
{
  "ch": "market.btcusdt.depth.step0",
  "ts": 1489474082831,
  "tick": {
    "bids": [
    [9999.3900,0.0098], // [price, amount]
    [9992.5947,0.0560]
    // more Market Depth data here
    ],
    "asks": [
    [10010.9800,0.0099],
    [10011.3900,2.0000]
    //more data here
    ]
  }
}
```

### Update Content

<aside class="notice">Under 'tick' object there is a list of bids and a list of asks</aside>

Field     | Data Type | Description
--------- | --------- | -----------
bids      | object    | The current all bids in format [price, quote volume]
asks      | object    | The current all asks in format [price, quote volume]

<aside class="notice">When symbol is set to "hb10" amount, count, and vol will always have the value of 0</aside>

### Pull Request

Pull request is supported.

```json
{
  "req": "market.btcusdt.depth.step0",
  "id": "id10"
}
```

## Trade Detail

This topic sends the latest completed trade.

### Topic

`market.$symbol.trade.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.trade.detail",
  "id": "id1"
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | Trading symbol                     | All supported trading symbols, e.g. btcusdt, bccbtc

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.trade.detail",
  "ts": 1489474081631
}
```

> Update example

```json
{
  "ch": "market.btcusdt.trade.detail",
  "ts": 1489474082831,
  "tick": {
        "id": 14650745135,
        "ts": 1533265950234,
        "data": [
            {
                "amount": 0.0099,
                "ts": 1533265950234,
                "id": 146507451359183894799,
                "price": 401.74,
                "direction": "buy"
            }
            // more Trade Detail data here
        ]
  }
}
```

### Update Content

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | Unique trade id
amount    | float     | Last trade volume
price     | float     | Last trade price
ts        | integer   | Last trade time (UNIX epoch time in millisecond)
direction | string    | Aggressive order side (taker's order side) of the trade: 'buy' or 'sell'

### Pull Request

Pull request (of maximum latest 300 trade records) is supported.

```json
{
  "req": "market.btcusdt.trade.detail",
  "id": "id11"
}
```

## Market Details

This topic sends the latest market stats with 24h summary

### Topic

`market.$symbol.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.detail",
  "id": "id1"
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | Trading symbol                     | All supported trading symbols, e.g. btcusdt, bccbtc

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.detail",
  "ts": 1489474081631
}
```

> Update example

```json
  "tick": {
    "amount": 12224.2922,
    "open":   9790.52,
    "close":  10195.00,
    "high":   10300.00,
    "ts":     1494496390000,
    "id":     1494496390,
    "count":  15195,
    "low":    9657.00,
    "vol":    121906001.754751
  }
```

### Update Content

Field     | Data Type | Description
--------- | --------- | -----------
id        | integer   | UNIX epoch timestamp in second as response id
ts        | integer   | UNIX epoch timestamp in millisecond of this tick
amount    | float     | Aggregated trading volume in past 24H (in base currency)
count     | integer   | Number of trades in past 24H
open      | float     | Opening price in past 24H
close     | float     | Last price
low       | float     | Low price in past 24H
high      | float     | High price in past 24H
vol       | float     | Aggregated trading value in past 24H (in quote currency)

### Pull Request

Pull request is supported.

```json
{
  "req": "market.btcusdt.detail",
  "id": "id11"
}
```

# Websocket Asset and Order

## General

### Websocket URL

**Websocket Asset and Order**

**`wss://api.huobi.pro/ws/v1`**

### Data Format

All return data of websocket APIs are compressed with GZIP so they need to be unzipped.

### Heartbeat and Connection

After connected to Huobi's Websocket server, the server will send heartbeat periodically (currently at 5s interval). The heartbeat message will have an integer in it, e.g.

> {"ping": 1492420473027}

When client receives this heartbeat message, it should response with a matching "pong" message which has the same integer in it, e.g.

> {"pong": 1492420473027}

<aside class="warning">After the server sent two consective heartbeat message without receiving at least one matching "pong" response from a client, then right before server sends the next "ping" heartbeat, the server will disconnect this client</aside>

### Subscribe to Topic

To receive data you have to send a "sub" message first.

```json
{
  "op": "operation type, 'sub' for subscription, 'unsub' for unsubscription",
  "topic": "topic to sub",
  "cid": "id generate by client"
}
```

After successfully subscribed, you will receied a response to confirm subscription

```json
{
  "op": "operation type, refer to the operation which triggers this response",
  "cid": "id1",
  "error-code": 0, // 0 for no error
  "topic": "topic to sub if the op is sub",
  "ts": 1489474081631
}
```

Then, you will received message when there is update in this topic

```json
{
  "op": "notify",
  "topic": "topic of this notify",
  "ts": 1489474082831,
  "data": {
    // data of specific topic update
  }
}
```

### Unsubscribe

To unsubscribe, you need to send below message

```json
{
  "op": "unsub",
  "topic": "accounts",
  "cid": "client generated id"
}
```

And you will receive a message to confirm the unsubscribe

```json
{
  "op": "unsub",
  "topic": "accounts",
  "cid": "id generated by client",
  "err-code": 0,
  "ts": 1489474081631
}
```

### Pull Data

After successfully establishing a connection with the WebSocket API. There are 3 topics which are designed particularly for pull style data query. Those are

* accounts.list
* orders.list
* orders.detail

The details of how to user those three topic will be explain later in this documents.

**Rate limt of pull style query**

The limit is count againt per API key not per connection. When you reached the limit you will receive error with "too many request".

* accounts.list: once every 25 seconds
* orders.list AND orders.detail: once every 5 seconds

### Authentication

Asset and Order topics require authentication. To authenticate yourself, send below message

```json
{
  "op": "auth",
  "AccessKeyId": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",
  "SignatureMethod": "HmacSHA256",
  "SignatureVersion": "2",
  "Timestamp": "2017-05-11T15:19:30",
  "Signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=",
}
```

**The format of Authentication data instruction**

  filed              |type   |  instruction|
  ------------------ |----   |  -----------------------------------------------------
  op                 |string | required; the type of requested operator is auth
  cid                |string | optional; the ID of Client request
  AccessKeyId        |string | required; API access key , AccessKey is in APIKEY you applied
  SignatureMethod    |string | required; the method of sign, user computes signature basing on the protocol of hash ,the api uses HmacSHA256
  SignatureVersion   |string | required; the version of signature's protocol, the api uses 2
  Timestamp          |string | required; timestamp, the time is you requests (UTC timezone), this value is to avoid that another people intercepts your request. for example ：2017-05-11T16:22:06 (UTC timezone)|
  Signature          |string |required; signature, the value is computed to make sure that the Authentication is valid and not tampered|

> **Notice：**
> - Refer to the Authentication[https://huobiapi.github.io/docs/v1/en/#authentication] section to generate the signature
> - The request method in signature's method is `GET`

## Subscribe to Account Updates

This topic publishes all balance updates of the current account.

### Topic

`accounts`

> Subscribe request

```json
{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "accounts",
  "model": "0"
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
model     | string    | false    | 0                     | Whether to include frozen balance                 | 1 to include frozen balance, 0 to not

<aside class="notice">You may subscribe to this topic with different model to get updates in both models</aside>

> Response

```json
{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "err-code": 0,
  "ts": 1489474081631,
  "topic": "accounts"
}
```

> Update example

```json
{
  "op": "notify",
  "ts": 1522856623232,
  "topic": "accounts",
  "data": {
    "event": "order.place",
    "list": [
      {
        "account-id": 419013,
        "currency": "usdt",
        "type": "trade",
        "balance": "500009195917.4362872650"
      }
    ]
  }
}

```

### Update Content

Field     | Data Type | Description
--------- | --------- | -----------
event     | string    | The event type which triggers this balance updates, including oder.place, order.match, order.refund, order.cancel, order.fee-refund, and other balance transfer event types
account-id| integer   | The account id of this individual balance
currency  | string    | The crypto currency of this balance
type      | string    | The type of this account, including trade, loan, interest
balance   | string    | The balance of this account, include frozen balance if "model" was set to 1 in subscription

## Subscribe to Order Updates

This topic publishes all order updates of the current account.

### Topic

`orders.$symbol`

> Subscribe request

```json
{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders.htusdt",
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | Trading symbol                       | All supported trading symbols, e.g. btcusdt, bccbtc

> Response

```json
{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "err-code": 0,
  "ts": 1489474081631,
  "topic": "orders.htusdt"
}
```

> Update example

```json
{
  "op": "notify",
  "topic": "orders.htusdt",
  "ts": 1522856623232,
  "data": {
    "seq-id": 94984,
    "order-id": 2039498445,
    "symbol": "htusdt",
    "account-id": 100077,
    "order-amount": "5000.000000000000000000",
    "order-price": "1.662100000000000000",
    "created-at": 1522858623622,
    "order-type": "buy-limit",
    "order-source": "api",
    "order-state": "filled",
    "role": "taker|maker",
    "price": "1.662100000000000000",
    "filled-amount": "5000.000000000000000000",
    "unfilled-amount": "0.000000000000000000",
    "filled-cash-amount": "8301.357280000000000000",
    "filled-fees": "8.000000000000000000"
  }
}
```

### Update Content

Field               | Data Type | Description
---------           | --------- | -----------
seq-id              | integer   | Sequence id
order-id            | integer   | Order id
symbol              | string    | Trading symbol
account-id          | string    | Account id
order-amount        | string    | Order amount (in base currency)
order-price         | string    | Order price
created-at          | int       | Order creation time (UNIX epoch time in millisecond)
order-type          | string    | Order type, possible values: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
order-source        | string    | Order source, possible values: sys, web, api, app
order-state         | string    | Order state, possible values: submitted, partical-filled, cancelling, filled, canceled, partial-canceled
role                | string    | Order role in the trade: taker or maker
price               | string    | Order execution price
filled-amount       | string    | Order execution quantity (in base currency)
filled-cash-amount  | string    | Order execution value (in quote currency)
filled-fees         | string    | Transaction fee paid so far
unfilled-amount     | string    | Remaining order quantity

## Subscribe to Order Updates (NEW)

This topic publishes all order updates of the current account. By comparing with above subscription topic “orders.$symbol”, the new topic “orders.$symbol.update” should have lower latency but more sequential updates. API users are encouraged to subscribe to this new topic for getting order update ticks, instead of above topic “orders.$symbol”. (The current subscription topic “orders.$symbol” will be still kept in Websocket API service till further notice.)

### Topic

`orders.$symbol.update`

> Subscribe request

```json
{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders.htusdt.update"
}
```

### Topic Parameter

Parameter | Data Type | Required | Default Value         | Description                                       | Value Range
--------- | --------- | -------- | -------------         | -----------                                       | -----------
symbol    | string    | true     | NA                    | Trading symbol                       | All supported trading symbols, e.g. btcusdt, bccbtc



> Response

```json
{
  "op": "sub",
  "ts": 1489474081631,
  "topic": "orders.htusdt.update",
  "err-code": 0,
  "cid": "40sG903yz80oDFWr"  
}
```

> Update example

```json
{
  "op": "notify",
  "ts": 1522856623232,
  "topic": "orders.htusdt.update",  
  "data": {
    "unfilled-amount": "0.000000000000000000",
    "filled-amount": "5000.000000000000000000",
    "price": "1.662100000000000000",
    "order-id": 2039498445,
    "symbol": "htusdt",
    "match-id": 94984,
    "filled-cash-amount": "8301.357280000000000000",
    "role": "taker|maker",
    "order-state": "filled"
  }
}
```

### Update Content

Field               | Data Type | Description
---------           | --------- | -----------
match-id              | integer   | Match id (While order-state = submitted, canceled, partial-canceled,match-id refers to sequence number; While order-state = filled, partial-filled, match-id refers to last match ID.)
order-id            | integer   | Order id
symbol              | string    | Trading symbol
order-state         | string    | Order state, possible values: submitted, partical-filled, cancelling, filled, canceled, partial-canceled
role                | string    | Order role in the trade: taker or maker (While order-state = submitted, canceled, partialcanceled, a default value “taker” is given to this field; While order-state = filled, partial-filled, role can be either taker or maker.)
price               | string    | Last price (While order-state = submitted, price refers to order price; While order-state = canceled, partial-canceled, price is zero; While order-state = filled, partial-filled, price reflects the last execution price. (While role = taker, and this taker’s order matching with multiple orders on the opposite side simultaneously, price here refers to average price of the multiple trades.))
filled-amount       | string    | Last execution quantity (in base currency)
filled-cash-amount  | string    | Last execution value (in quote currency)
unfilled-amount     | string    | Remaining order quantity (While order-state = submitted, unfilled-amount contains the original order size; While order-state = canceled OR partial-canceled, unfilled-amount contains the remaining order quantity; While order-state = filled, if order-type = buymarket, unfilled-amount could possibly contain a minimal value; if order-type <> buy-market, unfilled-amount is zero; While order-state = partial-filled AND role = taker, unfilled-amount is the remaining order quantity; While order-state = partial-filled AND role = maker, unfilled-amount is zero. Huobi will support unfilled amount under this scenario in a later enhancement. Time is to be advised in another notification.)


## Request Account Details

Query all account data of the current user.

### Query Topic

`accounts.list`

> Query request

```json
{
  "op": "req",
  "cid": "40sG903yz80oDFWr",
  "topic": "accounts.list",
}
```

### Response

> Successful

```json
    {
      "op": "req",
      "topic": "accounts.list",
      "cid": "40sG903yz80oDFWr",
      "err-code": 0,
      "ts": 1489474082831,
      "data": [
        {
          "id": 419013,
          "type": "spot",
          "state": "working",
          "list": [
            {
              "currency": "usdt",
              "type": "trade",
              "balance": "500009195917.4362872650"
            },
            {
              "currency": "usdt",
              "type": "frozen",
              "balance": "9786.6783000000"
            }
          ]
        },
        {
          "id": 35535,
          "type": "point",
          "state": "working",
          "list": [
            {
              "currency": "eth",
              "type": "trade",
              "balance": "499999894616.1302471000"
            },
            {
              "currency": "eth",
              "type": "frozen",
              "balance": "9786.6783000000"
            }
          ]
        }
      ]
    }
```

> Failed

```json
    {
      "op": "req",
      "topic": "foo.bar",
      "cid": "40sG903yz80oDFWr",
      "err-code": 12001, //Response codes,0  represent success;others value  is error,the list of Response codes is in appendix
      "err-msg": "detail of error message",
      "ts": 1489474081631
    }
```

Field                |Data Type |    Description|
-------------------- |--------| ------------------------------------|
{ id                   |long    | account ID|
type              |string   |account type|
state           |string     |account status|
list               |string   |account list|
{currency                |string   |sub-account currency|
type           |string     |sub-account type|
balance }}           |string     |sub-account balance|

## Search Past Orders

Search past and open orders based on searching criteria.

### Query Topic

`order.list`

> Query request

```json
{
  "op": "req",
  "topic": "orders.list",
  "cid": "40sG903yz80oDFWr",
  "symbol": "htusdt",
  "states": "submitted,partial-filled"
}
```

### Request Parameters

Parameter  | Data Type | Required | Default | Description                                   | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
account-id | int       | true     | NA      | Account id                        | NA
symbol     | string    | true     | NA      | Trading symbol                | All supported trading symbols, e.g. btcusdt, bccbtc
types      | string    | false    | NA      | Order type   | buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc
states     | string    | false    | NA      | Order state  | submitted, partial-filled, partial-canceled, filled, canceled
start-date | string    | false    | -61d    | Start date, in format yyyy-mm-dd      | NA
end-date   | string    | false    | today   | End date, in format yyyy-mm-dd        | NA
from       | string    | false    | NA      | Order id to begin with                 | NA
direct     | string    | false    | next    | Searching direction when 'from' is given          | next, prev
size       | int       | false    | 100     | Number of items in each return               | [1, 100]

### Response
  
> Successful

```json
{
  "op": "req",
  "topic": "orders.list",
  "cid": "40sG903yz80oDFWr",
  "err-code": 0,
  "ts": 1522856623232,
  "data": [
    {
      "id": 2039498445,
      "symbol": "htusdt",
      "account-id": 100077,
      "amount": "5000.000000000000000000",
      "price": "1.662100000000000000",
      "created-at": 1522858623622,
      "type": "buy-limit",
      "filled-amount": "5000.000000000000000000",
      "filled-cash-amount": "8301.357280000000000000",
      "filled-fees": "8.000000000000000000",
      "finished-at": 1522858624796,
      "source": "api",
      "state": "filled",
      "canceled-at": 0
    }
  ]
}
```
Field                |Data Type |    Description|
-------------------- |--------| ------------------------------------|
id                   |long    | order ID|
symbol               |string   |trading symbol|
account-id           |long     |account ID|
amount               |string   |order size|
price                |string   |order price|
created-at           |long     |order creation time|
type                 |string   |order type, possible values: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker|
filled-amount        |string   |filled amount|
filled-cash-amount   |string   |filled value|
filled-fees          |string   |transaction fee|
finished-at          |string   |trade time|
source               |string   |order source, possible values: sys, web, api, app|
state                |string   |order state, possible values: submitted, partical-filled, cancelling, filled, canceled, partial-canceled|
cancel-at            |long     |order cancellation time|


## Query Order by Order ID

Get order details by a given order ID.

### Query Topic

`order.detail`

> Query request

```json
{
  "op": "req",
  "topic": "orders.detail",
  "order-id": "2039498445",
  "cid": "40sG903yz80oDFWr"
}
```

### Request Parameters

Parameter  | Required | Data Type | Default | Description                   | Value Range
---------  | --------- | -------- | ------- | -----------                                   | ----------
op         |true       |string   |operation type "req"    |||                                
cid        |true       |string   |id generate by client        |||                                
topic      |false      |string   |topic to sub "orders.detail"  |||          
order-id   |true       |string   |order ID    ||| 

### Response
  
> Successful

```json
{
  "op": "req",
  "topic": "orders.detail",
  "cid": "40sG903yz80oDFWr",
  "err-code": 0,
  "ts": 1522856623232,
  "data": {
    "id": 2039498445,
    "symbol": "htusdt",
    "account-id": 100077,
    "amount": "5000.000000000000000000",
    "price": "1.662100000000000000",
    "created-at": 1522858623622,
    "type": "buy-limit",
    "filled-amount": "5000.000000000000000000",
    "filled-cash-amount": "8301.357280000000000000",
    "filled-fees": "8.000000000000000000",
    "finished-at": 1522858624796,
    "source": "api",
    "state": "filled",
    "canceled-at": 0
  }
}
```
Field                |Data Type |    Description|
-------------------- |--------| ------------------------------------|
id                   |long    | order ID|
symbol               |string   |trading symbol|
account-id           |long     |account ID|
amount               |string   |order size|
price                |string   |order price|
created-at           |long     |order creation time|
type                 |string   |order type, possible values: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker|
filled-amount        |string   |filled amount|
filled-cash-amount   |string   |filled value|
filled-fees          |string   |transaction fee|
finished-at          |string   |trade time|
source               |string   |order source, possible values: sys, web, api, app|
state                |string   |order state, possible values: submitted, partical-filled, cancelling, filled, canceled, partial-canceled|
cancel-at            |long     |order cancellation time|



