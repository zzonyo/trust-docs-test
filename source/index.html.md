---
title: Huobi Trust API 文档

language_tabs: # must be one of https://git.io/vQNgJ
- json

toc_footers:
- <a href='https://www.huobihktrust.com/zh-hk/user/api/'>创建 API Key </a>
  includes:

search: true
---

# 更新日志

<style>
table {
    max-width:100%
}
table th {
    white-space: nowrap; /*表头内容强制在一行显示*/
}
</style>



| 生效时间<br>(UTC +8) | 接口     | 变化      | 摘要         |
| ---------- | --------- | --------- | --------------- |
| 2021.9.16 | - | - | - |


# 简介

欢迎使用Huobi Trust API！

此文档是Huobi Trust API的唯一官方文档，Huobi Trust API提供的功能和服务会在此文档持续更新。

以下是现货API文档各章节主要内容

第一部分是概要介绍：

- **快速入门**：该章节对Huobi Trust API做了简单且全方位的介绍，适合第一次使用Huobi Trust API的用户。
- **常见问题**：该章节列举了使用Huobi Trust API时常见的、和具体API无关的通用问题。
- **联系我们**：该章节介绍了针对不同问题，如何联系我们。

第二部分是每个接口类的详细介绍，每个接口类一个章节，每个章节分为如下内容：

- **简介**：对该接口类进行简单介绍，包括一些注意事项和说明。
- ***具体接口***：介绍每个接口的用途、限频、请求、参数、返回等详细信息。
- **常见错误码**：介绍该接口类下常见的错误码及其说明。
- **常见问题**：介绍该接口类下常见问题和解答。

# 快速入门

## 接入准备

如需使用API ，请先登录网页端，完成API key的申请和权限配置，再据此文档详情进行开发和交易。

您可以点击 <a href='https://www.huobihktrust.com/zh-hk/user/api/ '>这里 </a> 创建 API Key。

每个用户可创建20组Api Key，每个Api Key可对应设置读取权限。

权限说明如下：

- 读取权限：读取权限用于对数据的查询接口，例如：资产列表查询等。

创建成功后请务必记住以下信息：

- `Access Key`  API 访问密钥

- `Secret Key`  签名认证加密所使用的密钥（仅申请时可见）

<aside class="notice">
每个 API Key 最多可绑定 20个IP 地址(主机地址或网络地址)。
</aside>
<aside class="warning">
<red><b>风险提示</b></red>：这两个密钥与账号安全紧密相关，无论何时都请勿将二者<b>同时</b>向其它人透露。API Key的泄露可能会造成您的资产损失（即使未开通提币权限），若发现API Key泄露请尽快删除该API Key。
</aside>

## SDK与代码示例

**SDK（推荐）**

[Java](https://github.com/huobitrustapi/huobi_Java) | [Python3](https://github.com/huobitrustapi/huobi_Python) | [C++](https://github.com/huobitrustapi/huobi_Cpp) | [C#](https://github.com/huobitrustapi/huobi_CSharp) | [Go](https://github.com/huobitrustapi/huobi_golang)

**其它代码示例**

[https://github.com/huobitrustapi?tab=repositories](https://github.com/huobitrustapi?tab=repositories)

## 接口类型

香港信托为用户提供两种接口，您可根据自己的使用场景和偏好来选择适合的方式进行查询资产。

### REST API

REST，即Representational State Transfer的缩写，是目前较为流行的基于HTTP的一种通信机制，每一个URL代表一种资源。

使用API进行资产查询，建议开发者使用REST API进行操作。

### WebSocket API

WebSocket是HTML5一种新的协议（Protocol）。它实现了客户端与服务器全双工通信，通过一次简单的握手就可以建立客户端和服务器连接，服务器可以根据业务规则主动推送信息给客户端。

市场行情和买卖深度等信息，建议开发者使用WebSocket API进行获取。

**接口鉴权**

以上两种接口均包含公共接口和私有接口两种类型。

公共接口可用于获取基础信息和行情数据。公共接口无需认证即可调用。

私有接口可用于交易管理和账户管理。每个私有请求必须使用您的API Key进行签名验证。

## 接入URLs
您可以使用www.huobihktrust.com域名。

**REST API**

**`https://www.huobihktrust.com`**

<aside class="notice">
请使用中国大陆以外的 IP 访问Huobi Trust API。
</aside>
<aside class="notice">
鉴于延迟高和稳定性差等原因，不建议通过代理的方式访问Huobi Trust API。
</aside>
<aside class="notice">
为保证API服务的稳定性，建议使用日本AWS云服务器进行访问。如使用中国大陆境内的客户端服务器，连接的稳定性将难以保证。
</aside>

## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。  
每一个API Key需要有适当的权限才能访问相应的接口，每个新创建的API Key都需要分配权限。在使用接口前，请查看每个接口的权限类型，并确认你的API Key有相应的权限。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 www.huobihktrust.com，比如 www.huobihktrust.com/v1/open/apiKeyDemo。
- API 访问Id（AccessKeyId）：您申请的 API Key 中的 Access Key。
- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。
- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。
- 时间戳（Timestamp）：您发出请求的时间 (UTC 时间)  。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。
- 必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。
  - 对于 GET 请求，每个方法自带的参数都需要进行签名运算。
  - 对于 POST 请求，每个方法自带的参数不进行签名认证，并且需要放在 body 中。
- 签名：签名计算得出的值，用于确保签名有效和未被篡改。

### 签名步骤

规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情时完整的请求URL

`https://www.huobihktrust.com/v1/open/apiKeyDemo?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

**1. 请求方法（GET 或 POST，WebSocket用GET），后面添加换行符 “\n”**

例如：
`GET\n`

**2. 添加小写的访问域名，后面添加换行符 “\n”**

例如：
`
www.huobihktrust.com\n
`

**3. 访问方法的路径，后面添加换行符 “\n”**

例如apiKeyDemo：<br>
`
/v1/open/apiKeyDemo\n
`

例如WebSocket v2<br>
`
/ws/v2
`

**4. 对参数进行URL编码，并且按照ASCII码顺序进行排序**

例如，下面是请求参数的原始顺序，且进行URL编码后


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`demo-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 编码，且进行了 URL 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空格被编码为 “%20”。
</aside>
<aside class="notice">
时间戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加并且进行 URL 编码。时间戳有效时间5分钟。
</aside>

经过排序之后

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`demo-id=1234567890`

**5. 按照以上顺序，将各参数使用字符 “&” 连接**


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`

**6. 组成最终的要进行签名计算的字符串如下**

`GET\n`

`www.huobihktrust.com\n`

`v1/open/apiKeyDemo\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`


**7. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名**


1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。
2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

**8. 将生成的数字签名加入到请求里**

对于Rest接口：

1. 把所有必须的认证参数添加到接口调用的路径参数里
2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

最终，发送到服务器的 API 请求应该为

`https://www.huobihktrust.com/v1/open/apiKeyDemo?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&demo-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`


# 接入说明

## 接口概览

| 接口分类       | 分类链接                     | 概述                                             |
| -------------- | ---------------------------- | ------------------------------------------------ |
| 测试类         | /v1/open/apiKeyDemo/*        | apiKey测试相关接口       |
| 账户类         | /v1/open/account/*           | 账户相关接口             |

该分类为大类整理，部分接口未遵循此规则，请根据需求查看有关接口文档。

## 新限频规则

- 当前，新限频规则正在逐步上线中，已单独标注限频值的接口且该限频值被标注为NEW的接口适用新限频规则。

- 新限频规则采用基于UID的限频机制，即，同一UID下各API Key同时对某单个节点请求的频率不能超出单位时间内该节点最大允许访问次数的限制。

- 用户可根据Http Header中的"X-HB-RateLimit-Requests-Remain"（限频剩余次数）及"X-HB-RateLimit-Requests-Expire"（窗口过期时间）查看当前限频使用情况，以及所在时间窗口的过期时间，根据该数值动态调整您的请求频率。

## 限频规则

除已单独标注限频值为NEW的接口外 -<br>
* 每个API Key 在1秒之内限制10次<br>
* 若接口不需要API Key，则每个IP在1秒内限制10次<br>

比如：

* 资产订单类接口调用根据API Key进行限频：1秒10次


## 请求格式

所有的API请求都是restful，目前只有两种方法：GET和POST

* GET请求：所有的参数都在路径参数里
* POST请求，所有参数以JSON格式发送在请求主体（body）里

## 返回格式

所有的接口都是JSON格式。其中v1和v2接口的JSON定义略有区别。

**接口返回格式**：最上层有三个字段：`code`, `message` 和 `data`。前两个字段表示返回码和错误消息，实际的业务数据在`data`字段里。

以下是一个返回格式的样例：

```json
{
  "code": 200,
  "message": "",
  "data": // per API response data in nested JSON object
}
```

| 参数名称 | 数据类型 | 描述               |
| -------- | -------- | ------------------ |
| code     | int      | API接口返回码      |
| message  | string   | 错误消息（如果有） |
| data     | object   | 接口返回数据主体   |

## 数据类型

本文档对JSON格式中数据类型的描述做如下约定：

- `string`: 字符串类型，用双引号（"）引用
- `int`: 32位整数，主要涉及到状态码、大小、次数等
- `long`: 64位整数，主要涉及到Id和时间戳
- `float`: 浮点数，主要涉及到金额和价格，建议程序中使用高精度浮点型
- `object`: 对象，包含一个子对象{}
- `array`: 数组，包含多个对象

## 最佳实践

###安全类
- 强烈建议：不要将API Key暴露给任何人（包括第三方软件或机构），API Key代表了您的账户权限，API Key的暴露可能会对您的信息、资金造成损失，若API Key泄露，请尽快删除并重新创建。

###公共类
**API访问建议**

- 不建议在中国大陆境内使用临时域名以及代理的方式访问Huobi Trust API，此类方式访问API连接的稳定性很难保证。
- 建议使用日本AWS云服务器进行访问。
- 官方域名www.huobihktrust.com。

**新限频规则**

- 当前最新限频规则正在逐步上线中，已单独标注限频值的接口适用新限频规则。

- 用户可根据Http Header中“X-HB-RateLimit-Requests-Remain（限频剩余次数）”，“X-HB-RateLimit-Requests-Expire（窗口过期时间）”查看当前限频使用情况，以及所在时间窗口的过期时间，根据该数值动态调整您的请求频率。

- 同一UID下各API Key同时对某单个节点请求的频率不能超出单位时间内该节点最大允许访问次数的限制。


# 常见问题

本章列举了和具体API无关的通用常见问题，如网络、签名或通用错误等。

针对某类或某个API的问题，请查看每章API的错误码和常见问题。

### Q1：一个用户可以申请多少个API Key？

每个用户可创建20组API Key，每个API Key可对应设置读取权限。

以下是权限的说明：

- 读取权限：读取权限用于对数据的查询接口，例如：资产查询等。

### Q2：为什么经常出现断线、超时的情况？

请检查是否属于以下情况：

1. 客户端服务器如在中国大陆境内，连接的稳定性很难保证，建议使用日本AWS云服务器进行访问。

### Q3：为什么签名认证总返回失败？

请检查如下可能的原因：

1、签名参数应该按照ASCII码排序。比如下面是原始的参数：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

排序之后应该为：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2、签名串需进行URL编码。比如：

- 冒号 `:`会被编码为`%3A`，空格会被编码为 `%20`
- 时间戳需要格式化为 `YYYY-MM-DDThh:mm:ss` ，经过URL编码之后为 `2017-05-11T15%3A19%3A30`

3、签名需进行 base64 编码

4、Get请求参数需在签名串中

5、时间为UTC时间转换为YYYY-MM-DDTHH:mm:ss

6、检查本机时间与标准时间是否存在偏差（偏差应小于1分钟）

7、WebSocket发送验签认证消息时，消息体不需要URL编码

8、签名时所带Host应与请求接口时Host相同

如果您使用了代理，代理可能会改变请求Host，可以尝试去掉代理；

或者，您使用的网络连接库可能会把端口包含在Host内，可以尝试在签名用到的Host中包含端口，如“www.huobihktrust.com:443"

9、Access Key 与 Secret Key中是否存在隐藏特殊字符，影响签名

当前官方已支持多种语言的[SDK](https://github.com/huobitrustapi)，可以参考SDK的签名实现，或者以下三种语言的签名样例代码

<a href='https://github.com/huobitrustapi/huobi_Java/blob/master/java_signature_demo.md'>JAVA签名样例代码</a> | <a href='https://github.com/huobitrustapi/huobi_Python/blob/master/example/python_signature_demo.md'>Python签名样例代码</a>   | <a href='https://github.com/huobitrustapi/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++签名样例代码 </a>

### Q7：调用接口返回Incorrect Access Key 错误是什么原因？

请检查URL请求中Access Key是否传递准确，例如：

1. Access Key没有传递
2. Access Key位数不准确
3. Access Key已经被删除
4. URL请求中参数拼接错误或者特殊字符没有进行编码导致服务端对AccessKey解析不正确

### Q8：调用接口返回 gateway-internal-error 错误是什么原因？

请检查是否属于以下情况：

1. 可能为网络原因或服务内部错误，请稍后进行重试。
2. 发送数据格式是否正确（需要标准JSON格式）。
3. POST请求头header需要声明为`Content-Type:application/json` 。

### Q9：调用接口返回 login-required 错误是什么原因？

请检查是否属于以下情况：

1. 未将AccessKey参数带入URL中。
2. 未将Signature参数带入URL中。

### Q10: 调用Rest接口返回HTTP 405错误 method-not-allowed 是什么原因？

该错误表明调用了不存在的Rest接口，请检查Rest接口路径是否准确。由于Nginx的设置，请求路径(Path)是大小写敏感的，请严格按照文档声明的大小写。

# 联系我们

## 技术支持

使用过程中如有问题或者建议，您可选择以下任一方式联系我们：

- 通过官网的“帮助中心”或者发送邮件至support@huobihktrust.com联系客服。

如您遇到API错误，请按照如下模板向我们反馈问题。

`1. 问题描述`  
`2. 问题发生的用户Id(UID)，账户Id和订单Id(如果和账户、订单有关系)`  
`3. 完整的URL请求`  
`4. 完整的JSON格式的请求参数（如果有）`  
`5. 完整的JSON格式的返回结果`  
`6. 问题出现时间和频率（如何时开始出现，是否可以重现）`  
`7. 签名前字符串（如果是签名认证错误）`

下方是一个应用了模版的例子：

`1. 问题简要说明：签名错误`   
`2. UID：123456`  
`3. 完整的URL请求：GET https://www.huobihktrust.com/v1/open/apiKeyDemo/forRead?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`  
`4. 完整的JSON格式的参数：无`     
`5. 完整的JSON格式的返回：{"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key错误]","data":null}`  
`6. 问题出现频率：每次都会出现`  
`7. 签名前字符串`    
`GET\n`  
`www.huobihktrust.com\n`  
`/v1/open/apiKeyDemo/forRead\n`   
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`

注意：Access Key仅能证明您的身份，不会影响您账户的安全。切记**不**要将Secret Key信息分享给任何人，若您不小心将Secret Key暴露，请尽快[删除](https://www.hbg.com/zh-cn/apikey/)其对应的API Key，以免造成您的账户损失。

# 账户相关

## 简介

账户相关接口提供了账户、余额等查询转等功能。

<aside class="notice">访问账户相关的接口需要进行签名认证。</aside>

## 账户信息查询

API Key 权限：读取<br>
限频值（NEW）：100次/2s

查询指定类型账户，支持以下账户类型：

hb-spot：资金账户， hbt-custody：交易账户

### HTTP 请求

- GET `/v1/open/account/get`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                                         | 默认值 | 取值范围 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| source | true     | string | hb-spot：资金账户， hbt-brokerage：brokerage交易账户，hbt-custody：交易账户 |        |          |

> Response:

```json
{
  "code": 200,
  "data": [
    {
      "currency": "usdt",
      "state": "normal",
      "balance": "10120.558300000000000000",
      "suspense": "19.000000000000000000",
      "price": {
        "symbol": "usdtusdt",
        "high": 1,
        "close": 1,
        "open": 1,
        "amount": 0,
        "vol": 0,
        "count": 0
      }
    },
    {
      "currency": "btc",
      "state": "normal",
      "balance": "0",
      "suspense": "0",
      "price": {
        "symbol": "btcusdt",
        "high": 47815,
        "close": 47815,
        "open": 47815,
        "amount": 0,
        "vol": 0,
        "count": 0
      }
    }
  ],
  "success": true
}
```

### 响应数据

| 参数名称 | 是否必须 | 数据类型 | 描述     | 取值范围                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 状态码  | |
| message      | false   | string    | 错误描述（如有）| |
| data         | false   | object    | 业务数据 ||

data字段说明

| 参数名称 | 数据类型 | 描述           | 取值范围                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 币种           |                                                            |
| balance   | string   | 余额           |                                                            |
| suspense  | string   | 冻结金额        |                                                            |
| price     | object   | 折合usdt行情    |                                                            |

price字段说明

| 参数名称 | 数据类型 | 描述           | 取值范围                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 币种           |                                                            |
| symbol    | string   | 交易对          |                                                            |
| high      | number   | 24小时最高价     |                                                            |
| close     | number   | 最新价          |                                                            |
| open      | number   | 24小时开盘价    |                                                            |
| amount    | number   | 24小时成交量    |                                                            |
| vol       | number   | 24小时成交额    |                                                            |
| count     | number   | 24小时成交笔数	  |                                                            |
