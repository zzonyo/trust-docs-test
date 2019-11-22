---
title: 火币永续合约 API 文档

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.hbg.com/zh-cn/apikey/'> 创建 API Key </a>
includes:

search: False
---

# 简介

## API 简介

欢迎使用火币永续合约 API！ 你可以使用此 API 获得市场行情数据，进行交易，并且管理你的账户。

在文档的右侧是代码，目前我们仅提供针对 `shell` 的代码示例。

你可以通过选择上方下拉菜单的版本号来切换文档对应的 API 版本，也可以通过点击右上方的语言按钮来切换文档语言。

# 更新日志

|  生效时间（北京时间 UTC+8) | 接口 | 新增 / 修改 | 摘要 |
|-----|-----|-----|-----|
|2019.11.21 19:00| 初版

# 接入说明

## 接入 URLs

**REST API**

**`https://api.hbswap.pro`**  

**Websocket API**

**`wss://api.hbswap.pro`**  

## 限频规则

10次/秒

## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。每一个API Key需要有适当的权限才能访问相应的接口。每个新创建的API Key都需要分配权限。权限类型分为：读取，交易，提币。在使用接口前，请查看每个接口的权限类型，并确认你的API Key有相应的权限。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 api.huobi.pro，比如 api.huobi.pro/v1/order/orders。

- API 访问密钥（AccessKeyId）：您申请的 API Key 中的 Access Key。

- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。

- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。

- 时间戳（Timestamp）：您发出请求的时间 (UTC 时间)  。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。

- 必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。 请一定注意：对于 GET 请求，每个方法自带的参数都需要进行签名运算； 对于 POST 请求，每个方法自带的参数不进行签名认证，即 POST 请求中需要进行签名运算的只有 AccessKeyId、SignatureMethod、SignatureVersion、Timestamp 四个参数，其它参数放在 body 中。

- 签名：签名计算得出的值，用于确保签名有效和未被篡改。


### 创建 API Key

您可以在 <a href='https://www.hbg.com/zh-cn/apikey/'>这里 </a> 创建 API Key。

API Key 包括以下两部分

- `Access Key`  API 访问密钥
  
- `Secret Key`  签名认证加密所使用的密钥（仅申请时可见）

<aside class="notice">
创建 API Key 时可以选择绑定 IP 地址，未绑定 IP 地址的 API Key 有效期为90天。
</aside>
<aside class="notice">
API Key 具有包括交易、借币和充提币等所有操作权限。
</aside>
<aside class="warning">
这两个密钥与账号安全紧密相关，无论何时都请勿向其它人透露。
</aside>


### 签名步骤

规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情

`https://api.huobi.pro/v1/order/orders?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

#### 1. 请求方法（GET 或 POST），后面添加换行符 “\n”


`GET\n`

#### 2. 添加小写的访问地址，后面添加换行符 “\n”

`
api.huobi.pro\n
`

#### 3. 访问方法的路径，后面添加换行符 “\n”

`
/v1/order/orders\n
`

#### 4. 按照ASCII码的顺序对参数名进行排序。例如，下面是请求参数的原始顺序，进行过编码后


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 编码，且进行了 URI 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空格被编码为 “%20”。
</aside>
<aside class="notice">
时间戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加并且进行 URI 编码。
</aside>


#### 5. 经过排序之后

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

#### 6. 按照以上顺序，将各参数使用字符 “&” 连接


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`

#### 7. 组成最终的要进行签名计算的字符串如下

`GET\n`

`api.huobi.pro\n`

`/v1/order/orders\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`


#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里

最终，发送到服务器的 API 请求应该为

`https://api.huobi.pro/v1/order/orders?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

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
ts        | int       | 接口返回的调整为北京时间的时间戳，单位毫秒
data      | object    | 接口返回数据主体

# REST接口列表

|	类别	|	接口	|	路径	|	API权限	|
|--------- | --------- | -----------|-----------|
|	订单类接口（私有数据）	|	下单	|	POST /orders	|	交易	|
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

# 订单类接口（私有数据）

## 下单（逐一下单）

- POST ` /orders`

```json

```

### 请求参数

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|	缺省值	|
|	---	|	----	|	----	|	---	|	---	|	----	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	orderPrice	|	string	|	TRUE	|	订单价格（市价单无需此字段）	|		|		|
|	orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|		|
|	orderSize	|	long	|	TRUE	|	订单数量（张）	|		|		|
|	timeInForce	|	string	|	FALSE	|	订单有效期	|	gtc,ioc	|	gtc	|
|	orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|		|
|	stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托有效）	|		|		|
|	stopBy	|	string	|	FALSE	|	触发源（仅对计划委托有效）	|	last-trade-price,mark-price,index-price	|	last-trade-price	|


> Responds:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	---	|	----	|	----	|	---	|	---	|
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|		|		|
|	     { orderId }	|	long	|	TRUE	|	订单编号	|		|


## 批量撤单

- POST ` /orders`

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|orderIds|	string[]	|TRUE	|订单编号列表（每次最多批量撤销50张订单。）|		||

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|orderId|	long|	TRUE|	订单编号|||

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|
|	orderSide	|	string	|	FALSE	|	订单方向	|	buy,sell	|	all	|
|	orderTypes	|	string	|	FALSE	|	订单类型（可多填，以逗号分隔）	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以orderCreateTime为key进行检索	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|
|	orderStatus	|	string	|	FALSE	|	订单状态（可多填，以逗号分隔）	|	filled,partial-canceled,canceled,rejected	|	all	|
|	orderTypes	|	string	|	FALSE	|	订单类型（可多填，以逗号分隔）	|	limit,stop-limit	|	all	|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以lastActTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	FALSE	|	合约代码，如不填orderId，symbol必填，如已填orderId，symbol须不填	|		|		|
|	orderId	|	long	|	FALSE	|	订单编号，如不填symbol，orderId必填，如已填symbol，orderId须不填	|		|		|
|	traceFrom	|	long	|	FALSE	|	回溯起始时间点（含），以tradeTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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
|	      feeType	|	string	|	TRUE	|	交易手续费类型	|	maker,taker	|
|	      orderId	|	long	|	TRUE	|	订单编号	|		|
|	      orderSide }|	string	|	TRUE	|	订单方向	|	buy,sell	|
