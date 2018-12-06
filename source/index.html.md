---
title: Huobi API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='#'>Sign Up for a Huobi API key </a>
  - <a href='https://www.huobi.pro/apikey/'>Login is required for creating an API key</a>

includes:
  - errors

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

```python
TBC
```

# Market Data

## Get Klines(candles)

This endpoint retrieves all klines in a specific range.

### HTTP Request

`GET https://api.huobi.pro/market/history/kline`

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

```shell
curl "https://api.huobi.pro/market/history/kline"
```

```python
TBC
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

## Get Latest Ticker

This endpoint retrieves the latest ticker with some important 24h aggregated market data.

<aside class="warning">This is how to create<code>&lt;warning&gt;</code> .</aside>

### HTTP Request

`GET https://api.huobi.pro/market/detail/merged`

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

```shell
curl "https://api.huobi.pro/market/history/kline"
```

```python
TBC
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

# Spot Trading

TBC

# Margin Trading

TBC

# Wallet (Deposit and Withdraw)

TBC

# Account

TBC
