---
title: 火币 API 文档 v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# API v1.0 简介

欢迎使用火币API v1.0! 你可以使用此API获得市场行情数据，进行交易，并且管理你的账户。

在文档的右侧是代码实例，目前我们仅提供针对shell的代码实例。

你可以通过选择上方下拉菜单的版本号来切换文档对应的API版本。你也可以通过点击右上方的语言按钮来切换文档语言。

# 通用

## 请求格式

所有的API请求都以GET或者POST形式发出。对于GET请求，所有的参数都在路径参数里；对于POST请求，所有参数则以JSON格式发送在请求主体（body）里。

## 返回格式

所有的接口返回都是JSON格式。在JSON最上层有几个表示请求状态和属性的字段："status", "ch", 和 "ts". 实际的接口返回内容在"data"字段里.

### 返回内容格式

> 返回内容将会是以下格式:

```json
{
  "status": "ok",
  "ch": "market.btcusdt.kline.1day",
  "ts": 1499223904680,
  "data": // per API response data in nested JSON object
}
```

字段      | 数据类型 | 描述
--------- | --------- | -----------
status    | string    | API接口返回状态
ch        | string    | 接口数据对应的数据流。部分接口没有对应数据流因此不返回此字段
ts        | int       | 接口返回的时间戳
data      | object    | 接口返回数据主体

## 限频规则

每个API key可以发送至多每10秒100个请求。如需提高API访问限制请联系客服。

## 签名认证

部分接口需要通过签名验证以确保数据私有性。 在进行接口签名验证之前，你需要先获得API key和其对应的密钥。

<aside class="notice">
你可以登陆huobi.com账号在“账号”下的“API管理”中管理你的API key。
</aside>

为了完成签名认证，你需要遵循以下步骤

1. 为你的接口请求生成一个“请求字符串”

2. 用上一步里生成的“请求字符串”和你的密钥生成一个数字签名

3. 将生成的数字签名加入到请求的路径参数里

以下将对每一步进行详细解释

### 为你的接口请求生成一个“请求字符串”

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

请求字符串一开始为空，通过三个步骤陆续增加内容。

1. 将接口路径加入请求字符串

2. 加入必须的认证参数到请求字符串

3. 加入可选的认证参数到请求字符串。可选参数的添加顺序必须符合参数名的字母排序。

<aside class="notice">
时间戳需要以YYYY-MM-DDThh:mm:ss格式添加并且符合URL编码。
</aside>

### 用上一步里生成的“请求字符串”和你的密钥生成一个数字签名

> The result signature will look like

```shell
4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=
```

1. 将上一步得到的请求字符串和API私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

### 将生成的数字签名加入到请求的路径参数里

> The final request with signature will look like

```shell
https://api.huobi.pro/v1/order/orders?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

```

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

# 基础接口

## 返回所有支持的交易对

此接口返回所有火币支持的交易对。

### HTTP请求

`GET https://api.huobi.pro/v1/common/symbols`

```shell
curl "https://api.huobi.prov1/common/symbols"
```

> The above command returns JSON structure like this:

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

### 请求参数

此接口不接受任何参数。

### 返回字段

字段            | 数据类型 | 描述
---------       | --------- | -----------
base-currency   | string    | 交易对中的基础币种
quote-currency  | string    | 交易对中的报价币种
price-precision | integer   | 交易对报价的精度（小数点后位数）
amount-precision| integer   | 交易对基础币种计数精度（小数点后位数）
symbol-partition| string    | 交易区，可能值: [main，innovation，bifurcation]

## 返回所有支持的币种

此接口返回所有火币支持的币种。

### HTTP请求

`GET https://api.huobi.pro/v1/common/currencys`

```shell
curl "https://api.huobi.prov1/common/currencys"
```

> The above command returns JSON structured like this:

```json
  "data": [
    "usdt",
    "eth",
    "etc"
  ]
```

### 请求参数

此接口不接受任何参数。

### 返回字段

<aside class="notice">返回的“data”对象是一个字符串数组，每一个字符串代表一个支持的币种。</aside>

## 返回当前系统时间

此接口返回当前的系统时间，时间是以毫秒为单位的UNIX时间戳。

### HTTP请求

`GET https://api.huobi.pro/v1/common/timestamp`

```shell
curl "https://api.huobi.prov1/common/timestamp"
```

> The above command returns JSON structured like this:

```json
  "data": 1494900087029
```

### 请求参数

此接口不接受任何参数。

### Response Content

返回的“data”对象是一个整数表示返回的时间戳。

# 行情数据

## K 线数据（蜡烛图）

此接口返回历史K线数据。

### HTTP请求

`GET https://api.huobi.pro/market/history/kline`

```shell
curl "https://api.huobi.pro/market/kline?period=1day&size=200&symbol=btcusdt"
```

> 以上命令返回的 JSON 结果:

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

### 请求参数

参数       | 数据类型 | 是否必须 | 默认值 | 描述
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | The trading pair to query, e.g. btcusdt, bccbtc
period    | string    | true     | NA      | The period of each candle, allowed values are: 1min, 5min, 15min, 30min, 60min, 1day, 1mon, 1week, 1year
size      | integer   | false    | 150     | The number of data returns, range [1, 2000]

### 响应数据

字段      | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 以UNIX秒为单位的时间戳，并以此作为此K线柱的id
amount    | float     | 以基础币种计量的交易量
count     | integer   | 交易次数
open      | float     | 本阶段开盘价
close     | float     | 本阶段收盘价
low       | float     | 本阶段最低价
high      | float     | 本阶段最高价
vol       | float     | 以报价币种计量的交易量

## 24小时聚合 Ticker

此接口获取ticker信息同时提供最近24小时的交易聚合信息。

### HTTP请求

`GET https://api.huobi.pro/market/detail/merged`

```shell
curl "https://api.huobi.pro/market/detail/merged?symbol=ethusdt"
```

> 以上命令返回的 JSON 结果:

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

### 请求参数

参数      | 数据类型   | 是否必须  | 默认值  | 描述
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | 交易对, 例如 btcusdt, bccbtc

### 响应数据

字段      | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 以UNIX秒为单位的时间戳，并以此作为此ticker的id
amount    | float     | 以基础币种计量的交易量
count     | integer   | 交易次数
open      | float     | 本阶段开盘价
close     | float     | 本阶段收盘价
low       | float     | 本阶段最低价
high      | float     | 本阶段最高价
vol       | float     | 以报价币种计量的交易量
bid       | object    | 当前的最高卖价 [price, quote volume]
ask       | object    | 当前的最低买价 [price, quote volume]

## 所有交易对的最新 Tickers

此交易对获得所有交易对的tickers。

<aside class="notice">此接口返回所有交易对的ticker，因此数据量较大</aside>

### HTTP请求

`GET https://api.huobi.pro/market/tickers`

```shell
curl "https://api.huobi.pro/market/tickers"
```

> 以上命令返回的 JSON 结果:

```json
[  
    {  
        "open":0.044297,      // daily Kline,opennig price
        "close":0.042178,     // daily Kline,closing price
        "low":0.040110,       // daily Kline,the minimum price
        "high":0.045255,      // daily Kline,the maxmum price
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

### 请求参数

此接口不接受任何参数。

### 响应数据

核心响应数据为一个对象列，每个对象包含下面的字段

字段      | 数据类型   | 描述
--------- | --------- | -----------
amount    | float     | 以基础币种计量的交易量
count     | integer   | 交易次数
open      | float     | 本阶段开盘价
close     | float     | 本阶段收盘价
low       | float     | 本阶段最低价
high      | float     | 本阶段最高价
vol       | float     | 以报价币种计量的交易量
symbol    | string    | 交易对，例如btcusdt, bccbtc

## 市场深度数据

此接口返回指定交易对的当前市场深度数据。

### HTTP请求

`GET https://api.huobi.pro/market/depth`

```shell
curl "https://api.huobi.pro/market/depth?symbol=btcusdt&type=step1"
```

> 以上命令返回的 JSON 结果:

```json
{
    "version": 31615842081,
    "ts": 1489464585407,
    "bids": [
      [7964, 0.0678], // [price, amount]
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

### 请求参数

参数      | 数据类型   | 必须     | 描述
--------- | --------- | -------- | -------------
symbol    | string    | true     | 交易对，例如btcusdt, bccbtc
type      | string    | true     | 深度的精细度，具体说明见下方

**参数type的各值说明（需补充）**

取值      | 说明
--------- | ---------
step0     |
step1     |
step2     |
step3     |
step4     |
step5     |

### 响应数据

<aside class="notice">返回的JSON顶级数据对象名为'tick'而不是通常的'data'</aside>

字段      | 数据类型    | 描述
--------- | --------- | -----------
ts        | integer   | UNIX毫秒时间戳
version   | integer   | 内部字段
bids      | object    | 当前的所有买单 [price, quote volume]
asks      | object    | 当前的所有卖单 [price, quote volume]

## 获取最新交易结果

此接口返回指定交易对最新的一个交易记录。

### HTTP请求

`GET https://api.huobi.pro/market/trade`

```shell
curl "https://api.huobi.pro/market/trade?symbol=ethusdt"
```

> 以上命令返回的 JSON 结果:

```json
{
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

### 请求参数

参数      | 数据类型   | 是否必须  | 默认值   | 描述
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | 交易对，例如btcusdt, bccbtc

### 响应数据

<aside class="notice">返回的JSON顶级数据对象名为'tick'而不是通常的'data'</aside>

字段       | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 唯一交易id
amount    | float     | 以基础币种为单位的交易量
price     | float     | 以报价币种为单位的成交价格
ts        | integer   | UNIX毫秒时间戳
direction | string    | 交易方向：“买”或“卖”

## 获得近期交易记录

此接口返回指定交易对近期的所有交易记录。

### HTTP请求

`GET https://api.huobi.pro/market/history/trade`

```shell
curl "https://api.huobi.pro/market/history/trade?symbol=ethusdt&size=2"
```

> 以上命令返回的 JSON 结果:

```json
[  
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

### 请求参数

参数       | 数据类型  | 是否必须   | 默认值 | 描述
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | 交易对，例如 btcusdt, bccbtc
size      | integer   | false    | 1       | 返回的交易记录数量，最大值2000

### 响应数据

<aside class="notice">返回的数据对象是一个对象数组，每个数组元素为一个UNIX时间戳下的所有交易记录，这些交易记录以数组形式呈现。

参数      | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 唯一交易id
amount    | float     | 以基础币种为单位的交易量
price     | float     | 以报价币种为单位的成交价格
ts        | integer   | UNIX毫秒时间戳
direction | string    | 交易方向：“买”或“卖”

## 最近24小时行情数据

此接口返回最近24小时的行情数据汇总。

### Http请求

`GET https://api.huobi.pro/market/detail/`

```shell
curl "https://api.huobi.pro/market/detail?symbol=ethusdt"
```

> 以上命令返回的 JSON 结果:

```json
{  
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

### 请求参数

参数      | 数据类型 | 是否必须 | 默认值 | 描述
--------- | --------- | -------- | ------- | -----------
symbol    | string    | true     | NA      | 交易对，例如btcusdt, bccbtc

### 响应数据

<aside class="notice">返回的JSON顶级数据对象名为'tick'而不是通常的'data'</aside>

字段      | 数据类型   | 描述
--------- | --------- | -----------
id        | integer   | UNIX秒时间戳作为id
amount    | float     | 以基础币种计量的交易量
count     | integer   | 交易次数
open      | float     | 本阶段开盘价
close     | float     | 本阶段收盘价
low       | float     | 本阶段最低价
high      | float     | 本阶段最高价
vol       | float     | 以报价币种计量的交易量
version   | integer   | 内部数据

# 现货交易

<aside class="notice">All endpoints in this section require authentication</aside>

## 下单

This endpoint place an trading order and send to the exchange to be matched.

### Http请求

`GET https://api.huobi.pro/v1/order/orders/place`

```shell
curl "https://api.huobi.pro/v1/order/orders/place"
BODY {
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"}
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": "59378"
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
account-id | string    | true     | NA      | The account id used for this spot trading
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
type       | string    | true     | NA      | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
amount     | string    | true     | NA      | The amount in quote currency to buy / the amount in base currency to sell
price      | string    | false    | NA      | The limit price of limit order
source     | string    | false    | api     | When trade with margin use 'margin-api'

### 响应数据

<aside class="notice">The returned data object is a single string which represents the order id</aside>

## Show All Open Orders

This endpoint returns all open orders which have not been filled completely.

### Http请求

`GET https://api.huobi.pro/v1/order/openOrders`

```shell
curl "https://api.huobi.pro/v1/order/openOrders"
BODY {
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"}
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
account-id | string    | false    | NA      | The account id used for this spot trading
symbol     | string    | false    | NA      | 交易对, e.g. btcusdt, bccbtc
side       | string    | false    | both    | Filter on the direction of the trade, possible values are: buy, sell. Default is to return all
size       | int       | false    | 10      | The max number of orders to return

### 响应数据

参数           | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | order id
symbol              | string    | 交易对, e.g. btcusdt, bccbtc
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

### Http请求

`POST https://api.huobi.pro/v1/order/orders/{order-id}/submitcancel`

```shell
curl "https://api.huobi.pro/v1/order/orders/59378/submitcancel"
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": "59378"
}
```

## Submit Cancel for Multiple Orders at Once

This endpoint submit cancellation for multiple orders at once.

### Http请求

`GET https://api.huobi.pro/v1/order/orders/batchcancel`

```shell
curl "https://api.huobi.pro/v1/order/orders/batchcancel"
BODY {
  "order-ids": [
    "1", "2", "3"
  ]
}
```

> 以上命令返回的 JSON 结果:

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

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
order-ids  | list      | true     | NA      | The order ids to cancel. Max size is 50.

### 响应数据

参数           | 数据类型 | 描述
---------           | --------- | -----------
success             | list      | The order ids with thier cancel request sent successfully
failed              | list      | The details of the failed cancel request

## Submit Cancel for Multiple Orders at Once

This endpoint submit cancellation for multiple orders at once.

### Http请求

`GET https://api.huobi.pro/v1/order/orders/batchcancel`

```shell
curl "https://api.huobi.pro/v1/order/orders/batchcancel"
BODY {
  "order-ids": [
    "1", "2", "3"
  ]
}
```

> 以上命令返回的 JSON 结果:

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

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
order-ids  | list      | true     | NA      | The order ids to cancel. Max size is 50.

### 响应数据

参数           | 数据类型 | 描述
---------           | --------- | -----------
success             | list      | The order ids with thier cancel request sent successfully
failed              | list      | The details of the failed cancel request

## Show the Order Detail of One Order

This endpoint returns the detail of one order.

### Http请求

`GET https://api.huobi.pro/v1/order/orders/{order-id}`

```shell
curl "https://api.huobi.pro/v1/order/orders/59378"
```

> 以上命令返回的 JSON 结果:

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

### 响应数据

参数           | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | order id
symbol              | string    | 交易对, e.g. btcusdt, bccbtc
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

## Show the Match Result of an Order

This endpoint returns the match result of an order.

### Http请求

`GET https://api.huobi.pro/v1/order/orders/{order-id}/matchresult`

```shell
curl "https://api.huobi.pro/v1/order/orders/59378/matchresult"
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 响应数据

<aside class="notice">The return data contains a list and each item in the list represents a match result</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | Internal id
symbol              | string    | 交易对, e.g. btcusdt, bccbtc
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

### Http请求

`GET https://api.huobi.pro/v1/order/orders`

```shell
curl "https://api.huobi.pro/v1/order/orders"
BODY {
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"
   }
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
types      | string    | false    | All     | The types of order to include in the search
states     | string    | false    | All     | 订单状态
start-date | string    | false    | -61d    | Search starts date, in format yyyy-mm-dd
end-date   | string    | false    | today    | Search ends date, in format yyyy-mm-dd
from       | string    | false    | both    | Search order id to begin with
direct     | string    | false    | both    | Search direction when 'from' is used, possible values: 'next', 'prev'
size       | int       | false    | 100     | The max number of orders to return, max value is 100

### 响应数据

参数           | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | Order id
account-id          | integer   | Account id
user-id             | integer   | User id
amount              | string    | The amount of base currency in this order
symbol              | string    | 交易对, e.g. btcusdt, bccbtc
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

## Search the Match Results

This endpoint returns the match results of past and open orders based on specific search criteria.

### Http请求

`GET https://api.huobi.pro/v1/order/matchresults`

```shell
curl "https://api.huobi.pro/v1/order/matchresults"
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
types      | string    | false    | All     | The types of order to include in the search
states     | string    | false    | All     | 订单状态
start-date | string    | false    | -61d    | Search starts date, in format yyyy-mm-dd
end-date   | string    | false    | today   | Search ends date, in format yyyy-mm-dd
from       | string    | false    | NA      | Search match result id to begin with
direct     | string    | false    | next    | Search direction when 'from' is used, possible values: 'next', 'prev'
size       | int       | false    | 100     | The max number of orders to return

### 响应数据

<aside class="notice">The return data contains a list and each item in the list represents a match result</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | Internal id
symbol              | string    | 交易对, e.g. btcusdt, bccbtc
order-id            | string    | The order id of this order
match-id            | string    | The match id of this match
price               | string    | The limit price of limit order
created-at          | int       | The timestamp in milliseconds when the match and fill is done
type                | string    | The order type, possible values are: buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker
filled-amount       | string    | The amount which has been filled
filled-fees         | string    | Transaction fee paid so far
source              | string    | The source where the order was triggered, possible values: sys, web, api, app

# 杠杆交易

<aside class="notice">All endpoints in this section require authentication</aside>

<aside class="notice">Currently margin trade only supports base currency of USDT and BTC</aside>

<aside class="warning">All order placed with margin should set the 'source' field to 'margin-api'</aside>

## 从现货账户划转到杠杆账户

此接口用于将资产从现货账户划转到杠杆账户。

### Http请求

`POST https://api.huobi.pro/v1/dw/transfer-in`

```shell
curl "https://api.huobi.pro/v1/dw/transfer-in"
BODY
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": 1000
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bchbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 划转数量

### 响应数据

<aside class="notice">The return data contains a single value instead of an object</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Transfer id

## 从杠杆账户划转到现货账户

此接口用于将资产从杠杆账户划转到现货账户。

### Http请求

`GET https://api.huobi.pro/v1/dw/transfer-out`

```shell
curl "https://api.huobi.pro/v1/dw/transfer-out"
BODY
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": 1000
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 划转数量

### 响应数据

<aside class="notice">The return data contains a single value instead of an object</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Transfer id

## 申请借贷

此接口用于申请借贷.

### Http请求

`POST https://api.huobi.pro/v1/margin/orders`

```shell
curl "https://api.huobi.pro/v1/margin/orders"
BODY
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": 1000
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 借贷数量

### 响应数据

<aside class="notice">The return data contains a single value instead of an object</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Margin order id

## 归还借贷

此接口用于归还借贷.

### Http请求

`POST https://api.huobi.pro/v1/margin/orders/{order-id}/repay`

```shell
curl "https://api.huobi.pro/v1/margin/orders/1000/repay"
BODY
{
  "amount": "1.0"
}
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": 1000
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
amount     | string    | true     | NA      | 归还币种

### 响应数据

<aside class="notice">The return data contains a single value instead of an object</aside>

参数           | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Margin order id

## 查询借贷订单

This endpoint returns margin orders based on a specific searching criteria.

### Http请求

`POST https://api.huobi.pro/v1/margin/loan-orders`

```shell
curl "https://api.huobi.pro/v1/margin/load-orders"
BODY {
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"
   }
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
states     | string    | false    | All     | 订单状态
start-date | string    | false    | -61d    | Search starts date, in format yyyy-mm-dd
end-date   | string    | false    | today    | Search ends date, in format yyyy-mm-dd
from       | string    | false    | both    | Search order id to begin with
direct     | string    | false    | both    | Search direction when 'from' is used, possible values: 'next', 'prev'
size       | int       | false    | 100     | The max number of orders to return, max value is 100

### 响应数据

参数           | 数据类型 | 描述
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

## 借贷账户详情

This endpoint returns the balance of the margin loan account.

### Http请求

`GET https://api.huobi.pro/v1/margin/accounts/balance`

```shell
curl "https://api.huobi.pro/v1/margin/accounts/balance"
BODY {
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"
   }
```

> 以上命令返回的 JSON 结果:

```json
{  
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
}
```

### 请求参数

参数  | 数据类型 | 是否必须 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc

### 响应数据

Parameter           | Data Type     | Description
---------           | ---------     | -----------
symbol              | string        | The margin loan pair, e.g. btcusdt, bccbtc
state               | string        | Loan state, possible values: created, accrual, cleared, invalid
risk-rate           | string        | The risk rate
fl-price            | string        | The price which triggers closeout
list                | object array  | The list of loans and their details

# 钱包（充值与提现）

TBC

# 账户相关

TBC
