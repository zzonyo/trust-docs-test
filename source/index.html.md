---
title: Huobi API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Introduction

Welcome to the Huobi API! You can use our API to access all market data, trading, and account management endpoints.

We have language bindings in Shell, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# General

## Response Body Format

TBC

## Respones Status Code

TBC

## Endpoint Rate Limit

TBC

## Server Re-locate

TBC

## Authentication

> To authorize, use this code:

```shell
TBC
```

# Market Data

## Get Klines(candles)

This endpoint retrieves all klines in a specific range.

### HTTP Request

`GET https://api.huobi.pro/market/history/kline`

```shell
curl "https://api.huobi.pro/market/history/kline"
```

> The above command returns JSON structured like this:

```json
[
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

### Query Parameters

Parameter | Data Type | Required | Default | Description
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | The trading pair to query, e.g. btcusdt, bccbtc
period    | string    | true     | NA      | If set to false, the result will include kittens that have already been adopted.
size      | integer   | false    | 150     | The number of data returns

### Response Content
Parameter | Data Type | Description
--------- | --------- | -----------
id        | integer   | The UNIX timestamp in seconds as response id
amount    | float     | The aggregated trading volume in USDT
count     | integer   | The number of completed trades
open      | float     | The opening price
close     | float     | The closing price
low       | float     | The low price
high      | float     | The high price
vol       | float     | The trading volume in base currency

<aside class="success">
This is how to create a reminder.
</aside>

## Get Latest Ticker

This endpoint retrieves the latest ticker with some important 24h aggregated market data.

<aside class="warning">This is how to create<code>&lt;warning&gt;</code> .</aside>

### HTTP Request

`GET https://api.huobi.pro/market/detail/merged`

```shell
curl "https://api.huobi.pro/market/detail/merged"
```

> The above command returns JSON structured like this:

```json
{
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

### Query Parameters

Parameter | Data Type | Required | Default | Description
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | The trading pair to query, e.g. btcusdt, bccbtc

### Response Content

Parameter | Data Type | Description
--------- | --------- | -----------
id        | integer   | The UNIX timestamp in seconds as response id
amount    | float     | The aggregated trading volume in USDT
count     | integer   | The number of completed trades
open      | float     | The opening price
close     | float     | The closing price
low       | float     | The low price
high      | float     | The high price
vol       | float     | The trading volume in base currency
bid       | object    | The current best bid in format [price, quote volume]
ask       | object    | The current best ask in format [price, quote volume]

# Spot Trading

TBC

# Margin Trading

TBC

# Wallet (Deposit and Withdraw)

TBC

# Account

TBC
