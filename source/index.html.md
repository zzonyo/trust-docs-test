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
|2019.11.21 19:00| ||初版|

# REST接口列表

|	类别	|	接口	|	路径	|	API权限	|
|--------- | --------- | -----------|-----------|
|	订单类接口（私有数据）	|	下单	|	[POST /orders](#下单逐一下单)	|	交易	|
|		|	批量撤单	|	[DELETE /orders](#批量撤单)	|	交易	|
|		|	查询特定订单	|	[GET /orders/detail](#查询特定订单)	|	交易	|
|		|	查询open订单	|	[GET /orders/open-orders](#查询open订单)	|	读取	|
|		|	查询历史订单	|	[GET /orders/history](#查询closed订单)	|	读取	|
|		|	查询历史成交	|	[GET /orders/trades](#查询历史成交)	|	读取	|
|	仓位类接口（私有数据）|	查询仓位	|	[GET /positions](#查询仓位)	|	读取	|
|		|	调整仓位设置	|	[POST /positions/setting](#调整仓位设置)	|	交易	|
|		|	仓位保证金划转	|	[POST /positions/margin](#仓位保证金划转)	|	交易	|
|	账户类接口（私有数据）	|	查询账户余额	|	[GET /account/balance](#查询账户余额)	|	读取	|
|	行情类接口（公共数据）|	K线	|	[GET /market/candlesticks](#K线)	|	-	|
|		|	有限档位MBP	|	[GET /market/mbp](#有限档位MBP)	|	-	|
|		|	市场成交	|	[GET /market/trades](#市场成交)	|	-	|
|		|	市场快照	|	[GET /market/summary](#市场快照)	|	-	|
|	Benchmark接口（公共数据）	|	资金费率	|	[GET /market/funding-rate](#历史资金费率)	|	-	|
|		|	预测资金费率	|	[GET /market/indicative-funding-rate](#预测资金费率)	|	-	|
|		|	指数价格及成分（动态）	|	[GET /market/index-constituents](#指数价格及成分动态)	|	-	|
|	参考数据类接口（公共数据）	|	查询合约要素	|	[GET /reference/instruments](#查询合约要素)	|	-	|

# Websocket接口列表

|	类别	|	接口	|	主题	|	API权限	|
|	-----	|	--------	|	--------	|	----	|	
|	订单类接口（私有数据）	|	订阅订单更新 - 创建	|	[orders#${symbol}](#订阅订单更新)	|	读取	|
|		|	订阅订单更新 - 触发	|	[orders#${symbol}](#订阅订单更新)	|	读取	|
|		|	订阅订单更新 - 成交	|	[orders#${symbol}](#订阅订单更新)	|	读取	|
|		|	订阅订单更新 - 撤销	|	[orders#${symbol}](#订阅订单更新)	|	读取	|
|	仓位类接口（私有数据）	|	订阅仓位更新	|	[positions#${symbol}](#订阅仓位更新)	|	读取	|
|	账户类接口（私有数据） |	订阅账户流水	|	[accounts#${currency}](#订阅账户流水)	|	读取	|
|	行情类接口（公共数据）	|	订阅&请求K线	|	[candlestick#${symbol}@${interval}](#订阅请求K线)	|	-	|
|		|	订阅&请求有限档位MBP	|	[mbp#${symbol}@${levels}](#订阅请求有限档位MBP)	|	-	|
|		|	订阅&请求市场成交	|	[trades#${symbol}](#订阅请求市场成交)	|	-	|
|		|	订阅市场快照	|	[summary#${symbol}](#订阅市场快照)	|	-	|
|	Benchmark类接口（公共数据） |	订阅预测资金费率	|	[ind.funding.rate#${symbol}](#订阅预测资金费率)	|	-	|
|		|	订阅指数价格及成分（动态）	|	[index.cons#${symbol}](#订阅指数价格及成分动态)	|	-	|

# REST私有数据接口接入说明

## 接口鉴权

### 签名说明
API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。

一个合法的请求由以下几部分组成：

方法请求地址：即访问服务器地址 api.hbdm.com，比如 api.XXX.com/api/swap/orders/detail

API 访问密钥（AccessKeyId）：您申请的 API Key 中的 Access Key。

签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。

签名版本（SignatureVersion）：签名协议的版本，此处使用2。

时间戳（Timestamp）：您发出请求的时间 (UTC 时区) (UTC 时区) (UTC 时区) 。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。

必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。 请一定注意：对于 GET 请求，每个方法自带的参数都需要进行签名运算； 对于 POST 请求，每个方法自带的参数不进行签名认证，即 POST 请求中需要进行签名运算的只有 AccessKeyId、SignatureMethod、SignatureVersion、Timestamp 四个参数，其它参数放在 body 中。

签名：签名计算得出的值，用于确保签名有效和未被篡改。

### 签名步骤
规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情

https://api.XXX.com/api/swap/orders/detail

AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx

&SignatureMethod=HmacSHA256

&SignatureVersion=2

&Timestamp=2017-05-11T15:19:30

&orderId=2

#### 1. 请求方法（GET 或 POST），后面添加换行符 “\n”
GET\n

#### 2. 添加小写的访问地址，后面添加换行符 “\n”
api.XXX.com\n

#### 3. 访问方法的路径，后面添加换行符 “\n”
/api/swap/orders/detail\n

#### 4. 按照ASCII码的顺序对参数名进行排序。例如，下面是请求参数的原始顺序，进行过编码后
AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx

SignatureMethod=HmacSHA256

SignatureVersion=2

Timestamp=2017-05-11T15%3A19%3A30

orderId=2

`参数使用 UTF-8 编码，且进行了 URI 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空格被编码为 “%20”。`
`其中时间戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加并且进行 URI 编码。`

#### 5. 经过排序之后
AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx

orderId=2

SignatureMethod=HmacSHA256

SignatureVersion=2

Timestamp=2017-05-11T15%3A19%3A30

#### 6. 按照以上顺序，将各参数使用字符 “&” 连接
AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&orderId=2&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30

#### 7. 组成最终的要进行签名计算的字符串如下
GET\n

api.XXX.com\n

/api/swap/orders/detail\n

AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&orderId=2&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30

#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名
4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=

将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里
最终，发送到服务器的 API 请求应该为

https://api.XXX.com/api/swap/orders/detail?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&orderId=2&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

把所有必须的认证参数添加到接口调用的路径参数里

把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

# Websocket私有数据接口接入说明
 
## Websocket建连

上下行数据采用json格式进行传输，数据不进行压缩。
WebSocket建立连接时需要在header中明确指定所属的交易所编码，该header一般由接入层自动添加。

示例：`exchangeCode=xxx`

## 客户端请求

| 参数名 | 类型 | 是否必需 | 说明 |
|--------|----|--------|----|
| action | string | Y | 请求动作。有效值:req,sub,unsub,pong|
| seq | long| N | 请求序列号，客户端自定义。如果存在该参数，服务端会在响应结果中返回该字段|
| ch | string | N | 数据主题|
| params | object | N | 请求的参数|

格式如下：

```json
{
    "action": "req", 
    "ch": "auth",
    "params": { 
        "authType":"api",
        "accessKey": "sffd-ddfd-dfdsaf-dfdsafsd",
        "signatureMethod": "HmacSHA256",
        "signatureVersion": "2",
        "timestamp": "2019-09-01T18:16:16",
        "signature": "safsfdsjfljljdfsjfsjfsdfhsdkjfhklhsdlkfjhlksdfh"
    }
}
```

## 服务端返回

服务器会向客户端发送三种类型的数据：
- 响应数据，是对客户端请求的应答数据
- 推送数据，是客户端订阅主题后，主动推送的主题更新数据
- 保活数据，是服务端向客户端下发的Ping消息

返回的数据结构如下（空白表示该场景不适用）：

| 参数名 | 类型 | 响应数据 | 推送数据 | 保活数据 | 说明 |
|-----|-------|--------|----|--------|----|
| action | string | 非空，取值: req,sub,unsub  | 非空，取值: push | 非空，取值: ping | 客户端的请求动作|
| ch | string | 非空 | 非空 |  | 数据主题|
| code | int | 非空 |  |  | 服务端返回码
| data | object | 可空 | 非空 | 非空 | 返回的数据体|
| message | string | 可空 | |  |  返回码描述，code为200时不返回|
| seq | long | 可空 |  |  |  客户端请求的序号|
<aside class="notice"> 可空的字段在输出时如果值为null，返回的json中将不出现该字段。</aside>

### 响应数据的格式

```json
成功：
{
    "action": "req",
    "ch": "auth",
    "code": 200,
    "data": {},
    "seq": 9898989898
}
失败：
{
    "action": "req",
    "ch": "auth",
    "code": 500,
    "message": "system.error",
    "seq": 9898989898
}
```


### 推送数据的格式

```json
{
    "action": "push",
    "ch": "trade.update#btcusdt",
    "data": {
          "symbol": "btcusdt",
          "orderId": 19181918
    }
}
```


### 保活数据的格式

```json
{
    "action": "ping",
    "data": {
          "ts": 1918191878787
    }
}
```


## Action类型

客户端和服务端发送数据的Action包括如下几类：

| Action名称 | 方向 | 说明|
|-----|-------|--------|
| req | 双向 | 一次性请求|
| sub | 双向 | 订阅数据|
| unsub | 双向 | 取消订阅|
| push | Server -> Client | 服务器向客户端推送订阅消息|
| ping | Server -> Client | 服务器向客户端推送Ping消息|
| pong | Client -> Server | 客户端向服务器回复Pong消息|

## 连接保活
  
Websocket的连接采用读/写双向保活，客户端超过60s未向服务端发送数据或服务端超过60s未向客户端发送数据均认为连接已经失效，服务端将主动断开与客户端的连接。

服务器每隔20s向客户端发送一次ping消息，ping消息包含一个long型的时间戳，客户端需要向服务器回复pong，pong消息包含一个long型的时间戳，该值建议使用ping消息的时间戳。示例：

服务器推送Ping消息:

```json
{
    "action": "ping",
    "data": {
        "ts": 12345678
    }
}
```
客户端回复Pong消息: 

```json
{
    "action": "pong",
    "params": {
        "ts": 12345678
    }
}
```

<aside class="notice">保活机制只看双向是否有数据传输，不关心数据内容，如果回复pong时未采用要求的格式，连接不会被关闭但可能会提示数据错误。</aside>

## 流控
  


## 用户鉴权

用户鉴权是一次Req操作，需要客户端向服务器发送req请求。

### AccessKey 鉴权

用于API用户的鉴权

数据主题：
`auth`

请求参数列表

| 字段 | 类型 | 是否必填 | 说明|
|-----|-------|--------|----|
| authType | string | 必填 | api|
| accessKey | string | 必填 | API访问密钥|
| signatureMethod | string | 必填 | 签名方法，有效取值：HmacSHA256|
| signatureVersion | string | 必填 | 签名协议版本，有效取值：2|
| timestamp | string | 必填 | 发出请求时的时间戳 (UTC 时区) ，格式：`2017-05-21T16:22:06`|
| signature | string | 必填 | 签名，计算得出的值，用于确保签名有效和未被篡改|

请求示例：
```json
{
    "action": "req", 
    "ch": "auth",
    "params": { 
        "authType":"api",
        "accessKey": "sffd-ddfd-dfdsaf-dfdsafsd",
        "signatureMethod": "HmacSHA256",
        "signatureVersion": "2",
        "timestamp": "2019-09-01T18:16:16",
        "signature": "safsfdsjfljljdfsjfsjfsdfhsdkjfhklhsdlkfjhlksdfh"
    }
}

```

响应结果列表

无

响应示例：

```json
{
    "action": "req", 
    "ch": "auth",
    "code": 200
}

```

# Websocket公共数据接口接入说明

# REST接口 - 订单类（私有数据）

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

- DELETE ` /orders`

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

> Response:

```json

```

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

> Response:

```json

```

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

> Response:

```json

```

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

> Response:

```json

```

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
|	      aggressor	|	boolean	|	TRUE	|	成交主动方	|	true,false	|
|	      orderId	|	long	|	TRUE	|	订单编号	|		|
|	      orderSide }|	string	|	TRUE	|	订单方向	|	buy,sell	|

# REST接口 - 仓位类（私有数据）

## 查询仓位

- GET ` /positions`

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|symbol|	string	|FALSE	|合约代码||	all


> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	marginMode	|	string	|	FALSE	|	持仓模式（marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项，例外：全仓转逐仓须同时指定杠杆率leverage）	|	cross,isolated	|		|
|	riskLimit	|	long	|	FALSE	|	风险限额（marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项）	|		|		|
|	leverage	|	string	|	FALSE	|	杠杆率（仅对逐仓模式有效，marginMode，riskLimit，leverage须分别调整，每次请求须仅填一项，例外：全仓转逐仓须同时指定杠杆率leverage）	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|amount|string	|TRUE|账户与仓位间资金划转金额（转入仓位为正值，转出仓位为负值）|||

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|currency	|string	|FALSE	|币种		||all

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	interval	|	string	|	TRUE	|	K线间隔	|	1m,5m,15m,30m,60m,4h,1d（基于自然日，GMT时间）,1w（基于自然周，GMT时间）,1M（基于自然月，GMT时间）,1y（基于自然年，GMT时间）	|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以ts为key进行检索	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	100	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	code	|	integer	|	TRUE	|	返回码	|		|
|	message	|	string	|	FALSE	|	错误消息（仅出错时返回）	|		|
|	data	|	object	|	TRUE	|	按id倒序排列	|		|
|	     { symbol	|	string	|	FALSE	|	代码	|		|
|	      open	|	string	|	FALSE	|	K线区间内开盘价	|		|
|	      high	|	string	|	FALSE	|	K线区间内最高价	|		|
|	      low	|	string	|	FALSE	|	K线区间内最低价	|		|
|	      close	|	string	|	FALSE	|	K线区间内收盘价	|		|
|	      numOfTrades	|	integer	|	FALSE	|	K线区间内总成交笔数（仅对合约代码有效）	|		|
|	      volume	|	string	|	FALSE	|	K线区间内总成交量（仅对合约代码有效）	|		|
|	      turnover	|	string	|	FALSE	|	K线区间内总成交额（仅对合约代码有效）	|		|
|	      id }|	long	|	FALSE	|	K线区间开始时间（unix time in second）	|		|

## 有限档位MBP

- GET ` /market/mbp`

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	levels	|	integer	|	FALSE	|	MBP档位	|	5,10,20,50,100	|	5	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,300]	|	1	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|symbol	|string|	TRUE|	合约代码	|||	


> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以fundingTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	1	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	start	|	long	|	FALSE	|	回溯起始时间点（含），以indexTime为key进行检索，最远可查询48小时内历史记录	|		|	最新系统时间	|
|	limit	|	integer	|	FALSE	|	最大返回条目数量	|	[1,500]	|	1	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	FALSE	|	合约代码	|		|	all	|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
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

# Websocket接口 - 订单类（私有数据）

## 订阅订单更新

`orders#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码（可填通配符* ）	|		|		|

> Response:

```json

```

### 返回字段 - 订单创建

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	eventType	|	string	|	TRUE	|	事件类型	|	creation	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	orderId	|	long	|	TRUE	|	订单编号	|		|
|	orderPrice	|	string	|	TRUE	|	订单价格	|		|
|	orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	orderSize	|	long	|	TRUE	|	订单数量	|		|
|	timeInForce	|	string	|	TRUE	|	订单有效期	|	gtc,ioc	|
|	orderType	|	string	|	TRUE	|	订单类型	|	limit,stop-limit	|
|	stopPrice	|	string	|	FALSE	|	触发价格（仅对计划委托订单类型有效）	|		|
|	stopBy	|	string	|	FALSE	|	触发源（仅对计划委托订单类型有效）	|	last-trade-price,mark-price,index-price	|
|	orderStatus	|	string	|	TRUE	|	订单状态	|	created,submitted	|
|	orderCreateTime	|	long	|	TRUE	|	订单创建时间	|		|

> Response:

```json

```

### 返回字段 - 订单触发

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	eventType	|	string	|	TRUE	|	事件类型	|	trigger	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	orderId	|	long	|	TRUE	|	订单编号	|		|
|	orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	orderStatus	|	string	|	TRUE	|	订单状态	|	submitted,rejected	|
|	rejectReason	|	string	|	FALSE	|	被拒原因（仅对计划委托触发校验失败有效）	|		|
|	triggerTime	|	long	|	TRUE	|	触发时间（仅对计划委托有效）	|		|

> Response:

```json

```

### 返回字段 - 订单成交

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	eventType	|	string	|	TRUE	|	事件类型	|	trade	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	orderId	|	long	|	TRUE	|	订单号	|		|
|	tradePrice	|	string	|	TRUE	|	成交价	|		|
|	tradeVolume	|	long	|	TRUE	|	成交量	|		|
|	orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	tradeId	|	long	|	TRUE	|	成交编号（具平台唯一性。  同一taker订单同时产生的多笔成交按对手单成交优先级拥有不同的trade ID）	|		|
|	tradeTime	|	long	|	TRUE	|	成交时间	|		|
|	execType	|	string	|	TRUE	|	成交类型	|	trade（正常成交）,liquidation（爆仓预处理系统减仓）,liquidated（爆仓平仓）,deleverage（ADL自动减仓）,funding（资金费用互换）,administration（系统平仓）	|
|	aggressor	|	boolean	|	TRUE	|	交易手续费类型	|	true,false	|
|	transactFee	|	string	|	TRUE	|	交易手续费	|		|
|	orderStatus	|	string	|	TRUE	|	订单状态	|	partial-filled,filled	|
|	execAmt	|	long	|	TRUE	|	已成交数量	|		|
|	remainAmt	|	long	|	TRUE	|	未成交数量	|		|
|	avgExecPrc	|	string	|	TRUE	|	成交均价	|		|

> Response:

```json

```

### 返回字段 - 订单撤销

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	eventType	|	string	|	TRUE	|	事件类型	|	cancellation	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	orderId	|	integer	|	TRUE	|	订单号	|		|
|	orderSide	|	string	|	TRUE	|	订单方向	|	buy,sell	|
|	orderStatus	|	string	|	TRUE	|	订单状态	|	partial-canceled,canceled	|
|	execAmt	|	long	|	TRUE	|	已成交数量	|		|
|	remainAmt	|	long	|	TRUE	|	未成交数量	|		|
|	avgExecPrc	|	string	|	TRUE	|	成交均价	|		|
|	lastActTime	|	long	|	TRUE	|	订单最近更新时间	|		|

# Websocket接口- 仓位类（私有数据）

## 订阅仓位更新

`positions#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码（可填通配符* ）	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	marginMode	|	string	|	TRUE	|	持仓模式（全仓或逐仓）	|	cross,isolated	|
|	riskLimit	|	long	|	TRUE	|	风险限额	|		|
|	initMargin	|	string	|	TRUE	|	起始保证金率 initial margin rate （逐仓时为杠杆率倒数，全仓时为该档风险限额设定值）	|		|
|	maintMargin	|	string	|	TRUE	|	维持保证金率 maintenance margin rate	|		|
|	alarmMargin	|	string	|	TRUE	|	预警保证金率 alarm margin rate	|		|
|	leverage	|	string	|	TRUE	|	杠杆率 leverage rate	|		|
|	adlRank	|	integer	|	TRUE	|	自动减仓队列排名	|		|
|	liquidationPx	|	string	|	TRUE	|	爆仓价	|		|
|	alarmPx	|	string	|	TRUE	|	预警价	|		|
|	position	|	long	|	TRUE	|	持仓量（张），多仓为正，空仓为负	|		|
|	positionValue	|	string	|	TRUE	|	仓位价值（以标记价格计算）	|		|
|	positionEquity	|	string	|	TRUE	|	仓位权益	|		|
|	positionMargin	|	string	|	TRUE	|	仓位保证金	|		|
|	entryPrice	|	string	|	TRUE	|	开仓均价	|		|
|	realisedPnl	|	string	|	TRUE	|	已实现盈亏 realized profit & loss ，盈为正，亏为负	|		|
|	unrealisedPnl	|	string	|	TRUE	|	未实现盈亏 unrealized profit & loss，盈为正，亏为负，以标记价格计算	|		|
|	unrealisedRoe	|	string	|	TRUE	|	未实现盈亏回报率，盈为正，亏为负，以标记价格计算	|		|
|	markPrice	|	string	|	TRUE	|	标记价格	|		|
|	positionStatus	|	string	|	TRUE	|	仓位状态	|	normal,margin-call,liquidation,deleverage	|
|	ts	|	long	|	TRUE	|	更新时间	|		|

# Websocket接口- 账户类（私有数据）

## 订阅账户流水

`accounts#${currency}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	currency	|	string	|	TRUE	|	币种（可填通配符* ）	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	currency	|	string	|	TRUE	|	币种	|		|
|	accountChange	|	string	|	TRUE	|	余额变更（转入/释放为正，转出/冻结为负）	|		|
|	changeType	|	string	|	TRUE	|	余额变更类型	|	realized-pnl,transfer|
|	changeTime	|	long	|	TRUE	|	余额变更时间	|		|
|	availBalance	|	string	|	TRUE	|	可用余额（不包含累计仓位保证金，不包含累计委托保证金，不包含累计未实现盈亏。可用于开（加）仓，可转出。）	|		|
|	accountBalance	|	string	|	TRUE	|	账户余额（不包含未实现盈亏）	|		|

# Websocket接口- 行情类（公共数据）

## 订阅&请求K线

`candlestick#${symbol}@${interval}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|
|	interval	|	string	|	TRUE	|	K线间隔	|	1m,5m,15m,30m,60m,4h,1d（基于自然日，GMT时间）,1w（基于自然周，GMT时间）,1M（基于自然月，GMT时间）,1y（基于自然年，GMT时间）	|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	id	|	long	|	FALSE	|	K线区间开始时间（unix time in second）	|		|
|	symbol	|	string	|	FALSE	|	代码	|		|
|	open	|	string	|	FALSE	|	K线区间内开盘价	|		|
|	high	|	string	|	FALSE	|	K线区间内最高价	|		|
|	low	|	string	|	FALSE	|	K线区间内最低价	|		|
|	close	|	string	|	FALSE	|	K线区间内收盘价	|		|
|	numOfTrades	|	integer	|	FALSE	|	K线区间内总成交笔数（仅对合约代码有效）	|		|
|	volume	|	string	|	FALSE	|	K线区间内总成交量（仅对合约代码有效）	|		|
|	turnover	|	string	|	FALSE	|	K线区间内总成交额（仅对合约代码有效）	|		|

## 订阅&请求有限档位MBP

`mbp#${symbol}@${levels}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|
|	levels	|	integer	|	TRUE	|	MBP档位	|	5,10,20,50,100	|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	ts	|	long	|	TRUE	|	消息更新时间	|		|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	delta	|	bool	|	TRUE	|	是否增量数据	|	true,false	|
|	bids	|	array	|	TRUE	|	买盘，按price降序排列	|		|
|	     { price	|	string	|	TRUE	|	订单价格	|		|
|	      size }|	string	|	TRUE	|	订单量（在该价格上所有订单量orderSize总和）	|		|
|	asks	|	array	|	TRUE	|	卖盘，按price升序排列	|		|
|	     { price	|	string	|	TRUE	|	订单价格	|		|
|	      size }	|	string	|	TRUE	|	订单量（在该价格上所有订单量orderSize总和）	|		|

## 订阅&请求市场成交

`trades#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	symbol	|	string	|	TRUE	|	代码（可为合约代码、指数代码、标记价格代码）	|		|
|	tradeId	|	long	|	TRUE	|	最近成交编号	|		|
|	tradeTime	|	long	|	TRUE	|	最近成交时间	|		|
|	tradePrice	|	string	|	TRUE	|	最近成交价	|		|
|	tradeVolume	|	string	|	TRUE	|	最近成交量（仅对合约代码有效）	|		|
|	aggrOrdSide	|	string	|	TRUE	|	最近成交主动方（即taker的买卖方向，仅对合约代码有效）	|	buy,sell	|

## 订阅市场快照

`summary#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	open	|	string	|	TRUE	|	滚动24小时日开盘价	|		|
|	high	|	string	|	TRUE	|	滚动24小时日最高价	|		|
|	low	|	string	|	TRUE	|	滚动24小时日最低价	|		|
|	close	|	string	|	TRUE	|	滚动24小时日收盘价	|		|
|	numOfTrades	|	integer	|	TRUE	|	滚动24小时日总成交笔数	|		|
|	totalVolume	|	string	|	TRUE	|	滚动24小时日总成交量	|		|
|	turnover	|	string	|	TRUE	|	滚动24小时日总成交额	|		|
|	instStatus	|	string	|	TRUE	|	合约状态 symbol status	|	normal,intraday-suspended,price-limit	|
|	openInt	|	long	|	TRUE	|	市场总持仓量	|		|

# Websocket接口- Benchmark（公共数据）

## 订阅预测资金费率

`ind.funding.rate#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	合约代码	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	ts	|	long	|	TRUE	|	消息更新时间	|		|
|	symbol	|	string	|	TRUE	|	合约代码	|		|
|	indFundRate	|	string	|	TRUE	|	预估资金费率	|		|
|	indFundTime	|	long	|	TRUE	|	预估资金费用结算时间	|		|

## 订阅指数价格及成分（动态）

`index.cons#${symbol}`

> Subscribe request

```json

```

### 请求参数

|名称	|数据类型|	是否必需|	描述|	取值|	缺省值|
|---	|-------|	---------|	----|	----|	-----|
|	symbol	|	string	|	TRUE	|	指数代码	|		|		|

> Response:

```json

```

### 返回字段

|	名称	|	数据类型	|	是否必需	|	描述	|	取值	|
|	-----	|	--------	|	--------	|	----	|	----	|
|	ts	|	long	|	TRUE	|	消息更新时间	|		|
|	symbol	|	string	|	TRUE	|	指数代码	|		|
|	indexPrice	|	string	|	TRUE	|	指数价格,本阶段18位，后期根据配置提供（truncate)|		|
|	indexTime	|	long	|	TRUE	|	指数计算时间	|		|
|	constituents	|	array	|	TRUE	|	按constituent正序排列	|		|
|	     { constituent	|	string	|	TRUE	|	指数成分，[Exchange Name] + [.] + [Symbol]	|		|
|	      price	|	string	|	TRUE	|	成分价格	|		|
|	      weight }	|	string	|	TRUE	|	成分权重（百分比），精度：小数点后4位	|		|


