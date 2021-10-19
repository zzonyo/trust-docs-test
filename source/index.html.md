---
title: Huobi Trust API 文档

language_tabs: # must be one of https://git.io/vQNgJ
- json

toc_footers:
- <a href='https://www.hbg.com/zh-cn/apikey/'>创建 API Key </a>
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

此文档是Huobi Trust API的唯一官方文档，Huobi Trust API提供的功能和服务会在此文档持续更新，并会发布公告进行通知，建议您关注和订阅我们的公告，及时获取相关信息。

以下是现货API文档各章节主要内容

第一部分是概要介绍：

- **快速入门**：该章节对Huobi Trust API做了简单且全方位的介绍，适合第一次使用Huobi Trust API的用户。
- **在线演示**：该章节介绍了现货API在线演示工具，方便用户直接调用和观察线上API环境。
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

每个母用户可创建20组Api Key，每个Api Key可对应设置读取、交易、提币三种权限。

权限说明如下：

- 读取权限：读取权限用于对数据的查询接口，例如：订单查询、成交查询等。
- 交易权限：交易权限用于下单、撤单、划转类接口。
- 提币权限：提币权限用于创建提币订单、取消提币订单操作。

创建成功后请务必记住以下信息：

- `Access Key`  API 访问密钥

- `Secret Key`  签名认证加密所使用的密钥（仅申请时可见）

<aside class="notice">
每个 API Key 最多可绑定 20个IP 地址(主机地址或网络地址)，未绑定 IP 地址的 API Key 有效期为90天。出于安全考虑，强烈建议您绑定 IP 地址。
</aside>
<aside class="warning">
<red><b>风险提示</b></red>：这两个密钥与账号安全紧密相关，无论何时都请勿将二者<b>同时</b>向其它人透露。API Key的泄露可能会造成您的资产损失（即使未开通提币权限），若发现API Key泄露请尽快删除该API Key。
</aside>

## SDK与代码示例

**SDK（推荐）**

[Java](https://github.com/huobiapi/huobi_Java) | [Python3](https://github.com/huobiapi/huobi_Python) | [C++](https://github.com/huobiapi/huobi_Cpp) | [C#](https://github.com/HuobiRDCenter/huobi_CSharp) | [Go](https://github.com/huobirdcenter/huobi_golang)

**其它代码示例**

[https://github.com/huobiapi?tab=repositories](https://github.com/huobiapi?tab=repositories)

## 测试环境（已停止）

测试环境运行了一段时间后，因用户访问量很少，而维护成本很高，我们慎重决定后将其停止。

线上环境更稳定，流动性更好，建议您直接使用线上环境。

## 接口类型

火币为用户提供两种接口，您可根据自己的使用场景和偏好来选择适合的方式进行查询行情、交易或提币。

### REST API

REST，即Representational State Transfer的缩写，是目前较为流行的基于HTTP的一种通信机制，每一个URL代表一种资源。

交易或资产提币等一次性操作，建议开发者使用REST API进行操作。

### WebSocket API

WebSocket是HTML5一种新的协议（Protocol）。它实现了客户端与服务器全双工通信，通过一次简单的握手就可以建立客户端和服务器连接，服务器可以根据业务规则主动推送信息给客户端。

市场行情和买卖深度等信息，建议开发者使用WebSocket API进行获取。

**接口鉴权**

以上两种接口均包含公共接口和私有接口两种类型。

公共接口可用于获取基础信息和行情数据。公共接口无需认证即可调用。

私有接口可用于交易管理和账户管理。每个私有请求必须使用您的API Key进行签名验证。

## 接入URLs
您可以自行比较使用www.huobihktrust.com和api-aws.huobi.pro两个域名的延迟情况，选择延迟低的进行使用。

其中，api-aws.huobi.pro域名对使用aws云服务的用户做了一定的链路延迟优化。

**REST API**

**`https://www.huobihktrust.com`**

**Websocket Feed（行情，不包含MBP增量行情）**

**`wss://www.huobihktrust.com/ws`**

<aside class="notice">
请使用中国大陆以外的 IP 访问Huobi Trust API。
</aside>
<aside class="notice">
鉴于延迟高和稳定性差等原因，不建议通过代理的方式访问火币API。
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
* 行情类接口调用根据IP进行限频：1秒10次

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
- 强烈建议：在申请API Key时，请绑定您的IP地址，以此来保证您的API Key仅能在您自己的IP上使用。另外，在API Key未绑定IP时，有效期为90天，绑定IP后，则永远不会过期。
- 强烈建议：不要将API Key暴露给任何人（包括第三方软件或机构），API Key代表了您的账户权限，API Key的暴露可能会对您的信息、资金造成损失，若API Key泄露，请尽快删除并重新创建。

###公共类
**API访问建议**

- 不建议在中国大陆境内使用临时域名以及代理的方式访问Huobi API，此类方式访问API连接的稳定性很难保证。
- 建议使用日本AWS云服务器进行访问。
- 官方域名www.huobihktrust.com。

**新限频规则**

- 当前最新限频规则正在逐步上线中，已单独标注限频值的接口适用新限频规则。

- 用户可根据Http Header中“X-HB-RateLimit-Requests-Remain（限频剩余次数）”，“X-HB-RateLimit-Requests-Expire（窗口过期时间）”查看当前限频使用情况，以及所在时间窗口的过期时间，根据该数值动态调整您的请求频率。

- 同一UID下各API Key同时对某单个节点请求的频率不能超出单位时间内该节点最大允许访问次数的限制。

###行情类
**行情类数据的获取**

- 行情类数据推荐使用WebSocket方式实时接收数据变化的推送，并在程序中进行数据的缓存，WebSocket方式实时性更高，且不受限频的影响。
- 建议用户不要在同一条WebSocket连接中订阅过多的主题和币种对，否则可能会因为上游数据量过大，导致网络阻塞，以至于连接断连。

###账户类
**资产中心**

- 使用WebSocket的方式，同时订阅`orders.$symbol.update`、`accounts.update#${mode}`主题，`orders.$symbol.update`用于接收订单的状态变化（创建、成交、撤销以及相关成交价格、数量信息），由于该主题在推送数据时，未经过清算，所以时效性更快，可根据`accounts.update#${mode}`主题接收相关资产的变更信息，以此来维护账户内的资金情况。
- 不建议WebSocket订阅`accounts`主题，该主题已由`accounts.update#${mode}`取代，会在后续停止服务，请尽早更换使用。

# 在线演示

API[在线演示](https://open.huobigroup.com/)可以让用户不需要写任何一行代码，只要鼠标点击就可以直接调用线上每个API，并可以观察到调用API的请求和返回结果。该调试工具界面和API文档类似，提供了参数输入框和返回字段的说明，用户可以快速上手，几乎不需要额外的使用手册。

该工具封装了共享的API Key，并且在调用私有接口后会将详细的签名过程和参数展示出来。如果您的程序遇到签名问题无法解决，可以将在其用到的API Key和时间戳复制到您的程序中
，将两者进行对比，发现签名失败的原因。

# 在线提问

用户可以在线提问与搜索相关问题

[在线问答知识库系统](https://open.huobigroup.com/cms)


# 常见问题

本章列举了和具体API无关的通用常见问题，如网络、签名或通用错误等。

针对某类或某个API的问题，请查看每章API的错误码和常见问题。

### Q1：什么是UID和account-id？
A：UID是用户ID，是标示每个用户的唯一ID（包括母用户和子用户），UID可以在Web或App界面的个人信息里查看到，也可以通过接口 `GET /v2/user/uid`获得。

account-id则是该用户下不同业务账户的ID，需要通过`GET /v1/account/accounts`接口获取，并根据account-type区分具体账户。如果需要开通某个账户，需要首先通过Web或App开通并向该账户进行转账。

账户类型包括但不限于如下账户（合约账户不包括在内）：

- spot 现货账户
- otc OTC账户
- margin 逐仓杠杆账户，该账户类型以subType区分具体币种对账户
- super-margin（或cross-margin） 全仓杠杆账户
- investment C2C杠杆借出账户
- borrow C2C杠杆借入账户
- point 点卡账户
- minepool 矿池账户
- etf ETF账户

### Q2：一个用户可以申请多少个API Key？

每个母用户可创建20组API Key，每个API Key可对应设置读取、交易、提币三种权限。
每个母用户还可创建200个子用户，每个子用户可创建20组API Key，每个API Key可对应设置读取、交易两种权限。

以下是三种权限的说明：

- 读取权限：读取权限用于对数据的查询接口，例如：订单查询、成交查询等。
- 交易权限：交易权限用于下单、撤单、划转类接口。
- 提币权限：提币权限用于创建提币订单、取消提币订单操作。

### Q3：为什么经常出现断线、超时的情况？

请检查是否属于以下情况：

1. 客户端服务器如在中国大陆境内，连接的稳定性很难保证，建议使用日本AWS云服务器进行访问。
2. 域名建议使用www.huobihktrust.com或api-aws.huobi.pro，其他不建议使用。

### Q4：为什么WebSocket总是断开连接？

常见原因有：

1. 未回复Pong，WebSocket连接需在接收到服务端发送的Ping信息后回复Pong，保证连接的稳定。
2. 网络原因造成客户端发送了Pong消息，但服务端并未接收到。
3. 网络原因造成连接断开。
4. 建议用户做好WebSocket连接断连重连机制，在确保心跳（Ping/Pong）消息正确回复后若连接意外断开，程序能够自动进行重新连接。

### Q5：www.huobihktrust.com 与 api-aws.huobi.pro有什么区别？

api-aws.huobi.pro域名对使用aws云服务的用户做了链路延迟优化，请求时延更低。

### Q6：为什么签名认证总返回失败？

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

当前官方已支持多种语言的[SDK](https://github.com/HuobiRDCenter)，可以参考SDK的签名实现，或者以下三种语言的签名样例代码

<a href='https://github.com/HuobiRDCenter/huobi_Java/blob/master/java_signature_demo.md'>JAVA签名样例代码</a> | <a href='https://github.com/HuobiRDCenter/huobi_Python/blob/master/example/python_signature_demo.md'>Python签名样例代码</a>   | <a href='https://github.com/HuobiRDCenter/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++签名样例代码 </a>

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

hb-spot：资金账户， hbt-brokerage：brokerage交易账户，hbt-custody：交易账户

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

## 常见问题

### Q1：client-order-id是什么？
A： client-order-id作为下单请求标识的一个参数，类型为字符串，长度为64。 此id为用户自己生成，8小时内有效。如果是终态订单仅2小时有效。

### Q2：如何获取下单数量、金额、小数限制、精度的信息？
A： 可使用 Rest API `GET /v1/common/symbols` 获取相关币对信息， 下单时注意最小下单数量和最小下单金额的区别。

常见返回错误如下：

- order-value-min-error: 下单金额小于最小交易额
- order-orderprice-precision-error : 限价单价格精度错误
- order-orderamount-precision-error : 下单数量精度错误
- order-limitorder-price-max-error : 限价单价格高于限价阈值
- order-limitorder-price-min-error : 限价单价格低于限价阈值
- order-limitorder-amount-max-error : 限价单数量高于限价阈值
- order-limitorder-amount-min-error : 限价单数量低于限价阈值

### Q3： 为什么收到订单成功成交的消息后再次进行下单，返回余额不足？
A：为保证订单的及时送达以及低延时， 订单推送的结果是在撮合后直接推送，此时订单可能并未完成资产的清算。

建议使用以下方式保证资金可以正确下单：

1. 结合资产推送主题`accounts`同步接收资产变更的消息，确保资金已经完成清算。

2. 收到订单推送消息时，使用Rest接口调用账户余额，验证账户资金是否足够。

3. 账户中保留相对充足的资金余额。

### Q4: 成交明细里的filled-fees和filled-points有什么区别？
A: 成交中的成交手续费分为普通手续费以及抵扣手续费两种类型，两种类型不会同时存在。

1. 普通手续费表示，在成交时，未开启HT抵扣、点卡抵扣，使用原币进行手续费扣除。例如：在BTCUSDT币种对下购买BTC，filled-fees字段不为空，表示扣除了普通手续费，单位是BTC。

2. 抵扣手续费表示，在成交时，开启了HT抵扣或点卡抵扣，使用HT或点卡进行手续费的抵扣。例如BTCUSDT币种对下购买BTC，HT\点卡充足时，filled-fees为空，filled-points不为空，表示扣除了HT或点卡作为手续费，扣除单位需参考fee-deduct-currency字段

### Q5: 成交明细中match-id和trade-id有什么区别？
A: match-id表示订单在撮合中的顺序号，trade-id表示成交时的序号， 一个match-id可能有多个trade-id（成交时），也可能没有trade-id(创建订单、撤销订单)

### Q6: 为什么基于当前盘口买一或者卖一价格进行下单触发了下单限价错误？
A: 当前火币有基于最新成交价上下一定幅度的限价保护，对流动性不好的币，基于盘口数据下单可能会触发限价保护。建议基于ws推送的成交价+盘口数据信息进行下单

### Q7: 如何获取杠杆类交易的币种对？
A: 您可以根据` GET /v1/common/symbols`接口返回数据中的字段区分。leverage-ratio代表逐仓杠杆倍数。super-magin-leverage-ratio代表支持全仓杠杆倍数。如果值为0，表明不支持杠杆交易。

# 策略委托

## 简介

策略委托，目前仅包括计划委托及追踪委托。与现有止盈止损订单相比，计划委托/追踪委托有以下显著不同 –<br>特别说明，如遇行情或其他极端情况，策略委托单可能会延迟触发。

1）	计划委托/追踪委托被创建后，未触发前，交易所将不会冻结委托保证金。仅当计划委托成功触发后，交易所才会冻结该委托的保证金。<br>
2）	计划委托支持限价单和市价单类型，追踪委托仅支持市价单。<br>
3）	追踪委托是一种更高级的计划委托。通常的计划委托仅可设置触发价一个条件，当市场最新价格达到触发价时，该订单即被送入撮合。追踪委托在计划委托的基础上增加了一个设定条件，即回调幅度。当市场最新价达到设定的触发价时，该追踪委托并不会被送入撮合，而是继续等待市场价格回转出现。当市场价格回转幅度达到设定的回调幅度时，该追踪委托才会被送入撮合。火币Global支持用户设定的回调幅度范围为0.1%~5%。<br>

<aside class="notice">访问策略委托相关的接口需要进行签名认证。</aside>
<aside class="notice"> 在计划委托/追踪委托上线一段时间后，火币Global可能会下线现有止盈止损订单类型。届时将另行通知。 </aside>

## 策略委托下单

POST /v2/algo-orders<br>
API Key 权限：交易<br>
限频值（NEW）：20次/2秒<br>
仅可通过此节点下单策略委托，不可通过现货/杠杆交易相关接口下单策略委托<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	TRUE	|		|	账户编号	|当前仅支持spot账户ID、margin账户ID、super-margin账户ID，暂不支持c2c-margin账户ID		|
|	symbol	|	string	|	TRUE	|		|	交易代码	|		|
|	orderPrice	|	string	|	FALSE	|		|	订单价格（对市价单无效）	|		|
|	orderSide	|	string	|	TRUE	|		|	订单方向	|	buy,sell	|
|	orderSize	|	string	|	FALSE	|		|	订单数量（对市价买单无效）	|		|
|	orderValue	|	string	|	FALSE	|		|	订单金额（仅对市价买单有效）	|		|
|	timeInForce	|	string	|	FALSE	|	gtc for orderType=limit; ioc for orderType=market	|	订单有效期	|	gtc(对orderType=market无效),boc(对orderType=market无效),ioc,fok(对orderType=market无效)	|
|	orderType	|	string	|	TRUE	|		|	订单类型	|	limit,market	|
|	clientOrderId	|	string	|	TRUE	|		|	用户自编订单号（最长64位）	|		|
|	stopPrice	|	string	|	TRUE	|		|	触发价	|		|
|	trailingRate	|	string	|	FALSE	|		|	 回调幅度（仅对追踪委托有效）	|	[0.001,0.050]	|

注：<br>
•	orderPrice与stopPrice的偏离率不能超出交易所对该币对的价格限制（百分比），例如，当交易所限定，限价买单的订单价格不能高于市价的110%时，该限制比率也同样适用于orderPrice与stopPrice之比。<br>
•	用户须保证策略委托在触发时，其clientOrderId不与该用户的其它（8小时内）订单重复，否则，会导致触发失败。<br>
•	用户须保证相关账户（accountId）中存有足够资金作为委托保证金，否则将导致策略委托触发时校验失败。<br>
•	timeInForce字段中各枚举值含义：gtc - good till cancel (除非用户主动撤销否则一直有效)，boc - book or cancel（即post only，或称book only，除非成功挂单否则自动撤销），ioc - immediate or cancel（立即成交剩余部分自动撤销），fok - fill or kill（立即全部成交否则全部自动撤销）<br>

> Response

```json
{
  "code": 200,
  "data": {
    "clientOrderId": "a001"
  }
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ clientOrderId }	|	string	|	TRUE	|用户自编订单号	|

## 策略委托（触发前）撤单

POST /v2/algo-orders/cancellation<br>
API Key 权限：交易<br>
限频值（NEW）：20次/2秒<br>
单次请求最多批量撤销50张订单<br>
如需撤销已成功触发的订单，须通过现货/杠杆交易相关接口完成<br>
如需撤销未触发的订单，仅可通过此节点撤销，不可通过现货/杠杆交易相关接口撤销<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	clientOrderIds	|	string[]	|	TRUE	|		|	用户自编订单号（可多填，以逗号分隔）	|		|

> Response

```json
{
  "code": 200,
  "data": {
    "accepted": [
      "a001"
    ],
    "rejected": []
  }
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|按用户请求顺序排列	|
|	{ accepted	|	string[]	|	FALSE	|已接受订单clientOrderId列表	|
|	rejected }	|	string[]	|	TRUE	|已拒绝订单clientOrderId列表	|

## 查询未触发OPEN策略委托

GET /v2/algo-orders/opening<br>
API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
未触发OPEN订单，指的是已成功下单，但尚未触发，订单状态orderStatus为created的订单<br>
未触发OPEN订单，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	FALSE	|	all	|	账户编号	|		|
|	symbol	|	string	|	FALSE	|	all	|	交易代码	|		|
|	orderSide	|	string	|	FALSE	|	all	|	订单方向	|	buy,sell	|
|	orderType	|	string	|	FALSE	|	all	|	订单类型	|	limit,market	|
|	sort	|	string	|	FALSE	|	desc	|	检索方向	|asc - 由远及近, desc - 由近及远		|
|	limit	|	integer	|	FALSE	|	100	|	单页最大返回条目数量	|[1,500]		|
|	fromId	|	long	|	FALSE	|		|	起始编号（仅在下页查询时有效）	|		|

> Response

```json
{
  "code": 200,
  "data": [
    {
      "lastActTime": 1593235832976,
      "orderOrigTime": 1593235832937,
      "symbol": "btcusdt",
      "orderSize": "0.001",
      "stopPrice": "5001",
      "accountId": 5260185,
      "source": "api",
      "clientOrderId": "a001",
      "orderSide": "buy",
      "orderType": "limit",
      "timeInForce": "gtc",
      "orderPrice": "5000",
      "orderStatus": "created"
    }
  ]
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|按用户请求参数sort指定顺序排列	|
|	{ accountId	|	integer	|	TRUE	|账户编号	|
|	source	|	string	|	TRUE	|订单来源（api,web,ios,android,mac,windows,sys）	|
|	clientOrderId	|	string	|	TRUE	|用户自编订单号	|
|	symbol	|	string	|	TRUE	|交易代码	|
|	orderPrice	|	string	|	TRUE	|订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	|订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	|订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	|订单方向	|
|	timeInForce	|	string	|	TRUE	|订单有效期|
|	orderType	|	string	|	TRUE	|订单类型	|
|	stopPrice	|	string	|	TRUE	|触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	|订单创建时间	|
|	lastActTime	|	long	|	TRUE	|订单最近更新时间	|
|	orderStatus }	|	string	|	TRUE	|订单状态（created）	|
|	nextId	|	long	|	FALSE	|下页起始编号（仅在查询结果需要分页返回时传此字段）	|

## 查询策略委托历史

GET /v2/algo-orders/history<br>
API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
历史终态订单包括，触发前被主动撤销的策略委托（orderStatus=canceled），触发失败的策略委托（orderStatus=rejected），触发成功的策略委托（orderStatus=triggered）。<br>
如需查询已成功触发订单的后续状态，须通过现货/杠杆交易相关接口完成<br>
触发前被主动撤销的策略委托及触发失败的策略委托，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	FALSE	|	all	|	账户编号	|		|
|	symbol	|	string	|	TRUE	|		|	交易代码	|		|
|	orderSide	|	string	|	FALSE	|	all	|	订单方向	|	buy,sell	|
|	orderType	|	string	|	FALSE	|	all	|	订单类型	|	limit,market	|
|	orderStatus	|	string	|	TRUE	|		|	订单状态	|	canceled,rejected,triggered	|
|	startTime	|	long	|	FALSE	|		|	远点时间	||
|	endTime	|	long	|	FALSE	|当前时间		|	近点时间 | |
|	sort	|	string	|	FALSE	|	desc	|	检索方向	|asc - 由远及近, desc - 由近及远		|
|	limit	|	integer	|	FALSE	|	100	|	单页最大返回条目数量	|[1,500]		|
|	fromId	|	long	|	FALSE	|		|	起始编号（仅在下页查询时有效）	|		|

> Response

```json
{
  "code": 200,
  "data": [
    {
      "orderOrigTime": 1593235832937,
      "lastActTime": 1593236344401,
      "symbol": "btcusdt",
      "source": "api",
      "orderSide": "buy",
      "orderType": "limit",
      "timeInForce": "gtc",
      "clientOrderId": "a001",
      "accountId": 5260185,
      "orderPrice": "5000",
      "orderSize": "0.001",
      "stopPrice": "5001",
      "orderStatus": "canceled"
    }
  ]
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|按用户请求参数sort指定顺序排列	|
|	{ accountId	|	integer	|	TRUE	|账户编号	|
|	source	|	string	|	TRUE	|订单来源	|
|	clientOrderId	|	string	|	TRUE	|用户自编订单号	|
|	orderId	|	string	|	FALSE	|订单编号（仅对orderStatus=triggered有效）	|
|	symbol	|	string	|	TRUE	|交易代码	|
|	orderPrice	|	string	|	TRUE	|订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	|订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	|订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	|订单方向	|
|	timeInForce	|	string	|	TRUE	|订单有效期|
|	orderType	|	string	|	TRUE	|订单类型	|
|	stopPrice	|	string	|	TRUE	|触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	|订单创建时间	|
|	lastActTime	|	long	|	TRUE	|订单最近更新时间	|
|	orderCreateTime	|	long	|	FALSE	|订单触发时间（仅对orderStatus=triggered有效）	|
|	orderStatus	|	string	|	TRUE	|订单状态（triggered,canceled,rejected）	|
|	errCode	|	integer	|	FALSE	|订单被拒状态码（仅对orderStatus=rejected有效）	|
|	errMessage }	|	string	|	FALSE	|订单被拒错误消息（仅对orderStatus=rejected有效）	|
|	nextId	|	long	|	FALSE	|下页起始编号（仅在查询结果需要分页返回时传此字段）	|

## 查询特定策略委托

GET /v2/algo-orders/specific<br>
API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
如需查询已成功触发订单的后续状态，须通过现货/杠杆交易相关接口完成<br>
未触发的策略委托及触发失败的策略委托，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	clientOrderId	|	string	|	TRUE	|		| 用户自编订单号|		|

> Response

```json
{
  "code": 200,
  "data": {
    "lastActTime": 1593236344401,
    "orderOrigTime": 1593235832937,
    "symbol": "btcusdt",
    "orderSize": "0.001",
    "stopPrice": "5001",
    "accountId": 5260185,
    "source": "api",
    "clientOrderId": "a001",
    "orderSide": "buy",
    "orderType": "limit",
    "timeInForce": "gtc",
    "orderPrice": "5000",
    "orderStatus": "canceled"
  }
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ accountId	|	integer	|	TRUE	|账户编号	|
|	source	|	string	|	TRUE	|订单来源	|
|	clientOrderId	|	string	|	TRUE	|用户自编订单号	|
|	orderId	|	string	|	FALSE	|订单编号（仅对orderStatus=triggered有效）	|
|	symbol	|	string	|	TRUE	|交易代码	|
|	orderPrice	|	string	|	TRUE	|订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	|订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	|订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	|订单方向	|
|	timeInForce	|	string	|	TRUE	|订单有效期|
|	orderType	|	string	|	TRUE	|订单类型	|
|	stopPrice	|	string	|	TRUE	|触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	|订单创建时间	|
|	lastActTime	|	long	|	TRUE	|订单最近更新时间	|
|	orderCreateTime	|	long	|	FALSE	|订单触发时间（仅对orderStatus=triggered有效）	|
|	orderStatus	|	string	|	TRUE	|订单状态（created,triggered,canceled,rejected）	|
|	errCode	|	integer	|	FALSE	|订单被拒状态码（仅对orderStatus=rejected有效）	|
|	errMessage }	|	string	|	FALSE	|订单被拒错误消息（仅对orderStatus=rejected有效）	|

## 常见错误码

以下是策略委托接口返回的错误码和说明。

| 错误码 | 说明                       |
| ------ | -------------------------- |
| 2002   | 参数无效                   |
| 1001   | 无效的url                  |
| 1002   | 请重新登录后重试           |
| 1003   | API签名无效                |
| 1005   | 访问权重不足               |
| 1006   | 超出访问限制               |
| 1007   | 未查询到记录               |
| 2003   | 交易功能暂停               |
| 3002   | 订单数量精度错误           |
| 3003   | 触发价格精度错误           |
| 3004   | 低于限价单最小订单数量限制 |
| 3005   | 超出限价单最大订单数量限制 |
| 3006   | 超出限价单最高订单价格限制 |
| 3007   | 低于限价单最低订单价格限制 |
| 3008   | 低于最小订单金额限制       |
| 3009   | 低于市价单最小订单数量限制 |
| 3010   | 超出市价单最大订单数量限制 |
| 3100   | 限价交易期间不接受市价申报 |

# 借币（逐仓/全仓杠杆）

## 简介

逐仓杠杆/全仓杠杆接口提供了账户借币、还币、查询、划转等功能

<aside class="notice">访问借币相关的接口需要进行签名认证。</aside>
<aside class="notice">目前逐仓杠杆交易仅支持部分以 USDT，HSUD， 和 BTC 为报价币种的交易对。</aside>

## 归还借币（全仓逐仓通用）

API Key 权限：交易

限频值：2次/秒

子用户可以调用

还币顺序为，（如不指定transactId）先借先还，利息先还；如指定transactId时，currency参数不做校验。

### HTTP 请求

- POST /v2/account/repayment

> Request:

```json
{
  "accountid": "1266826",
  "currency": "btc",
  "amount": "0.00800334",
  "transactId": "437"
}
```

### 请求参数

| **名称**   | **类型** | **是否必需** | **描述**       |
| ---------- | -------- | ------------ | -------------- |
| accountId  | string   | TRUE         | 还币账户ID     |
| currency   | string   | TRUE         | 还币币种       |
| amount     | string   | TRUE         | 还币金额       |
| transactId | string   | FALSE        | 原始借币交易ID |

> Response:

```json
{
  "code":200,
  "Data": [
    {
      "repayId":1174424,
      "repayTime":1600747722018
    }
  ]
}
```

### 响应数据

| **名称**     | **类型** | **是否必需** | **描述**                                 |
| ------------ | -------- | ------------ | ---------------------------------------- |
| code         | integer  | TRUE         | 状态码                                   |
| message      | string   | FALSE        | 错误描述（如有）                         |
| data         | array    | TRUE         |                                          |
| [{ repayId   | string   | TRUE         | 还币交易ID                               |
| repayTime }] | long     | TRUE         | 还币交易时间（unix time in millisecond） |

注：
返回relayId不意味着该还币100%成功，用户须在还币后通过查询还币交易记录确认该还币状态。

##

## 资产划转（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于现货账户与逐仓杠杆账户的资产互转。

从现货账户划转至逐仓杠杆账户 `transfer-in`，从逐仓杠杆账户划转至现货账户 `transfer-out`

### HTTP 请求

- POST ` /v1/dw/transfer-in/margin`

- POST ` /v1/dw/transfer-out/margin`

> Request:

```json
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```


### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                         |
| -------- | -------- | -------- | ------ | ---------------------------- |
| symbol   | string   | true     | NA     | 交易对, e.g. btcusdt, ethbtc |
| currency | string   | true     | NA     | 币种                         |
| amount   | string   | true     | NA     | 划转数量                     |


> Response:

```json
{
  "data": 1000
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述        |
| -------- | -------- | ----------- |
| data     | integer  | Transfer id |

## 查询借币币息率及额度（逐仓）

API Key 权限：读取<br>
限频值（NEW）：20次/2s

此接口返回用户级别的借币币息率及借币额度。

```shell
curl "https://www.huobihktrust.com/v1/margin/loan-info?symbols=btcusdt"
```

### HTTP 请求

- GET ` /v1/margin/loan-info`

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                          |
| -------- | -------- | -------- | ------ | ----------------------------- |
| symbols  | string   | false    | all    | 交易代码 (可多选，以逗号分隔) |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "symbol": "btcusdt",
      "currencies": [
        {
          "currency": "btc",
          "interest-rate": "0.00098",
          "min-loan-amt": "0.020000000000000000",
          "max-loan-amt": "550.000000000000000000",
          "loanable-amt": "0.045696000000000000",
          "actual-rate": "0.00098"
        },
        {
          "currency": "usdt",
          "interest-rate": "0.00098",
          "min-loan-amt": "100.000000000000000000",
          "max-loan-amt": "4000000.000000000000000000",
          "loanable-amt": "400.000000000000000000"
          "actual-rate": "0.00098"
        }
      ]
    }
  ]
}
```

### 响应数据

| 参数名称       | 数据类型 | 描述                                                         |
| -------------- | -------- | ------------------------------------------------------------ |
| { symbol       | string   | 交易代码                                                     |
| currencies     | object   |                                                              |
| { currency     | string   | 币种                                                         |
| interest-rate  | string   | 基础日币息率                                                 |
| min-loan-amt   | string   | 最小允许借币金额                                             |
| max-loan-amt   | string   | 最大允许借币金额                                             |
| loanable-amt   | string   | 最大可借金额                                                 |
| actual-rate }} | string   | 抵扣后的实际借币币息率，如不适用抵扣或未启用抵扣，返回基础日币息率 |

## 申请借币（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于申请借币.

### HTTP 请求

- POST ` /v1/margin/orders`

> Request:

```json
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                      |
| -------- | -------- | -------- | ------ | ------------------------- |
| symbol   | string   | true     | NA     | 交易对                    |
| currency | string   | true     | NA     | 币种                      |
| amount   | string   | true     | NA     | 借币数量（精度：3位小数） |

> Response:

```json
{
  "status": "ok",
  "data": 1000
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述   |
| -------- | -------- | ------ |
| status   | string   | 状态   |
| data     | integer  | 订单id |

## 归还借币（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于归还借币.

### HTTP 请求

- POST ` /v1/margin/orders/{order-id}/repay`

> Request:

```json
{
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 描述                          |
| -------- | -------- | -------- | ----------------------------- |
| order-id | string   | true     | 借币订单 ID，写在 url path 中 |
| amount   | string   | true     | 归还币种数量                  |

> Response:

```json
{
  "data": 1000
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述            |
| -------- | -------- | --------------- |
| data     | integer  | Margin order id |


## 查询借币订单（逐仓）

API Key 权限：读取<br>
限频值（NEW）：100次/2s

此接口基于指定搜索条件返回借币订单。

### HTTP 请求

- GET ` /v1/margin/loan-orders`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                                 | 默认值                           | 取值范围                                                     |
| ---------- | -------- | ------ | ---------------------------------------------------- | -------------------------------- | ------------------------------------------------------------ |
| symbol     | true     | string | 交易对                                               |                                  | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`）       |
| start-date | false    | string | 查询开始日期, 日期格式yyyy-mm-dd                     |                                  |                                                              |
| end-date   | false    | string | 查询结束日期, 日期格式yyyy-mm-dd                     |                                  |                                                              |
| states     | false    | string | 状态列表，可以支持多个状态，用逗号分隔               |                                  | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |
| from       | false    | string | 查询起始 ID                                          |                                  |                                                              |
| direct     | false    | string | 查询方向                                             |                                  | prev 向前，时间（或 ID）正序；next 向后，时间（或 ID）倒序） |
| size       | false    | string | 查询记录大小                                         | 100                              | [1, 100]                                                     |
| sub-uid    | false    | int    | 子用户编号（母用户查询子用户借币订单时，此字段必填） | 如不填，缺省查询当前用户借币订单 |                                                              |

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "deduct-rate": "1",
      "created-at": 1595831651478,
      "updated-at": 1595832010845,
      "accrued-at": 1595831651478,
      "interest-amount": "0.004083000000000000",
      "loan-amount": "100.000000000000000000",
      "hour-interest-rate": "0.000040830000000000",
      "loan-balance": "0.000000000000000000",
      "interest-balance": "0.000000000000000000",
      "paid-coin": "0.004083000000000000",
      "day-interest-rate": "0.000980000000000000",
      "interest-rate": "0.000040830000000000",
      "user-id": 5574974,
      "account-id": 5463409,
      "currency": "usdt",
      "symbol": "btcusdt",
      "paid-point": "0.000000000000000000",
      "deduct-currency": "",
      "deduct-amount": "0",
      "id": 7839857,
      "state": "cleared"
    }
  ]
}
```

### 响应数据


| 字段名称           | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| ------------------ | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| id                 | true     | long     | 订单号                     |                                                              |
| user-id            | true     | long     | 用户ID                     |                                                              |
| account-id         | true     | long     | 账户ID                     |                                                              |
| symbol             | true     | string   | 交易对                     |                                                              |
| currency           | true     | string   | 币种                       |                                                              |
| loan-amount        | true     | string   | 借币本金总额               |                                                              |
| loan-balance       | true     | string   | 未还本金                   |                                                              |
| interest-rate      | true     | string   | 币息率                     |                                                              |
| interest-amount    | true     | string   | 币息总额                   |                                                              |
| interest-balance   | true     | string   | 未还币息                   |                                                              |
| created-at         | true     | long     | 借币发起时间               |                                                              |
| accrued-at         | true     | long     | 最近一次计息时间           |                                                              |
| state              | true     | string   | 订单状态                   | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |
| paid-point         | true     | string   | 已支付点卡金额（用于还息） |                                                              |
| paid-coin          | true     | string   | 已支付原币金额（用于还息） |                                                              |
| deduct-rate        | true     | string   | 抵扣率（用于还息）         |                                                              |
| deduct-currency    | true     | string   | 抵扣币种（用于还息）       |                                                              |
| deduct-amount      | true     | string   | 抵扣金额（用于还息）       |                                                              |
| updated-at         | true     | long     | 更新时间                   |                                                              |
| hour-interest-rate | true     | string   | 时息率                     |                                                              |
| day-interest-rate  | true     | string   | 日息率                     |                                                              |

## 借币账户详情（逐仓）

API Key 权限：读取<br>
限频值（NEW）：100次/2s

此接口返回借币账户详情。

```shell
curl "https://www.huobihktrust.com/v1/margin/accounts/balance?symbol=btcusdt"
```

### HTTP 请求

- GET `/v1/margin/accounts/balance`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 默认值                           | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------------------------------- | -------- |
| symbol   | false    | string | 交易对，作为get参数<br />如果不传则不返回可转余额(transfer-out-available)和可借余额(loan-available) |                                  |          |
| sub-uid  | false    | int    | 子用户编号（母用户查询子用户借币详情时，此字段必填）         | 如不填，缺省查询当前用户借币详情 |          |

> Response:

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
          "type": "transfer-out-available",//可转btc,只有传入symbol才会返回
          "balance": "1163.872174670000000000"
        },
        {
          "currency": "btc",
          "type": "loan-available",//可借btc,只有传入symbol才会返回
          "balance": "8161.876538350676000000"
        }
      ]
    }
  ]
}
```

### 响应数据

| 字段名称   | 是否必须 | 数据类型 | 描述                                                         | 取值范围 |
| ---------- | -------- | -------- | ------------------------------------------------------------ | -------- |
| symbol     | true     | string   | 交易对                                                       |          |
| state      | true     | string   | 账户状态，working 正常,fl-sys 系统自动爆仓,fl-mgt 手动爆仓,fl-end 爆仓结束 |          |
| risk-rate  | true     | string   | 风险率                                                       |          |
| fl-price   | true     | string   | 爆仓价                                                       |          |
| list       | true     | array    | 借币账户详情列表                                             |          |
| { currency | true     | string   | 币种                                                         |          |
| type       | true     | string   | 类型，trade: 交易余额, frozen: 冻结余额, loan: 待还借贷本金, interest: 待还借贷利息, ,transfer-out-available 可划转额, loan-available 可借额 |          |
| balance }  | true     | string   | 余额，负数表示应还金额。transfer-out-available的余额如果为-1，代表该币种可全部转出。 |          |

## 资产划转（全仓）

API Key 权限：交易

限频值（NEW）：10次/s

此接口用于现货账户与全仓杠杆账户的资产互转。

从现货账户划转至全仓杠杆账户 `transfer-in`，从全仓杠杆账户划转至现货账户 `transfer-out`

### HTTP 请求

- POST ` /v1/cross-margin/transfer-in`
- POST ` /v1/cross-margin/transfer-out`

> Request:

```json
{
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述     |
| -------- | -------- | -------- | ------ | -------- |
| currency | string   | true     | NA     | 币种     |
| amount   | string   | true     | NA     | 划转数量 |


> Response:

```json
{
  "status": "ok",
  "data": 1000
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述        |
| -------- | -------- | ----------- |
| data     | integer  | Transfer id |

## 查询借币币息率及额度（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回用户级别的借币币息率及借币额度。

### HTTP 请求

- GET ` /v1/cross-margin/loan-info`

### 请求参数

无

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "currency": "bch",
      "interest-rate": "0.00098",
      "min-loan-amt": "0.35",
      "max-loan-amt": "3500",
      "loanable-amt": "0.70405181",
      "actual-rate": "0.000343"
    },
    {
      "currency": "btc",
      "interest-rate": "0.00098",
      "min-loan-amt": "0.01",
      "max-loan-amt": "100",
      "loanable-amt": "0.02281914",
      "actual-rate": "0.000343"
    },
    {
      "currency": "eos",
      "interest-rate": "0.00098",
      "min-loan-amt": "30",
      "max-loan-amt": "300000",
      "loanable-amt": "57.69175296",
      "actual-rate": "0.000343"
    },
    {
      "currency": "eth",
      "interest-rate": "0.00098",
      "min-loan-amt": "0.5",
      "max-loan-amt": "6000",
      "loanable-amt": "1.06712197",
      "actual-rate": "0.000343"
    },
    {
      "currency": "ltc",
      "interest-rate": "0.00098",
      "min-loan-amt": "1.5",
      "max-loan-amt": "15000",
      "loanable-amt": "3.28947368",
      "actual-rate": "0.000343"
    },
    {
      "currency": "usdt",
      "interest-rate": "0.00098",
      "min-loan-amt": "100",
      "max-loan-amt": "1500000",
      "loanable-amt": "200.00000000",
      "actual-rate": "0.000343"
    },
    {
      "currency": "xrp",
      "interest-rate": "0.00098",
      "min-loan-amt": "380",
      "max-loan-amt": "4000000",
      "loanable-amt": "734.21439060",
      "actual-rate": "0.000343"
    }
  ]
}
```

### 响应数据

| 参数名称      | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| { currency    | string   | 币种                                                         |
| interest-rate | string   | 基础日币息率                                                 |
| min-loan-amt  | string   | 最小允许借币金额                                             |
| max-loan-amt  | string   | 最大允许借币金额                                             |
| loanable-amt  | string   | 最大可借金额                                                 |
| actual-rate } | string   | 抵扣后的实际币息率，如不适用抵扣或未启用抵扣则返回基础日币息率 |

## 获取杠杆持仓限额（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回用户级别的持仓限额。

### HTTP 请求

- `GET /v2/margin/limit?currency=btc`

> Request:

```json
GET /v2/margin/limit?currency=btc
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                                                         |
| -------- | -------- | -------- | ------ | ------------------------------------------------------------ |
| currency | string   | true     | NA     | 币种，支持批量查询(币种之间用英文逗号分隔)，单次最多可查10个币种 |


>

> Response:

```json
{
  "data": [
    {
      "currency": "btc",
      "maxHoldings": "2"
    },
    {
      "currency": "btc3s",
      "maxHoldings": "12000"
    },
    "code": 200
    }
```

### 响应数据

###

| 名称         | 类型    | 描述             |
| ------------ | ------- | ---------------- |
| code         | integer | 状态码           |
| message      | string  | 错误描述（如有） |
| { currency   | string  | 币种             |
| maxHoldings} | string  | 持仓限额         |



##

## 申请借币（全仓）

API Key 权限：交易<br>

限频值（NEW）：2次/2s

此接口用于申请借币.

### HTTP 请求

- POST ` /v1/cross-margin/orders`

> Request:

```json
{
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                      |
| -------- | -------- | -------- | ------ | ------------------------- |
| currency | string   | true     | NA     | 币种                      |
| amount   | string   | true     | NA     | 借币数量（精度：3位小数） |

> Response:

```json
{
  "status": "ok",
  "data": 1000
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述            |
| -------- | -------- | --------------- |
| data     | integer  | Margin order id |

## 归还借币（全仓）

API Key 权限：交易<br>

限频值（NEW）：2次/2s

此接口用于归还借币.

### HTTP 请求

- POST ` /v1/cross-margin/orders/{order-id}/repay`

> Request:

```json
{
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 描述                          |
| -------- | -------- | -------- | ----------------------------- |
| order-id | string   | true     | 借币订单 ID，写在 url path 中 |
| amount   | string   | true     | 归还币种数量                  |

> Response:

```json
{
  "status": "ok",
  "data": null
}
```

### 响应数据

| 参数名称 | 数据类型 | 描述 |
| -------- | -------- | ---- |
| data     | null     | -    |

## 查询借币订单（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口基于指定搜索条件返回借币订单。

### HTTP 请求

- GET ` /v1/cross-margin/loan-orders`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                             | 默认值 | 取值范围 |
| ---------- | -------- | ------ | -------------------------------- | ------ | -------- |
| start-date | false    | string | 查询开始日期, 日期格式yyyy-mm-dd |        |          |
| end-date   | false    | string | 查询结束日期, 日期格式yyyy-mm-dd |        |          |
| currency   | false    | string | 币种                             |        |          |
| state | false | string | 状态   |all   |created 未放款，accrual 已放款，cleared 已还清，invalid 异常
| from   | false | string | 查询起始 ID  | 0   |     |
| direct | false | string | 查询方向     |    | prev 向前，时间（或 ID）正序；next 向后，时间（或 ID）倒序） |
| size   | false | string | 查询记录大小  |  10  |[10,100]     |
|sub-uid|false|long|子用户UID|如不填，缺省查询当前用户借贷订单||

> Response:

```json
{
  "status": "ok",
  "data": [
    {
      "loan-balance": "0.100000000000000000",
      "interest-balance": "0.000200000000000000",
      "loan-amount": "0.100000000000000000",
      "accrued-at": 1511169724531,
      "interest-amount": "0.000200000000000000",
      "filled-points" : "0.2",
      "filled-ht" : "0.2",
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

### 响应数据

| 字段名称         | 是否必须 | 数据类型 | 描述             | 取值范围                                                     |
| ---------------- | -------- | -------- | ---------------- | ------------------------------------------------------------ |
| id               | true     | long     | 订单号           |                                                              |
| user-id          | true     | long     | 用户ID           |                                                              |
| account-id       | true     | long     | 账户ID           |                                                              |
| currency         | true     | string   | 币种             |                                                              |
| loan-amount      | true     | string   | 借币本金总额     |                                                              |
| loan-balance     | true     | string   | 未还本金         |                                                              |
| interest-amount  | true     | string   | 币息总额         |                                                              |
| interest-balance | true     | string   | 未还币息         |                                                              |
| filled-points    | true     | string   | 点卡抵扣数量     |                                                              |
| filled-ht        | true     | string   | HT抵扣数量       |                                                              |
| created-at       | true     | long     | 借币发起时间     |                                                              |
| accrued-at       | true     | long     | 最近一次计息时间 |                                                              |
| state            | true     | string   | 订单状态         | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |

## 借币账户详情（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回借币账户详情。

### HTTP 请求

- GET `/v1/cross-margin/accounts/balance`

### 请求参数

| 参数名称 | 是否必须 | 类型 | 描述      | 默认值                           | 取值范围 |
| -------- | -------- | ---- | --------- | -------------------------------- | -------- |
| sub-uid  | false    | long | 子用户UID | 如不填，缺省查询当前用户借贷订单 |          |

> Response:

```json
{
  "status": "ok",
  "data":
  {
    "id": 18264,
    "type": "cross-margin",
    "state": "working",
    "risk-rate": "1000",
    "acct-balance-sum": "12312.123123",
    "debt-balance-sum": "1231.2123123",
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
}
```

### 响应数据

| 字段名称         | 是否必须 | 数据类型 | 描述                                                         |
| ---------------- | -------- | -------- | ------------------------------------------------------------ |
| id               | true     | integer  | Account ID 账户编号                                          |
| type             | true     | integer  | 账户类型：cross-margin                                       |
| state            | true     | string   | 账户状态：working 正常,fl-sys 系统自动爆仓,fl-end 爆仓结束,fl-negative 穿仓 |
| risk-rate        | true     | string   | 风险率                                                       |
| acct-balance-sum | true     | string   | 总持有usdt折合                                               |
| debt-balance-sum | true     | string   | 总负债usdt折合                                               |
| list             | true     | array    | 借币账户详情列表                                             |
| { currency       | true     | string   | 币种                                                         |
| type             | true     | string   | 账户类型，trade: 交易余额, frozen: 冻结余额, loan: 待还借贷本金, interest: 待还借贷利息, ,transfer-out-available 可划转额, loan-available 可借额 |
| balance }        | true     | string   | 余额，负数表示应还金额。transfer-out-available的账户余额如果为-1，代表该币种可全部转出。 |

## 还币交易记录查询

API Key 权限：读取

限频值：2次/秒

子用户可以调用

按repayTime检索

### HTTP 请求

- GET /v2/account/repayment

### 请求参数

| **名称**  | **类型** | **是否必需** | **描述**                                                     |
| --------- | -------- | ------------ | ------------------------------------------------------------ |
| repayId   | string   | FALSE        | 还币交易ID                                                   |
| accountId | string   | FALSE        | 账户ID（缺省值：所有账户）                                   |
| currency  | string   | FALSE        | 借入/借出币种（缺省值：所有币种）                            |
| startTime | long     | FALSE        | 远点时间（unix time in millisecond；取值范围：[(endTime - x天), endTime]；缺省值：(endTime - x天)） |
| endTime   | long     | FALSE        | 近点时间（unix time in millisecond；取值范围：[(当前时间 - y天), 当前时间]；缺省值：当前时间） |
| sort      | string   | FALSE        | 检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc） |
| limit     | integer  | FALSE        | 单页最大返回条目数量（取值范围：[1,100]；缺省值：50）        |
| fromId    | long     | FALSE        | 查询起始编号（仅对翻页查询有效）                             |

> Response:

```json
{
  "code":200,
  "data":[
    {
      "repayId": 1174413,
      "repayTime":1600747389111,
      "accountId": 1266826,
      "currency":"btc",
      "repaidAmount": "0.00200083",
      "transactIds":
      {
        "transactId":502,
        "repaidprincipal": "0.00199666",
        "repaidInterest": "0.00000417",
        "paidHt": "0",
        "paidPoint": "0"
      }
    }
  ]
}
```
### 响应数据
| **名称**        | **类型** | **是否必需** | **描述**                                                 |
| --------------- | -------- | ------------ | -------------------------------------------------------- |
| code            | integer  | TRUE         | 状态码                                                   |
| message         | string   | FALSE        | 错误描述（如有）                                         |
| data            | array    | TRUE         | 按sort指定顺序排列                                       |
| [{ repayId      | string   | TRUE         | 还币交易ID                                               |
| repayTime       | long     | TRUE         | 还币交易时间（unix time in millisecond）                 |
| accountId       | string   | TRUE         | 还币账户ID                                               |
| currency        | string   | TRUE         | 还币币种                                                 |
| repaidAmount    | string   | TRUE         | 已还币金额                                               |
| transactIds     | object   | TRUE         | 该笔还币所涉及的原始借币交易ID列表（按还币优先顺序排列） |
| { transactId    | long     | TRUE         | 原始借币交易ID                                           |
| repaidPrincipal | string   | TRUE         | 该笔还币交易已还本金                                     |
| repaidInterest  | string   | TRUE         | 该笔还币交易已还利息                                     |
| paidHt          | string   | TRUE         | 该笔还币交易已支付HT金额                                 |
| paidPoint }}]   | string   | TRUE         | 该笔还币交易已支付点卡金额                               |
| nextId          | long     | FALSE        | 下页查询起始编号（仅在存在下页数据时返回）               |

## 常见错误码

**以下是逐仓杠杆接口的返回码和说明。**

| 返回码                                      | 说明                                                         |
| ------------------------------------------- | ------------------------------------------------------------ |
| account-transfer-balance-insufficient-error | 账户余额不足                                                 |
| account-transfer-balance-overflow-error     | 负账户余额溢出                                               |
| account-transfer-balance-insufficient_error | 账户余额不足（不区分动作类型）                               |
| base-msg                                    | 自定义错误消息                                               |
| base-system-error                           | 系统异常                                                     |
| base-currency-error                         | currency不存在                                               |
| base-symbol-error                           | symbol不存在                                                 |
| base-margin-symbol-invalid                  | 非法借贷交易对(非法交易对或者被禁止借贷的交易对)             |
| base-record-invalid                         | 记录无效                                                     |
| base-request-timeout                        | 请求超时，请稍后再试                                         |
| base_request_exceed_number_limit            | 请求人数过多，请稍后再试                                     |
| base-date-limit-error                       | 日期错误                                                     |
| base-update-error                           | 更新数据错误                                                 |
| base-operation-forbidden 禁止操作           | 非计息状态 禁止还款                                          |
| dw-insufficient-balance                     | 余额不足                                                     |
| dw-account-transfer-error                   | 转账错误                                                     |
| frequent-invoke                             | 操作过于频繁，请稍后重试                                     |
| loan-order-not-found                        | 订单未找到                                                   |
| loan-amount-scale-limit                     | 借贷&还款 金额精度限制                                       |
| loan-repay-max-limit                        | 偿还大于借贷                                                 |
| loan-insufficient-balance                   | 余额不足                                                     |
| login-required                              | 需要登录                                                     |
| margin-country-not-allow                    | 国家未开放借贷                                               |
| margin-country-auth-required                | 国家未开放借贷，需要认证                                     |
| margin-trading-is-not-available             | 暂不支持逐仓杠杆交易--禁止土耳其籍或通过土耳其KYC的用户进行逐仓杠杆借币 |
| margin-account-state-error                  | 账户状态异常(爆仓中)                                         |
| risk-verification-failed                    | 风控拦截通用错误码                                           |
| sub-user-auth-required                      | 需要母用户授权子用户                                         |

**以下是全仓杆接口的返回码和说明。**

| 返回码                                   | 说明                                  |
| ---------------------------------------- | ------------------------------------- |
| abnormal-users-cannot-transfer           | 非正常用户不能转出                    |
| account-explosion-in-prohibited-transfer | 账户爆仓中禁止划转操作                |
| account-is-abnormal-retry-after-refresh  | 账户异常请刷新重试                    |
| account-balance-insufficient-error       | 账户余额不足                          |
| account-cannot-be-inquired               | 无法查询到全仓杠杆账户                |
| base-not-in-white-list                   | 不是白名单用户                        |
| base-currency-error                      | currency不存在                        |
| base-operation-forbidden                 | 禁止操作                              |
| base-user-request-exceed-limit           | 操作太频繁，请稍后再试                |
| base-currency-not-open                   | currency还没有开放 该保证金币种未开启 |
| beyond-maximum-number-of-rollover        | 超出最大转出数量                      |
| exceed-maximum-amount                    | 超出最大数量                          |
| start-date-cannot-greater-than-end-date  | 开始时间不能大于结束时间              |
| frequent-invoke                          | 操作过于频繁，请稍后重试              |
| insufficient-exchange-fund               | 交易所资金不足                        |
| loan-order-not-found                     | 订单未找到                            |
| loan-amount-scale-limit                  | 借贷&还款 金额精度限制                |
| loan-repay-max-limit                     | 偿还大于借贷                          |
| loan-insufficient-balance                | 余额不足                              |
| loan-fee-rate-compute-fail               | 系统借款利率计算异常                  |
| login-required                           | 需要登录                              |
| margin-subuser-no-permission             | 全仓杠杆子账号未开通权限              |
| normal-and-warehouse-can-transfer        | 正常用户与穿仓用户可以转入            |
| order-orderamount-precision-error        | 交易数额精度错误                      |
| require-exchange-id                      | 需要交易所id                          |
| subacount-currency-not-exit              | 该币种的子账户不存在                  |
| system-busy                              | 系统繁忙                              |
| unsupport-kyc-info                       | 不支持的kyc认证信息                   |
| uc-network-error                         | 网络错误                              |
| uncreated-currency-cannot-be-drawn       | 未创建币种子账户无法划出              |

## 常见问题

### Q1: 逐仓和全仓借币时我查询到可借余额有值，而且我申请借币的额度小于可借余额，为什么借币时却提示可借币不足错误，无法借币成功？

A: 用户可借额度不仅取决于用户账户的可借额度，也取决于系统可借总额度。按照风险控制要求系统每天有一个借币的总额度，为所有用户共享。如果超过了这个额度，即使账户自己的额度够也无法借币。系统当天总额度用尽时，只有当天有用户还币之后，才可以继续借币。我们目前正在实现对用户更友好的解决方案，尝试将更准确的信息通过API提供给用户。

# 借币（C2C）

## 简介

C2C借币相关接口提供了用户对用户之间的借入、借出、还币、查询、划转等功能。

<aside class="notice">访问交易相关的接口需要进行签名认证。</aside>

以下C2C借币相关接口统一限频值为2次/秒。<br>
子用户不可调用以下C2C借币相关接口。<br>
借入账户ID（accountId）须在web页面完成第一次划转后方可生成。<br>

## 借入借出下单

POST /v2/c2c/offer<br>
API Key 权限：交易<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	FALSE	|	借入账户ID（仅对借入订单有效）	|
|	currency	|	string	|	TRUE	|	借入/借出币种	|
|	side	|	string	|	TRUE	|	订单方向（lend, borrow）	|
|	timeInForce	|	string	|	FALSE	|	订单有效期（gtc, ioc）	|
|	amount	|	string	|	TRUE	|	订单金额	|
|	interestRate	|	string	|	TRUE	|	日息率	|
|	loanTerm	|	integer	|	TRUE	|	借币期限（单位：天；有效值：10, 20, 30）	|

注：<br>
•	当前借出订单缺省有效期为gtc，借入订单缺省有效期为ioc。如用户设定timeInForce为非缺省值，返回错误信息。<br>

> Response

```json
{
  "data": {
    "offerId": 14743
    "createTime": 1593172709875
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ offerId	|	string	|	TRUE	|	订单ID	|
|	createTime }	|	long	|	TRUE	|	订单创建时间（unix time in millisecond）	|

## 借入借出撤单

POST /v2/c2c/cancellation<br>
API Key 权限：交易<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	offerId	|	string	|	TRUE	|	订单ID	|

> Response

```json
{
  "data": {
    "rejected": [
      {
        "offerId": 14411,
        "errCode": 40310,
        "errMessage": "order-non-existent(NT)"
      }
    ]
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ accepted	|	object	|	TRUE	|	已接受订单ID列表	|
|	[ offerId ]	|	string	|	FALSE	|	订单ID	|
|	rejected	|	object	|	TRUE	|	已拒绝订单ID列表	|
|	[ offerId	|	string	|	FALSE	|	订单ID	|
|	errCode	|	integer	|	FALSE	|	撤单被拒错误码	|
|	errMessage ]}	|	string	|	FALSE	|	撤单被拒错误消息	|

注：<br>
•	撤单请求被接受（accepted）不意味着撤单成功。用户须在撤单后主动查询该订单以确认撤单状态。<br>

## 撤销所有借入借出订单

POST /v2/c2c/cancel-all<br>
API Key 权限：交易<br>
每次最多撤销500张订单（以offerId降序逐一撤销）<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	FALSE	|	账户ID（缺省值：所有账户）	|
|	currency	|	string	|	FALSE	|	借入/借出币种（缺省值：所有适用C2C的币种）	|
|	side	|	string	|	FALSE	|	订单方向（有效值：lend, borrow；缺省值：所有方向）	|

> Response

```json
{
  "data": {
    "accepted": [
      {
        "offerId": "14742"
      }
    ]
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ accepted	|	object	|	TRUE	|	已接受订单ID列表	|
|	[ offerId ]	|	string	|	FALSE	|	订单ID	|
|	rejected	|	object	|	TRUE	|	已拒绝订单ID列表	|
|	[ offerId	|	string	|	FALSE	|	订单ID	|
|	errCode	|	integer	|	FALSE	|	撤单被拒错误码	|
|	errMessage ]}	|	string	|	FALSE	|	撤单被拒错误消息	|

注：<br>
•	撤单请求被接受（accepted）不意味着撤单成功。用户须在撤单后主动查询该订单以确认撤单状态。<br>

## 查询借入借出订单

GET /v2/c2c/offers<br>
API Key 权限：读取<br>
按createTime检索<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	FALSE	|	账户ID（缺省值：所有账户）	|
|	currency	|	string	|	FALSE	|	借入/借出币种（缺省值：所有适用C2C的币种）	|
|	side	|	string	|	FALSE	|	订单方向（有效值：lend, borrow；缺省值：所有方向）	|
|	offerStatus	|	string	|	TRUE	|	订单状态（有效值：submitted, filled, partial-filled, canceled, partial-canceled；可多填，以逗号分隔）	|
|	startTime	|	long	|	FALSE	|	远点时间（unix time in millisecond）	|
|	endTime	|	long	|	FALSE	|	近点时间（unix time in millisecond）	|
|	limit	|	integer	|	FALSE	|	单页最大返回条目数量（取值范围：[1,100]；缺省值：50）	|
|	fromId	|	long	|	FALSE	|	查询起始编号（仅对翻页查询有效）	|

> Response

```json
{
  "code": 200,
  "data": [
    {
      "offerId": "14736",
      "createTime": 1593175645809,
      "lastActTime": 1593176383232,
      "offerStatus": "filled",
      "accountId": "13699363",
      "currency": "usdt",
      "side": "borrow",
      "timeInForce": "ioc",
      "origAmount": "10",
      "amount": "0",
      "interestRate": "0.0002",
      "loanTerm": 20
    },
    {
      "offerId": "14732",
      "createTime": 1593173423885,
      "lastActTime": 1593174884411,
      "offerStatus": "filled",
      "accountId": "13699363",
      "currency": "usdt",
      "side": "borrow",
      "timeInForce": "ioc",
      "origAmount": "10",
      "amount": "0",
      "interestRate": "0.000192",
      "loanTerm": 10
    }
  ]
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|	按createTime倒序排列	|
|	{ offerId	|	string	|	TRUE	|	订单ID	|
|	createTime	|	long	|	TRUE	|	订单创建时间（unix time in millisecond）	|
|	lastActTime	|	long	|	TRUE	|	订单更新时间（unix time in millisecond）	|
|	offerStatus	|	string	|	TRUE	|	订单状态（有效值：submitted, filled, partial-filled, canceled, partial-canceled）	|
|	accountId	|	string	|	TRUE	|	账户ID	|
|	currency	|	string	|	TRUE	|	借入/借出币种	|
|	side	|	string	|	TRUE	|	订单方向（有效值：lend, borrow）	|
|	timeInForce	|	string	|	TRUE	|	订单有效期（gtc, ioc）	|
|	origAmount	|	string	|	TRUE	|	订单原始金额	|
|	amount	|	string	|	TRUE	|	订单剩余金额	|
|	interestRate	|	string	|	TRUE	|	日息率	|
|	loanTerm }	|	integer	|	TRUE	|	借币期限	|
|	nextId	|	long	|	FALSE	|	下页查询起始编号（仅在存在下页数据时返回）	|

## 查询特定借入借出订单及其交易记录

GET /v2/c2c/offer<br>
API Key 权限：读取<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	offerId	|	string	|	TRUE	|	订单ID	|

> Response

```json
{
  "code": 200,
  "data": {
    "lastActTime": 1593176383232,
    "offerStatus": "filled",
    "origAmount": "10",
    "currency": "usdt",
    "amount": "0",
    "timeInForce": "ioc",
    "side": "borrow",
    "offerId": "14736",
    "accountId": "13699363",
    "interestRate": "0.0002",
    "loanTerm": 20,
    "transactions": [
      {
        "transactRate": "0.00019",
        "transactAmount": "10",
        "transactTime": 1593175646232,
        "transactId": 28152,
        "aggressor": true,
        "unpaidPrincipal": "0",
        "unpaidInterest": "0",
        "paidInterest": "0.00007917",
        "transactStatus": "closed"
      }
    ],
    "createTime": 1593175645809
  }
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|	按市场板块正序排列	|
|	{ offerId	|	string	|	TRUE	|	订单ID	|
|	createTime	|	long	|	TRUE	|	订单创建时间（unix time in millisecond）	|
|	lastActTime	|	long	|	TRUE	|	订单更新时间（unix time in millisecond）	|
|	offerStatus	|	string	|	TRUE	|	订单状态（有效值：submitted, filled, partial-filled, canceled, partial-canceled）	|
|	accountId	|	string	|	TRUE	|	账户ID	|
|	currency	|	string	|	TRUE	|	借入/借出币种	|
|	side	|	string	|	TRUE	|	订单方向（有效值：lend, borrow）	|
|	timeInForce	|	string	|	TRUE	|	订单有效期（gtc, ioc）	|
|	origAmount	|	string	|	TRUE	|	订单原始金额	|
|	amount	|	string	|	TRUE	|	订单剩余金额	|
|	interestRate	|	string	|	TRUE	|	日息率	|
|	loanTerm	|	integer	|	TRUE	|	借币期限	|
|	transactions	|	object	|	TRUE	|	按transactTime倒序排列	|
|	{ transactRate	|	string	|	TRUE	|	交易价格（即达成交易的日息率）	|
|	transactAmount	|	string	|	TRUE	|	交易金额	|
|	transactTime	|	long	|	TRUE	|	交易时间（unix time in millisecond）	|
|	transactId	|	long	|	TRUE	|	交易ID	|
|	aggressor	|	boolean	|	TRUE	|	是否交易主动方（有效值：true, false）	|
|	unpaidPrincipal	|	string	|	TRUE	|	未还本金	|
|	unpaidInterest	|	string	|	TRUE	|	未还币息（截至查询时间）	|
|	paidInterest	|	string	|	TRUE	|	已还币息	|
|	transactStatus }}	|	string	|	TRUE	|	还币状态（有效值：pending, closed）	|

## 查询借入借出交易记录

GET /v2/c2c/transactions<br>
API Key 权限：读取<br>
按transactTime检索<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	FALSE	|	账户ID（缺省值：所有账户）	|
|	currency	|	string	|	FALSE	|	借入/借出币种（缺省值：所有币种）	|
|	side	|	string	|	FALSE	|	订单方向（有效值：lend, borrow；缺省值：所有方向）	|
|	transactStatus	|	string	|	TRUE	|	还币状态（有效值：pending, closed）	|
|	startTime	|	long	|	FALSE	|	远点时间（unix time in millisecond）	|
|	endTime	|	long	|	FALSE	|	近点时间（unix time in millisecond）	|
|	limit	|	integer	|	FALSE	|	单页最大返回条目数量（取值范围：[1,100]；缺省值：50）	|
|	fromId	|	long	|	FALSE	|	查询起始编号（仅对翻页查询有效）	|

> Response

```json
{
  "data": [
    {
      "transactId": 5585,
      "transactTime": "1593178102345",
      "transactRate": "0.0019",
      "transactAmount": "10",
      "aggressor": "true",
      "unpaidPrincipal": "0",
      "unpaidInterest": "0",
      "piadInterest": "0.00007917",
      "transactStatus": "closed",
      "offerId": "14736",
      "accountId" "13699363",
      "currency": "usdt",
      "side": "borrow"
    }
  ],
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|	按sort指定顺序排列	|
|	{ transactRate	|	string	|	TRUE	|	交易价格（即达成交易的日息率）		|
|	transactAmount	|	string	|	TRUE	|	交易金额	|
|	transactTime	|	long	|	TRUE	|	交易时间（unix time in millisecond）	|
|	transactId	|	long	|	TRUE	|	交易ID	|
|	aggressor	|	boolean	|	TRUE	|	是否交易主动方（有效值：true, false）	|
|	unpaidPrincipal	|	string	|	TRUE	|	未还本金	|
|	unpaidInterest	|	string	|	TRUE	|	未还币息（截至查询时间）	|
|	paidInterest	|	string	|	TRUE	|	已还币息	|
|	transactStatus	|	string	|	TRUE	|	还币状态（有效值：pending, closed）	|
|	offerId	|	string	|	TRUE	|	订单ID	|
|	accountId	|	string	|	TRUE	|	账户ID	|
|	currency	|	string	|	TRUE	|	借入/借出币种	|
|	side }	|	string	|	TRUE	|	订单方向（有效值：lend, borrow）	|
|	nextId	|	long	|	FALSE	|	下页查询起始编号（仅在存在下页数据时返回）	|

## 还币
POST /v2/c2c/repayment<br>
API Key 权限：交易<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	TRUE	|	还币账户ID	|
|	currency	|	string	|	TRUE	|	还币币种	|
|	amount	|	string	|	TRUE	|	还币金额	|
|	offerId	|	string	|	TRUE	|	原始借入订单ID	|

> Response

```json
{
  "data": {
    "repayId": 5585,
    "repayTime": "1593178102345"
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ repayId	|	string	|	TRUE	|	还币交易ID	|
|	repayTime }	|	long	|	TRUE	|	还币交易时间（unix time in millisecond）	|

注：<br>
•	返回relayId不意味着该还币100%成功，用户须在还币后通过查询还币交易记录确认该还币状态。<br>

## 查询还币交易记录
GET /v2/c2c/repayment<br>
API Key 权限：读取<br>
按repayTime检索<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	repayId	|	string	|	FALSE	|	还币交易ID	|
|	accountId	|	string	|	FALSE	|	账户ID（缺省值：所有账户）	|
|	currency	|	string	|	FALSE	|	借入/借出币种（缺省值：所有币种）	|
|	startTime	|	long	|	FALSE	|	远点时间（unix time in millisecond）	|
|	endTime	|	long	|	FALSE	|	近点时间（unix time in millisecond）	|
|	limit	|	integer	|	FALSE	|	单页最大返回条目数量（取值范围：[1,100]；缺省值：50）	|
|	fromId	|	long	|	FALSE	|	查询起始编号（仅对翻页查询有效）	|

> Response

```json
{
  "code": 200,
  "data": [
    {
      "repayId": 2173,
      "repayTime": 1593176382960,
      "accountId": 13699363,
      "currency": "usdt",
      "paidAmount": "10.00007917",
      "transactIds": [
        {
          "transactId": 28152,
          "paidPrincipal": "10",
          "paidInterest": "0.00007917"
        }
      ]
    },
    {
      "repayId": 2171,
      "repayTime": 1593174883839,
      "accountId": 13699363,
      "currency": "usdt",
      "paidAmount": "10.00007",
      "transactIds": [
        {
          "transactId": 28145,
          "paidPrincipal": "10",
          "paidInterest": "0.00007"
        }
      ]
    }
  ]
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|	按repayTime倒序排列	|
|	{ repayId	|	string	|	TRUE	|	还币交易ID	|
|	repayTime	|	long	|	TRUE	|	还币交易时间（unix time in millisecond）	|
|	accountId	|	string	|	TRUE	|	还币账户ID	|
|	currency	|	string	|	TRUE	|	还币币种	|
|	paidAmount	|	string	|	TRUE	|	已还币金额	|
|	transactIds	|	object	|	TRUE	|	还币交易ID列表（按还币优先顺序排列）	|
|	{ transactId	|	long	|	TRUE	|	交易ID	|
|	paidPrincipal	|	string	|	TRUE	|	单笔还币交易已还本金	|
|	paidInterest }}	|	string	|	TRUE	|	单笔还币交易已还币息	|
|	nextId	|	long	|	FALSE	|	下页查询起始编号（仅在存在下页数据时返回）	|

## 资产划转
POST /v2/c2c/transfer<br>
API Key 权限：交易<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	from	|	string	|	TRUE	|	转出账户ID	|
|	to	|	string	|	TRUE	|	转入账户ID	|
|	currency	|	string	|	TRUE	|	划转币种	|
|	amount	|	string	|	TRUE	|	划转金额	|

注：<br>
•	仅允许现货账户与借入账户间划转。<br>

> Response

```json
{
  "data": {
    "transactId": 5585,
    "transactTime": "1593178102345"
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ transactId	|	string	|	TRUE	|	划转交易ID	|
|	transactTime }	|	long	|	TRUE	|	划转交易时间（unix time in millisecond）	|

## 查询账户余额

GET /v2/c2c/account<br>
API Key 权限：读取<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	accountId	|	string	|	TRUE	|	账户ID	|
|	currency	|	string	|	FALSE	|	币种	|

> Response

```json
{
  "data": {
    "accountId": 13699363,
    "accountStatus": "working",
    "symbol": "btcusdt",
    "riskRate": "10",//风险率为10，意味着最低风险
    "subAccountTypes": [
      {
        "currency": "btc",
        "subAccountType": "trade",
        "acctBalance": "0.00000029",
        "availBalance": "0.00000029",
        "transferable": "0.00000029",
        "borrowable": "0.01969453"
      },
      {
        "currency": "usdt",
        "subAccountType": "trade",
        "acctBalance": "90.27945823",
        "availBalance": "90.27945823",
        "transferable": "90.27945823",
        "borrowable": "180.56423403"
      },
      {
        "currency": "usdt",
        "subAccountType": "loan",
        "acctBalance": "0",
        "availBalance": "0",
        "transferable": "0",
        "borrowable": "0"
      },
      {
        "currency": "usdt",
        "subAccountType": "interest",
        "acctBalance": "0",
        "availBalance": "0",
        "transferable": "0",
        "borrowable": "0"
      }
    ]
  },
  "code": 200,
  "success": true
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	data	|	object	|	TRUE	|		|
|	{ accountId	|	string	|	TRUE	|	账户ID	|
|	accountStatus	|	string	|	TRUE	|	账户状态（working 正常, lock 锁定, fl-sys 系统自动爆仓, fl-mgt 手动爆仓, fl-end 爆仓结束, fl-negative 穿仓）	|
|	symbol	|	string	|	FALSE	|	交易对（仅对借入账户类型有效）	|
|	riskRate	|	string	|	FALSE	|	风险率（仅对借入账户类型有效）	|
|	subAccountTypes	|	object	|	TRUE	|	账户子类型列表	|
|	{ subAccountType	|	string	|	TRUE	|	账户子类型（trade, lending, earnings, loan, interest, advance）	|
|	currency	|	string	|	TRUE	|	币种	|
|	acctBalance	|	string	|	TRUE	|	账户余额	|
|	availBalance	|	string	|	FALSE	|	可用余额 （仅对借入账户下trade子类型有效）	|
|	transferable	|	string	|	FALSE	|	可转出金额 （仅对借入账户下trade子类型有效）	|
|	borrowable }}	|	string	|	FALSE	|	可借入金额 （仅对借入账户下trade子类型有效）	|

注：<br>
•	账户子类型trade, loan, interest, advance仅对借入账户有效；<br>
•	账户子类型trade, lending, earnings仅对借出账户有效。<br>

## 常见错误码

以下是C2C借币相关接口的错误码、错误消息和说明。

| 错误码 | 错误消息                                                     | 说明                                               |
| ------ | ------------------------------------------------------------ | -------------------------------------------------- |
| 40301  | Insufficient available balance                               | 可用余额不足                                       |
| 40302  | Failed to get the account                                    | 获取账户信息失败                                   |
| 40307  | Existence of an ongoing loan order                           | 存在正在进行中的借贷单                             |
| 40309  | Wrong order status                                           | 订单状态错误                                       |
| 40310  | Order does not exist                                         | 借贷单不存在                                       |
| 40311  | User has OTC loans                                           | 用户存在场外借贷                                   |
| 40312  | Only normal and bankrupt users can be included               | 爆仓中账户不能转入资产                             |
| 40315  | There is no liquidation or forced liquidation setting        | 缺少强平或爆仓设置                                 |
| 40317  | Failed to get sub-loan order                                 | 获取子借贷单失败                                   |
| 40319  | No less than the minimum borrowing amount                    | 不能低于最小借出量                                 |
| 40320  | borrowing configuration does not exist                       | 借贷配置不存在                                     |
| 40322  | The user has not passed advanced verification                | 用户未通过高级认证                                 |
| 40324  | The amount of repayment exceeds the amount borrowed          | 还款数量超过借贷量                                 |
| 40326  | White list users only                                        | 非白名单用户                                       |
| 40327  | Exceeding the maximum accuracy                               | 超过最大精度                                       |
| 40328  | Cannot exceed the maximum amount of borrowing                | 不能超过最大借贷量                                 |
| 40329  | Interest rate out of the set range                           | 利率超出设定范围                                   |
| 40330  | Cannot be less than the minimum loan amount                  | 不能低于最小借入量                                 |
| 40331  | cannot exceed the maximum loan amount                        | 不能超过最大借入量                                 |
| 40332  | Cannot be less than the minimum repayment amount             | 不能低于最小还款量                                 |
| 40333  | the ending time must be greater than the starting time       | 结束时间必须大于开始时间                           |
| 40335  | in repayment                                                 | 还款中                                             |
| 40336  | This feature is not open to users in China, the United States, Turkey, Japan, Singapore | 该功能不对中国、美国、土耳其、日本、新加坡用户开放 |
| 40337  | C2C lending transaction is not currently available           | 暂不支持C2C借贷交易                                |
| 40339  | Debit and credit function is closed                          | 借贷功能已关闭                                     |
| 40340  | The current account ID does not belong to the current user   | 当前账户ID不属于当前用户所持有                     |
| 40345  | This account is not a C2C account                            | 该账户非C2C账户                                    |
| 40346  | This order is not allowed to change renew state              | 当前订单不能修改续借状态                           |

# Websocket行情数据

## 简介

### 接入URL

**Global站行情请求地址（除MBP增量推送及MBP全量REQ以外Websocket行情频道）**

**`wss://www.huobihktrust.com/ws`**

**`wss://api-aws.huobi.pro/ws`**

**MBP增量推送及MBP全量REQ请求地址**

**`wss://www.huobihktrust.com/feed`**

**`wss://api-aws.huobi.pro/feed`**

### 数据压缩

WebSocket 行情接口返回的所有数据都进行了 GZIP 压缩，需要 client 在收到数据之后解压。

### 心跳消息

```json
{"ping": 1492420473027}
```

当用户的Websocket客户端连接到火币Websocket服务器后，服务器会定期（当前设为5秒）向其发送`ping`消息并包含一整数值。

```json
{"pong": 1492420473027}
```

当用户的Websocket客户端接收到此心跳消息后，应返回`pong`消息并包含同一整数值。

<aside class="warning">当Websocket服务器连续两次发送了`ping`消息却没有收到任何一次`pong`消息返回后，服务器将主动断开与此客户端的连接。</aside>

### 订阅主题

> Sub request:

```json
{
  "sub": "market.btcusdt.kline.1min",
  "id": "id1"
}
```

成功建立与Websocket服务器的连接后，Websocket客户端发送请求以订阅特定主题：

{
"sub": "topic to sub",
"id": "id generate by client"
}

> Sub response:

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.kline.1min",
  "ts": 1489474081631
}
```

成功订阅后，Websocket客户端将收到确认。

之后, 一旦所订阅的主题有更新，Websocket客户端将收到服务器推送的更新消息（push）。

### 取消订阅

> UnSub request:

```json
{
  "unsub": "market.btcusdt.trade.detail",
  "id": "id4"
}
```

取消订阅的格式如下：

{
"unsub": "topic to unsub",
"id": "id generate by client"
}

> UnSub response:

```json
{
  "id": "id4",
  "status": "ok",
  "unsubbed": "market.btcusdt.trade.detail",
  "ts": 1494326028889
}
```

取消订阅成功确认。

### 请求数据

Websocket服务器同时支持一次性请求数据（pull）。

一次性请求的格式如下：

{
"req": "topic to req",
"id": "id generate by client"
}

一次性返回数据的具体格式参见各个主题。

### 限频

数据请求（req）限频规则

单个连接每两次请求不能小于100ms。

## K线数据

### 主题订阅

一旦K线数据产生，Websocket服务器将通过此订阅主题接口推送至客户端：

`market.$symbol$.kline.$period$`

> 订阅请求

```json
{
  "sub": "market.ethbtc.kline.1min",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 描述     | 取值范围                                                     |
| ------ | -------- | -------- | -------- | ------------------------------------------------------------ |
| symbol | string   | true     | 交易代码 | btcusdt, ethbtc...等（如需获取杠杆ETP净值K线，净值symbol = 杠杆ETP交易对symbol + 后缀‘nav’，例如：btc3lusdtnav） |
| period | string   | true     | K线周期  | 1min, 5min, 15min, 30min, 60min, 4hour, 1day, 1mon, 1week, 1year |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.ethbtc.kline.1min",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
  "ch": "market.ethbtc.kline.1min",
  "ts": 1489474082831, //system update time
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

### 数据更新字段列表

| 字段   | 数据类型 | 描述                                        |
| ------ | -------- | ------------------------------------------- |
| id     | integer  | unix时间，同时作为K线ID                     |
| amount | float    | 成交量                                      |
| count  | integer  | 成交笔数                                    |
| open   | float    | 开盘价                                      |
| close  | float    | 收盘价（当K线为最晚的一根时，是最新成交价） |
| low    | float    | 最低价                                      |
| high   | float    | 最高价                                      |
| vol    | float    | 成交额, 即 sum(每一笔成交价 * 该笔的成交量) |

<aside class="notice">当symbol被设为“hb10”或“huobi10”时，amount，count，vol均为零值。</aside>
### 数据请求

用请求方式一次性获取K线数据需要额外提供以下参数：
（每次最多返回300条）

```json
{
  "req": "market.$symbol.kline.$period",
  "id": "id generated by client",
  "from": "from time in epoch seconds",
  "to": "to time in epoch seconds"
}
```

| 参数 | 数据类型 | 是否必需 | 缺省值                                | 描述                            | 取值范围                                                     |
| ---- | -------- | -------- | ------------------------------------- | ------------------------------- | ------------------------------------------------------------ |
| from | integer  | false    | 1501174800(2017-07-28T00:00:00+08:00) | 起始时间 (epoch time in second) | [1501174800, 2556115200]                                     |
| to   | integer  | false    | 2556115200(2050-01-01T00:00:00+08:00) | 结束时间 (epoch time in second) | [1501174800, 2556115200] or ($from, 2556115200] if "from" is set |



## 聚合行情(Ticker)数据

### 主题订阅

获取市场聚合行情数据，每100ms推送一次。

`market.$symbol.ticker`

> 订阅请求

```json
{
  "sub": "market.btcusdt.ticker"
}
```

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述   | 取值范围                                               |
| ------ | -------- | -------- | ------ | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易对 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response:

```json
{
  "ch": "market.btcusdt.ticker",
  "ts": 1628587397308,
  "tick": {
    "open": 44718.5,
    "high": 46711,
    "low": 44480.81,
    "close": 45868.99,
    "amount": 22527.427922989766,
    "vol": 1030630905.0136755,
    "count": 676424,
    "bid": 45868.98,
    "bidSize": 0.016782,
    "ask": 45868.99,
    "askSize": 3.1279664455029423,
    "lastPrice": 45868.99,
    "lastSize": 0.007444
  }
}

```

### 响应数据

| 字段名称  | 数据类型 | 描述                                     |
| --------- | -------- | ---------------------------------------- |
| id        | long     | NA                                       |
| amount    | float    | 以基础币种计量的交易量（以滚动24小时计） |
| count     | integer  | 交易次数（以滚动24小时计）               |
| open      | float    | 本阶段开盘价（以滚动24小时计）           |
| close     | float    | 本阶段最新价（以滚动24小时计）           |
| low       | float    | 本阶段最低价（以滚动24小时计）           |
| high      | float    | 本阶段最高价（以滚动24小时计）           |
| vol       | float    | 以报价币种计量的交易量（以滚动24小时计） |
| bid       | float    | 当前的最高买价                           |
| bidSize   | float    | 最高买价对应的量                         |
| ask       | float    | 当前的最低卖价                           |
| askSize   | float    | 最低卖价对应的量                         |
| lastPrice | float    | 最新成交价                               |
| lastSize  | float    | 最新成交价对应的量                       |

##

## 市场深度行情数据

此主题发送最新市场深度快照。快照频率为每秒1次。

### 主题订阅

`market.$symbol.depth.$type`

> Subscribe request

```json
{
  "sub": "market.btcusdt.depth.step0",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述         | 取值范围                                               |
| ------ | -------- | -------- | ------ | ------------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码     | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| type   | string   | true     | step0  | 合并深度类型 | step0, step1, step2, step3, step4, step5               |

**"type" 合并深度类型**

| Value | Description                          |
| ----- | ------------------------------------ |
| step0 | 不合并深度                           |
| step1 | Aggregation level = precision*10     |
| step2 | Aggregation level = precision*100    |
| step3 | Aggregation level = precision*1000   |
| step4 | Aggregation level = precision*10000  |
| step5 | Aggregation level = precision*100000 |

当type值为‘step0’时，默认深度为150档;
当type值为‘step1’,‘step2’,‘step3’,‘step4’,‘step5’时，默认深度为20档。

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.depth.step0",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
  "ch": "market.htusdt.depth.step0",
  "ts": 1572362902027, //system update time
  "tick": {
    "bids": [
      [3.7721, 344.86],// [price, size]
      [3.7709, 46.66]
    ],
    "asks": [
      [3.7745, 15.44],
      [3.7746, 70.52]
    ],
    "version": 100434317651,
    "ts": 1572362902012 //quote time
  }
}
```

### 数据更新字段列表

<aside class="notice">在'tick'object下方呈现买盘卖盘深度列表</aside>
| 字段    | 数据类型 | 描述                         |
| ------- | -------- | ---------------------------- |
| bids    | object   | 当前的所有买单 [price, size] |
| asks    | object   | 当前的所有卖单 [price, size] |
| version | integer  | 内部字段                     |
| ts      | integer  | 新加坡时间的时间戳，单位毫秒 |

<aside class="notice">当symbol被设为"hb10"时，amount, count, vol均为零值 </aside>
### 数据请求

支持数据请求方式一次性获取市场深度数据：

```json
{
  "req": "market.btcusdt.depth.step0",
  "id": "id10"
}
```

## 市场深度MBP行情数据（增量推送）

用户可订阅此频道以接收最新深度行情Market By Price (MBP) 的增量数据推送；同时，该频道支持用户以req方式请求获取全量数据。

**MBP增量推送及MBP全量REQ请求地址**

**`wss://www.huobihktrust.com/feed`**

**`wss://api-aws.huobi.pro/feed`**

建议下游数据处理方式：<br>
1）	订阅增量数据并开始缓存；<br>
2）	请求全量数据（同等档位数）并根据该全量消息的seqNum与缓存增量数据中的prevSeqNum对齐；<br>
3）	开始连续增量数据接收与计算，构建并持续更新MBP订单簿；<br>
4）	每条增量数据的prevSeqNum须与前一条增量数据的seqNum一致，否则意味着存在增量数据丢失，须重新获取全量数据并对齐；<br>
5）	如果收到增量数据包含新增price档位，须将该price档位插入MBP订单簿中适当位置；<br>
6）	如果收到增量数据包含已有price档位，但size不同，须替换MBP订单簿中该price档位的size；<br>
7）	如果收到增量数据某price档位的size为0值，须将该price档位从MBP订单簿中删除；<br>
8）	如果收到单条增量数据中包含两个及以上price档位的更新，这些price档位须在MBP订单簿中被同时更新。<br>

当前仅支持5档/20档MBP逐笔增量以及150档MBP快照增量的推送，二者的区别为 -<br>
1） 深度不同；<br>
2） 5档/20档为逐笔增量MBP行情，150档为100毫秒定时快照增量MBP行情；<br>
3） 当5档/20档订单簿仅发生单边行情变化时，增量推送仅包含单边行情更新，比如，推送消息中包含数组asks，但不含数组bids；<br>

```json
{
  "ch": "market.btcusdt.mbp.5",
  "ts": 1573199608679,
  "tick": {
    "seqNum": 100020146795,
    "prevSeqNum": 100020146794,
    "asks": [
      [645.140000000000000000, 26.755973959140651643]
    ]
  }
}
```
当150档订单簿仅发生单边行情变化时，增量推送包含双边行情更新，但其中一边行情为空，比如，推送消息中包含数组asks更新的同时，也包含bids空数组；<br>

```json
{
  "ch":"market.btcusdt.mbp.150",
  "ts":1573199608679,
  "tick":{
    "seqNum":100020146795,
    "prevSeqNum":100020146794,
    "bids":[ ],
    "asks":[
      [645.14,26.75597395914065]
    ]
  }
}
```
未来，150档增量推送的数据行为将与5档/20档增量保持一致，即，单边深度行情变更时，推送消息中将不包含另一边行情深度行情；<br>
4） 当150档订单簿在100毫秒时间间隔内未发生变化时，增量推送包含bids和asks空数组；<br>

```json
{
  "ch":"market.zecusdt.mbp.150",
  "ts":1585074391470,
  "tick":{
    "seqNum":100772868478,
    "prevSeqNum":100772868476,
    "bids":[  ],
    "asks":[  ]
  }
}
```
而5档/20档MBP逐笔增量，在订单簿未发生变化时，不推送数据；<br>
未来，150档增量推送的数据行为将与5档增量保持一致，即，在订单簿未发生变化时，不再推送空消息；<br>
5）5档/20档逐笔增量行情仅支持部分交易对（btcusdt,ethusdt,xrpusdt,eosusdt,ltcusdt,etcusdt,adausdt,dashusdt,bsvusdt），150档快照增量支持全部交易对。<br>

REQ频道支持5档/20档/150档全量数据的获取。<br>

### 订阅增量推送

`market.$symbol.mbp.$levels`

> Sub request

```json
{
  "sub": "market.btcusdt.mbp.5",
  "id": "id1"
}
```

### 请求全量数据

`market.$symbol.mbp.$levels`

> Req request

```json
{
  "req": "market.btcusdt.mbp.5",
  "id": "id2"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述                         | 取值范围                         |
| ------ | -------- | -------- | ------ | ---------------------------- | -------------------------------- |
| symbol | string   | true     | NA     | 交易代码（不支持通配符）     |                                  |
| levels | integer  | true     | NA     | 深度档位（取值：5， 20， 150，400） | 当前仅支持5档，20档，150或400档深度 |

> Response (增量订阅)

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.mbp.5",
  "ts": 1489474081631 //system response time
}
```

> Incremental Update (增量订阅)

```json
{
  "ch": "market.btcusdt.mbp.5",
  "ts": 1573199608679, //system update time
  "tick": {
    "seqNum": 100020146795,
    "prevSeqNum": 100020146794,
    "asks": [
      [645.140000000000000000, 26.755973959140651643] // [price, size]
    ]
  }
}
```

> Response (全量请求)

```json
{
  "id": "id2",
  "rep": "market.btcusdt.mbp.150",
  "status": "ok",
  "data": {
    "seqNum": 100020142010,
    "bids": [
      [618.37, 71.594], // [price, size]
      [423.33, 77.726],
      [223.18, 47.997],
      [219.34, 24.82],
      [210.34, 94.463]
    ],
    "asks": [
      [650.59, 14.909733438479636],
      [650.63, 97.996],
      [650.77, 97.465],
      [651.23, 83.973],
      [651.42, 34.465]
    ]
  }
}
```

### 数据更新字段列表

| 字段       | 数据类型 | 描述                                    |
| ---------- | -------- | --------------------------------------- |
| seqNum     | integer  | 消息序列号                              |
| prevSeqNum | integer  | 上一消息序列号                          |
| bids       | object   | 买盘，按price降序排列，["price","size"] |
| asks       | object   | 卖盘，按price升序排列，["price","size"] |

## 市场深度MBP行情数据（全量推送）

用户可订阅此频道以接收最新深度行情Market By Price (MBP) 的全量数据推送。推送频率为大约100毫秒一次。

### 订阅增量推送

`market.$symbol.mbp.refresh.$levels`

> Sub request

```json
{
  "sub": "market.btcusdt.mbp.refresh.20",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述                     | 取值范围 |
| ------ | -------- | -------- | ------ | ------------------------ | -------- |
| symbol | string   | true     | NA     | 交易代码（不支持通配符） |          |
| levels | integer  | true     | NA     | 深度档位                 | 5,10,20  |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.mbp.refresh.20",
  "ts": 1489474081631 //system response time
}
```

> Refresh Update

```json
{
  "ch": "market.btcusdt.mbp.refresh.20",
  "ts": 1573199608679, //system update time
  "tick": {

    "seqNum": 100020142010,
    "bids": [
      [618.37, 71.594], // [price, size]
      [423.33, 77.726],
      [223.18, 47.997],
      [219.34, 24.82],
      [210.34, 94.463], ... // 省略余下15档
    ],
    "asks": [
      [650.59, 14.909733438479636],
      [650.63, 97.996],
      [650.77, 97.465],
      [651.23, 83.973],
      [651.42, 34.465], ... // 省略余下15档
    ]
  }
}
```

### 数据更新字段列表

| 字段   | 数据类型 | 描述                                    |
| ------ | -------- | --------------------------------------- |
| seqNum | integer  | 消息序列号                              |
| bids   | object   | 买盘，按price降序排列，["price","size"] |
| asks   | object   | 卖盘，按price升序排列，["price","size"] |


## 买一卖一逐笔行情

当买一价、买一量、卖一价、卖一量，其中任一数据发生变化时，此主题推送逐笔更新。

### 主题订阅

`market.$symbol.bbo`

> Subscribe request

```json
{
  "sub": "market.btcusdt.bbo",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围                                               |
| ------ | -------- | -------- | ------ | -------- | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.bbo",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
  "ch": "market.btcusdt.bbo",
  "ts": 1489474082831, //system update time
  "tick": {
    "symbol": "btcusdt",
    "quoteTime": "1489474082811",
    "bid": "10008.31",
    "bidSize": "0.01",
    "ask": "10009.54",
    "askSize": "0.3",
    "seqId":"10242474683"
  }
}
```

### 数据更新字段列表

| 字段      | 数据类型 | 描述         |
| --------- | -------- | ------------ |
| symbol    | string   | 交易代码     |
| quoteTime | long     | 盘口更新时间 |
| bid       | float    | 买一价       |
| bidSize   | float    | 买一量       |
| ask       | float    | 卖一价       |
| askSize   | float    | 卖一量       |
| seqId     | int      | 消息序号     |


## 成交明细

### 主题订阅

此主题提供市场最新成交逐笔明细。

`market.$symbol.trade.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.trade.detail",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围                                               |
| ------ | -------- | -------- | ------ | -------- | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.trade.detail",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
  "ch": "market.btcusdt.trade.detail",
  "ts": 1489474082831, //system update time
  "tick": {
    "id": 14650745135,
    "ts": 1533265950234, //trade time
    "data": [
      {
        "amount": 0.0099,
        "ts": 1533265950234, //trade time
        "id": 146507451359183894799,
        "tradeId": 102043494568,
        "price": 401.74,
        "direction": "buy"
      }
      // more Trade Detail data here
    ]
  }
}
```

### 数据更新字段列表

| 字段      | 数据类型 | 描述                                           |
| --------- | -------- | ---------------------------------------------- |
| id        | integer  | 唯一成交ID（将被废弃）                         |
| tradeId   | integer  | 唯一成交ID（NEW）                              |
| amount    | float    | 成交量（买或卖一方）                           |
| price     | float    | 成交价                                         |
| ts        | integer  | 成交时间 (UNIX epoch time in millisecond)      |
| direction | string   | 成交主动方 (taker的订单方向) : 'buy' or 'sell' |

### 数据请求

支持数据请求方式一次性获取成交明细数据（仅能获取最多最近300个成交记录）：

```json
{
  "req": "market.btcusdt.trade.detail",
  "id": "id11"
}
```

## 市场概要

### 主题订阅

此主题提供24小时内最新市场概要快照。快照频率不超过每秒10次。

`market.$symbol.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.detail",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围             |
| ------ | -------- | -------- | ------ | -------- | -------------------- |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...等 |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.detail",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
  "ch": "market.btcusdt.detail",
  "ts": 1494496390001, //system update time
  "tick": {
    "amount": 12224.2922,
    "open":   9790.52,
    "close":  10195.00,
    "high":   10300.00,
    "id":     1494496390,
    "count":  15195,
    "low":    9657.00,
    "vol":    121906001.754751
  }
}
```

### 数据更新字段列表

| 字段   | 数据类型 | 描述                     |
| ------ | -------- | ------------------------ |
| id     | integer  | unix时间，同时作为消息ID |
| amount | float    | 24小时成交量             |
| count  | integer  | 24小时成交笔数           |
| open   | float    | 24小时开盘价             |
| close  | float    | 最新价                   |
| low    | float    | 24小时最低价             |
| high   | float    | 24小时最高价             |
| vol    | float    | 24小时成交额             |

### 数据请求

支持数据请求方式一次性获取市场概要数据：

```json
{
  "req": "market.btcusdt.detail",
  "id": "id11"
}
```

## 杠杆ETP实时净值推送

### 主题订阅

此主题提供杠杆ETP实时净值的推送。

`market.$symbol.etp`

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围      |
| ------ | -------- | -------- | ------ | -------- | ------------- |
| symbol | string   | true     | NA     | 交易代码 | 杠杆ETP交易对 |

### 数据更新字段列表

| 字段名称       | 数据类型 | 描述                                        |
| -------------- | -------- | ------------------------------------------- |
| symbol         | string   | 杠杆ETP交易代码                             |
| nav            | float    | 最新净值                                    |
| navTime        | long     | 最新净值更新时间 (unix time in millisecond) |
| outstanding    | float    | ETP总份额                                   |
| basket         | object   | 篮子                                        |
| { currency     | float    | 币种                                        |
| amount }       | float    | 金额                                        |
| actualLeverage | float    | 实际杠杆率                                  |

## 常见错误码

以下是WebSocket行情接口的错误码、错误消息和说明。

| 错误码      | 错误消息                               | 说明                     |
| ----------- | -------------------------------------- | ------------------------ |
| bad-request | invalid topic                          | topic错误                |
| bad-request | invalid symbol                         | symbol错误               |
| bad-request | symbol trade not open now              | 该交易对未到开始交易时间 |
| bad-request | 429 too many request                   | req 请求太频繁           |
| bad-request | unsub with not subbed topic            | 未订阅该主题             |
| bad-request | not json string                        | 发送的请求不是JSON格式   |
| 1008        | header required correct cloud-exchange | exchangeCode 参数错误    |
| bad-request | request timeout                        | 请求超时                 |

# Websocket资产及订单

## 简介

### 接入URL

**Websocket资产及订单**

**`wss://www.huobihktrust.com/ws/v2`**

**`wss://api-aws.huobi.pro/ws/v2`**

注：api-aws.huobi.pro域名对使用aws云服务的用户做了一定的链路延迟优化。

请使用中国大陆以外的服务器访问火币 API。

### 数据压缩

与行情WebSocket不同，资产和订单返回的数据未进行 GZIP 压缩。

### 心跳消息

当用户的Websocket客户端连接到火币WebSocket服务器后，服务器会定期（当前设为20秒）向其发送`Ping`消息并包含一整数值如下：

```json
{
  "action": "ping",
  "data": {
    "ts": 1575537778295
  }
}
```

当用户的Websocket客户端接收到此心跳信息后，应返回`Pong`消息并包含同一整数值：

```json
{
  "action": "pong",
  "data": {
    "ts": 1575537778295 // 使用Ping消息中的ts值
  }
}
```

### `action`的有效取值

| 有效取值   | 取值说明                             |
| ---------- | ------------------------------------ |
| sub        | 订阅数据                             |
| req        | 数据请求                             |
| ping、pong | 心跳数据                             |
| push       | 推送数据，服务端发送至客户端数据类型 |

### 限频

此版本对用户采取了多维度的限频策略，具体策略如下：

- 限制单连接**有效**的请求（包括req，sub，unsub，不包括ping/pong和其他无效请求)为**50次/秒**（此处秒限制为滑动窗口）。当超过此限制时，会返回"too many request"错误消息。
- 限制单API Key建连总数为**10**。当超过此限制时，会返回"too many connection"错误消息。
- 限制单IP建立连接数为**100次/秒**。当超过次限制时，会返回"too many request"错误消息。

### 鉴权

鉴权请求格式如下：

```json
{
  "action": "req",
  "ch": "auth",
  "params": {
    "authType":"api",
    "accessKey": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",
    "signatureMethod": "HmacSHA256",
    "signatureVersion": "2.1",
    "timestamp": "2019-09-01T18:16:16",
    "signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o="
  }
}

```

鉴权成功后返回数据格式如下：

```json
{
  "action": "req",
  "code": 200,
  "ch": "auth",
  "data": {}
}
```

参数说明

| 字段             | 是否必需 | 数据类型 | 描述                                                         |
| ---------------- | -------- | -------- | ------------------------------------------------------------ |
| action           | true     | string   | Websocket数据操作类型，鉴权固定值为req                       |
| ch               | true     | string   | 请求主题，鉴权固定值为auth                                   |
| authType         | true     | string   | 鉴权类型，鉴权固定值为api。注意，该参数不在签名计算中。      |
| accessKey        | true     | string   | 您申请的API Key中的AccessKey                                 |
| signatureMethod  | true     | string   | 签名方法，用户计算签名寄语哈希的协议，固定值为HmacSHA256     |
| signatureVersion | true     | string   | 签名协议版本，固定值为2.1                                    |
| timestamp        | true     | string   | 时间戳，您发出请求的时间（UTC时间）在查询请求中包含此值有助于防止第三方截取您的请求。如：2017-05-11T16:22:06。再次强调是 (UTC 时区) |
| signature        | true     | string   | 签名, 计算得出的值，用于确保签名有效和未被篡改               |

### 签名步骤

资产和订单WebSocket签名与Rest接口签名步骤相似，具体区别如下：

1. 生成参与签名的字符串时，请求方法固定使用GET，请求地址固定为/ws/v2

2. 生成参与签名的固定参数名替换为：accessKey，signatureMethod，signatureVersion，timestamp

3. signatureVersion版本升级为2.1

Rest接口签名步骤,您可以点击 <a href='https://huobiapi.github.io/docs/spot/v1/cn/#c64cd15fdc'>这里</a> 获取。

签名前最后生成的字符串如下：

```
GET\n
www.huobihktrust.com\n
/ws/v2\n
accessKey=0664b695-rfhfg2mkl3-abbf6c5d-49810&signatureMethod=HmacSHA256&signatureVersion=2.1&timestamp=2019-12-05T11%3A53%3A03
```

注：JSON请求中的数据不需要URL编码。

### 订阅主题

成功建立与Websocket服务器的连接后，Websocket客户端发送如下请求以订阅特定主题：

```json
{
  "action": "sub",
  "ch": "accounts.update"
}
```
订阅成功Websocket客户端会接收到如下消息：

```json
{
  "action": "sub",
  "code": 200,
  "ch": "accounts.update#0",
  "data": {}
}
```

### 请求数据

成功建立Websocket服务器的连接后，Websocket客户端发送如下请求用以获取一次性数据：


```json
{
  "action": "req",
  "ch": "topic",
}
```

请求成功后Websocket客户端会收到如下消息：

```json
{
  "action": "req",
  "ch": "topic",
  "code": 200,
  "data": {} // 请求数据体
}
```

## 订阅订单更新

API Key 权限：读取

订单的更新推送由任一以下事件触发：<br>
-	计划委托或追踪委托触发失败事件（eventType=trigger）<br>
- 计划委托或追踪委托触发前撤单事件（eventType=deletion）<br>
- 订单创建（eventType=creation）<br>
-	订单成交（eventType=trade）<br>
-	订单撤销（eventType=cancellation）<br>

不同事件类型所推送的消息中，字段列表略有不同。开发者可以采取以下两种方式设计返回的数据结构：<br>
- 定义一个包含所有字段的数据结构，并允许某些字段为空<br>
- 定义不同的数据结构，分别包含各自的字段，并继承自一个包含公共数据字段的数据结构

### 订阅主题

` orders#${symbol}`

### 订阅参数

> Subscribe request

```json
{
  "action": "sub",
  "ch": "orders#btcusdt"
}

```

> Response

```json
{
  "action": "sub",
  "code": 200,
  "ch": "orders#btcusdt",
  "data": {}
}
```

| 参数   | 数据类型 | 描述                      |
| ------ | -------- | ------------------------- |
| symbol | string   | 交易代码（支持通配符 * ） |


### 数据更新字段列表

> Update example

```json
{
  "action":"push",
  "ch":"orders#btcusdt",
  "data":
  {
    "orderSide":"buy",
    "lastActTime":1583853365586,
    "clientOrderId":"abc123",
    "orderStatus":"rejected",
    "symbol":"btcusdt",
    "eventType":"trigger",
    "errCode": 2002,
    "errMessage":"invalid.client.order.id (NT)"
  }
}
```

当计划委托/追踪委托触发失败后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：trigger（本事件仅对计划委托/追踪委托有效） |
| symbol        | string   | 交易代码                                                     |
| clientOrderId | string   | 用户自编订单号                                               |
| orderSide     | string   | 订单方向，有效值：buy,sell                                   |
| orderStatus   | string   | 订单状态，有效值：rejected                                   |
| errCode       | int      | 订单触发失败错误码                                           |
| errMessage    | string   | 订单触发失败错误消息                                         |
| lastActTime   | long     | 订单触发失败时间                                             |

> Update example

```json
{
  "action":"push",
  "ch":"orders#btcusdt",
  "data":
  {
    "orderSide":"buy",
    "lastActTime":1583853365586,
    "clientOrderId":"abc123",
    "orderStatus":"canceled",
    "symbol":"btcusdt",
    "eventType":"deletion"
  }
}
```

当计划委托/追踪委托在触发前被撤销后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：deletion（本事件仅对计划委托/追踪委托有效） |
| symbol        | string   | 交易代码                                                     |
| clientOrderId | string   | 用户自编订单号                                               |
| orderSide     | string   | 订单方向，有效值：buy,sell                                   |
| orderStatus   | string   | 订单状态，有效值：canceled                                   |
| lastActTime   | long     | 订单撤销时间                                                 |

> Update example

```json
{
  "action":"push",
  "ch":"orders#btcusdt",
  "data":
  {
    "orderSize":"2.000000000000000000",
    "orderCreateTime":1583853365586,
    "accountId":992701,
    "orderPrice":"77.000000000000000000",
    "type":"sell-limit",
    "orderId":27163533,
    "clientOrderId":"abc123",
    "orderSource":"spot-api",
    "orderStatus":"submitted",
    "symbol":"btcusdt",
    "eventType":"creation"
  }
}
```

当订单挂单后 –

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型，有效值：creation                                   |
| symbol          | string   | 交易代码                                                     |
| accountId       | long     | 账户ID                                                       |
| orderId         | long     | 订单ID                                                       |
| clientOrderId   | string   | 用户自编订单号（如有）                                       |
| orderSource     | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格                                                     |
| orderSize       | string   | 订单数量（对市价买单无效）                                   |
| orderValue      | string   | 订单金额（仅对市价买单有效）                                 |
| type            | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| orderStatus     | string   | 订单状态，有效值：submitted                                  |
| orderCreateTime | long     | 订单创建时间                                                 |

注：<br>
- 止盈止损订单在尚未被触发时，接口将不会推送此订单的创建；<br>
- Taker订单在成交前，接口首先推送其创建事件。<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>

> Update example

```json
{
  "action":"push",
  "ch":"orders#btcusdt",
  "data":
  {
    "tradePrice":"76.000000000000000000",
    "tradeVolume":"1.013157894736842100",
    "tradeId":301,
    "tradeTime":1583854188883,
    "aggressor":true,
    "remainAmt":"0.000000000000000400000000000000000000",
    "execAmt":"2",
    "orderId":27163536,
    "type":"sell-limit",
    "clientOrderId":"abc123",
    "orderSource":"spot-api",
    "orderPrice":"15000",
    "orderSize":"0.01",
    "orderStatus":"filled",
    "symbol":"btcusdt",
    "eventType":"trade"
  }
}
```

当订单成交后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：trade                                      |
| symbol        | string   | 交易代码                                                     |
| tradePrice    | string   | 成交价                                                       |
| tradeVolume   | string   | 成交量                                                       |
| orderId       | long     | 订单ID                                                       |
| type          | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| clientOrderId | string   | 用户自编订单号（如有）                                       |
| orderSource   | string   | 订单来源                                                     |
| orderPrice    | string   | 原始订单价（市价单无效）                                     |
| orderSize     | string   | 原始订单数量（市价买单无效）                                 |
| orderValue    | string   | 原始订单金额（仅对市价买单有效）                             |
| tradeId       | long     | 成交ID                                                       |
| tradeTime     | long     | 成交时间                                                     |
| aggressor     | bool     | 是否交易主动方，有效值： true (taker), false (maker)         |
| orderStatus   | string   | 订单状态，有效值：partial-filled, filled                     |
| remainAmt     | string   | 该订单未成交数量（市价买单为未成交金额）                     |
| execAmt       | string   | 该订单累计成交量（市价买单为成交金额）                       |

注：<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>
- 当一张taker订单同时与对手方多张订单成交后，所产生的每笔成交（tradePrice, tradeVolume, tradeTime, tradeId, aggressor）将被分别推送（而不是合并推送一笔）。<br>

> Update example

```json
{
  "action":"push",
  "ch":"orders#btcusdt",
  "data":
  {
    "lastActTime":1583853475406,
    "remainAmt":"2.000000000000000000",
    "execAmt":"2",
    "orderId":27163533,
    "type":"sell-limit",
    "clientOrderId":"abc123",
    "orderSource":"spot-api",
    "orderPrice":"15000",
    "orderSize":"0.01",
    "orderStatus":"canceled",
    "symbol":"btcusdt",
    "eventType":"cancellation"
  }
}
```

当订单被撤销后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：cancellation                               |
| symbol        | string   | 交易代码                                                     |
| orderId       | long     | 订单ID                                                       |
| type          | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| clientOrderId | string   | 用户自编订单号（如有）                                       |
| orderSource   | string   | 订单来源                                                     |
| orderPrice    | string   | 原始订单价（市价单无效）                                     |
| orderSize     | string   | 原始订单数量（市价买单无效）                                 |
| orderValue    | string   | 原始订单金额（仅对市价买单有效）                             |
| orderStatus   | string   | 订单状态，有效值：partial-canceled, canceled                 |
| remainAmt     | string   | 该订单未成交数量（市价买单为未成交金额）                     |
| execAmt       | string   | 该订单累计成交量（市价买单为成交金额）                       |
| lastActTime   | long     | 订单最近更新时间                                             |
注：<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>

## 订阅清算后成交及撤单更新

API Key 权限：读取

仅当用户订单成交或撤销时推送。其中，订单成交为逐笔推送，如一张 taker 订单同时与多张 maker 订单成交，该接口将推送逐笔更新。但用户收到的这几笔成交消息的次序，有可能与实际的成交次序不完全一致。另外，如果一张订单的成交及撤销几乎同时发生，例如 IOC 订单成交后剩余部分被自动撤销，用户可能会先收到撤单推送，再收到成交推送。<br>

如用户需要获取依次更新的订单推送，建议订阅另一频道 orders#${symbol}。<br>

### 订阅主题

`trade.clearing#${symbol}#${mode}`

### 订阅参数

| 参数   | 数据类型 | 是否必需 | 描述                                                         |
| ------ | -------- | -------- | ------------------------------------------------------------ |
| symbol | string   | TRUE     | 交易代码（支持通配符 * ）                                    |
| mode   | int      | FALSE    | 推送模式（0 - 仅在订单成交时推送；1 - 在订单成交、撤销时均推送；缺省值：0） |

注：<br>
可选订阅参数 mode，如不填或填0，仅推送成交事件；如填1，推送成交及撤销事件。<br>

> Subscribe request

```json
{
  "action": "sub",
  "ch": "trade.clearing#btcusdt#0"
}

```

> Response

```json
{
  "action": "sub",
  "code": 200,
  "ch": "trade.clearing#btcusdt#0",
  "data": {}
}
```

> Update example

```json
{
  "ch": "trade.clearing#btcusdt#0",
  "data": {
    "eventType": "trade",
    "symbol": "btcusdt",
    "orderId": 99998888,
    "tradePrice": "9999.99",
    "tradeVolume": "0.96",
    "orderSide": "buy",
    "aggressor": true,
    "tradeId": 919219323232,
    "tradeTime": 998787897878,
    "transactFee": "19.88",
    "feeDeduct ": "0",
    "feeDeductType": "",
    "feeCurrency": "btc",
    "accountId": 9912791,
    "source": "spot-api",
    "orderPrice": "10000",
    "orderSize": "1",
    "clientOrderId": "a001",
    "orderCreateTime": 998787897878,
    "orderStatus": "partial-filled"
  }
}
```

### 数据更新字段列表（当订单成交后）

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型（trade）                                            |
| symbol          | string   | 交易代码                                                     |
| orderId         | long     | 订单ID                                                       |
| tradePrice      | string   | 成交价                                                       |
| tradeVolume     | string   | 成交量                                                       |
| orderSide       | string   | 订单方向，有效值： buy, sell                                 |
| orderType       | string   | 订单类型，有效值： buy-market, sell-market,buy-limit,sell-limit,buy-ioc,sell-ioc,buy-limit-maker,sell-limit-maker,buy-stop-limit,sell-stop-limit,buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| aggressor       | bool     | 是否交易主动方，有效值： true, false                         |
| tradeId         | long     | 交易ID                                                       |
| tradeTime       | long     | 成交时间，unix time in millisecond                           |
| transactFee     | string   | 交易手续费（正值）或交易手续费返佣（负值）                   |
| feeCurrency     | string   | 交易手续费或交易手续费返佣币种（买单的交易手续费币种为基础币种，卖单的交易手续费币种为计价币种；买单的交易手续费返佣币种为计价币种，卖单的交易手续费返佣币种为基础币种） |
| feeDeduct       | string   | 交易手续费抵扣                                               |
| feeDeductType   | string   | 交易手续费抵扣类型，有效值： ht, point                       |
| accountId       | long     | 账户编号                                                     |
| source          | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格 （市价单无此字段）                                  |
| orderSize       | string   | 订单数量（市价买单无此字段）                                 |
| orderValue      | string   | 订单金额（仅市价买单有此字段）                               |
| clientOrderId   | string   | 用户自编订单号                                               |
| stopPrice       | string   | 订单触发价（仅止盈止损订单有此字段）                         |
| operator        | string   | 订单触发方向（仅止盈止损订单有此字段）                       |
| orderCreateTime | long     | 订单创建时间                                                 |
| orderStatus     | string   | 订单状态，有效值：filled, partial-filled                     |

注：<br>
- transactFee中的交易返佣金额可能不会实时到账；<br>

### 数据更新字段列表（当订单撤销后）

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型（cancellation）                                     |
| symbol          | string   | 交易代码                                                     |
| orderId         | long     | 订单ID                                                       |
| orderSide       | string   | 订单方向，有效值： buy, sell                                 |
| orderType       | string   | 订单类型，有效值： buy-market, sell-market,buy-limit,sell-limit,buy-ioc,sell-ioc,buy-limit-maker,sell-limit-maker,buy-stop-limit,sell-stop-limit,buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| accountId       | long     | 账户编号                                                     |
| source          | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格 （市价单无此字段）                                  |
| orderSize       | string   | 订单数量（市价买单无此字段）                                 |
| orderValue      | string   | 订单金额（仅市价买单有此字段）                               |
| clientOrderId   | string   | 用户自编订单号                                               |
| stopPrice       | string   | 订单触发价（仅止盈止损订单有此字段）                         |
| operator        | string   | 订单触发方向（仅止盈止损订单有此字段）                       |
| orderCreateTime | long     | 订单创建时间                                                 |
| remainAmt       | string   | 未成交量（对于市价买单，该字段定义为未成交额）               |
| orderStatus     | string   | 订单状态，有效值：canceled, partial-canceled                 |


## 订阅账户变更

API Key 权限：读取

订阅账户的余额更新。

### 订阅主题

`accounts.update#${mode}`

用户可选择以下任一账户变更推送的触发方式

1、仅在账户余额发生变动时推送；

2、在账户余额发生变动或可用余额发生变动时均推送，且分别推送。

3、在账户余额发生变动或可用余额发生变动时均推送，且一起推送。

注意：现货和合约之间的账户划转引起的账户余额变动，暂时没有消息推送。

### 订阅参数

| 参数 | 数据类型 | 描述                                 |
| ---- | -------- | ------------------------------------ |
| mode | integer  | 推送方式，有效值：0，1，2  默认值：0 |

订阅示例

1、不填mode：

accounts.update

仅当账户余额变动时推送；

2、填写mode=0：

accounts.update#0

仅当账户余额变动时推送；

3、填写mode=1：

accounts.update#1

在账户余额发生变动或可用余额发生变动时均推送且分别推送。

4、填写mode=2：

accounts.update#2

在账户余额发生变动或可用余额发生变动时均推送且一起推送。

注：无论用户采用哪种模式订阅，在订阅成功后，服务器将首先推送当前各账户的账户余额与可用余额，然后再推送后续的账户更新。在首推各账户初始值时，消息中的changeType和changeTime的值为null。

> Subscribe request

```json
{
  "action": "sub",
  "ch": "accounts.update"
}
```

> Response

```json
{
  "action": "sub",
  "code": 200,
  "ch": "accounts.update#0",
  "data": {}
}
```

> Update example

```json
accounts.update#0：
{
"action": "push",
"ch": "accounts.update#0",
"data": {
"currency": "btc",
"accountId": 123456,
"balance": "23.111",
"changeType": "transfer",
"accountType":"trade",
"seqNum": "86872993928",
"changeTime": 1568601800000
}
}

accounts.update#1：
{
"action": "push",
"ch": "accounts.update#1",
"data": {
"currency": "btc",
"accountId": 33385,
"available": "2028.699426619837209087",
"changeType": "order.match",
"accountType":"trade",
"seqNum": "86872993928",
"changeTime": 1574393385167
}
}
{
"action": "push",
"ch": "accounts.update#1",
"data": {
"currency": "btc",
"accountId": 33385,
"balance": "2065.100267619837209301",
"changeType": "order.match",
"accountType":"trade",
"seqNum": "86872993928",
"changeTime": 1574393385122
}
}
```

### 数据更新字段列表

| 字段        | 数据类型 | 描述                                                         |
| ----------- | -------- | ------------------------------------------------------------ |
| currency    | string   | 币种                                                         |
| accountId   | long     | 账户ID                                                       |
| balance     | string   | 账户余额（仅当账户余额发生变动时推送）                       |
| available   | string   | 可用余额（仅当可用余额发生变动时推送）                       |
| changeType  | string   | 余额变动类型，有效值：order-place(订单创建)，order-match(订单成交)，order-refund(订单成交退款)，order-cancel(订单撤销)，order-fee-refund(点卡抵扣交易手续费)，margin-transfer(杠杆账户划转)，margin-loan(借币本金)，margin-interest(借币计息)，margin-repay(归还借币本金币息)，deposit (充币）, withdraw (提币)，other(其他资产变化) |
| accountType | string   | 账户类型，有效值：trade, loan, interest                      |
| changeTime  | long     | 余额变动时间，unix time in millisecond                       |
| seqNum      | long     | 账户变更的序号                                               |

注：<br>
账户更新推送的是到账金额，多笔成交产生的多笔交易返佣可能会合并到帐。<br>

## 常见错误码

以下是WebSocket资产和订单接口的错误码、错误消息和说明。

| 错误码 | 错误消息                 | 说明                                                         |
| ------ | ------------------------ | ------------------------------------------------------------ |
| 200    | 正确                     | 正确返回                                                     |
| 100    | 超时关闭                 | 超时关闭                                                     |
| 400    | Bad Request              | 请求错误                                                     |
| 404    | Not Found                | 找不到服务                                                   |
| 429    | Too Many Requests        | 超过单机服务最大连接数或者超过单IP最大连接数                 |
| 500    | 系统异常                 | 系统错误                                                     |
| 2000   | invalid.ip               | 无效的ip                                                     |
| 2001   | nvalid.json              | 无效的请求json                                               |
| 2001   | invalid.authType         | 验签方式错误                                                 |
| 2001   | invalid.action           | 无效的订阅事件                                               |
| 2001   | invalid.symbol           | 无效的交易对                                                 |
| 2001   | invalid.ch               | 无效的订阅                                                   |
| 2001   | invalid.exchange         | 无效的交易所code                                             |
| 2001   | missing.param.auth       | 缺少验签参数                                                 |
| 2002   | invalid.auth.state       | 认证未通过                                                   |
| 2002   | auth.fail                | 验签失败，包括API Key绑定的IP错误                            |
| 2003   | query.account.list.error | 查询账户列表失败                                             |
| 4000   | too.many.request         | 客户端上行请求限频（单个实例50次/秒）                        |
| 4000   | too.many.connection      | 同一个API Key的建联数量超过服务器单个实例限制（单个实例最多连接10个） |

# 稳定币

## 简介

稳定币接口提供了价格查询和兑换功能。

## 稳定币兑换价格查询

GET v1/stable-coin/quote
API Key 权限：读取

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                       | 取值范围         |
| -------- | -------- | ------ | -------------------------- | ---------------- |
| currency | true     | string | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD    |
| amount   | true     | string | 与HUSD兑换的稳定币币种数量 | amount必须为整数 |
| type     | true     | string | 兑换方向                   | buy兑入/sell兑出 |

### 响应数据

| 参数名称       | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| -------------- | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| currency       | true     | string   | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD                                                |
| amount         | true     | string   | 与HUSD兑换的稳定币币种数量 | 因兑换账户额度等因素影响，返回的amount可能会比请求的amount小 |
| type           | true     | string   | 兑换方向                   | buy兑入/sell兑出                                             |
| exchangeAmount | true     | string   | 匹配的HUSD数量             | type=buy时，exchangeAmount为用户所需支付的husd数量；type=sell时，exchangeAmount为用户可获得的husd数量 |
| exchangeFee    | true     | string   | 手续费金额 （单位：HUSD）  |                                                              |
| quoteId        | true     | string   | 该次稳定币报价唯一ID       |                                                              |
| expiration     | true     | string   | 确认兑换有效期             | 时间（一般为接口请求时间向后延伸10秒）                       |

## 兑换稳定币

POST v1/stable-coin/exchange
API Key 权限：交易

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                 | 取值范围 |
| -------- | -------- | ------ | -------------------- | -------- |
| quote-id | true     | string | 该次稳定币报价唯一ID |          |

### 响应数据

| 参数名称        | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| --------------- | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| transact-id     | true     | long     | 兑换记录ID                 |                                                              |
| currency        | true     | string   | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD                                                |
| amount          | true     | string   | 与HUSD兑换的稳定币币种数量 |                                                              |
| type            | true     | string   | 兑换方向                   | buy兑入/sell兑出                                             |
| exchange-amount | true     | string   | 匹配的HUSD数量             | type=buy时，exchange-amount为用户所需支付的husd数量；type=sell时，exchange-amount为用户可获得的husd数量 |
| exchange-fee    | true     | string   | 手续费金额 （单位：HUSD）  |                                                              |
| time            | true     | long     | 时间戳                     |                                                              |

## 常见错误码

以下是是稳定币接口的错误码和说明。

| 响应码                         | 说明                                             |
| ------------------------------ | ------------------------------------------------ |
| invalid-currency               | 币种无效                                         |
| invalid-amount                 | 币种数量小于最低值（1000）或大于当前可兑换额度   |
| invalid-type                   | type不为sell或buy                                |
| quote-exceed-price-limit       | 报价超过合理范围（小于0.9或者大于1.1）           |
| quote-exceed-time-limit        | 报价时间已经过期                                 |
| quote-failure                  | 后端其他错误引起的后端其他错误引起的价格查询失败 |
| invalid-quote-id               | 无效的quote-id                                   |
| insufficient-balance           | 可用余额不足                                     |
| insufficient-quota             | 稳定币限额不足/超出稳定币限额                    |
| exchange-failure               | 后端其他错误引起的兑换失败                       |
| Base-user-request-exceed-limit | 您的操作太频繁，请稍后再试                       |

# 杠杆ETP

## 简介

杠杆ETP接口提供了ETP的换入、换出、调仓、查询等功能。

## 基础参考信息

用户可以通过该接口取得关于杠杆ETP换入换出的基础参考信息。

### HTTP 请求

- GET `/v2/etp/reference`

公共数据接口

### 请求参数

| 名称    | 类型 | 是否必需 | 描述                             |      |
| ------- | ---- | -------- | -------------------------------- | ---- |
| etpName | true | string   | 杠杆ETP名称 (for example: btc3l) |      |

> Response:

```json
{
  "data": {
    "etpStatus": "normal",
    "creationQuota": {
      "maxCreationValue": "10000",
      "minCreationValue": "200",
      "dailyCreationValue": "50000",
      "creationCurrency": "btc3l"
    },
    "maxRedemptionAmount": "1000",
    "minRedemptionAmount": "50",
    "dailyRedemptionAmount": "5000",
    "creationFeeRate": "0.0035",
    "redemptionFeeRate": "0.0035",
    "displayName": "BTC*3/USDT",
    "etpName": "btc3l"
  },
  "code": 200,
  "success": true
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ etpName	|	string	|	TRUE	|杠杆ETP名称	|
|	displayName	|	string	|	TRUE	|杠杆ETP显示名称	|
|	creationQuota	|	object	|	TRUE	|	|
|	{ maxCreationValue	|	int	|	TRUE	|单次最大申购金额	|
|	minCreationValue	|	int	|	TRUE	|单次最小申购金额	|
|	dailyCreationValue	|	int	|	TRUE	|单日最大申购金额	|
|	creationCurrency }	|	string	|	TRUE	|申购金额单位（计价币种）	|
|	maxRedemptionAmount	|	int	|	TRUE	|单次最大赎回数量	|
|	minRedemptionAmount	|	int	|	TRUE	|单次最小赎回数量	|
|	dailyRedemptionAmount	|	int	|	TRUE	|单日最大赎回数量	|
|	creationFeeRate	|	float	|	TRUE	|申购费率	|
|	redemptionFeeRate	|	float	|	TRUE	|赎回费率	|
|	etpStatus	} |	string	|	TRUE	|ETP申购赎回状态（normal, creation-only, redemption-only, halted）	|

## 杠杆ETP换入

用户可以通过该接口换入杠杆ETP。

### HTTP 请求

- POST `/v2/etp/creation`

API Key 权限：交易<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpName	|	string	|	TRUE	| 杠杆ETP名称 (for example: btc3l)	|
|	value	|	float	|	TRUE	| 申购金额（基于计价币种）		|
|	currency	|	string	|	TRUE	| 申购金额单位（计价币种）	|

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ transactId	|	long	|	TRUE	|交易ID	|
|	transactTime }	|	long	|	TRUE	|交易时间（unix time in millisecond）	|

注：
返回transactId 不意味着申购成功，用户须在申购后通过查询交易记录确认该申购状态。

## 杠杆ETP换出

用户可以通过该接口换出杠杆ETP。

### HTTP 请求

- POST `/v2/etp/redemption`

API Key 权限：交易<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpName	|	string	|	TRUE	| ETP名称 (for example: btc3l)	|
|	currency	|	string	|	TRUE	| 赎回币种（计价币种）	|
|	amount	|	float	|	TRUE	| 赎回数量	|

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ transactId	|	long	|	TRUE	|交易ID	|
|	transactTime }	|	long	|	TRUE	|交易时间（unix time in millisecond）	|

注：
返回transactId不意味着赎回成功，用户须在赎回后通过查询交易记录确认该赎回状态。

## 获取杠杆ETP申赎记录

用户可以通过该接口获取杠杆ETP申赎记录。

### HTTP 请求

- GET `/v2/etp/transactions`

API Key 权限：读取<br>
限频值：2次/秒<br>
按transactTime检索<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpNames	|	string	|	TRUE	| ETP名称， for example: btc3，仅支持单个查询 |
|	currencies	|	string	|	FALSE	| 计价币种（仅对transactTypes=creation有效；可多填，以逗号分隔；缺省值：该ETP下所有计价币种）	|
|	transactTypes	|	string	|	TRUE	| 交易类型（可多填，以逗号分隔；有效值：creation, redemption；缺省值：所有交易类型）	|
|	transactStatus	|	string	|	FALSE	|交易状态，有效值：completed, processing, clearing, rejected，仅支持单个查询	|
|	startTime|	long	|	FALSE	|远点时间（unix time in millisecond；取值范围：[(endTime - 10天), endTime]；缺省值：(endTime - 10天)）	|
|	endTime|	long	|	FALSE	|近点时间（unix time in millisecond；取值范围：[(当前时间 - 180天), 当前时间]；缺省值：当前时间）	|
|	sort|	string	|	FALSE	|检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc）	|
|	limit|	integer	|	FALSE	|单页最大返回条目数量（取值范围：[1,500]；缺省值：100）	|
|	fromId	|	long	|	FALSE	| 查询起始编号（仅对翻页查询有效）	|

注：<br>
startTime与endTime构成查询窗口，窗口最大可设置为10天，窗口可在“之前180天”与“当前时间”范围内平移。<br>

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|按用户指定sort方向排列	|
|	{ etpName	|	string	|	TRUE	| 杠杆ETP名称	|
|	transactId	|	long	|	TRUE	|交易ID	|
|	transactTime	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	transactType	|	string	|	TRUE	|交易类型（有效值：creation, redemption）	|
|	transactAmount	|	float	|	TRUE	| 实际交易数量（基础币种）	|
|	transactAmountOrig	|	float	|	FALSE	| 原始赎回数量（基于基础币种；仅对transactType=redemption有效）	|
|	transactValue	|	float	|	TRUE	| 实际交易金额（计价币种）	|
|	transactValueOrig	|	float	|	FALSE	| 原始申购金额（基于计价币种；仅对transactType=creation有效）	|
|	transactPrice	|	float	|	TRUE	| 实际交易价格（基于计价币种）	|
|	currency	|	string	|	TRUE	| 计价币种	|
|	transactFee	|	float	|	TRUE	| 交易手续费	|
|	feeCurrency	|	string	|	TRUE	| 交易手续费币种	|
|	transactStatus	|	string	|	TRUE	|交易状态（有效值：completed, processing, clearing, rejected）	|
|	errCode	|	integer	|	FALSE	|错误码（仅对transactStatus=rejected有效）	|
|	errMessage }	|	string	|	FALSE	|错误描述（仅对transactStatus=rejected有效）	|
|	nextId	|	long	|	FALSE	| 下页查询起始编号（仅在存在下页数据时返回）	|

注：<br>
如用户查询时，实际交易数量、实际交易金额、实际交易价格尚未生成，字段transactAmount、transactValue、transactPrice更新为空。<br>

## 获取特定杠杆ETP申赎记录

用户可以通过该接口获取特定杠杆ETP申赎记录。

### HTTP 请求

- GET `/v2/etp/transaction`

API Key 权限：读取<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	|交易ID	|

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ etpName	|	string	|	TRUE	| 杠杆ETP名称	|
|	transactId	|	long	|	TRUE	|交易ID	|
|	transactTime	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	transactType	|	string	|	TRUE	|交易类型（有效值：creation, redemption）	|
|	transactAmount	|	float	|	TRUE	| 实际交易数量（基础币种）	|
|	transactAmountOrig	|	float	|	FALSE	| 原始赎回数量（基于基础币种；仅对transactType=redemption有效）	|
|	transactValue	|	float	|	TRUE	| 实际交易金额（计价币种）	|
|	transactValueOrig	|	float	|	FALSE	| 原始申购金额（基于计价币种；仅对transactType=creation有效）	|
|	transactPrice	|	float	|	TRUE	| 实际交易价格（基于计价币种）	|
|	currency	|	string	|	TRUE	| 计价币种	|
|	transactFee	|	float	|	TRUE	| 交易手续费	|
|	feeCurrency	|	string	|	TRUE	| 交易手续费币种	|
|	transactStatus	|	string	|	TRUE	|交易状态（有效值：completed, processing, clearing, rejected）	|
|	errCode	|	integer	|	FALSE	|状态码（仅对transactStatus=rejected有效）	|
|	errMessage }	|	string	|	FALSE	|错误描述（仅对transactStatus=rejected有效）	|

注：<br>
如用户查询时，实际交易数量、实际交易金额、实际交易价格尚未生成，字段transactAmount、transactValue、transactPrice更新为空。<br>

## 获取杠杆ETP调仓记录

用户可以通过该接口获取杠杆ETP调仓记录。

### HTTP 请求

- GET `/v2/etp/rebalance`

公共数据接口<br>
按rebalTime检索<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	symbol	|	string	|	TRUE	| ETP交易代码 (for example: btc3lusdt)|
|	rebalTypes	|	string	|	FALSE	| 调仓类型（可多填，以逗号分隔；有效值：daily, adhoc；缺省值：所有类型）	|
|	startTime|	long	|	FALSE	|远点时间（unix time in millisecond；取值范围：[(endTime - 10天), endTime]；缺省值：(endTime - 10天)）	|
|	endTime|	long	|	FALSE	|近点时间（unix time in millisecond；取值范围：[(当前时间 - 180天), 当前时间]；缺省值：当前时间）	|
|	sort|	string	|	FALSE	|检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc）	|
|	limit|	integer	|	FALSE	|单页最大返回条目数量（取值范围：[1,500]；缺省值：100）	|
|	fromId	|	long	|	FALSE	| 查询起始编号（仅对翻页查询有效）	|

注：<br>
startTime与endTime构成查询窗口，窗口最大可设置为10天，窗口可在“之前180天”与“当前时间”范围内平移。<br>

> Response

```json
{
  "code": 200,
  "data": [
    {
      "symbol": "btc3lusdt",
      "rebalTime": 1594990401594,
      "rebalType": "adhoc"
    },
    {
      "symbol": "btc3lusdt",
      "rebalTime": 1595065303552,
      "rebalType": "adhoc"
    }
  ],
  "nextId": 2989
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|按用户指定sort方向排列	|
|	{ symbol	|	string	|	TRUE	|ETP交易代码	|
|	rebalTime	|	long	|	TRUE	|调仓时间（unix time in millisecond）	|
|	rebalType }	|	string	|	TRUE	|调仓类型（daily, adhoc）	|
|	nextId	|	long	|	FALSE	| 下页查询起始编号（仅在存在下页数据时返回）	|



## 杠杆ETP单个撤单

用户可以通过该接口进行杠杆ETP撤单。

### HTTP 请求

- POST /v2/etp/{transactId}/cancel

API Key 权限：交易<br>限频值：1次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	| ETP交易ID|



> Response

```json

{
  "code": 80042,
  "message": "撤单失败，订单不存在"
}

```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|





## 杠杆ETP批量撤单

用户可以通过该接口进行杠杆ETP批量撤单。

### HTTP 请求

- POST /v2/etp/batch-cancel

API Key 权限：交易<br>限频值：1次/5秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	| ETP交易ID，例如："transactId":[65445,65446]|





> Response

```json
{
  "code":200,
  "data":{
    "success":[
      "5983466"
    ],
    "failed":[
      {
        "errMsg":"Cancellation of order failed, order does not exist",
        "transactId":"65445",
        "errCode":80043
      },
      {
        "errMsg":"Cancellation of order failed, order does not exist",
        "transactId":"65446",
        "errCode":80043
      }
    ]
  },
  "message":null
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	data	|	object	|	TRUE	|	|
|	{ success	|	string	|	TRUE	|ETP撤单成功交易列表	|
|	errMsg	|	long	|	TRUE	|撤单失败错误信息	|
|	errCode 	|	string	|	TRUE	|撤单失败错误码	|
|	transactId}	|	long	|	FALSE	| 交易ID	|



## 获取ETP持仓限额

用户可以通过该接口查询ETP的持仓限额。

### HTTP 请求

- GET /v2/etp/limit

API Key 权限：交易<br>

限频值：1次/1秒<br>

> Request:

```json
GET /v2/etp/limit?currency=btc3l,btc3s
```

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	currency	|	string	|	TRUE	| 币种,支持批量查询(币种之间用英文逗号分隔)，单次最多可查10个币种|



> Response

```json
{

  "data": [
    {
      "remainingAmount": "2",
      "currency": "btc3l",
      "maxHoldings": "2"
    },
    {
      "remainingAmount": "12000",
      "currency": "btc3s",
      "maxHoldings": "12000"
    },
    "code": 200,
    "success": true
    }
```

### 响应数据

| 名称             | 类型    | 描述             |
| ---------------- | ------- | ---------------- |
| code             | integer | 状态码           |
| message          | string  | 错误描述（如有） |
| { currency       | string  | ETP交易代码      |
| maxHoldings      | string  | 持仓限额         |
| remainingAmount} | string  | 剩余额度         |



## 常见错误码

以下是杠杆ETP接口的错误码、错误消息和说明。

| 错误码 | 错误消息                       | 说明                                                   |
| ------ | ------------------------------ | ------------------------------------------------------ |
| 1002   | 您所在的国家禁止申购赎回       | 用户注册或认证国籍不允许申赎                           |
| 2002   | 参数错误                       | 错误的币种传入                                         |
| 80007  | 申购关闭，订单已取消           | 申购关闭                                               |
| 80008  | 赎回关闭，订单已取消           | 赎回关闭                                               |
| 80009  | 申购金额不得低于{0}            | 小于最小下单量                                         |
| 80010  | 申购金额不得高于{0}            | 高于最大下单量                                         |
| 80011  | 个人今日可申购额度超限         | 个人单日申购已超出限额                                 |
| 80012  | 平台今日可申购额度超限         | 平台整体申购超出                                       |
| 80013  | 赎回数量不得低于{0}            | 小于最小下单量                                         |
| 80014  | 赎回数量不得高于{0}            | 高于最大下单量                                         |
| 80015  | 个人今日可赎回额度超限         | 人单日赎回已超出限额                                   |
| 80016  | 平台今日可赎回额度超限         | 平台整体赎回超出限额                                   |
| 80018  | 资产余额不足                   | 资产余额不足                                           |
| 80019  | 下单失败，请重试               | broker返回非已知错误异常                               |
| 80021  | 申购失败，订单已取消           | 用户申购金额过小，不足合约1张                          |
| 80022  | 赎回失败，订单已取消           | 用户赎回金额过小，不足合约1张                          |
| 80023  | 申购失败，订单已取消           | 行情波动较大，合约下单后计算用户需扣款金额大于下单金额 |
| 80024  | 赎回失败，订单已取消           | 行情波动较大，合约下单后计算用户需扣款金额大于下单金额 |
| 80026  | 系统繁忙，请稍后再试           | 超出订单排队队列                                       |
| 80027  | 赎回失败，订单已取消           | 没有份额可供用户赎回                                   |
| 80028  | 下单失败，超出该币种的持仓限额 | 下单失败，超出该币种的持仓限额                         |
| 80041  | 撤单失败，该订单已取消         | 撤单失败，该订单已取消                                 |
| 80042  | 撤单失败，该订单已执行         | 撤单失败，该订单已执行                                 |
| 80043  | 撤单失败，订单不存在           | 撤单失败，订单不存在                                   |
| 80045  | 撤单失败，系统繁忙，请稍后重试 | 调用broker等失败                                       |
| 80052  | 超出最大查询限制10             | 超出最大查询限制                                       |
