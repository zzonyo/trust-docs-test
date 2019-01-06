---
title: 火币 API 文档 v1.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>获取 APIKEY </a>
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

参数名称| 数据类型 | 描述
--------- | --------- | -----------
status    | string    | API接口返回状态
ch        | string    | 接口数据对应的数据流。部分接口没有对应数据流因此不返回此字段
ts        | int       | 接口返回的时间戳
data      | object    | 接口返回数据主体

## 限频规则

现货 / 杠杆(api.huobi.pro)：10秒100次

合约(api.hbdm.com)：限制频率为10秒50次
<aside class="notice">
单个APIKEY维度限制，建议行情API访问也要加上签名，否则限频会更严格。
</aside>

## 签名认证

部分接口需要通过签名验证以确保数据私有性。 在进行接口签名验证之前，你需要先获得API key和其对应的密钥。

<aside class="notice">
目前关于apikey申请和修改，请在“账户 - API管理”页面进行相关操作。其中AccessKey为API 访问密钥，SecretKey为用户对请求进行签名的密钥（仅申请时可见）。
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

字段名称            | 数据类型 | 描述
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

`GET /market/history/kline`

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
symbol    | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
period    | string    | true     | NA      | The period of each candle, allowed values are: 1min, 5min, 15min, 30min, 60min, 1day, 1mon, 1week, 1year
size      | integer   | false    | 150     | The number of data returns, range [1, 2000]

### 响应数据

字段名称      | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 以UNIX秒为单位的时间戳，并以此作为此K线柱的id
amount    | float     | 以基础币种计量的交易量
count     | integer   | 交易次数
open      | float     | 本阶段开盘价
close     | float     | 本阶段收盘价
low       | float     | 本阶段最低价
high      | float     | 本阶段最高价
vol       | float     | 以报价币种计量的交易量

## 聚合行情（Ticker）

此接口获取ticker信息同时提供最近24小时的交易聚合信息。

### HTTP请求

`GET /market/detail/merged`

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

字段名称      | 数据类型 | 描述
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

`GET /market/tickers`

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

字段名称      | 数据类型   | 描述
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

`GET /market/depth`

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

字段名称      | 数据类型    | 描述
--------- | --------- | -----------
ts        | integer   | UNIX毫秒时间戳
version   | integer   | 内部字段
bids      | object    | 当前的所有买单 [price, quote volume]
asks      | object    | 当前的所有卖单 [price, quote volume]

## 最近市场成交记录

此接口返回指定交易对最新的一个交易记录。

### HTTP请求

`GET /market/trade`

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

字段名称       | 数据类型 | 描述
--------- | --------- | -----------
id        | integer   | 唯一交易id
amount    | float     | 以基础币种为单位的交易量
price     | float     | 以报价币种为单位的成交价格
ts        | integer   | UNIX毫秒时间戳
direction | string    | 交易方向：“买”或“卖”

## 获得近期交易记录

此接口返回指定交易对近期的所有交易记录。

### HTTP请求

`GET /market/history/trade`

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

`GET /market/detail/`

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

字段名称      | 数据类型   | 描述
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

<aside class="notice">与这个部分的接口交互需要先进行身份验证。</aside>

## 下单

此接口发送一个新订单到火币以进行撮合。

### Http请求

`GET /v1/order/orders/place`

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

参数名称 | 数据类型 | 是否必需 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
account-id | string    | true     | NA      | 现货交易的账户id
symbol     | string    | true     | NA      | 交易对, 例如btcusdt, bccbtc
type       | string    | true     | NA      | 订单类型，包括buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker （TBC 这里可能需要翻译加说明）
amount     | string    | true     | NA      | 订单交易量，以交易对的基础币种来表示（TBC）
price      | string    | false    | NA      | limit order的交易价格
source     | string    | false    | api     | 现货交易填写“api”

### 响应数据

返回的主数据对象是一个对应下单单号的字符串。

## 查询当前未成交订单

此接口查询已发送但是仍未成交的订单。

### Http请求

`GET /v1/order/openOrders`

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

参数名称 | 数据类型 | 是否必需 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
account-id | string    | false    | NA      | 现货交易的账户id
symbol     | string    | false    | NA      | 交易对, 例如btcusdt, bccbtc
side       | string    | false    | both    | 指定只返回某一个方向的订单，可能的值有: buy, sell. 默认两个方向都返回。
size       | int       | false    | 10      | 返回订单的数量，最大值2000。

### 响应数据

字段名称          | 数据类型 | 描述
---------           | --------- | -----------
id                  | integer   | 订单id
symbol              | string    | 交易对, 例如btcusdt, bccbtc
price               | string    | limit order的交易价格
created-at          | int       | 订单创建的毫秒时间戳
type                | string    | 订单类型
filled-amount       | string    | 订单中已成交部分的数量
filled-cash-amount  | string    | 订单中已成交部分的总价格
filled-fees         | string    | 已交交易手续费总额
source              | string    | 现货交易填写“api”
state               | string    | 订单状态，包括submitted, partical-filled, cancelling

## 发送订单取消请求

此接口发送一个取消订单的请求。

<aside class="warning">此接口只提交取消请求，实际取消结果需要通过订单状态，撮合状态等接口来确认。</aside>

### Http请求

`POST /v1/order/orders/{order-id}/submitcancel`

```shell
curl "https://api.huobi.pro/v1/order/orders/59378/submitcancel"
```

> 以上命令返回的 JSON 结果:

```json
{  
  "data": "59378"
}
```

### 请求参数

此接口不接受任何参数。

### 响应数据

返回的主数据对象是一个对应下单单号的字符串。

## 批量撤销订单

此接口同时为多个订单（基于id）发送取消请求。

### Http请求

`GET /v1/order/orders/batchcancel`

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

| 参数名称  | 是否必须 | 类型   | 描述   | 默认值  | 取值范围 |
| ---- | ---- | ---- | ----  | ---- | ---- |
| order-ids | true | list | 撤销订单ID列表 |  |单次不超过50个订单id|

### 响应数据

| 字段名称 | 数据类型 | 描述
| ---- | ----- | ---- |
| data | map | 撤单结果

## 批量取消符合条件的订单

此接口同时为多个订单（基于筛选条件）发送取消请求。

### Http请求

`GET /v1/order/orders/batchcancel`

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

| 参数名称     | 是否必须 | 类型     | 描述           | 默认值  | 取值范围 |
| -------- | ---- | ------ | ------------ | ---- | ---- |
| account-id | true  | string | 账户ID     |     |      |
| symbol     | false | string | 交易对     |      |   单个交易对字符串，缺省将返回所有符合条件尚未成交订单  |
| side | false | string | 主动交易方向 |      |   “buy”或“sell”，缺省将返回所有符合条件尚未成交订单   |
| size | false | int | 所需返回记录数  |  100 |   [0, 100]   |

### 响应数据

| 字段名称 | 数据类型   | 描述 |
| ---- | ---- | ------ |
| success-count | true | int | 成功取消的订单数
| failed-count | true | int | 取消失败的订单数
| next-id | true | long | 下一个符合取消条件的订单号

## 查询单个订单详情

此接口返回指定订单的最新状态和详情。

### Http请求

`GET /v1/order/orders/{order-id}`

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

### 请求参数

| 参数名称     | 是否必须 | 类型  | 描述   | 默认值  | 取值范围 |
| -------- | ---- | ------ | -----  | ---- | ---- |
| order-id | true | string | 订单ID，填在path中 |      |      |

### 响应数据

| 字段名称     | 是否必须  | 数据类型   | 描述   | 取值范围     |
| ----------------- | ----- | ------ | -------  | ----  |
| account-id        | true  | long   | 账户 ID    |       |
| amount            | true  | string | 订单数量              |    |
| canceled-at       | false | long   | 订单撤销时间    |     |
| created-at        | true  | long   | 订单创建时间    |   |
| field-amount      | true  | string | 已成交数量    |     |
| field-cash-amount | true  | string | 已成交总金额     |      |
| field-fees        | true  | string | 已成交手续费（买入为币，卖出为钱） |     |
| finished-at       | false | long   | 订单变为终结态的时间，不是成交时间，包含“已撤单”状态    |     |
| id                | true  | long   | 订单ID    |     |
| price             | true  | string | 订单价格       |     |
| source            | true  | string | 订单来源   | api |
| state             | true  | string | 订单状态   | submitting , submitted 已提交, partial-filled 部分成交, partial-canceled 部分成交撤销, filled 完全成交, canceled 已撤销 |
| symbol            | true  | string | 交易对   | btcusdt, bchbtc, rcneth ... |
| type              | true  | string | 订单类型   | buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |

## 指定订单的成交明细

此接口返回指定订单的成交明细。

### Http请求

`GET /v1/order/orders/{order-id}/matchresults`

```shell
curl "https://api.huobi.pro/v1/order/orders/59378/matchresults"
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

| 参数名称  | 是否必须 | 类型  | 描述  | 默认值  | 取值范围 |
| -------- | ---- | ------ | -----  | ---- | ---- |
| order-id | true | string | 订单ID，填在path中 |      |      |

### 响应数据

<aside class="notice">返回的主数据对象为一个对象数组，其中每一个元件代表一个交易结果</aside>

| 字段名称    | 是否必须 | 数据类型   | 描述   | 取值范围     |
| ------------- | ---- | ------ | -------- | -------- |
| created-at    | true | long   | 成交时间     |    |
| filled-amount | true | string | 成交数量     |    |
| filled-fees   | true | string | 成交手续费    |     |
| id            | true | long   | 订单成交记录ID |     |
| match-id      | true | long   | 撮合ID     |     |
| order-id      | true | long   | 订单 ID    |      |
| price         | true | string | 成交价格  |    |
| source        | true | string | 订单来源  | api      |
| symbol        | true | string | 交易对   | btcusdt, bchbtc, rcneth ...  |
| type          | true | string | 订单类型   | buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |

## 搜索历史订单

此接口基于搜索条件查询历史订单。

### Http请求

`GET /v1/order/orders`

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

| 参数名称   | 是否必须  | 类型     | 描述   | 默认值  | 取值范围   |
| ---------- | ----- | ------ | ------  | ---- | ----  |
| symbol     | true  | string | 交易对      |      |btcusdt, bchbtc, rcneth ...  |
| types      | false | string | 查询的订单类型组合，使用','分割  |      | buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |
| start-date | false | string | 查询开始日期, 日期格式yyyy-mm-dd |      |      |
| end-date   | false | string | 查询结束日期, 日期格式yyyy-mm-dd |      |    |
| states     | true  | string | 查询的订单状态组合，使用','分割  |      | submitted 已提交, partial-filled 部分成交, partial-canceled 部分成交撤销, filled 完全成交, canceled 已撤销 |
| from       | false | string | 查询起始 ID   |      |    |
| direct     | false | string | 查询方向   |      | prev 向前，next 向后    |
| size       | false | string | 查询记录大小      |      |         |

### 响应数据

| 参数名称    | 是否必须  | 数据类型   | 描述   | 取值范围   |
| ----------------- | ----- | ------ | ----------------- | ----  |
| account-id        | true  | long   | 账户 ID    |     |
| amount            | true  | string | 订单数量    |   |
| canceled-at       | false | long   | 接到撤单申请的时间   |    |
| created-at        | true  | long   | 订单创建时间   |    |
| field-amount      | true  | string | 已成交数量   |    |
| field-cash-amount | true  | string | 已成交总金额    |    |
| field-fees        | true  | string | 已成交手续费（买入为币，卖出为钱） |       |
| finished-at       | false | long   | 最后成交时间    |   |
| id                | true  | long   | 订单ID    |    |
| price             | true  | string | 订单价格  |    |
| source            | true  | string | 订单来源   | api  |
| state             | true  | string | 订单状态    | submitting , submitted 已提交, partial-filled 部分成交, partial-canceled 部分成交撤销, filled 完全成交, canceled 已撤销 |
| symbol            | true  | string | 交易对    | btcusdt, bchbtc, rcneth ... |
| type              | true  | string | 订单类型  | submit-cancel：已提交撤单申请  ,buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |

## 查询当前和历史成交

此接口基于搜索条件查询当前和历史成交记录。

### Http请求

`GET /v1/order/matchresults`

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

| 参数名称   | 是否必须  | 类型  | 描述   | 默认值  | 取值范围    |
| ---------- | ----- | ------ | ------ | ---- | ----------- |
| symbol     | true  | string | 交易对   | btcusdt, bchbtc, rcneth ... |    |
| types      | false | string | 查询的订单类型组合，使用','分割   |      | buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |
| start-date | false | string | 查询开始日期, 日期格式yyyy-mm-dd | -61 days     | [-61day, now] |
| end-date   | false | string | 查询结束日期, 日期格式yyyy-mm-dd |   Now   |  [start-date, now]  |
| from       | false | string | 查询起始 ID    |   订单成交记录ID（最大值）   |     |
| direct     | false | string | 查询方向    |   默认next， 成交记录ID由大到小排序   | prev 向前，next 向后   |
| size       | false | string | 查询记录大小    |   100   | <=100  |

### 响应数据

<aside class="notice">返回的主数据对象为一个对象数组，其中每一个元件代表一个交易结果。</aside>

| 参数名称   | 是否必须 | 数据类型   | 描述   | 取值范围   |
| ------------- | ---- | ------ | -------- | ------- |
| created-at    | true | long   | 成交时间     |    |
| filled-amount | true | string | 成交数量     |    |
| filled-fees   | true | string | 成交手续费    |    |
| id            | true | long   | 订单成交记录ID |    |
| match-id      | true | long   | 撮合ID     |    |
| order-id      | true | long   | 订单 ID    |    |
| price         | true | string | 成交价格     |    |
| source        | true | string | 订单来源     | api   |
| symbol        | true | string | 交易对      | btcusdt, bchbtc, rcneth ...  |
| type          | true | string | 订单类型     | buy-market：市价买, sell-market：市价卖, buy-limit：限价买, sell-limit：限价卖, buy-ioc：IOC买单, sell-ioc：IOC卖单 |

# 杠杆交易

<aside class="notice">与这个部分的接口交互需要先进行身份验证。</aside>

<aside class="notice">目前杠杆交易仅支持以USDT和BTC为报价币种的交易对。</aside>

<aside class="warning">所有通过杠杆交易接口发出的订单，“source”参数需设置为“margin-api”</aside>

## 从现货账户划转到杠杆账户

此接口用于将资产从现货账户划转到杠杆账户。

### Http请求

`POST /v1/dw/transfer-in`

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

参数名称 | 数据类型 | 是否必需 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bchbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 划转数量

### 响应数据

字段名称          | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Transfer id

## 从杠杆账户划转到现货账户

此接口用于将资产从杠杆账户划转到现货账户。

### Http请求

`GET /v1/dw/transfer-out`

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

参数名称 | 数据类型 | 是否必需 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 划转数量

### 响应数据

字段名称          | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Transfer id

## 申请借贷

此接口用于申请借贷.

### Http请求

`POST /v1/margin/orders`

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

参数名称 | 数据类型 | 是否必需 | 默认值 | 描述
---------  | --------- | -------- | ------- | -----------
symbol     | string    | true     | NA      | 交易对, e.g. btcusdt, bccbtc
currency   | string    | true     | NA      | 币种
amount     | string    | true     | NA      | 借贷数量

### 响应数据

字段名称          | 数据类型 | 描述
---------           | --------- | -----------
data                | integer   | Margin order id

## 归还借贷

此接口用于归还借贷.

### Http请求

`POST /v1/margin/orders/{order-id}/repay`

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

参数名称 | 数据类型 | 是否必需 | 描述
---------  | --------- | -------- | -----------
order-id   | string    | true     | 借贷订单 ID，写在 path 中
amount     | string    | true     | 归还币种

### 响应数据

字段名称     | 数据类型 | 描述
-------  | ------- | -----------
data     | integer | Margin order id

## 查询借贷订单

此接口基于指定搜索条件返回借贷订单。

### Http请求

`POST /v1/margin/loan-orders`

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

| 参数名称       | 是否必须  | 类型     | 描述    | 默认值  | 取值范围   |
| ----- | ----- | ------ |  -------  | ---- |  ----  |
| symbol | true | string | 交易对  |  |  |
| start-date | false | string | 查询开始日期, 日期格式yyyy-mm-dd  |     |    |
| end-date | false | string | 查询结束日期, 日期格式yyyy-mm-dd  |    |    |
| states | false | string | 状态 |     |   |
| from   | false | string | 查询起始 ID  |    |     |
| direct | false | string | 查询方向     |    | prev 向前，next 向后 |
| size   | false | string | 查询记录大小  |    |     |

### 响应数据

| 字段名称 | 是否必须 | 数据类型 | 描述 | 取值范围 |
|-----|-----|-----|-----|------|
|   id  |  true  |  long  |  订单号 | |
|   user-id  |  true  |  long  | 用户ID | |
|   account-id  |  true  |  long  |  账户ID | |
|   symbol  |  true  |  string  |  交易对 | |
|   currency  |  true  |  string  |  币种 | |
| loan-amount | true |string | 借贷本金总额 | |
| loan-balance | true | string | 未还本金 | |
| interest-rate | true | string | 利率 | |
| interest-amount | true | string | 利息总额 | |
| interest-balance | true | string | 未还利息 | |
| created-at | true | long | 借贷发起时间 | |
| accrued-at | true | long | 最近一次计息时间 | |
| state | true | string | 订单状态 |created 未放款，accrual 已放款，cleared 已还清，invalid 异常|

## 借贷账户详情

此接口返回借贷账户详情。

### Http请求

`GET /v1/margin/accounts/balance`

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

| 参数名称 | 是否必须 | 类型 | 描述 | 默认值 | 取值范围 |
|-----|-----|-----|-----|-----|-----|
| symbol | false | string | 交易对，作为get参数  |  |  |

### 响应数据

| 字段名称 | 是否必须 | 数据类型 | 描述 | 取值范围 |
|-----|-----|-----|-----|------|
| symbol  |  true  |  string  |  交易对 | |
| state  |  true  |  string  |  账户状态 | working,fl-sys,fl-mgt,fl-end |
| risk-rate | true | object | 风险率 | |
| fl-price | true | string | 爆仓价 | |
| list | true | array | 子账户列表 | |

# 钱包（充值与提现）

TBC

# 账户相关

TBC
