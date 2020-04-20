---
title: 火币永续合约 API 文档

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.hbg.com/zh-cn/apikey/'>创建 API Key </a>
includes:

search: False
---

# 简介

## 永续合约API 简介

欢迎使用火币永续合约 API！ 你可以使用此 API 获得市场行情数据，进行交易，并且管理你的账户。

在文档的右侧是代码示例，目前我们仅提供针对 `shell` 的代码示例。

你可以通过选择上方下拉菜单的版本号来切换文档对应的 API 版本，也可以通过点击右上方的语言按钮来切换文档语言。


## 做市商项目

<aside class="notice">
做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动。
</aside>

欢迎有优秀 maker 策略交易量大的用户参与长期合约做市商项目。如果您的火币交割合约账户中有折合大于 5 BTC 资产，或火币永续合约账户中有折合大于 3 BTC 资产，请提供以下信息到 dm_mm@huobi.com（做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动）:

1. 提供火币 UID （需不存在返佣关系的 UID）；
2. 提供其他交易平台 maker 交易量截图证明（比如30天内成交量，或者 VIP 等级等）；


# 更新日志
## 1.0.2 2020年4月9日 【增加免鉴权的资金费率WS推送接口；增加免鉴权的强平订单WS推送接口】

### 1、增加免鉴权的资金费率WS推送接口

  - 接口名称： 订阅资金费率推送(免鉴权)

  - 接口类型： 公开接口

  - 订阅主题： public.$contract_code.funding_rate

### 2、增加免鉴权的强平订单WS推送接口

  - 接口名称： 订阅强平订单推送(免鉴权)

  - 接口类型： 公开接口

  - 订阅主题： public.$contract_code.liquidation_orders

## 1.0.1 2020年3月20日 

### 1、首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议。然后再使用API进行高杠杆倍数(>20倍)下单。

### 2、websocket订单与用户数据接口鉴权签名路径变更，签名构建由原/notification变更为/swap-notification。

   - 接口名称：ws订单与用户数据下所有接口
   - 接口类型：私有接口
   - 鉴权路径：/swap-notification

### 3、增加websocket订阅增量市场orderbook数据接口，分为20档和150档不合并数据，每30MS检查一次更新，若有更新则推送。

   - 接口名称：订阅Market Depth增量数据
   - 接口类型：公开接口
   - 订阅主题：market.$contract_code.depth.size_${size}.high_freq

### 4、增加获取用户的API指标禁用信息的API接口。
   - 接口名称：获取用户的API指标禁用信息
   - 接口类型：私有接口
   - 接口URL：/swap-api/v1/swap_api_trading_status

### 5、增加websocket订阅资金费率接口，资金费率有更新时会推送信息。
  
   - 接口名称：订阅资金费率
   - 接口类型：私有接口
   - 订阅主题：funding_rate.$contract_code
 
### 6、获取下单量限制的接口增加10种订单价格类型，包括：opponent_ioc（对手价-IOC下单），lightning_ioc（闪电平仓-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），lightning_fok（闪电平仓-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。

  - 接口名称：查询用户当前的下单量限制
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_order_limit
 
### 7、合约下单接口增加8种订单价格类型，分别为：opponent_ioc（对手价-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。

  - 接口名称：合约下单
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_order
      
### 8、合约批量下单接口增加8种订单价格类型，分别为：opponent_ioc（对手价-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。

  - 接口名称：合约批量下单
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_batchorder
      
### 9、闪电平仓下单接口请求参数增加字段order_price_type，值分别为：lightning_ioc（闪电平仓-IOC下单），lightning_fok（闪电平仓-FOK下单），lightning(闪电平仓-默认值）。
  
  - 接口名称：闪电平仓下单
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_lightning_close_position
 
### 10、获取订单明细信息返回的data字典中增加字段强平类型：liquidation_type， 所有成交的手续费：fee，手续费币种：fee_asset。
  
  - 接口名称：获取订单明细信息
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_order_detail
 
### 11、获取合约历史委托trade_type和orders修改，请求参数的trade_type中，增加类型：减仓平多，减仓平空；返回参数的orders数组元素增加字段"liquidation_type"。
  
  - 接口名称：获取合约历史委托
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_hisorders
 
### 12、WS订单成交推送增加字段liquidation_type。
  
  - 接口名称：WS订阅订单成交推送
  - 接口类型：私有接口
  - 接口URL：orders.$symbol
      
### 13、增加母子账户划转的API接口，母账户与每个子账户相互划转限频10次/分钟。
  
  - 接口名称：母子账户划转
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_master_sub_transfer
 
### 14、查询系统状态的接口增加母子划转权限参数，在返回参数的数组"data"中，增加两个字段："master_transfer_sub"、"sub_transfer_master"。
  
  - 接口名称：查询系统状态
  - 接口类型：公共接口
  - 接口URL：/swap-api/v1/swap_api_state
 
### 15、增加查询母账户下的所有母子账户的划转记录的功能。

  - 接口名称：获取母账户下的所有母子账户划转记录
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_master_sub_transfer_record
      
### 16、返回财务记录的接口中，增加返回4种母子账户划转的流水。
  
  - 接口名称：查询用户财务记录
  - 接口类型：私有接口
  - 接口URL：/swap-api/v1/swap_financial_record


# 合约交易接入说明

## 合约交易接口列表

### 接口列表

  权限类型  |    接口数据类型   |   请求方法      |          类型  |   描述                     |   需要验签  |
----------- |  ------------------ | ---------------------------------------- |  ---------- |  ------------------------------- |  --------------  |
读取     |  基础行情接口           |  swap-api/v1/swap_contract_info  |                 GET        |  获取合约信息                 |  否  |
读取     |  基础行情接口           |  swap-api/v1/swap_index  |                         GET        |  获取合约指数信息             |  否  |
读取     |  基础行情接口           |  swap-api/v1/swap_price_limit  |                 GET         |  获取合约最高限价和最低限价   |  否  |
读取     |  基础行情接口           |   swap-api/v1/swap_open_interest  |                  GET        |  获取当前可用合约总持仓量     |  否  |
读取     |  市场行情接口           |   swap-ex/market/depth  |                  GET        |  获取行情深度数据     |  否  |
读取     |  市场行情接口           |   swap-ex/market/history/kline  |                  GET        |  获取K线数据     |  否  |
读取     |  市场行情接口           |   swap-ex/market/detail/merged  |                  GET        |  获取聚合行情     |  否  |
读取     |  市场行情接口           |   swap-ex/market/trade  |                  GET        |  获取市场最近成交记录     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_risk_info  |                  GET        |  查询合约风险准备金余额和预估分摊比例     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_insurance_fund  |                  GET        |  查询合约风险准备金余额历史数据     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_adjustfactor  |                  GET        |  查询平台阶梯调整系数     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_his_open_interest  |                  GET        |  平台持仓量的查询     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_elite_account_ratio  |                  GET        |  精英账户多空持仓对比-账户数     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_elite_position_ratio  |                  GET        |  精英账户多空持仓对比-持仓量     |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_api_state  |                  GET        |  查询系统状态   |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_funding_rate  |                  GET        |  获取合约的资金费率   |  否  |
读取     |  市场行情接口           |   swap-api/v1/swap_historical_funding_rate  |                  GET        |  获取合约的历史资金费率   |  否  |
读取     |  市场行情接口           |   /heartbeat   |                  GET        |  查询系统是否可用   |  否  |
读取     |  账户接口           |   swap-api/v1/swap_account_info   |                  POST        |  获取用户账户信息   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_position_info   |                  POST        |  获取用户持仓信息   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_sub_account_list   |                  POST        |  查询母账户下所有子账户资产信息   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_sub_account_info   |                  POST        |  查询单个子账户资产信息   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_sub_position_info   |                  POST        |  查询单个子账户持仓信息   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_financial_record   |                  POST        |  查询用户财务记录   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_order_limit   |                  POST        |  查询用户当前的下单量限制   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_fee   |                  POST        |  查询用户当前的手续费费率   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_transfer_limit   |                  POST        |  查询用户当前的划转限制   |  是  |
读取     |  账户接口           |   swap-api/v1/swap_position_limit   |                  POST        |  用户持仓量限制的查询   |  是  |
交易     |  账户接口           |  swap-api/v1/swap_order |    POST       |       合约下单       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_batchorder |    POST       |       合约批量下单       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_cancel |    POST       |       撤销订单       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_cancelall |    POST       |       全部撤单       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_order_info |    POST       |       获取合约订单信息       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_order_detail |    POST       |       获取订单明细信息       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_openorders |    POST       |       获取合约当前未成交委托       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_hisorders |    POST       |       获取合约历史委托       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_matchresults |    POST       |       获取历史成交记录       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_lightning_close_position |    POST       |       闪电平仓下单       |  是  |
交易     |  账户接口           |  swap-api/v1/swap_liquidation_orders |    POST       |       获取强平订单       |  是  |

## 访问地址

访问地址 | 适用站点 | 适用功能 | 适用交易对 |
------ | ---- | ---- | ------ |
https://api.hbdm.com| 火币合约|   API     | 火币合约的交易品种  |

### 备注

"https://api.hbdm.com"如果无法访问请使用："https://api.btcgateway.pro"。


## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 api.hbdm.com，比如 api.hbdm.com/swap-api/v1/swap_order。

- API 访问密钥（AccessKeyId）：您申请的 API Key 中的 Access Key。

- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。

- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。

- 时间戳（Timestamp）：您发出请求的时间 (UTC 时区) (UTC 时区) (UTC 时区) 。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。

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
API Key 具有包括交易、借贷和充提币等所有操作权限。
</aside>
<aside class="warning">
这两个密钥与账号安全紧密相关，无论何时都请勿向其它人透露。
</aside>


### 签名步骤

规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情

`https://api.hbdm.com/swap-api/v1/swap_order?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

#### 1. 请求方法（GET 或 POST），后面添加换行符 “\n”


`GET\n`

#### 2. 添加小写的访问地址，后面添加换行符 “\n”

`
api.hbdm.com\n
`

#### 3. 访问方法的路径，后面添加换行符 “\n”

`
/swap-api/v1/swap_order\n
`

#### 4. 按照ASCII码的顺序对参数名进行排序。例如，下面是请求参数的原始顺序，进行过编码后


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

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

#### 6. 按照以上顺序，将各参数使用字符 “&” 连接


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`

#### 7. 组成最终的要进行签名计算的字符串如下

`POST\n`

`api.hbdm.com\n`

`/swap-api/v1/swap_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里

最终，发送到服务器的 API 请求应该为

`https://api.hbdm.com/swap-api/v1/swap_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

## 访问次数限制

* 交割合约和永续合约分开限频

* 公开行情接口和用户私有接口都有访问次数限制

* 普通用户，需要密钥的私有接口，每个UID 3秒最多30次请求(该UID的所有币种和不同到期日的合约的所有私有接口共享3秒30次的额度)

* 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多60次请求（所有该IP的非行情类的公开接口请求共享3秒60次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取市场最近成交记录：

    （1） restful接口：同一个IP,  1秒最多200个请求 

    （2）  websocket：req请求，同一时刻最多请求50次；sub请求，无限制，服务器主动推送数据
    
- WebSocket私有订单成交推送接口(需要API KEY验签)

     一个UID最多同时建立10个私有订单成交推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。
   
     注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。
     

- 所有API接口返回数据中增加限频信息

  将在api接口response中的header返回以下字段：
  
  ratelimit-limit： 单轮请求数上限，单位：次数
  
  ratelimit-interval：请求数重置的时间间隔，单位：毫秒
  
  ratelimit-remaining：本轮剩余可用请求数，单位：次数
  
  ratelimit-reset：请求数上限重置时间，单位：毫秒
  
- 一个uid对应计划委托下单接口请求1秒5次、一个uid对应计划委托撤单接口请求1秒5次、一个uid对应计划委托全部撤单接口请求1秒5次。

## 撤单率限制【暂未启用】

- 当用户通过API在10分钟内特定订单价格类型的委托单总笔数大于或等于2500笔时，系统会自动计算撤单率，如果撤单率大于99%，则禁止该用户通过API特定价格类型进行下单5分钟；

- 当API用户在1小时的总禁用次数达到3次时，则禁止用户通过API特定价格类型进行下单30分钟，待解禁恢复访问后，总禁用次数重置，且之前周期统计过的次数不计入新周期的总禁用次数;

- 其他客户端挂撤单以及API撤单将不受影响，每次禁用会以短信和邮件形式通知；

- 被禁用的API下单类型仅包括：限价委托、Post_only、FOK、IOC四种订单价格类型，其他下单方式如lightning（闪电平仓下单），opponent(对手价下单)，optimal_5（最优5档），optimal_10(最优10档下单），optimal_20（最优20档下单），opponent_ioc（对手价-IOC下单），lightning_ioc（闪电平仓-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），lightning_fok（闪电平仓-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）等在禁用期间将仍然可用；

- 禁用期间下单类型为被禁用的四种类型时，接口返回信息header中会包括字段："recovery-time：禁用的恢复时间戳"，单位为毫秒，表示禁用结束时间，可恢复访问的时间戳；如果不在禁用期间，header中不返回该字段；

- 委托单总笔数与撤单率的计算是基于UID，母子UID是分开单独计算的。计算撤单率的时间周期为10分钟/次；

- 指标说明：
 	- 撤单率 = 无效撤单总笔数 / 委托单总笔数（订单来源均为API）。
  - 委托单总笔数=同时满足以下所有条件的委托单总笔数：
      - 订单来源为API并且订单类型为报单（order Type = 1）；
    
      - 订单价格类型为限价委托、Post_only、FOK和IOC四种订单价格类型；
    
      - 委托单的下单时间在【当周期开始时间-3秒，当周期结束时间】内的委托单总笔数；
 	
    - 无效撤单总笔数=同时满足以下所有条件的委托单总笔数：
      - 订单来源为API并且订单类型为报单（order Type = 1）；
    
      - 订单价格类型为限价委托、Post_only、FOK和IOC四种订单价格类型；
    
      - 订单状态为已撤销（status = 7）；
    
      - 订单成交数量为0；
    
      - 撤单时间与下单时间间隔小于等于3秒；
    
      - 委托单的撤单时间在当周期内的委托单。
      
- 为了保证API系统的稳定性和交易性能，请您在高峰期时段尽量降低API订单的撤单量和撤单率，以避免频繁触发API的限制机制，以下是降低撤单率的建议：

  - 1．订单的价格更靠近盘口；

  - 2、适当延长下单与撤单的时间间隔；

  - 3、适当增加单笔订单金额，减少下单次数；

  - 4、尽量增加订单成交率:

      - 1) 优先使用对手价、最优5档、最优10档、最优20档、闪电平仓、opponent_ioc（对手价-IOC下单）、lightning_ioc（闪电平仓-IOC下单）、optimal_5_ioc（最优5档-IOC下单）、optimal_10_ioc（最优10档-IOC下单）、optimal_20_ioc（最优20档-IOC下单）、opponent_fok（对手价-FOK下单）、lightning_fok（闪电平仓-FOK下单）、optimal_5_fok（最优5档-FOK下单）、optimal_10_fok（最优10档-FOK下单）、optimal_20_fok（最优20档-FOK下单）等成交概率大的委托方式下单；

      - 2) IOC订单、FOK订单、Post_only订单尽量摆在买卖第一档的位置上；

  - 5、适当延长策略轮询时间。


## 查询系统是否可用

通过接口`https://www.hbdm.com/heartbeat`，可以查询系统是否可用,其中heartbeat为1是可用，为0不可用。
“swap_heartbeat”，表示永续的系统状态， 系统的预估恢复时间；
“swap_estimated_recovery_time”，表示永续的系统的预估恢复时间,单位：毫秒；

> 返回数据

```json
  {
  "status": "ok",
  "data": {"heartbeat": 1,
          "estimated_recovery_time": null,
          "swap_heartbeat": 1,
          "swap_estimated_recovery_time": null},
  "ts": 1557714418033
  }

```

## 错误码详情

错误代码	 | 错误描述|
----- | ---------------------- |
403	|	无效身份                |
1000|	系统异常                |
1001|	系统未准备就绪             |
1002|	查询异常                |
1003|	操作redis异常           |
1004|	系统繁忙，请稍后重试    |
1010|	用户不存在               |
1011|	用户会话不存在             |
1012|	用户账户不存在             |
1013|	合约品种不存在             |
1014|	合约不存在               |
1015|	指数价格不存在             |
1016|	对手价不存在              |
1017|	查询订单不存在             |
1018|	主账号不存在             |
1019|	主账号不在开通子账号白名单里             |
1020|	您的子账号数量已超出限制，请联系客服             |
1021|	开户失败。您的主账号尚未开通合约交易权限，请前往开通             |
1030|	输入错误                |
1031|	非法的报单来源             |
1032|	访问次数超出限制            |
1033|	合约周期字段值错误           |
1034|	报单价格类型字段值错误         |
1035|	报单方向字段值错误           |
1036|	报单开平字段值错误           |
1037|	杠杆倍数不符合要求           |
1038|	报单价格不符合最小变动价        |
1039|	报单价格超出限制            |
1040|	报单数量不合法             |
1041|	报单数量超出限制            |
1042|	超出多头持仓限制            |
1043|	超出多头持仓限制            |
1044|	超出平台持仓限制            |
1045|	杠杆倍数与所持有仓位的杠杆不符合    |
1046|	持仓未初始化              |
1047|	可用保证金不足             |
1048|	持仓量不足               |
1049|	市价单不支持               |
1050|	客户报单号重复             |
1051|	没有可撤订单              |
1052|	超出批量数目限制            |
1053|	无法获取合约的最新价格区间       |
1054|	无法获取合约的最新价          |
1055|	平仓时权益不足             |
1056|	结算中无法下单和撤单          |
1057|	暂停交易中无法下单和撤单        |
1058|	停牌中无法下单和撤单          |
1059|	交割中无法下单和撤单          |
1060|	此合约在非交易状态中，无法下单和撤单  |
1061|	订单不存在，无法撤单          |
1062|	撤单中，无法重复撤单          |
1063|	订单已成交，无法撤单          |
1064|	报单主键冲突              |
1065|	客户报单号不是整数           |
1066|	字段不能为空              |
1067|	字段不合法               |
1068|	导出错误                |
1069|	报单价格不合法             |
1070|	数据为空，无法导出          |
1071|	订单已撤，无法撤单             |
1072|	卖出价必须低于指定USD             |
1073|	仓位异常，请联系客服             |
1074|	下单异常，请联系客服             |
1075|	您的下单价格成交后可能会导致强平，请修改下单价格             |
1076|	盘口无数据，请稍后再试             |
1077|	交割结算中，当前品种资金查询失败            |
1078|	交割结算中，部分品种资金查询失败             |
1079|	交割結算中，当前品种持仓查询失败            |
1080|	交割結算中，部分品种持仓查询失败            |
1081|	未完成的计划委托单超限             |
1082|	触发类型参数错误            |
1083|您的仓位已进入强平接管，暂时无法下单 |
1084|您的合约API挂单接口被禁用，请于(GMT+8) 后再试 |
1085|计划委托下单失败，请修改价格再次下单或联系客服 |
1086|{0}合约暂时限制{1}端开仓，请联系客服 |
1087|{0}合约暂时限制{1}端平仓，请联系客服 |
1088|{0}合约暂时限制{1}端撤单，请联系客服 | 
1089|{0}合约暂时限制划转，请联系客服  |
1090|保证金率小于0, 无法下单|
1091|账户权益小于0, 无法下单|
1100|	用户没有开仓权限            |
1101|	用户没有平仓权限            |
1102|	用户没有入金权限            |
1103|	用户没有出金权限            |
1104|	合约交易权限,当前禁止交易       |
1105|	合约交易权限,当前只能平仓       |
1106|合约状态异常，无法出入金 |
1108|服务异常，请稍后再试 |
1109|子账号没有开仓权限，请联系客服 |
1110|子账号没有平仓权限，请联系客服 |
1111|子账号没有入金权限，请联系客服 |
1112|子账号没有出金权限，请联系客服 |
1113|子账号没有交易权限，请登录主账号授权 |
1114|子账号没有划转权限，请登录主账号授权 |
1115|您没有访问此子账号的权限 |
1200|	登录错误                |
1220|	用户尚未开通合约交易          |
1221|	开户资金不足              |
1222|	开户天数不足              |
1223|	开户VIP等级不足           |
1224|	开户国家限制              |
1225|	开户不成功               |
1226|合约已开户，无法重复开户 |
1227|火币合约暂不支持子账户，请返回退出子账户，切换主账户登录|
1228|未开户，无法同意协议 |
1229|重复同意协议|
1230|您尚未做风险认证|
1231|您尚未做身份认证|
1232|您上传的图片格式/大小不符合要求，请重新上传 | 
1250|	无法获取HT_token        |
1251|	BTC折合资产无法获取         |
1252|	现货资产无法获取            |
1253|签名验证错误 |
1300|划转失败 |
1301|可划转余额不足 |
1302|系统划转错误 |
1303|单笔转出的数量不能低于{0}{1} |
1304|单笔转出的数量不能高于{0}{1} |
1305|单笔转入的数量不能低于{0}{1} |
1306|单笔转入的数量不能高于{0}{1} |
1307|您当日累计转出量超过{0}{1}, 暂无法转出 |
1308|您当日累计转入量超过{0}{1}, 暂无法转入|
1309|您当日累计净转出量超过{0}{1}, 暂无法转出|
1310|您当日累计净转入量超过{0}{1}, 暂无法转入|
1311|超过平台当日累计最大转出量限制, 暂无法转出|
1312|超过平台当日累计最大转入量限制, 暂无法转入|
1313|超过平台当日累计最大净转出量限制, 暂无法转出|
1314|超过平台当日累计最大净转入量限制, 暂无法转入|
1315|划转类型错误|
1316|划转冻结失败|
1317|划转解冻失败|
1318|划转确认失败|
1319|查询可划转金额失败|
1320|此合约在非交易状态中, 无法进行系统划转|
1321|划转失败, 请稍后重试或联系客服|
1322|划转金额必须大于0|
1323|服务异常, 划转失败, 请稍后再试|
1325|设置交易单位失败| 
1326|获取交易单位失败|
1327|无划转权限, 划转失败, 请联系客服|
1328|无划转权限, 划转失败, 请联系客服|
1329|无划转权限, 划转失败, 请联系客服|
1330|无划转权限, 划转失败, 请联系客服|
1331|超出划转精度限制(8位), 请修改后操作|
12001|无效的提交时间|
12002|错误的签名版本|
12003|错误的签名方法|
12004|密钥已经过期|
12005|ip地址错误|
12006|提交时间不能为空|
12007|公钥错误|
12008|校验失败|
12009|用户被锁定或不存在|

## 常见错误FAQ


一、温馨提示您，永续合约每8小时为一期，每期结束时进行结算。即04:00-12:00为一期，结算时间为12:00；12:00-20:00为一期，结算时间为20:00；20:00-次日04:00为一期，结算时间为04:00。以上时间均为新加坡时间。

(1)在结算时不能下单和撤单，若用户在结算时下单或撤单会返回错误码"1056"，提示结算中无法下单和撤单。
建议您在结算时间点每隔几秒钟轮询获取合约信息接口：swap-api/v1/swap_contract_info，当返回报文中contract_status返回状态码为5、6、7、8中的任意一个数字时表示在结算中，当contract_status返回状态码为1时是表示结算完成可以正常下单和撤单。


(2)在结算时查询资金和持仓会返回错误码，返回的错误码及错误码表示的含义如下：

  1.	错误码"1077"表示"交割结算中，当前品种资金查询失败"；
  2.	错误码"1078"表示"交割结算中，部分品种资金查询失败"；
  3.	错误码"1079"表示"交割结算中，当前品种持仓查询失败"；
  4.	错误码"1080"表示"交割结算中，部分品种持仓查询失败"；

建议您从返回的报文里读取状态码，如果状态码出现上述四种类型，请不要用这个返回的数据。


二、由于近段时间平台系统订单堆积情况比较严重，我们的技术人员正在努力解决和优化中，如果近段时间出现系统繁忙的情况或者出现以下提示：

{“status”:”error”,”err_code”:1004,”err_msg”:”System busy. Please try again later.”,”ts”: }

请您耐心等待，在此过程中请不要进行重复的下单和撤单，以避免造成重复下单以及对系统性能造成额外的压力，在此期间，建议您可以通过Web和APP端进行下单和撤单。


## API 最佳实践

### 1、swap-api/v1/swap_hisorders 历史委托查询接口：

- 为了保证时效性和降低延迟，强烈建议用户使用swap-api/v1/swap_order_info获取用户订单信息接口来查询订单信息，获取合约订单信息接口从内存里面查询，无延迟，接口响应速度更快。

- 如果用户一定要使用swap-api/v1/swap_hisorders 历史委托查询接口，请尽量输入更多的查询条件，trade_type（推荐传0查询全部）、type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 2、swap-api/v1/swap_matchresults 获取历史成交记录接口：

- 为了提升查询的性能和响应速度，查询条件 trade_type（推荐传0查询全部） 、contract_code 、create_date 尽量都输入，并且create_date输入尽量小的整数，最好只查询一天的数据；

 

### 3、swap-api/v1/swap_financial_record 查询用户财务记录接口：

- 为了提升查询的性能和响应速度，查询条件type（推荐不填查询全部）、create_date，尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 4、swap-api/v1/swap_order_detail 获取订单明细接口：

- 查询条件created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。

- 例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从swap_order下单接口返回报文中的ts中获取时间戳作为参数查询接口swap-api/v1/swap_order_detail获取订单明细，同时created_at禁止传0；；

 

### 5、订阅Market Depth 数据的WebSocket：

- 获得150档深度数据，使用step0, step1, step2, step3, step4, step5；

- 获得20档深度数据，使用 step6, step7, step8, step9, step10, step11；

- 由于每100ms推送一次150档全量数据，数据量比较大，如果客户端网络带宽不足或者处理不及时，webSocket断开可能比较频繁，强烈建议使用step6, step7, step8, step9, step10, step11 取20档数据。比如订阅20档数据

`{`

  `"sub": "market.BTC-USD.depth.step6",`

  `"id": "id5"`

`}`
 

- 我们也推荐使用增量订阅市场深度数据，增量深度数据有20档不合并数据和150档不合并数据，首次或者重连都推送全量数据，之后会推送增量数据，每30MS检查一次，如果有更新则推送，没有更新则不推送。需要维护好本地的深度数据。

`{`

  `"sub": "market.BTC-USD.depth.size_20.high_freq",`

  `"data_type":"incremental",`

  `"id": "id1"`

`}`
 

### 6、swap-api/v1/swap_order合约下单和swap-api/v1/swap_batchorder合约批量下单接口：

- 推荐传参数client_order_id（用户级别唯一），主要防止下单和批量下单接口由于网络或其它原因接口超时或者没有返回，可以根据client_order_id通过请求接口swap-api/v1/swap_order_info来快速获取订单是否下单正常或者快速获取订单信息。


## 代码实例

- <a href='https://github.com/hbdmapi/java_demo'>Java</a>

- <a href='https://github.com/hbdmapi/hbdm_Python'>Python</a>

### 备注：永续代码使用方式与交割合约类似，其他语言demo可以参考交割合约

# 合约市场行情接口

## 获取合约信息 

###  示例

- GET `swap-api/v1/swap_contract_info`

###  请求参数

参数名称     |  参数类型   |  必填   |  描述  |
---------------- |  -------------- |  ---------- |  ------------------------------------------------------------ |
contract_code   |  string         |  false |       大小写均支持，"BTC-USD",不填查询所有合约  |

> Response:

```json

  {
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USD",
            "contract_size":100,
            "price_tick":0.1,
            "create_date":"20200325",
            "contract_status":1,
            "settlement_date":"1586318400000"
        }
    ],
    "ts":1586315506917
}
    
```

###  返回参数

参数名称              |  是否必须   |  类型   |  描述                          |  取值范围|
-------------------------- |  ----------------- |  ---------- |  --------------------------------- |  -----------------------------------------------------------------------|
status                     |  true           |  string     |  请求处理结果                      |  "ok" , "error"  |
\<list\>(属性名称: data)    |                  |           |                               |   |
symbol                     |  true           |  string     |  品种代码                          |  "BTC","ETH"...  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
contract_size             |  true           |  decimal    |  合约面值，即1张合约对应多少美元   |  10, 100...  |
price_tick                |  true           |  decimal    |  合约价格最小变动精度             |  0.001, 0.01...  |
settlement_date             |  true           |  string     |  合约下次结算时间                     |  如"1490759594752"  |
create_date               |  true           |  string     |  合约上市时间                      |  如"1490759594752"  |
contract_status           |  true           |  int        |  合约状态                          |  合约状态: 1:上市、3:停牌、5:结算中、6:交割中、7:结算完成、8:交割完成  |
\</list\>    |             |               |                     |        |                 
ts                         |  true           |  long       |  响应生成时间点，单位：毫秒  |      

## 获取合约指数信息

###  示例

- GET `swap-api/v1/swap_index`

```shell

curl "https://api.hbdm.com/swap-api/v1/swap_index?contract_code=BTC-USD"

```

###  请求参数

参数名称   |  参数类型   | 必填   | 描述  |
-------------- |  -------------- |  ---------- |  ----------------  |
contract_code         |  string         |  false       |   支持大小写，"BTC-USD","ETH-USD"...  |

> Response:

```json

    {
      "status":"ok",
      "data": [
         {
           "contract_code": "BTC-USD",
           "index_price":471.0817,
           "index_ts": 1490759594752
          }
        ],
      "ts": 1490759594752
    }
    
```

###  返回参数

参数名称               | 是否必须   | 类型   |  描述             | 取值范围 |
--------------------------  | --------------| ----------  | ---------------------------- |  ----------------  |
status                    | true           |  string     |  请求处理结果                 |  "ok" , "error"  |
\<list\>(属性名称: data)    |                |           |                           |  |
contract_code                     |  true           |  string     |  指数代码                    | "BTC-USD","ETH-USD"...  |
index_price               |  true           |  decimal    |  指数价格   |                  |
index_ts                |  true           |  long   |  响应生成时间点，单位：毫秒   |                  |
\</list\>               |                |           |                           |  |                                                            
ts                         |  true           |  long       |  时间戳，单位：毫秒   |   |

## 获取合约最高限价和最低限价

###  示例

- GET `swap-api/v1/swap_price_limit`

###  请求参数

参数名称     | 参数类型    | 必填    | 描述 |
----------------  | --------------  | ---------- |  -----------------------------------------------------------------  |
contract_code   |  string         |  true |      合约代码，支持大小写，BTC-USD  |

> Response:

```json

    {
      "status":"ok",
      "data": 
       [{
          "symbol":"BTC",
          "high_limit":443.07,
          "low_limit":417.09,
          "contract_code": "BTC-USD"
         }],
      "ts": 1490759594752
    }
    
```

###  返回参数

参数名称              | 是否必须   | 类型    | 描述                      | 取值范围 |
-------------------------- |-------------- |---------- |---------------------------- |------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |  "ok" ,"error"  |
\<list\>(属性名称: data)  |    |   |    |    |
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH" ...                                    |
high_limit  |  true  |  decimal  |  最高买价|                                                          |
low_limit  | true  |  decimal   |  最低卖价|                                                          |
contract_code   |  true      |  string     |  合约代码      |  "BTC-USD" ...  |
\</list\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒              |            |


## 获取当前可用合约总持仓量 

###  示例

- GET `swap-api/v1/swap_open_interest`

###  请求参数

参数名称 | 参数类型    | 必填    | 描述 |
---------------- |  -------------- |  ---------- |  -----------------------------------------------------------------  |
contract_code   |  string         |  false |     支持大小写，"BTC-USD",不填查询所有合约  |

> Response:

```json

    {
      "status":"ok",
      "data":
        [{
          "symbol":"BTC",
          "volume":123,
          "amount":106,
          "contract_code": "BTC-USD"
         }],
      "ts": 1490759594752
    }
    
```

###  返回参数

参数名称 |     是否必须    | 类型    | 描述 | 取值范围 |
-------------------------- |  -------------- |  ---------- |  ----------------------------  | ------------------------------------------------------  |
status  |  true  |  string  |  请求处理结果| "ok" , "error"  |
\<list\>(属性名称: data)  |    |    |   |    |
symbol  |  true  |  string  |  品种代码  |  "BTC", "ETH" ...  |
volume  |  true  |  decimal  |  持仓量(张)|    |   
amount  |  true  |  decimal  |  持仓量(币)|    |   
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
\</list\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒   |


## 获取行情深度数据

###  示例

- GET `/swap-ex/market/depth`

###  请求参数

参数名称   |  参数类型     |  必填    |  描述  |
-------------- |  -------------- |  ---------- |  -------------------------------------------------------------------------------- |
contract_code   |  string         |  true |    仅支持大写, "BTC-USD" ...  |
type  |  string  |    true  |  (150档数据)  step0, step1, step2, step3, step4, step5（合并深度1-5）；step0时，不合并深度, (20档数据)  step6, step7, step8, step9, step10, step11（合并深度7-11）；step6时，不合并深度  |

>tick 说明:

```
    "tick": {
      "id": 消息id.
      "ts": 消息生成时间，单位：毫秒.
      "bids": 买盘,[price(挂单价), vol(此价格挂单张数)], //按price降序.
      "asks": 卖盘,[price(挂单价), vol(此价格挂单张数)]  //按price升序.
      "ch": 数据所属的 channel,
      "mrid": 订单ID,
      "ts": 时间戳,
      "version": 版本
    }
```

> Response:

```json

    {
      "ch":"market.BTC-USD.depth.step5",
      "status":"ok",
        "tick":{
          "asks":[
            [6580,3000],
            [70000,100]
            ],
          "bids":[
            [10,3],
            [2,1]
            ],
          "ch":"market.BTC-USD.depth.step5",
          "id":1536980854,
          "mrid":6903717,
          "ts":1536980854171,
          "version":1536980854
        },
      "ts":1536980854585
    }
    
```

###  返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.period | | 
status | true |  string | 请求处理结果 | "ok" , "error" | 
 \<dict\>(属性名称：tick) |  |  |  |  |
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
mrid  | true| string | 订单ID | | 
ch  | true| string | 订阅Channel | | 
id  | true| string | tick id | | 
version | true| string | 版本号 | | 
ts | true | long | 深度生成时间戳，单位：毫秒 | |
 \</dict\> |  |  |  |  |
ts | true | long | 响应生成时间点，单位：毫秒 | |



### 备注

- 用户选择“合并深度”时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。

- step1至step5是进行了深度合并后的150档深度数据，step7至step11是进行了深度合并后的20档深度数据，对应精度如下：

| Depth 类型 | 精度 |
|----|----|
|step1、step7|0.00001|
|step2、step8|0.0001|
|step3、step9|0.001|
|step4、step10|0.01|
|step5、step11|0.1|


## 获取K线数据

###  示例

- GET `/swap-ex/market/history/kline`

###  请求参数

参数名称    |  是否必须  |   类型     |  描述    |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  -----------------------------------------------------|
contract_code             |  true           |  string     |  合约代码                          | 仅支持大写， "BTC-USD" ...  |
period  |    true  |  string  |  K线类型  |  |  1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon  |
size  |  true  |  integer    |  获取数量   |  150  |  [1,2000]  |
from  |  false  |  integer  |  开始时间戳 10位 单位S |    |
to  |  false  |  integer  |   结束时间戳 10位 单位S |    |

### Note
   - 1、size字段或者from、to字段至少要填写一个。
   - 2、如果size、from、to 均不填写，则返回错误。
   - 3、如果填写from，也要填写to。最多可获取连续两年的数据。
   - 4、如果size、from、to 均填写，会忽略from、to参数

> Data说明：

```

"data": [
  {
    "id": K线id,
    "vol": 成交量(张)，买卖双边成交量之和,
    "count": 成交笔数,
    "open": 开盘价,
    "close": 收盘价,当K线为最晚的一根时，是最新成交价
    "low": 最低价,
    "high": 最高价,
    "amount": 成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)
   }
]

```

> Response:

```json

    {
      "ch": "market.BTC-USD.kline.1min",
      "data": [
        {
          "vol": 2446,
          "close": 5000,
          "count": 2446,
          "high": 5000,
          "id": 1529898120,
          "low": 5000,
          "open": 5000,
          "amount": 48.92
         },
        {
          "vol": 0,
          "close": 5000,
          "count": 0,
          "high": 5000,
          "id": 1529898780,
          "low": 5000,
          "open": 5000,
          "amount": 0
         }
       ],
      "status": "ok",
      "ts": 1529908345313
    }
    
```

###  返回参数

参数名称   |  是否必须     |  数据类型     |  描述  |   取值范围  |
--------------  |  -------------- |  -------------- |  ------------------------------------------ |  ----------------  |
ch  |  true  |  string  |    数据所属的 channel，格式： market.period   |        |
status  |    true  |  string  |    请求处理结果  |  "ok" , "error"  |
ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    | 
 \<list\>(属性名称: data)    |               |    |      |            | 
  id    |     true          | long   |  ID     |            
  vol    |     true          | decimal   |  成交量张数     |            
  count    |     true          | decimal   |  成交笔数     |            
  open    |     true          | decimal   |    开盘价   |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
  \</list\>    |               |     |      |    

## 获取聚合行情

###  示例

- GET `/swap-ex/market/detail/merged`

###  请求参数

参数名称   |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
--------------  | --------------  | ---------- |  ----------  | ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码                          | 仅支持大写， "BTC-USD" ...  |

>tick说明:

```

    "tick": {
      "id": K线id,
      "vol": 成交量（张），买卖双边成交量之和,
      "count": 成交笔数,
      "open": 开盘价,
      "close": 收盘价,当K线为最晚的一根时，是最新成交价
      "low": 最低价,
      "high": 最高价,
      "amount": 成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)
      "bid": [买1价,买1量(张)],
      "ask": [卖1价,卖1量(张)]
     }
     
```

> Response:

```json

    {
      "ch": "market.BTC-USD.detail.merged",
      "status": "ok",
      "tick": 
        {
          "vol":"13304",
          "ask": [5001, 2],
          "bid": [5000, 1],
          "close": "5000",
          "count": "13305",
          "high": "5000",
          "id": 1529387841,
          "low": "5000",
          "open": "5000",
          "ts": 1529387842137,
          "amount": "266.1"
         },
      "ts": 1529387842137
    }
    
```

###  返回参数

参数名称     |  是否必须    |   数据类型     |  描述  |    取值范围  |
-------------- |  -------------- |  -------------- |  ----------------------------------------------------------| ----------------  |
ch  |  true  |  string  |    数据所属的 channel，格式： market.\$contract_code.detail.merged   |     |
status  |    true  |  string  |    请求处理结果  |  "ok" , "error"  |
ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    | 
 \<dict\>(属性名称: tick)    |               |    |  24小时成交量、开盘价和收盘价     |            | 
  id    |     true          | long   |  ID     |            
  vol    |     true          | string   |  成交量张数     |            
  count    |     true          | int   |  成交笔数     |            
  open    |     true          | string   |    开盘价   |            
  close    |     true          | string   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | string   |  最低价    |            
  high    |     true          | string   |  最高价    |            
  amount    |     true          | string   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
ask | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bid| true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
  \</dict\>    |               |     |      | 

## 获取市场最近成交记录

###  示例

- GET `/swap-ex/market/trade`

###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |  默认值  |  取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码,仅支持大写                         |  "BTC-USD" ...  |

>Tick说明：

```
    "tick": {
      "id": 消息id,
      "ts": 最新成交时间,
      "data": [
        {
       "id": 成交id,
        "price": 成交价钱,
         "amount": 成交量(张)，买卖双边成交量之和,
         "direction": 主动成交方向,
         "ts": 成交时间
        }
      ]
    }
```


> Response:

```json

    {
      "ch": "market.BTC-USD.trade.detail",
      "status": "ok",
      "tick": {
        "data": [
          {
            "amount": "2",
            "direction": "sell",
            "id": 6010881529486944176,
            "price": "5000",
            "ts": 1529386945343
           }
         ],
        "id": 1529388202797,
        "ts": 1529388202797
        },
      "ts": 1529388202797
    }
    
```

###  返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   |  取值范围  |
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ |  --------------  |
ch  |  true  |  string  |  数据所属的 channel，格式： market.\$contract_code.trade.detail  |  |   |
status  |  true  |  string  |  |  |  "ok","error" |
ts  |  true  |  long |  发送时间  |   |    |
 \<list\>(属性名称: tick)    |               |    |  Trade数据     |            | 
id  |  true  |  long  |  ID  |   |    
price  |  true  |  string  |  价格  |   |    
amount  |  true  |  string  |  数量（张）  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
ts  |  true  |  long  |  订单成交时间  |   |  
  \</list\>    |               |     |      | 



## 批量获取最近的交易记录

###  示例

- GET `/swap-ex/market/history/trade`

###  请求参数：

参数名称     |  是否必须     | 数据类型   |  描述  |    默认值    |  取值范围  |
-------------- |  -------------- |  -------------- |  -------------------- |  ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码,仅支持大写                          |  "BTC-USD" ...  |
size  |  true  |  int  |    获取交易记录的数量  | 1  |  [1, 2000]  |

>data说明：

```

    "data": {
      "id": 消息id,
      "ts": 最新成交时间,
      "data": [
        {
          "id": 成交id,
          "price": 成交价,
          "amount": 成交量(张)，买卖双边成交量之和,
          "direction": 主动成交方向,
          "ts": 成交时间
        }
      ]
    }
    
```

> Response:

```json

    {
      "ch": "market.BTC-USD.trade.detail",
      "status": "ok",
      "ts": 1529388050915,
      "data": [
        {
          "id": 601088,
          "ts": 1529386945343,
          "data": [
            {
             "amount": 2,
             "direction": "sell",
             "id": 6010881529486944176,
             "price": 5000,
             "ts": 1529386945343
             }
           ]
        }
       ]
    }
    
```

###  返回参数

参数名称   |  是否必须     |  数据类型    |  描述  |    取值范围   |
--------------  | --------------  | --------------  | ---------------------------------------------------------  | ---------------  |
ch  |  true  |  string  |    数据所属的 channel，格式： market.$contract_code.trade.detail   |    |
status  |  true  |  string  |    |    "ok"，"error" |
ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    |
 \<list\>(属性名称: data)    |               |    |  Trade数据     |            | 
 \<list\>(属性名称: data)    |               |    |       |            | 
id  |  true  |  long  |  ID  |   |    
price  |  true  |  decimal  |  价格  |   |    
amount  |  true  |  int  |  数量（张）  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
ts  |  true  |  long  |  订单成交时间  |   |  
  \</list\>    |               |     |      |
id  |  true  |  long  |  ID  |   |    
ts  |  true  |  long  |  最新成交时间 |   |    
\</list\>    |               |     |      |


## 查询合约风险准备金余额和预估分摊比例

- GET `swap-api/v1/swap_risk_info`

### 请求参数

 参数名称               |   是否必须  |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  string         |  false |     支持大小写， 例如"BTC-USD",不填返回所有合约  |

> Response:

```json

{
  "status": "ok",
  "ts": 158797866555,
  "data": [
    {
      "contract_code": "BTC-USD",
      "insurance_fund": 3806.4615259197324414715719,
      "estimated_clawback": 0.0023
    }
  ]
}

```

### 返回参数

  参数名称                |   是否必须  |   类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<list\>(属性名称：data) |  |  |  |  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 estimated_clawback | true  | decimal | 预估分摊比例 |  |
 \</list\> |  |  |  |  |

## 查询合约风险准备金余额历史数据

- GET `swap-api/v1/swap_insurance_fund`

### 请求参数

  参数名称                |   是否必须   |   类型    |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   | 支持大小写，例如 "BTC-USD" ...  |

> Response:

```json

{
  "status": "ok",
  "ts": 158797866555,
  "data":   {
     "symbol": "BTC",
     "contract_code": "BTC-USD",
     "tick": [
        {
          "insurance_fund": 3806.4615259197324414715719,
          "ts": 158797866555
         }
      ]
  }
}

```

### 返回参数

  参数名称                |   是否必须   |   类型    |    描述             |    取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<dict\>(属性名称：data)|  |  |  | 字典数据 |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 \<list\>(属性名称：tick) |  |  |  |  |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 ts | true  | long | 数据时间点，单位：毫秒 |  |
 \</list\> |  |  |  |  |
 \</dict\> |  |  |  |  |

## 查询平台阶梯调整系数

- GET `swap-api/v1/swap_adjustfactor`

### 请求参数

  参数名称                |   是否必须   |    类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code | false | string | 合约代码	 | 支持大小写，"BTC-USD"... ,如果缺省，默认返回所有品种 |

> Response:

```json
{
  "status": "ok",
  "data": [
   {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "list": [
       {
          "lever_rate": 10,
          "ladders": [
           {
             "ladder": 1,
             "min_size": 0,
             "max_size": 100,
             "adjust_factor": 0.1
           },
           {
             "ladder": 2,
             "min_size": 101,
             "max_size": 500,
             "adjust_factor": 0.2
           }
           ]
       }
       ]
   }
   ],
   "ts": 158797866555
}

```

### 返回参数

   参数名称                |   是否必须  |   类型   |    描述             |    取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<list\>(属性名称：data) |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 \<list\>(属性名称：list) |  |  |  |  |
 lever_rate   | true     | int  | 杠杆倍数               |                |
 \<list\>(属性名称：ladders) |  |  |  |  |
 min_size | true | decimal | 净持仓量的最小值 |  |
 max_size | true | decimal | 净持仓量的最大值 |  |
 ladder | true | int | 档位 |  |
 adjust_factor | true | decimal | 调整系数 |  |
 \</list\> |  |  |  |  |
 \</list\> |  |  |  |  |
 \</list\> |  |  |  |  |

## 平台持仓量的查询

### 实例

- GET `swap-api/v1/swap_his_open_interest`

### 请求参数

|  参数名称                |   是否必须   |   类型    |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | 合约代码   | 支持大小写，"BTC-USD" ... |
| period | true | string | 时间周期类型 | 1小时:"60min"，4小时:"4hour"，12小时:"12hour"，1天:"1day" |
| size | false | int | 获取数量 | 默认为：48，取值范围 [1,200]  |
| amount_type | true | int | 计价单位 | 1:张，2:币  |

> Response:

```json

{
  "status": "ok",
  "data": 
        {
         "symbol": "BTC",
         "contract_code": "BTC-USD",
         "tick": [
            {
             "volume": 1,
             "amount_type": 1,
             "ts": 1529387842137
            }
          ]
        },
    "ts": 158797866555
}

```

### 返回参数

|   参数名称                |   是否必须   |   类型    |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | 请求处理结果   | "ok" , "error" |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |
| \<dict\>(属性名称：data) |  |  | 字典数据 |  |
| symbol | true | string | 品种代码   | "BTC","ETH"... |
| contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
| \<list\>(属性名称：tick) |  |  |  |  |
| volume | true | decimal | 持仓量 |  |
| amount_type | true | int | 计价单位 | 1:张，2:币  |
| ts | true | long | 统计时间 |  |
| \</list\> |  |  |  |  |
| \</dict\> |  |  |  |  |

- 注意：
  
  tick字段：数组内的数据按照时间倒序排列；
  data字段：字典类型。

## 精英账户多空持仓对比-账户数

- GET `swap-api/v1/swap_elite_account_ratio`

### 请求参数

  参数名称               |   是否必须  |  类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  支持大小写，"BTC-USD" ...  |
period | true | string | 周期  | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "list": [
        {
         "buy_ratio": 0.2323,
         "sell_ratio": 0.4645,
         "locked_ratio": 0.4142,
         "ts": 158797866555
       }
       ]
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                 |  是否必须   |   类型    |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
\<list\>(属性名称：list) |  |  |  |  |
buy_ratio | true | decimal | 净多仓的账户比例 |  |
sell_ratio | true | decimal | 净空仓的账户比例 |  |
locked_ratio | true | decimal | 锁仓的账户比例 |  |
ts | true  | long | 生成时间 |  |
\</list\> |  |  |  |  |
\</list\> |  |  |  |  |


## 精英账户多空持仓对比-持仓量

- GET `swap-api/v1/swap_elite_position_ratio`

### 请求参数

  参数名称                 |   是否必须   |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  支持大小写，"BTC-USD" ...  |
period | true | string | 周期  | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "list": [
        {
         "buy_ratio": 0.2323,
         "sell_ratio": 0.4645,
         "ts": 158797866555
       }
       ]
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                 |   是否必须  |   类型   |  描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
\<list\>(属性名称：list) |  |  |  |  |
buy_ratio | true | decimal | 多仓的总持仓量占比 |  |
sell_ratio | true | decimal | 空仓的总持仓量占比 |  |
ts | true  | long | 生成时间 |  |
\</list\> |  |  |  |  |
\</list\> |  |  |  |  |

## 查询系统状态

- GET `swap-api/v1/swap_api_state`

### 请求参数

  参数名称                 |   是否必须  |   类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  false  | string |  合约代码 |  支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |


> Response:   


```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "open": 1,
      "close": 1,
      "cancel": 1,
      "transfer_in": 1,
      "transfer_out": 1,
      "master_transfer_sub": 1,
      "sub_transfer_master": 1
    }
 ],
 "ts": 158797866555
}
```

### 返回参数

  参数名称                |   是否必须   |   类型  |   描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
open | true | int | 开仓下单权限："1"表示可用，“0”表示不可用 |  |
close | true | int | 平仓下单权限："1"表示可用，“0”表示不可用 |  |
cancel | true | int | 撤单权限："1"表示可用，“0”表示不可用 |  |
transfer_in | true | int | 从币币转入的权限："1"表示可用，“0”表示不可用 |  |
transfer_out | true | int | 转出至币币的权限："1"表示可用，“0”表示不可用 |  |
| master_transfer_sub | true | int | 母账户划转到子账户的权限："1"表示可用，“0”表示不可用 |  |
| sub_transfer_master | true | int | 子账户划转到母账户的权限："1"表示可用，“0”表示不可用 |  |
\</list\>|  |  |  |  |


### 说明

- open，指交易权限中对应的“API-开仓-普通订单”的权限，开启为可用，关闭为不可用；
  
- close，指交易权限中对应的“API-平仓-普通订单”的权限，开启为可用，关闭为不可用；

- cancel，指交易权限中对应的“API-撤单-普通订单”的权限，开启为可用，关闭为不可用；

- transfer_in，指交易权限中对应的“其他-划转-从币币转入”的权限，开启为可用，关闭为不可用；

- transfer_out，指交易权限中对应的“其他-划转-转出至币币”的权限，开启为可用，关闭为不可用；



## 获取合约的资金费率

- GET `swap-api/v1/swap_funding_rate`

### 请求参数

  参数名称                 |   是否必须   |   类型    |   描述               |   取值范围         |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   | 支持大小写，"BTC-USD" ...  |

> Response: 

```json

{
	"status": "ok",
	"data": {
		"estimated_rate": "0.000100000000000000",
		"funding_rate": "-0.000041207721886464",
		"contract_code": "BTC-USD",
		"symbol": "BTC",
		"fee_asset": "BTC",
		"funding_time": "1586923200000",
		"next_funding_time": "1586952000000"
	},
	"ts": 1586913483642
}
```

### 返回参数

  参数名称                 |   是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<dict\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
fee_asset | true  | string | 资金费币种 | "BTC","ETH"... |
funding_time | true | string | 当期资金费率时间 |  |
funding_rate | true | string | 当期资金费率 |  |
estimated_rate | true | string | 下一期预测资金费率 |  |
next_funding_time  | true | string |  下一期资金费率时间    |   |
\</dict\> |  |  |  |  |

## 获取合约的历史资金费率

- GET `swap-api/v1/swap_historical_funding_rate`

### 请求参数

  参数名称                 |  是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  支持大小写，"BTC-USD" ...  |
page_index  | false    | int    | 页码，不填默认第1页    | 1       |                                          |
page_size   | false    | int    | 不填默认20，不得多于50 | 20      |                                          |

> Response:

```json
{
	"status": "ok",
	"data": {
		"total_page": 4,
		"current_page": 1,
		"total_size": 62,
		"data": [{
			"funding_rate": "-0.000069120944848016",
			"realized_rate": "-0.000069120944848016",
			"funding_time": "1586894400000",
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"fee_asset": "BTC"
		}, {
			"funding_rate": "0.000100000000000000",
			"realized_rate": "0.000100000000000000",
			"funding_time": "1586865600000",
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"fee_asset": "BTC"
		}, {
			"funding_rate": "-0.000195106288532093",
			"realized_rate": "-0.000195106288532093",
			"funding_time": "1586808000000",
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"fee_asset": "BTC"
		}, {
			"funding_rate": "0.000100000000000000",
			"realized_rate": "0.000100000000000000",
			"funding_time": "1586376000000",
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"fee_asset": "BTC"
		}, {
			"funding_rate": "0.000100000000000000",
			"realized_rate": "0.000100000000000000",
			"funding_time": "1586347200000",
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"fee_asset": "BTC"
		}]
	},
	"ts": 1586913570441
}

```

### 返回参数

  参数名称                 |   是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<dict\>(属性名称：data) |  |  |  |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
fee_asset | true  | string | 资金费币种 | "BTC","ETH"... |
funding_time | true | string | 资金费率时间 |  |
funding_rate | true | string | 当期资金费率 |  |
realized_rate | true | string | 实际资金费率 |  |
\</list\> |  |  |  |  |
total_page             | true     | int     | 总页数                |              |
current_page           | true     | int     | 当前页                |              |
total_size           | true     | int     |  总条数               |              |
\</dict\> |  |  |  |  |


## 获取强平订单

- GET `swap-api/v1/swap_liquidation_orders`

### 请求参数

  参数名称     |   是否必须   |   类型   |    描述         |   默认值   |   取值范围                                  |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code  |  true   |  string   |  合约代码   |    |  支持大小写，"BTC-USD" ... |
trade_type      | true     | int  | 交易类型         |               |0:全部,5: 卖出强平,6: 买入强平 |
create_date | true     | int    | 日期            |         | 7，90（7天或者90天）        |
page_index | false     | int    | 页码,不填默认第1页            |         |         |
page_size | false     | int    | 不填默认20，不得多于50            |         |        |

> Response:

```
{
  "status": "ok",
  "data":{
    "orders":[
      {
        "symbol": "BTC",
        "contract_code": "BTC-USD",     //合约代码
        "direction": "buy",
        "offset": "close",
        "volume": 111,
        "price": 1111,
        "created_at": 1408076414000,
      }
     ],
    "total_page":15,
    "current_page":3,
    "total_size":3
    },
  "ts": 1490759594752
}

```

### 返回参数

  参数名称                |   是否必须   |   类型    |   描述               |   取值范围       |
---------------------- | -------- | ------- | ------------------ | ------------ |
status                 | true     | string  | 请求处理结果             |              |
\<dict\>(属性名称: data) |          |         |                    |              |
\<list\>(属性名称: orders) |          |         |                    |              |
symbol                 | true     | string  | 品种代码               |              |
contract_code          | true     | string  | 合约代码               |"BTC-USD" ...  |
direction              | true     | string  | "buy":买 "sell":卖         |              |
offset              | true     | string  | "open":开 "close":平        |
volume           | true     | decimal | 强平数量               |              |
price      | true     | decimal | 破产价格               |              |
created_at            | true     | long    | 强平时间               |              |
\</list\>              |          |         |                    |              |
total_page             | true     | int     | 总页数                |              |
current_page           | true     | int     | 当前页                |              |
total_size             | true     | int     | 总条数                |              |
\</dict\>            |          |         |                    |              |
ts                     | true     | long    | 时间戳                |              |



# 合约资产接口

## 获取用户账户信息

###  示例

- POST  `swap-api/v1/swap_account_info`

###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ----------  | ------------ |  ------------------------------------------ |
contract_code   |  false          | string |    支持大小写, "BTC-USD"... ,如果缺省，默认返回所有合约  |  |

> Response:

```json

    {
      "status": "ok",
      "data": [
        {
          "symbol": "BTC",
   	      "contract_code": "BTC-USD",
          "margin_balance": 1,
          "margin_static": 0.5,
          "margin_position": 0,
          "margin_frozen": 3.33,
          "margin_available": 0.34,
          "profit_real": 3.45,
          "profit_unreal": 7.45,
          "withdraw_available":4.0989898,
          "risk_rate": 100,
          "liquidation_price": 100,
          "adjust_factor": 0.1
         },
        {
          "symbol": "ETH",
          "contract_code": "ETH-USD",
          "margin_balance": 1,
          "margin_static": 0.5,
          "margin_position": 0,
          "margin_frozen": 3.33,
          "margin_available": 0.34,
          "profit_real": 3.45,
          "profit_unreal": 7.45,
          "withdraw_available":4.7389859,
          "risk_rate": 100,
          "liquidation_price": 100,
          "adjust_factor": 0.1
         }
       ],
      "ts":158797866555
    }
    
```

###  返回参数

参数名称  |    是否必须   |  类型   |  描述  |   取值范围  |
-------------------------- |  -------------- |  ---------- |  ------------------------------------------ |  ----------------  |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<list\>(属性名称: data)  |    |    |    |    |    
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH"...  |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
margin_balance  |  true  |  decimal    |  账户权益   |    |  
margin_static  |  true  |  decimal    |  静态权益   |    |  
margin_position  |  true  |  decimal    |  持仓保证金（当前持有仓位所占用的保证金）   |    |
margin_frozen  |  true  |  decimal    |  冻结保证金  |   | 
margin_available  |  true  |  decimal   |  可用保证金  |    | 
profit_real  |    true  |  decimal    |  已实现盈亏  |    | 
profit_unreal  |  true  |  decimal    |  未实现盈亏  |   | 
risk_rate  | true  |  decimal    |  保证金率  |  |   
liquidation_price  |    true  |  decimal    |  预估强平价  |   | 
withdraw_available  |   true  |  decimal    |  可划转数量  |   | 
lever_rate  |  true  |  decimal    |  杠杠倍数  |    |   
adjust_factor                | true     | decimal  | 调整系数               |                |  
\</list\>  |    |    |    |       |
ts  |    long  |    long  |  响应生成时间点，单位：毫秒  |    | 


## 获取用户持仓信息

###  示例

- POST `swap-api/v1/swap_position_info`

###  请求参数

参数名称   |  是否必须   |  类型    |  描述    |  默认值    |  取值范围  |
-------------- |  --------------  | ---------- |  ----------  | ------------ |  ------------------------------------------  |
contract_code   |  false  | string |  合约代码 | | 仅支持大写，"BTC-USD"... ,如果缺省，默认返回所有合约  |

> Response:

```json

    {
      "status": "ok",
      "data": [
        {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "volume": 1,
          "available": 0,
          "frozen": 0.3,
          "cost_open": 422.78,
          "cost_hold": 422.78,
          "profit_unreal": 0.00007096,
          "profit_rate": 0.07,
          "profit": 0.97,
          "position_margin": 3.4,
          "lever_rate": 10,
          "direction":"buy",
          "last_price":7900.17
         }
        ],
     "ts": 158797866555
    }
    
```

###  返回参数

参数名称  |     是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- |  -------------- |  ---------- |  ---------------------------- |  ------------------------------------------------------  |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<list\>(属性名称: data)  |    |    |    |     |
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH"...  |
contract_code  |  true  |  string  |  合约代码  |  "BTC-USD" ...  |
volume  |  true  |  decimal    |  持仓量|   |
available  | true  |  decimal    |  可平仓数量  |    |   
frozen  |  true  |  decimal    |  冻结数量  |    |
cost_open  |  true  |  decimal    |  开仓均价  |    |
cost_hold  | true  |  decimal    |  持仓均价  |    |
profit_unreal  |  true  |  decimal    |  未实现盈亏  |    |   
profit_rate  |    true  |  decimal    |  收益率  |   | 
profit  |  true  |  decimal   |  收益  |    |
position_margin  |  true  |  decimal    |  持仓保证金  |    |   
lever_rate  |  true  |  int  |   杠杠倍数  |    |
direction  |  true  |  string  |  "buy":买 "sell":卖  |    |
last_price  |  true  |  decimal    |  最新价  |     | 
\</list\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒   |    |


## 查询母账户下所有子账户资产信息


### 请求参数

- POST `swap-api/v1/swap_sub_account_list`

参数名称    |  是否必须   |   类型   |   描述          |   默认值   |   取值范围                                   |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code   |  false  | string |  合约代码 | | 支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |

> Response:

```json

  {
      "status": "ok",
      "ts": 1499223904680,
    	"data": [
    	  {
    	    "sub_uid": 9910049,
    	    "list": [
                  {
    	          "symbol": "BTC",
    	          "contract_code": "BTC-USD",
                "margin_balance": 1,
                "liquidation_price": 100,
    	          "risk_rate": 100
    	        },
    	        {
    	           "symbol": "ETH",
    	           "contract_code": "ETH-USD",
                 "margin_balance": 1,
                 "liquidation_price": 100,
    	           "risk_rate": 100
    	        }
    	      ]
    	  },
          {
    	      "sub_uid": 9910048,
    	      "list": [
                    {
    	           "symbol": "BTC",
    	           "contract_code": "BTC-USD",
                 "margin_balance": 1,
                 "liquidation_price": 100,
    	           "risk_rate": 100
    	        },
    	        {
    	           "symbol": "ETH",
    	           "contract_code": "ETH-USD",
                 "margin_balance": 1,
                 "liquidation_price": 100,
    	           "risk_rate": 100
    	        }
    	        ]
          }
    	]
    }
  
```

### 返回参数

  参数名称                 |   是否必须   |   类型    |     描述               |   取值范围      |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
sub_uid | true  | long | 子账户UID |  |
\<list\>(属性名称：list) |  |  |  |  |
symbol | true | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
margin_balance | true | decimal | 账户权益 |  |
liquidation_price | true | decimal | 预估强平价 |  |
risk_rate | true | decimal | 保证金率 |  |
\</list\> |  |  |  |  |
\</list\> |  |  |  |  |

- 备注

  只返回已经开通合约交易的子账户数据.


## 查询单个子账户资产信息

- POST `swap-api/v1/swap_sub_account_info`

###  请求参数


  参数名称     |   是否必须   |  类型  |  描述         |   默认值   |   取值范围                                 |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code   |  false  | string |  合约代码 | | 支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |
sub_uid | true | long | 子账户的UID	 |  |

> Response:

```json

  {
    "status": "ok",
    "data":  [ 
       {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "margin_balance": 1,
          "margin_position": 0,
          "margin_frozen": 3.33,
          "margin_available": 0.34,
          "profit_real": 3.45,
          "profit_unreal": 7.45,
          "withdraw_available":4.0989898,
          "risk_rate": 100,
          "liquidation_price": 100,
          "adjust_factor": 0.1,
          "lever_rate":1,
          "margin_static": 3
        }
      ],
    "ts":158797866555
  }
  
```

### 返回参数

  参数名称                |   是否必须   |  类型    |   描述               |   取值范围      |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts                       | true | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol                  | true     | string  | 品种代码               | "BTC","ETH"...，当 $contract_code值为 * 时代表订阅所有品种 |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
margin_balance                  | true     | decimal  | 账户权益               |                |
margin_position                 | true     | decimal  | 持仓保证金（当前持有仓位所占用的保证金）               |                |
margin_frozen                 | true     | decimal  | 冻结保证金               |                |
margin_available                 | true     | decimal  | 可用保证金               |                |
profit_real                 | true     | decimal  | 已实现盈亏               |                |
profit_unreal                 | true     | decimal  | 未实现盈亏               |                |
risk_rate                 | true     | decimal  | 保证金率               |                |
liquidation_price                | true     | decimal  | 预估爆仓价               |                |
withdraw_available                | true     | decimal  | 可划转数量               |                |
lever_rate                | true     | int  | 杠杆倍数               |                |
adjust_factor                | true     | decimal  | 调整系数               |                |  
margin_static                | true     | decimal  | 静态权益               |                |  
\</list\> |  |  |  |  |


- 备注

  只能查询到开通合约交易的子账户信息；
  
  子账户来过合约系统但是未开通合约交易也不返回对应的数据；

## 查询单个子账户持仓信息

- POST `swap-api/v1/swap_sub_position_info`

### 请求参数

  参数名称    |  是否必须  |  类型  |  描述        |   默认值  |  取值范围                                  |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code   |  false  | string |  合约代码 | | 支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |
sub_uid | true | long | 子账户的UID	 |  |

> Response:

```json
 
{
	"status": "ok",
	"ts": 158797866555,
	"data": [{
		"symbol": "BTC",
		"contract_code": "BTC-USD",
		"volume": 1,
		"available": 0,
		"frozen": 0.3,
		"cost_open": 422.78,
		"cost_hold": 422.78,
		"profit_unreal": 0.00007096,
		"profit_rate": 0.07,
		"profit": 0.97,
		"position_margin": 3.4,
		"lever_rate": 10,
		"direction": "buy",
		"last_price": 6000
	}]
}
                                                
```

### 返回参数

  参数名称                |   是否必须   |   类型    |   描述              |   取值范围       |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts                       | true | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol                  | true     | string  | 品种代码               | "BTC","ETH"... |
contract_code                | true     | string  |  合约代码             | "BTC-USD" ... |
volume                | true     | decimal	  |  持仓量             |  |
available               | true     | decimal	  | 可平仓数量              |  |
frozen               | true     | decimal	  |  冻结数量             |  |
cost_open               | true     | decimal	  |  开仓均价             |  |
cost_hold               | true     | decimal	  | 持仓均价              |  |
profit_unreal               | true     | decimal	  | 未实现盈亏              |  |
profit_rate               | true     | decimal	  | 收益率              |  |
profit               | true     | decimal	  | 收益              |  |
position_margin               | true     | decimal	  | 持仓保证金              |  |
lever_rate               | true     | int	  | 杠杆倍数              |  |
direction               | true     | string	  |   仓位方向           |  "buy":多 "sell":空 |
last_price               | true     | decimal	  |   最新价           |   |
\</list\> |  |  |  |  |

## 查询用户财务记录

- POST `swap-api/v1/swap_financial_record`

###  请求参数

参数名称                |  是否必须  |  类型   |  描述              |  取值范围       |
----------------------- | -------- | ------- | ------------------ | ------------------------------- |
contract_code | true | string | 合约代码   | 支持大小写，"BTC-USD"... |
type | false | string | 不填查询全部类型,【查询多类型中间用，隔开】 | 平多：3，平空：4，开仓手续费-吃单：5，开仓手续费-挂单：6，平仓手续费-吃单：7，平仓手续费-挂单：8，交割平多：9，交割平空：10，交割手续费：11，强制平多：12，强制平空：13，从币币转入：14，转出至币币：15，结算未实现盈亏-多仓：16，结算未实现盈亏-空仓：17，穿仓分摊：19，系统：26，活动奖励：28，返利：29，资金费-收入：30，资金费-支出：31, 转出到子账号合约账户: 34, 从子账号合约账户转入:35, 转出到母账号合约账户: 36, 从母账号合约账户转入: 37 |
create_date | false | int | 可随意输入正整数，如果参数超过90则默认查询90天的数据 |  |
page_index | false | int | 第几页,不填默认第一页 |  |
page_size | false | int | 不填默认20，不得多于50 |  |

> Response:

```json
  

{
	"status": "ok",
	"data": {
		"financial_record": [{
			"id": 192838272,
			"ts": 1408076414000,
			"symbol": "BTC",
			"contract_code": "BTC-USD",
			"type": 1,
			"amount": 1
		}],
		"total_page": 15,
		"current_page": 3,
		"total_size": 3
	},
	"ts": 1490759594752
}                              
                               
```

### 返回参数

参数名称                |   是否必须  |  类型   |  描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | ------------------------------- |
status | true | string | 请求处理结果   | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  | 字典类型 |  |
\<list\>(属性名称：financial_record) |  |  |  |  |
id | true  | long |  |  |
ts | true  | long | 创建时间 |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
type | true  | int | 交易类型 | 平多：3，平空：4，开仓手续费-吃单：5，开仓手续费-挂单：6，平仓手续费-吃单：7，平仓手续费-挂单：8，交割平多：9，交割平空：10，交割手续费：11，强制平多：12，强制平空：13，从币币转入：14，转出至币币：15，结算未实现盈亏-多仓：16，结算未实现盈亏-空仓：17，穿仓分摊：19，系统：26，活动奖励：28，返利：29，资金费-收入：30，资金费-支出：31  |
amount | true  | decimal | 金额 |  |
\</list\> |  |  |  |  |
total_page | true  | int | 总页数 |  |
current_page | true  | int | 当前页 |  |
total_size | true  | int | 总条数 |  |
\</list\> |  |  |  |  |

## 查询用户当前的下单量限制

- POST `swap-api/v1/swap_order_limit`


### 请求参数

  参数名称               |   是否必须   |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code   |  false  | string |  合约代码 | 支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约 |
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单,opponent_ioc"： 对手价-IOC下单，"lightning_ioc"：闪电平仓-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |

> Response:

```json

{
  "status": "ok",
  "data":  {
      "order_price_type": "limit",
      "list":[
      {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "open_limit": 3000.0,
          "close_limit": 3000.0
      }
      ]
   },
 "ts": 158797866555
}

```

### 返回参数

 参数名称                |  是否必须 |  类型  |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<dict\>(属性名称：data) |  |  |  |  |    
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单,opponent_ioc"： 对手价-IOC下单，"lightning_ioc"：闪电平仓-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
 \<list\>(属性名称：list) |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 open_limit | true | float | 合约开仓单笔下单量最大值 |  |
 close_limit | true | float | 合约平仓单笔下单量最大值 |  |
 \</list\>  |  |  |  |  |
 \</dict\> |  |  |  |  |

## 查询用户当前的手续费费率

- POST `swap-api/v1/swap_fee`

### 请求参数

  参数名称                |  是否必须 |  类型  |   描述             |  取值范围      |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  false  | string |  合约代码 |  支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "fee_asset": "BTC", 
      "open_maker_fee": "-0.00025",
      "open_taker_fee": "0.00075",
      "close_maker_fee": "-0.00025",
      "close_taker_fee": "0.00075"
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                |  是否必须  |  类型   |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<dict\>(属性名称：data) |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
 open_maker_fee | true | string | 开仓挂单的手续费费率，小数形式 | |
 open_taker_fee | true | string | 开仓吃单的手续费费率，小数形式 | |
 close_maker_fee | true | string | 平仓挂单的手续费费率，小数形式 | |
 close_taker_fee | true | string | 平仓吃单的手续费费率，小数形式 | |
 \</dict\>  |  |  |  |  |

## 查询用户当前的划转限制

- POST `swap-api/v1/swap_transfer_limit`

### 请求参数

  参数名称                |  是否必须  |  类型   |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code   |  false  | string |  合约代码 |  支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "transfer_in_max_each": 5000,
      "transfer_in_min_each": 5000,
      "transfer_out_max_each": 5000,
      "transfer_out_min_each": 5000,
      "transfer_in_max_daily": 5000,
      "transfer_out_max_daily": 5000,
      "net_transfer_in_max_daily": 5000,
      "net_transfer_out_max_daily": 5000
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                |  是否必须  |  类型  |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 transfer_in_max_each | true | decimal | 单笔最大转入量 |  |
 transfer_in_min_each | true | decimal | 单笔最小转入量 |  |
 transfer_out_max_each | true | decimal | 单笔最大转出量 |  |
 transfer_out_min_each | true | decimal | 单笔最小转出量 |  |
 transfer_in_max_daily | true | decimal | 单日累计最大转入量 |  |
 transfer_out_max_daily | true | decimal | 单日累计最大转出量 |  |
 net_transfer_in_max_daily | true | decimal | 单日累计最大净转入量 |  |
 net_transfer_out_max_daily | true | decimal | 单日累计最大净转出量 |  |
 \</data\>  |  |  |  |  |

## 用户持仓量限制的查询

- post `swap-api/v1/swap_position_limit`
  
### 请求参数

  参数名称               |  是否必须 |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code   |  false  | string |  合约代码 |  支持大小写，"BTC-USD"... ,如果缺省，默认返回所有合约  |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "buy_limit": 3000,
      "sell_limit": 3000
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                |   是否必须   |  类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<list\>(属性名称：data) |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
buy_limit | true | decimal | 合约多仓持仓的最大值，单位为张 |  |
sell_limit | true | decimal | 合约空仓持仓的最大值，单位为张 |  |
\</list\> |  |  |  |  |

## 母子账户划转

- post `/swap-api/v1/swap_master_sub_transfer`

> Request:

```json
{
	"sub_uid": "123123123",
	"contract_code": "BTC_USD",
	"amount": "123",
	"type": "master_to_sub"
}
```

### 请求参数

| 参数名称   | 是否必须  | 类型     | 描述   | 取值范围    |
| ------ | ----- | ------ | ---- | ---------------------------- |
| sub_uid | true | long | 子账号uid	 |  |
| contract_code | true | string | 品种代码 | 支持大小写,"BTC-USD"... |
| amount | true | decimal | 划转金额 ||
| type | true | string | 划转类型 | master_to_sub：母账户划转到子账户， sub_to_master：子账户划转到母账户 |

- 备注：
  母账户与每个子账户相互划转限频10次/分钟。
  
> Response:

```json
{
 "data": {
  "order_id": "695340410205380608"
 },
 "status": "ok",
 "ts": 1585823672620
}

```

### 返回参数

| 参数名称          | 是否必须 | 类型      | 描述              | 取值范围                                     |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  object        |      |   |
| order_id        | true | string  | 划转订单ID            |  |
| \</data\>     |      |         |         |   |

## 获取母账户下的所有母子账户划转记录

- post `/swap-api/v1/swap_master_sub_transfer_record`

> Request:

```json
{
	"sub_uid": "123123123",
	"contract_code": "BTC_USD",
	"amount": "123",
	"type": "master_to_sub"
}
```

### 请求参数

| 参数名称   | 是否必须  | 类型     | 描述   | 取值范围      |
| ------ | ----- | ------ | ---- | ---------------------------- |
| contract_code | true | string | 品种代码 | 支持大小写,"BTC_USD",... |
| transfer_type | false | string | 划转类型，不填查询全部类型,【查询多类型中间用，隔开】 | 34:转出到子账号合约账户 35:从子账号合约账户转入  |
| create_date | true | int | 日期 | 可随意输入正整数，如果参数超过90则默认查询90天的数据 |
| page_index | false | int | 页码，不填默认第1页 | 1 |
| page_size | false | int | 不填默认20，不得多于50 | 20 |

> Response:

```json
{
 "data": {
  "current_page": 1,
  "total_page": 1,
  "total_size": 7,
  "transfer_record": [{
    "amount": 0.01,
    "contract_code": "BTC-USD",
    "id": 1660214269,
    "sub_account_name": "feyondtest01",
    "sub_uid": "1566233",
    "symbol": "BTC",
    "transfer_type": 35,
    "ts": 1585823672602
   }
  ]
 },
 "status": "ok",
 "ts": 1585823674006
}
```

### 返回参数

| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  object        |      |   |
| \<transfer_record\>      | true     |  object array      |      |   |
| id        | true | long  | 划转订单ID            |  |
| ts        | true | long  | 创建时间            |  |
| symbol        | true | string  | 品种  |"BTC","ETH"...  |
| contract_code | true | string | 品种代码 | "BTC_USD",... |
| sub_uid        | true | string  | 子账户UID            |  |
| sub_account_name        | true | string  | 子账户登录名            |  |
| transfer_type        | true | int  | 划转类型            | 从子账号合约账户转入：35，转出到子账号合约账户:34 |
| amount        | true | decimal  | 金额            |  |
| \</transfer_record\>     |      |         |         |   |
| total_page        | true | int  | 总页数            |  |
| current_page        | true | int  | 当前页            |  |
| total_size        | true | int  | 总条数            |  |
| \</data\>     |      |         |         |   |




## 获取用户的API指标禁用信息

- get `/swap-api/v1/swap_api_trading_status`


### 请求参数
 
 无
### Response:

| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status | true | string | 请求处理结果	 | "ok" , "error" |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |
| \<data\> |  | dict类型 |  |  |
| is_disable | true  | int | 是否被禁用 | 1：被禁用中，0：没有被禁用 |
| order_price_types | true | string | 触发禁用的订单价格类型，多个订单价格类型以英文逗号分割，例如：“limit,post_only,FOK,IOC” | 包含的类型有："limit":限价，"opponent":对手价，"post_only":只做maker单，optimal_5：最优5档，optimal_10：最优10档，optimal_20：最优20档，ioc:IOC订单，fok：FOK订单，"lightning"：闪电平仓，"lightning_ioc"：闪电平仓-IOC，"lightning_fok"：闪电平仓-FOK，“opponent_ioc”：对手价-IOC，"optimal_5_ioc"：最优5档-IOC，"optimal_10_ioc"：最优10档-IOC，"optimal_20_ioc"：最优20档-IOC，“opponent_fok”：对手价-FOK，"optimal_5_fok"：最优5档-FOK，"optimal_10_fok"：最优10档-FOK，"optimal_20_fok"：最优20档-FOK |
| disable_reason | true  | string | 触发禁用的原因，表示当前的禁用是由哪个指标触发 | "COR":撤单率（Cancel Order Ratio），“TDN”：总禁用次数（Total  Disable Number） |
| disable_interval | true | long | 禁用时间间隔，单位：毫秒 |  |
| recovery_time | true | long | 计划恢复时间，单位：毫秒 |  |
| \<COR\> |  | 字典类型 | 表示撤单率的指标（Cancel Order Ratio） |  |
| orders_threshold | true  | long | 委托单笔数的阈值 |  |
| orders | true  | long | 用户委托单笔数的实际值 |  |
| invalid_cancel_orders | true  | long | 用户委托单中的无效撤单笔数 |  |
| cancel_ratio_threshold | true  | decimal | 撤单率的阈值 |  |
| cancel_ratio | true  | decimal | 用户撤单率的实际值 |  |
| is_trigger | true  | int | 用户是否触发该指标 | 1：已经触发，0：没有触发 |
| is_active | true  | int | 该指标是否开启 | 1：已启用，0：未启用 |
| \</COR\> |  |  |  |  |
| </TDN\> |  | 字典类型 | 表示总禁用次数的指标（Total  Disable Number） |  |
| disables_threshold | true  | long | 总禁用次数的阈值 |  |
| disables | true  | long | 总禁用次数的实际值 |  |
| is_trigger | true  | int | 用户是否触发该指标 | 1：已经触发，0：没有触发 |
| is_active | true  | int | 该指标是否开启 | 1：已启用，0：未启用 |
| \</TDN\> |  |  |  |  |
| \</data\> |  |  |  |  |


 > 例子：
 
 ```json
  {
  "status": "ok",
  "data":
  [{
      "is_disable": 1,   //是否被禁用
      "order_price_types": “limit,post_only,FOK,IOC”,  // 触发禁用的订单价格类型
      "disable_reason":"COR",  // 触发禁用的原因
      "disable_interval": 5,  // 禁用时间间隔
      "recovery_time": 1, // 计划恢复时间
      "COR":  //撤单率的指标（Cancel Order Ratio）
       {
           "orders_threshold": 150,  //委托单笔数的阈值
           "orders": 150,  //用户委托单笔数的实际值
           "invalid_cancel_orders": 150,  //委托单中的无效撤单笔数 
           "cancel_ratio_threshold": 0.98,   //撤单率的阈值
           "cancel_ratio": 0.98,   //用户撤单率的实际值
           "is_trigger": 1,  //用户是否触发该指标
           "is_active": 1   //该指标是否开启
      } ,
      "TDN":  //总禁用次数的指标（Total  Disable Number）
       {
           "disables_threshold": 3,  //总禁用次数的阈值
           "disables": 3,  /总禁用次数的实际值
           "is_trigger": 1,  //用户是否触发该指标
           "is_active": 1   //该指标是否开启
      } 
   }],
 "ts": 158797866555
}

 ```



# 合约交易接口

## 合约下单 

###  示例

- POST  `swap-api/v1/swap_order`


###  请求参数

参数名  |  参数类型    |  必填   |  描述  |
-------------------- |  -------------- |  ----------  | ---------------------------------------------------------------  |
contract_code  |  string   |  true   |  合约代码,支持大小写,"BTC-USD"  |
client_order_id |   long  |  false  |  客户自己填写和维护，必须为数字  |
price  |  decimal  |   true  |  价格  |
volume  |    long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |    string  |    true  |  "open":开 "close":平  |
lever_rate  |  int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单;首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)]  |
order_price_type |  string  |    true  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，"fok":FOK订单，"ioc":IOC订单, opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单  |

###  备注

对手价下单price价格参数不用传，对手价下单价格是买一和卖一价,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单price价格参数不用传，"limit":限价，"post_only":只做maker单 需要传价格。


###   开平方向

开多：买入开多(direction用buy、offset用open)

平多：卖出平多(direction用sell、offset用close)

开空：卖出开空(direction用sell、offset用open)

平空：买入平空(direction用buy、offset用close)

> Response:

```json

    {
      "status": "ok",
      "data": {
	      	"order_id": 88,
	      	"order_id_str": "88"
	      },
      "ts": 158797866555
    }
    
```

###  返回参数

参数名称  |   是否必须   |  类型   |  描述  |  取值范围  |
------------------- | -------------- | ---------- | -------------------------------------------- | ---------------- |
status  |   true  |  string  |  请求处理结果  |  "ok" , "error"  |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
client_order_id  | true  |  long  |  用户下单时填写的客户端订单ID，没填则不返回  | 
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |    |   


## 合约批量下单 


###  示例

- POST  `swap-api/v1/swap_batchorder`

###  请求参数

参数名  |    参数类型   |  必填   |  描述  |
---------------------------------- | -------------- |  ---------- | -------------------------------------------------------------- |
orders_data  | List\<Object\>   |    |    |  

- orders_data对象参数详情

参数名  |    参数类型   |  必填   |  描述  |
---------------------------------- | -------------- |  ---------- | -------------------------------------------------------------- |
contract_code  |  string   |  true   |  合约代码,支持大小写,"BTC-USD"  |
client_order_id  |  long  |  false  |  客户自己填写和维护，必须为数字  |
price  |  decimal  |   true  |  价格  |
volume  |  long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |  string  |    true  |  "open":开 "close":平  |
lever_rate  |   int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单;首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)]  |
order_price_type |  string  |    true  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，"fok":FOK订单，"ioc":IOC订单, opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单  |

###  备注

对手价下单price价格参数不用传，对手价下单价格是买一和卖一价,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单price价格参数不用传，"limit":限价，"post_only":只做maker单 需要传价格。

一次最多允许10个订单。

> Response:

```json

  {
 "data": {
   "errors": [{
   "err_code": 1037,
   "err_msg": "倍数不符合要求",
   "index": 2
  }],
  "success": [{
   "index": 1,
   "order_id": 695342621643776000,
   "order_id_str": "695342621643776000"
  }]
 },
 "status": "ok",
 "ts": 1585824199847
}
    
```

###  返回参数

参数名称  |  是否必须   |  类型   |  描述  |  取值范围  |
----------------------------- | -------------- | ---------- | -------------------------------------------- | ---------------- |
status  |   true  |  string  |  请求处理结果  | "ok" , "error"  |
\<list\>(属性名称: errors)  |    |    |    |     |
index  |    true  |  int  |   订单索引  |    |
err_code  |  true  |  int  |   错误码  |    |
err_msg  | true  |  string  |  错误信息  |    |
\</list\>  |    |    |    |     |
\<list\>(属性名称: success)  |    |    |    |     |
index  |    true  |  int  |   订单索引  |    |
order_id  |  true  |  long  |  订单ID  |    |
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    |  
client_order_id  |  true  |  long  |  用户下单时填写的客户端订单ID，没填则不返回  | 
\</list\>  |    |    |    |    |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |

## 撤销订单 

###  示例

- POST `swap-api/v1/swap_cancel`

###  请求参数

参数名称  |   是否必须   |  类型   |  描述  |
------------------- | -------------- | ---------- | -------------------------------------------------------------- |
order_id |  false  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单)  |
client_order_id  |  false  |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单)  |
contract_code  |  true   |  string   |  合约代码,支持大小写,"BTC-USD"  |

###备注：

order_id和client_order_id都可以用来撤单，同时只可以设置其中一种，如果设置了两种，默认以order_id来撤单。

撤单接口返回结果只代表撤单命令发送成功，建议根据订单查询接口查询订单的状态来确定订单是否已真正撤销。

> Response:

```json
{
	"status": "ok",
	"data": {
		"errors": [{
			"order_id": "123456",
			"err_code": 1071,
			"err_msg": "Repeated withdraw."
		}],
		"successes": ""
	},
	"ts": 1586777833717
}
```

###  返回参数

参数名称  |  是否必须  |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | -------------------------------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<dict\>(属性名称: data)  |    |    |    |    |  
\<list\>(属性名称: errors)  |    |    |    |    |  
order_id  |    true  |  string  |  订单ID  |    |   
err_code  |   true  |  int  |   错误码  |    |   
err_msg  |  true  |  string  |  错误信息  |    | 
\</list\>  |    |    |    |    |
successes  |   true  |  string  |  撤销成功的订单的order_id或client_order_id列表  |   |
\</data\>  |    |    |    |    |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |   |


## 全部撤单 

###  示例

- POST  `swap-api/v1/swap_cancelall`

###  请求参数

参数名称    |  是否必须    |  类型    |  描述  |
-------------- | -------------- | ---------- | ---------------------------- |
contract_code  |  true   |  string   |  合约代码,仅支持大写，"BTC-USD"  |

> Response:(多笔订单返回结果(成功订单ID,失败订单ID))

```json
{
	"status": "ok",
	"data": {
		"errors": [{
			"order_id": "123456",
			"err_code": 1071,
			"err_msg": "Repeated withdraw."
		}],
		"successes": ""
	},
	"ts": 1586777833717
}
    
```

###  返回参数

参数名称  |  是否必须   |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | ---------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<dict\>(属性名称: data)  |    |    |    |    |
\<list\>(属性名称: errors)  |    |    |    |    |
order_id  |    true  |  string  |  订单id  |   | 
err_code  |    true  |  int  |   订单失败错误码  |   |   
err_msg  |  true  |  string  |   订单失败信息  |    | 
\</list\>    |    |    |    |    |
successes  |    true  |  string  |  成功的订单  |    |   
\</data\>    |    |    |    |    |
ts  | true  |  long  |  响应生成时间点，单位：毫秒  |   | 


## 获取合约订单信息

###  示例

- POST  `swap-api/v1/swap_order_info`

###  请求参数

参数名称  |    是否必须    |  类型    |  描述  |
------------------- | -------------- | ---------- | ------------------------------------------------------------- |
order_id  |  false  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
client_order_id   |  false  |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
contract_code  |  true   |  string   |  合约代码,支持大小写,"BTC-USD"  |

###  备注：

最多只能查询24小时内的撤单信息。

order_id和client_order_id都可以用来查询，同时只可以设置其中一种，如果设置了两种，默认以order_id来查询。结算后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。

> Response:

```json
{
 "data": [{
  "client_order_id": null,
  "contract_code": "BTC-USD",
  "created_at": 1585824063859,
  "direction": "buy",
  "fee": 0,
  "fee_asset": "BTC",
  "lever_rate": 10,
  "margin_frozen": 0.0,
  "offset": "open",
  "order_id": 695342051289735168,
  "order_id_str": "695342051289735168",
  "order_price_type": "limit",
  "order_source": "api",
  "order_type": 1,
  "price": 100,
  "profit": 0,
  "status": 7,
  "symbol": "BTC",
  "trade_avg_price": null,
  "trade_turnover": 0,
  "trade_volume": 0,
  "volume": 1
 }],
 "status": "ok",
 "ts": 1585824542208
}
    
```

###  返回数据

  参数名称  |    是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- | -------------- | ---------- | --------------------------------------------------------------------------------------------  | ---------------------------------------------------- |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<dict\>(属性名称: data)  |    |    |    |    | 
symbol  |  true  |  string  |  品种代码  |    |  
contract_code  |  true  |  string  |  合约代码  | "BTC-USD" ...  |
volume  |  true  |  decimal    |  委托数量  |    | 
price   |  true  |  decimal    |  委托价格  |    | 
order_price_type  |    true  |  string  |  订单报价类型  | 订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制  |  
direction  |  true  |  string  |  买卖方向  |  "buy":买 "sell":卖  |
offset  |  true  |  string  |  开平方向 |  "open":开 "close":平  |
lever_rate  |  true  |  int  |   杠杆倍数  |  1\\5\\10\\20  |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
client_order_id  |  true  |  long  |  客户订单ID  |    |  
created_at  |  true  |  long  |  创建时间  |    |
trade_volume    |  true  |  decimal  |    成交数量  |    |
trade_turnover  |  true  |  decimal  |   成交总金额  |    |    
fee  |   true  |  decimal  |     手续费  |     |   
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
trade_avg_price  |  true  |  decimal  |    成交均价  |    | 
margin_frozen    |  true  |  decimal  |    冻结保证金  |     |   
profit  |  true  |  decimal  |    收益  |    |
status  |  true  |  int  |   订单状态  |  (1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 10失败 11撤单中)  |  
order_type    |  true  |  int  |  订单类型  |    1:报单 、 2:撤单 、 3:强平、4:交割              |
order_source  |  true  |  string  |  订单来源  |  （1:system、2:web、3:api、4:m 5:risk、6:settlement） |   
\</dict\>  |    |    |    |    |
ts  |    true  |  long  |  时间戳  |  |   



## 获取订单明细信息

###  示例

- POST `swap-api/v1/swap_order_detail`

###  请求参数

参数名称    |  是否必须     |  类型    |  描述  |
-------------- | -------------- | ---------- | ------------------------ |
contract_code  |  true   |  string   |  合约代码,支持大小写,"BTC-USD"  |
order_id  | true  |  long  |   订单id  |
created_at  |  false  |  long  |   下单时间戳  |
order_type  |  true  |  int  |   订单类型，1:报单 、 2:撤单 、 3:强平、4:交割  |
page_index  |    false  |  int  |   第几页,不填第一页  |
page_size  |  false  |  int  |   不填默认20，不得多于50  |

### 备注

获取订单明细接口查询撤单数据时，如果传“created_at”和“order_type”参数则能查询最近90天数据，如果不传“created_at”和“order_type”参数只能查询到最近24小时数据。

order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从swap_order下单接口返回的ts中获取时间戳查询对应的订单。

created_at禁止传0。


> Response:

```json

    {
      "status": "ok",
      "data":{
        "symbol": "BTC",
        "contract_code": "BTC-USD",
        "volume": 111,
        "price": 1111,
        "order_price_type": "limit",
        "direction": "buy",
        "offset": "open",
        "lever_rate": 10,
        "margin_frozen": 10,
        "profit": 10,
        "order_source": "web",
        "created_at": 1408076414000,
        "canceled_at": 1408076414000,
        "instrument_price" : 10000,
        "final_interest" : 0,
        "adjust_value" : 0,
        "trades":[
          {
            "trade_id":112,
            "id": "1232-213123-1231",
            "trade_volume":1,
            "trade_price":123.4555,
            "trade_fee":0.234,
            "fee_asset": "BTC", 
            "trade_turnover":34.123,
            "role": "maker",
            "created_at": 1490759594752
          }
        ],
        "total_page":15,
        "total_size":3,
        "current_page":3
        },
      "ts": 1490759594752
    }
    
```

>错误:

```json

    {
     "status":"error",
     "err_code":20029,
     "err_msg": "invalid contract_code",
     "ts": 1490759594752
    }
    
```

###  返回数据

参数名称  |  是否必须   |  类型   |  描述  |  取值范围  |
----------------------------- | -------------- | ---------- | --------------------------------------------- | ------------------------------------------------------ |
status  |   true  |  string  |  请求处理结果  | "ok" , "error"  |
\<dict\> (属性名称: data)  |    |    |    |    | 
symbol  |   true  |  string  |  品种代码  |    | 
contract_code  |  true  |  string  |  合约代码  |  "BTC-USD" ...  |
lever_rate  |   true  |  int  |   杠杆倍数  |  1\5\10\20  |
direction  |  true  |  string  |  买卖方向  | "buy":买 "sell":卖 |  
offset  |     true  |  string  | 开平方向 |  "open":开 "close":平  |
volume  |     true  |  decimal    |  委托数量  |    | 
price  |      true  |  decimal    |  委托价格  |    | 
created_at  |   true  |  long    |    创建时间  |    |
canceled_at  |   true  |  long    |    撤单时间  |    |
order_source  | true  |  string  |  订单来源  |   | 
order_price_type  | true  |  string  |  订单报价类型  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制   |  
margin_frozen  |  true  |  decimal    |  冻结保证金  |    |    
profit  |   true  |  decimal    |  收益  |     |
total_page  |   true  |  int  |   总共页数  |    |
current_page  | true  |  int  |   当前页数  |    | 
total_size  |   true  |  int  |   总条数  |    |   
instrument_price  |   true  |  decimal  |   爆仓单合约价格  |    |   
final_interest  |   true  |  decimal  |   爆仓时合约权益  |    |   
adjust_value  |   true  |  decimal  |   爆仓时调整系数  |    |   
fee  |   true  |  decimal  |   所有成交的手续费之和  |    |   
fee_asset  |   true  |  string  |   表示手续费币种  |    |   
| liquidation_type              | true | string     | 强平类型 0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管      
\<list\> (属性名称: trades)  |    |    |    |    | 
trade_id  |  true  |  long  |    |  与swap-api/v1/swap_matchresults返回结果中的match_id一样，是撮合结果id， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id  |  
id     | true     | string    | 全局唯一的交易标识               |              |  
trade_price  |  true  |  decimal  |  撮合价格  |    |
trade_volume  | true  |  decimal  |  成交量  |    |  
trade_turnover  |    true  |  decimal  |  成交金额  |    | 
trade_fee  |   true  |  decimal  |  成交手续费  |    |   
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... | 
role  |   true  |  string  |  taker或maker  |   | 
created_at  |   true  |  long  |  创建时间  |    | 
\</list\>  |    |    |    |    |   
\</dict \>  |    |     |    |    |
ts  |  true  |  long  |  时间戳  |     |


## 获取合约当前未成交委托 

###  示例

- POST `swap-api/v1/swap_openorders`  

###  请求参数

  参数名称   |  是否必须    |  类型    |  描述  |  默认值    |  取值范围  |
-------------- | -------------- | ---------- | ------------------------ | ------------ | ---------------- |
contract_code  |  true   |  string   |  合约代码   |  支持大小写,"BTC-USD" ...  |
page_index   |  false  |  int  |   页码，不填默认第1页  |  1  |     |
page_size  |  false  |  int  |    |    |  不填默认20，不得多于50 |

> Response:

```json

    {
      "status": "ok",
      "data":{
        "orders":[
          {
             "symbol": "BTC",
             "contract_code": "BTC-USD",
             "volume": 111,
             "price": 1111,
             "order_price_type": "limit",
             "order_type": 1,
             "direction": "buy",
             "offset": "open",
             "lever_rate": 10,
             "order_id": 106837,
             "order_id_str": "88",
             "client_order_id": 10683,
             "order_source": "web",
             "created_at": 1408076414000,
             "trade_volume": 1,
             "trade_turnover": 1200,
             "fee": 0,
             "fee_asset": "BTC", 
             "trade_avg_price": 10,
             "margin_frozen": 10,
             "status": 1,
             "profit": 1.231
            }
           ],
        "total_page":15,
        "current_page":3,
        "total_size":3
       },
      "ts": 1490759594752
    }
    
```

###  返回参数

参数名称  |   是否必须  |  类型   |  描述  |   取值范围  |
-------------------------- | -------------- | ---------- | --------------------------------------------------------------- | ------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |    |
\<dict\>(属性名称: data)  |    |    |    |    |   
symbol  |  true  |  string  |  品种代码  |    |  
contract_code  |  true  |  string  |  合约代码  |  "BTC-USD" ...  |
volume  |  true  |  decimal    |  委托数量  |    |
price   |  true  |  decimal    |  委托价格  |    |   
order_price_type  |    true  |  string  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制  |
order_type  |    true  |  int  |  订单类型，1:报单 、 2:撤单 、 3:强平、4:交割  |
direction  |  true  |  string  |  "buy":买 "sell":卖  |    |   
offset  |  true  |  string  |  "open":开 "close":平  |    |  
lever_rate  |  true  |  int  |   杠杆倍数  |   1\\5\\10\\20  |
order_id  |  true  |  long  |  订单ID  |    |
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
client_order_id  |  true  |  long  |  客户订单ID  |    |
created_at  |  true  |  long  |  订单创建时间  |    |
trade_volume  |   true  |  decimal    |  成交数量  |    |  
trade_turnover  | true  |  decimal    |  成交总金额  |     | 
fee  |   true  |  decimal    |  手续费  |    |
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
trade_avg_price  |  true |  decimal    |  成交均价  |    |  
margin_frozen  |  true  |  decimal    |  冻结保证金  |    | 
profit  |  true  |  decimal   | 收益  |    |  
status  |  true  |  int  |   订单状态  |  (3未成交 4部分成交 5部分成交已撤单 6全部成交 7已撤单)  |  
order_source|   true  |  string  |  订单来源|    |
\</dict\>  |    |    |    |    |
total_page  |  true  |  int  |   总页数  |    |
current_page  |   true  |  int  |   当前页  |    |
total_size  |  true  |  int  |   总条数  |    |
ts  |    true  |  long  |  时间戳  |    |


## 获取合约历史委托

###  示例

- POST `swap-api/v1/swap_hisorders` 

###  请求参数

参数名称   |  是否必须   |  类型    |  描述  |  默认值    |  取值范围  |
-------------- | -------------- | ---------- |------------------------ | ------------ | ------------------------------------------------------------------------------------------------------ |
contract_code  |  true   |  string   |  合约代码   |  支持大小写,"BTC-USD" ...  |
trade_type  |   true  |  int  |   交易类型  |    0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平,7:交割平多,8: 交割平空, 11:减仓平多，12:减仓平空  |
type  |  true  |  int  |   类型  |  1:所有订单,2:结束状态的订单  |
status  |    true  |  string  |   订单状态  |  可查询多个状态，"3,4,5" , 0:全部,3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单  |
create_date |  true  |  int  |   日期  |   可随意输入正整数，如果参数超过90则默认查询90天的数据 |
page_index  |  false  |  int  |   |  页码，不填默认第1页  |  1  | 
page_size  |  false  |  int   |  每页条数，不填默认20  |  20  | 不得多于50  |

### 备注：

历史委托查询接口查询撤单信息，只能查询最近24小时内的撤单信息。

> Response:

```json
{
	"status": "ok",
	"data": {
		"orders": [{
			"order_id": 699204501151698944,
			"contract_code": "BTC-USD",
			"symbol": "BTC",
			"lever_rate": 20,
			"direction": "sell",
			"offset": "open",
			"volume": 1,
			"price": 9999.1,
			"create_date": 1586744943666,
			"order_source": "api",
			"order_price_type": 1,
			"order_type": 1,
			"margin_frozen": 0,
			"profit": 0,
			"trade_volume": 0,
			"trade_turnover": 0,
			"fee": 0,
			"trade_avg_price": 0,
			"status": 3,
			"order_id_str": "699204501151698944",
			"fee_asset": "BTC",
			"liquidation_type": "0"
		}],
		"total_page": 1,
		"current_page": 1,
		"total_size": 1
	},
	"ts": 1586751989809
}
```

###  返回参数

参数名称  |  是否必须   |  类型    |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | --------------------------------------------- | ------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |    |  
\<dict\>(属性名称: data)  |    |    |    |    | 
\<list\>(属性名称: orders)  |    |    |    |    | 
order_id  |    true  |  long  |  订单ID  |  
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
symbol  |  true  |  string  |  品种代码  |
contract_code  |    true  |  string  |  合约代码  | "BTC-USD" ...  |
lever_rate  |  true  |  int  |   杠杆倍数  |  1\\5\\10\\20  |
direction  |    true  |  string  | 买卖方向 |  "buy":买 "sell":卖  |  
offset  |  true  |  string  |  开平方向  |  "open":开 "close":平  |
volume  |  true  |  int    |  委托数量  |    |
price  |   true  |  decimal    |  委托价格  |    | 
create_date   |  true  |  long    |  创建时间  |    | 
order_source  |  true  |  string  |  订单来源  |    | 
order_price_type  |  true  |  int  |  订单报价类型 |  1：限价单，3：对手价，4：闪电平仓，5：计划委托，6：post_only |  
margin_frozen  |    true  |  decimal    |  冻结保证金  |    |    
profit  |  true  |  decimal    |  收益  |    |
trade_volume  |  true  |  decimal    |  成交数量  |    | 
trade_turnover  |   true  |decimal    |  成交总金额  |    |    
fee  |  true  |  decimal    |  手续费  |    |   
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
trade_avg_price  | true  |  decimal    |  成交均价  |    | 
status  |  true  |  int  |   订单状态  |    | 
order_type  |  true  |  int  |   订单类型  |  1:报单 、 2:撤单 、 3:强平、4:交割  |
| liquidation_type              | true | string     | 强平类型 0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管      
\</list\>  |    |    |     |     |  
\</dict\>|    |    |     |     |
total_page    |  true  |  int  |   总页数  |   |   
current_page  |  true  |  int  |   当前页  |   |   
total_size  |  true  |  int  |   总条数  |    |  
ts  |  true  |  long  |  时间戳  |    |  

## 获取历史成交记录

### 实例

- POST `swap-api/v1/swap_matchresults`

### 请求参数

 参数名称    | 是否必须 | 类型 |  描述        |  默认值 | 取值范围                             |
 ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
 contract_code  |  true   |  string   |  合约代码   |  支持大小写，"BTC-USD" ...  |
 trade_type  | true     | int    | 交易类型          |         | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平 |
 create_date | true     | int    | 日期            |         | 可随意输入正整数，如果参数超过90则默认查询90天的数据 |
 page_index  | false    | int    | 页码，不填默认第1页    | 1       |                                          |
 page_size   | false    | int    | 不填默认20，不得多于50 | 20      |                                          |

> Response: 

```json

{                                               
    "data": {                                      
 		"current_page": 1,                              
 		"total_page": 1,
 		"total_size": 2,                                
		"trades": [{
			"contract_code": "BTC-USD",
      "create_date": 1555553626736,
			"direction": "sell",
			"match_id": 3635853382,
      "id": "1232-213123-1231",
			"offset": "close",
			"offset_profitloss": 0.15646398812252696,
			"order_id": 1118,
			"order_id_str": "88",
			"symbol": "BTC",
      "order_source": "android",
			"trade_fee": -0.002897500905469032,
      "fee_asset": "BTC", 
			"trade_price": 5.522,
			"trade_turnover": 80,
			"role": "maker",
			"trade_volume": 8
		}]                                        
 	},                                                
 	"status": "ok",                                   
 	"ts": 1555654870867                               
}                
                               
```

### 返回参数

 参数名称              |  是否必须 |  类型  |  描述             |  取值范围     |
 ---------------------- | -------- | ------- | ------------------ | ------------ |
 status                 | true     | string  | 请求处理结果             |              |
 \<dict\>(属性名称: data) |          |         |                    |              |
 \<list\>(属性名称: trades) |          |         |                    |              |
 match_id               | true     | long    | 撮合结果id, 与订单ws推送orders.$symbol推送结果中的trade_id是相同的，非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id               |              |
 id               | true     | string    | 全局唯一的交易标识               |              |
 order_id               | true     | long    | 订单ID               |              |
 order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
 symbol                 | true     | string  | 品种代码               |              |
 order_source                 | true     | string  | 订单来源               |              |
 contract_code          | true     | string  | 合约代码               |  "BTC-USD" ...       |
 direction              | true     | string  | "buy":买 "sell":卖         |              |
 offset                 | true     | string  | "open":开 "close":平           |              |
 trade_volume           | true     | int | 成交数量               |              |
 trade_price                  | true     | decimal | 成交价格               |              |
 trade_turnover                  | true     | int | 成交总金额               |              |
 create_date            | true     | long    | 成交时间               |              |
 offset_profitloss                 | true     | decimal | 平仓盈亏                 |              |
 trade_fee                    | true     | decimal | 成交手续费                |              |
 fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
 role                   |   true    |       string  |  taker或maker  |         |
 \</list\>              |          |         |                    |              |
 total_page             | true     | int     | 总页数                |              |
 current_page           | true     | int     | 当前页                |              |
 total_size             | true     | int     | 总条数                |              |
 \</dict\>            |          |         |                    |              |
 ts                     | true     | long    | 时间戳                |              |

### 备注

- 如果不传page_index和page_size，默认只查第一页的20条数据，详情请看参数说明:

## 闪电平仓下单

- POST `swap-api/v1/swap_lightning_close_position`

### 请求参数

   参数名称                |   是否必须  |   类型  |    描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code  |  true   |  string   |  合约代码   |  支持大小写,"BTC-USD" ...  |
 volume | true | int | 委托数量（张） |  |
 direction | true | String | “buy”:买，“sell”:卖 |  |
 client_order_id | false | long | （API）客户自己填写和维护，必须保持唯一 |  |
| order_price_type | false | string | 订单报价类型 |不填，默认为“闪电平仓”，"lightning"：闪电平仓，"lightning_fok"：闪电平仓-FOK,"lightning_ioc"：闪电平仓-IOC |
> Response:

```json

{
  "status": "ok",
  "data": {
    "order_id": 986,
    "order_id_str": "88",
    "client_order_id": 9086
  },
  "ts": 158797866555
}

```


### 返回参数

  参数名称                |   是否必须  |  类型   |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果	 | "ok" :成功, "error"：失败 |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<dict\>(属性名称: data) |  |  |  | 字典 |
order_id | true  | long | 订单ID[用户级别的，不同的用户order_id可能相同] |  |
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
client_order_id | false | long | 用户自己的订单id |  |
\</dict\> |  |  |  |  |


> 错误信息：

```json

{
    "status": "error",
    "err_code": 20012,
    "err_msg": "invalid contract_code",
    "ts": 1490759594752
}

```



# 永续合约划转接口

## 现货-永续合约账户间进行资金的划转

### 实例

- POST `https://api.huobi.pro/v2/account/transfer`

### 备注

此接口用户币币现货账户与永续合约账户之间的资金划转。

该接口的访问频次的限制为1分钟10次。

注意：请求地址为火币Global地址

现货与永续合约划转接口，所有划转的币的精度是8位小数。

### 请求参数

  参数名称   |  是否必须    |  类型   |  描述      |  取值范围  |
--------------  | --------------  | ---------- |  ------------------------  |  ------------------------------------------------------------------------------------------------------  |
from  |    true  |  string  |  来源业务线账户，取值：spot(币币)、swap(反向永续)  |   e.g. spot  |
to  |    true  |  string  |  目标业务线账户，取值：spot(币币)、swap(反向永续)  |   e.g. swap  |
currency  |    true  |  string  |  币种,支持大小写  |   e.g. btc  |
amount  |   true  |  Decimal  |   划转金额  |      |

> Response:

```
  正确的返回：
   {
   "code":200,
   "data":113423809,
   "message":"Succeed",
   "success":true
   }

	错误的返回：
  {
    "code":1303,
    "data":null,
    "message":"The single transfer-out amount must be no less than 0.0008BTC",
    "success":false}

```

###  返回参数

参数名称  |  是否必须     |  类型    |  描述  |  取值范围  |
------------------ |  -------------- |  ---------- |  ---------------------  |  -----------------------------  |
code  |  true  |   long  |  响应码  |    |  
success  |    true  |   boolean    |    true/false  |  |
message  |    true  |   string    |     响应消息  |  |
data  |    true  |   long    |     划转流水ID |  |


## 响应码列表

响应码 | 中文说明 |  英文说明  | 
------------------------------------  |  --------------------------------  |  ------------------------- |
|200 | 成功 | Succeed |
|403| 拒绝访问 | Access denied |
|404|访问的资源不存在 | The resource being accessed does not exist|
|429|太多的请求 | too many requests|
|500|系统错误 | System error |
|501|无效请求 |Invalid request|
|502|无效参数 | Invalid parameter | 
|504|缺少参数 | Lack of parameter |
|512|拒绝匿名请求 | Reject anonymous requests |
|513|无效的签名 | Invalid signature | 
|10000|币种不存在 | Currency does not exist |
|10001|不支持同业务划转 | Does not support  transfer within single business|
|10002|不支持此划转业务 | This transfer is not supported| 
|10003|from方check校验不通过 | check rejected by the from party|
|10004|to方check校验不通过 |to check rejected by the to party|
|10005|个人账户平账检查不通过  | Personal account balance check failed |
|10006|系统账户检查失败 | System account check failed|
|10008|黑名单校验不通过 | Blacklist check failed|
|10009|用户有未安全上账资产，禁止划转 | No transfer is allowed if the user has any asset that has not been charged to the account safely |
|10010|用户被锁定 | User locked
|10011|24小时内修改过安全策略 | Security policy has been modified within 24 hours
|20001|OTC 人脸识别   | OTC Face Recognition 
|1030 | 服务异常，请稍后再试 | Abnormal service. Please try again later.
|1010 | 用户不存在 | Abnormal service. Please try again later.
| 1012 | 账户不存在 | Abnormal service. Please contact customer service.
| 1013 | 合约品种不存在 | This contract type doesn't exist.
| 1018 | 主账号不存在 | Main account doesn't exist.
| 1089 | {0}合约暂时限制划转,请联系客服  | {0} contract is restricted of transfer.  Please contact customer service.
| 1102 | 您没有转入权限,请联系客服 |  Unable to transfer in currently. Please contact customer service.
| 1103 | 您没有转出权限,请联系客服 | Unable to transfer out currently. Please contact customer service.
| 1106 | 合约状态异常,暂时无法划转 | Abnormal contracts status. Can’t transfer.
| 1111 | 子账号没有转入权限,请联系客服 | Sub-account doesn't own the permissions to transfer in. Please contact customer service.
| 1112 | 子账号没有转出权限,请联系客服 |  sub-account doesn't own the permissions to transfer out. Please contact customer service.
| 1114 | 子账号没有划转权限,请登录主账号授权 | The sub-account does not have transfer permissions. Please login main account to authorize.
| 1300 | 划转失败 | Transfer failed.
| 1301 | 可划转余额不足 | Insufficient amount available.
| 1302 | 系统划转错误 | Transfer failed.
| 1303 | 单笔转出的数量不能低于{0}{1} | The single transfer-out amount must be no less than {0}{1}.
| 1304 | 单笔转出的数量不能高于{0}{1} | The single transfer-out amount must be no more than {0}{1}.
| 1305 | 单笔转入的数量不能低于{0}{1} | The single transfer-in amount must be no less than {0}{1}.
| 1306 | 单笔转入的数量不能高于{0}{1}  | The single transfer-in amount must be no more than {0}{1}.
| 1307 | 您当日累计转出量超过{0}{1}, 暂无法转出 | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1308 | 您当日累计转入量超过{0}{1}, 暂无法转入 | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1309 | 您当日累计净转出量超过{0}{1}, 暂无法转出  | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1310 | 您当日累计净转入量超过{0}{1}, 暂无法转入 | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1311 | 超过平台当日累计最大转出量限制, 暂无法转出 | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1312 | 超过平台当日累计最大转入量限制, 暂无法转入 | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1313 | 超过平台当日累计最大净转出量限制, 暂无法转出 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1314 | 超过平台当日累计最大净转入量限制, 暂无法转入 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1315 | 划转类型错误 | Wrong transfer type.
| 1316 | 划转冻结失败 | Failed to freeze the transfer.
| 1317 | 划转解冻失败 | Failed to unfreeze the transfer.
| 1318 | 划转确认失败 | Failed to confirm the transfer.
| 1319 | 查询可划转金额失败 | Failed to acquire the available transfer amount.
| 1320 | 此合约在非交易状态中, 无法进行系统划 | The contract status is abnormal. Transfer is unavailable temporarily.
| 1321 | 划转失败, 请稍后重试或联系客服 | Transfer failed. Please try again later or contact customer service.
| 1322 | 划转金额必须大于0 | Invalid amount. Must be more than 0.
| 1323 | 服务异常, 划转失败, 请稍后再试 | Abnormal service, transfer failed. Please try again later.
| 1327 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1328 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1329 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1330 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1331 | 超出划转精度限制(8位), 请修改后操作 | Exceeds limit of transfer accuracy (8 digits). Please modify it.





# 合约Websocket简介

## 接口列表

  权限类型  |   接口数据类型   |  请求方法   |  类型    |  描述                     |  需要验签       |                                                                                                                                            
----------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |---------- |---------------------------- |--------------|
  读取   |  市场行情接口 |         market.$contract_code.kline.$period  |      sub        |  订阅 KLine 数据              |  否  |
  读取   |  市场行情接口  |           market.$contract_code.kline.$period  |              req        |  请求 KLine 数据              |  否  |
  读取   |  市场行情接口           |  market.$contract_code.depth.$type  |               sub        |  订阅 Market Depth 数据       |  否  | 
  读取   |  市场行情接口           |  market.$contract_code.detail  |               sub        |  订阅 Market detail 数据       |  否  |
  读取   |  市场行情接口           |  market.$contract_code.trade.detail  |               req        |  请求 Trade detail 数据       |  否  |
  读取   |  市场行情接口           |  market.$contract_code.trade.detail  |        sub |  订阅 Trade Detail 数据  |  否  | 
  交易   |  交易接口           |  orders.$contract_code  |        sub |  订阅订单成交数据  | 是  | 
  读取   |  资产接口           |  accounts.$contract_code  |        sub  |  订阅某个品种下的资产变动信息  | 是  | 
  读取   |  资产接口          |  positions.$contract_code  |        sub  |  订阅某个品种下的持仓变动信息  | 是  | 
  读取   |  交易接口          |  liquidationOrders.$contract_code  |        sub  |  订阅某个品种下的强平订单信息  | 是  | 

## 合约订阅地址

合约站行情请求以及订阅地址为：wss://api.hbdm.com/swap-ws

合约站订单推送订阅地址：wss://api.hbdm.com/swap-notification

如果这个两个地址访问不了，可使用：合约站行情请求以及订阅地址为：wss://api.btcgateway.pro/swap-ws

合约站订单推送订阅地址：wss://api.btcgateway.pro/swap-notification


如果对合约订单推送订阅有疑问，可以参考Demo
 
## 访问次数限制

公开行情接口和用户私有接口都有访问次数限制

- 普通用户，需要密钥的私有接口，每个UID 3秒最多30次请求(该UID的所有币种和不同到期日的合约的所有私有接口共享3秒30次的额度)

- 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多60次请求（所有该IP的非行情类的公开接口请求共享3秒60次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取市场最近成交记录：

    （1） restful接口：同一个IP,  1秒最多200个请求 

    （2）  websocket：req请求，同一时刻最多请求50次；sub请求，无限制，服务器主动推送数据

- WebSocket私有订单成交推送接口(需要API KEY验签)

    一个UID最多同时建立10个私有订单推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。

    注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。
    
- websocket 1秒同时最多发20个sub请求。

api接口response中的header返回以下字段

- ratelimit-limit： 单轮请求数上限，单位：次数

- ratelimit-interval：请求数重置的时间间隔，单位：毫秒

- ratelimit-remaining：本轮剩余可用请求数，单位：次数

- ratelimit-reset：请求数上限重置时间，单位：毫秒 
 
# WebSocket心跳以及鉴权接口

## 市场行情心跳

- WebSocket Server 发送心跳：

`{"ping": 18212558000}`

- WebSocket Client 应该返回：

`{"pong": 18212558000}`

注：WebSocket Client 和 WebSocket Server 建立连接之后，WebSocket Server 每隔 `5s`（这个频率可能会变化） 会向 WebSocket Client 发起一次心跳，WebSocket Client 忽略心跳2次后，WebSocket Server 将会主动断开连接；WebSocket Client发送最近2次心跳message中的其中一个`ping`的值，WebSocket Server都会保持WebSocket连接。

## 订单推送心跳

- WebSocket API 支持单向心跳，Server 发起 ping message，Client 返回 pong message。 WebSocket Server 发送心跳:

`{`

   `"op": "ping",`
    
   `"ts": 1492420473058`
    
`}`

- WebSocket Client 应该返回:

`{`

   `"op": "pong"`
    
   `"ts": 1492420473058`
    
`}`

### 备注：

- "pong"操作返回数据里面的"ts"的值为"ping"推送收到的"ts"值

- WebSocket Client 和 WebSocket Server 建⽴立连接之后，WebSocket Server 每隔 5s(这个频率可能会变化) 会向 WebSocket Client 发起⼀一次⼼心跳，WebSocket Client 忽略心跳 3 次后，WebSocket Server 将会主动断开连接。

- 异常情况WebSocket Server 会返回错误信息，比如：

`{`

   `"op": "pong"`
    
   `"ts": 1492420473027,`
    
   `"err-code": 2011`
    
   `"err-msg": “详细出错信息”`
    
`}`

## 订单推送访问地址

- 统一服务地址

  合约站订单推送订阅地址：wss://api.hbdm.com/swap-notification
  
  正常ws请求连接不能同时超过10个

### 数据压缩

WebSocket API 返回的所有数据都进⾏了 GZIP 压缩，需要 client 在收到数据之后解压

### 请求与响应数据说明

- 字符编码：UTF-8

- 大小写敏感，包含所有参数名和返回值

- 数据类型：使用JSON传输数据

- 所有请求数据都有固定格式，具体接口说明文档中只会重点介绍非通用部分，

> 请求数据结构如下:

```

   {
  "op": string, // 必填;Client 请求的操作类型(Server 会原样返回)，详细操作
  类型列列表请参考附录
  "cid": string, // 选填;当前请求唯一 ID(Client 自⽣成并保证本地唯一性，
  Server 会原样返回) 
  // 其余必填/可选字段
  }

```

> 所有响应/推送数据都会以固定的结构返回，具体接口说明文档中只会重点介绍data部分，请求响应数据结构如下:

```
   
  {
  "op": string, // 必填;本次响应 Client 请求的操作类型
  "cid": string, // 选填;Client 请求唯一 ID
  "ts": long, // 必填;Server 应答时本地时间戳
  "err-code": integer, // 必填;响应码，0 代表成功;非0 代表出错，详细响应码列表请参考错误码表。
  "err-msg": string, 只在出错情况下有此信息，表明详细的出错信息 
  "data": object // 选填;返回数据对象，请求处理成功时有效
  }
  
 ```

>  推送数据结构如下:

```

  {
  "op": "string", // 必填;Server 推送的操作类型，详细操作类型列表请参考附录
  "ts": long, // 必填;Server 推送时本地时间戳
  "data": object // 必填;返回数据对象
  }
  
```

## 服务方主动断开连接

在建连和鉴权期间，如果出错，服务方会主动断开连接，在关闭之前推送数据结构如下,

`{`

  `"op": "close", // 表明是服务⽅方主动断开连接`
   
  `"ts": long   // Server 推送时本地时间戳`
  
`}`


## 服务方返回错误，但不断开连接

鉴权成功后，在客户方提供非法Op或者某些内部错误的情况下，服务方会返回错误，但并不断开连接

`{`

  `"op": "error", // 表明是收到非法op或者内部错误 `
  
  `"ts": long// Server 推送时本地时间戳`
  
`}`

## 鉴权-Authentication

用户自⼰在火币网⽣成Access Key和Secret Key，Secret Key由用户自⼰保存，⽤户需提供Access Key。目前关于 apikey 申请和修改，请在“账户 - API 管理 ” 创建新API Key 填写备注(可选择绑定 ip)点击创建。其中 Access Key 为 API 访问密钥，Secret Key 为用户对请求进⾏签名的密钥(仅申请时可见)。用户按规则生成签名(Signature)。 

交易功能 websocket 版本接⼝建立连接时首先要做鉴权操作，具体格式如下，

重要提示：这两个密钥与账号安全紧密相关，无论何时都请勿向其它人透露。 

### 鉴权请求数据格式

`{`

  `"op": "auth",`
  
  `"type": "api",`
  
  `"AccessKeyId": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",`
  
  `"SignatureMethod": "HmacSHA256",`
  
  `"SignatureVersion": "2",`
  
  `"Timestamp": "2017-05-11T15:19:30",`
  
  `"Signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=",`
  
`}`


### 鉴权请求数据格式说明

| 字段名称         | 类型   | 说明                                                         |
| --------------- | ----- | ----------------------------------------------------------- |
| op               | string | 必填；操作名称，鉴权固定值为auth                             |
| type             | string | 必填；认证方式 api表示接口认证，ticket 表示终端认证          |
| cid              | string | 选填；Client请求唯一ID                                       |
| AccessKeyId      | string | type的值为api时必填；API 访问密钥, 您申请的 APIKEY 中的 AccessKey |
| SignatureMethod  | string | type的值为api时必填；签名方法, 用户计算签名的基于哈希的协议，此处使用 HmacSHA256 |
| SignatureVersion | string | type的值为api时必填；签名协议的版本，此处使用 2              |
| Timestamp        | string | type的值为api时必填；时间戳, 您发出请求的时间 (UTC 时区) 。在查询请求中包含此值有助于防止第三方截取您的请求。如:2017-05-11T16:22:06。再次强调是 (UTC 时区) |
| Signature        | string | type的值为api时必填；签名, 计算得出的值，用于确保签名有效和未被篡改 |
| ticket           | string | type的值为ticket时必填；登陆时返回                           |

#### 注意：

- 为了减少已有用户的接入工作量，此处使用了与REST接口同样的签名算法进行鉴权。

- 请注意大小写

- 当type为api时，参数op，type，cid，Signature不参加签名计算

- 此处签名计算中请求方法固定值为`GET`,其余值请参考REST接口签名算法文档

#### 步骤：

示例例参数签名(Signature)计算过程如下，

- 规范要计算签名的请求 因为使用 HMAC 进⾏签名计算时，使⽤不同内容计算得到的结果会完全
  不同。所以在进⾏签名计算前，请先对请求进⾏规范化处理。

- 请求方法(GET 或 POST)，后面添加换行符 `\n` 。

  `GET\n`

- 添加小写的访问地址，后面添加换行符`\n`。

  `api.hbdm.com\n`

- 访问方法的路径，后面添加换行符`\n`。

  `/swap-notification\n`

- 按照ASCII码的顺序对参数名进行排序(使⽤ UTF-8 编码，且进⾏了 URI 编码，十六进制字符必须
  大写，如‘:’会被编码为'%3A'，空格被编码为'%20')。例如，下面是请求参数的原始顺序，进⾏过
  编码后。

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-
  7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-
  11T15%3A19%3A30`
  

- 按照以上顺序，将各参数使用字符’&’连接。 
 
- 组成最终的要进行签名计算的字符串如下:
  
  计算签名，将以下两个参数传入加密哈希函数: 要进行签名计算的字符串，进行签名的密钥(SecretKey) 
  
  得到签名计算结果并进行 Base64编码
  
  将上述值作为参数Signature的取值添加到 API 请求中。 将此参数添加到请求时，必须将该值进⾏URI编码。

### 鉴权应答数据格式说明

| 名称     | 类型    | 说明                                                 |
| ------- | ------ | --------------------------------------------------- |
| op       | string  | 必填；操作名称，鉴权固定值为 auth                    |
| type     | string  | 必填；根据请求的参数进行返回。                       |
| cid      | string  | 选填；请求时携带则会返回。                           |
| err-code | integer | 成功返回 0, 失败为其他值，详细响应码列列表请参考附录 |
| err-msg  | string  | 可选，若出错表示详细错误信息                         |
| ts       | long    | 服务端应答时间戳                                     |
| user-id  | long    | ⽤户 id                                              |

> 鉴权成功应答数据示例

```json
 
{
  "op": "auth",
  "type":"api",
  "ts": 1489474081631,
  "err-code": 0,
  "data": {
    "user-id": 12345678
  }
}

```

> 鉴权失败应答返回数据示例

```

{
"op": "auth",
"type":"api",
"ts": 1489474081631, 
"err-code": xxxx， 
"err-msg": ”详细的错误信息“
}

```

# WebSocket市场行情接口

## 订阅 KLine 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

  `{`
  
  `"sub": "market.$contract_code.kline.$period",`
  
  `"id": "id generate by client"`
  
  `}`

> 订阅成功返回数据的例子:

```json

  {
      "id": "id1",
      "status": "ok",
      "subbed": "market.BTC-USD.kline.1min",
      "ts": 1489474081631
  }

```
### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| id      | string | 选填;Client 请求唯一 ID                     |
| sub   | string | 必填；订阅主题名称，market.$contract_code.kline.$period"; contrac_code仅支持大写，比如:BTC-USD, period仅支持小写：1min, 5min, 15min, 30min, 1hour,4hour,1day, 1mon|


### 正确订阅请求参数的例子：

    `{`
    
    `"sub": "market.BTC-USD.kline.1min",`
    
    `"id": "id1"`
    
    `}`


### 返回参数

 参数名称  |    是否必须   |   类型  |   描述   |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   请求参数   | 
  ts    |     true          | long   |  响应生成时间点，单位：毫秒     |           
 \<list\>(属性名称: tick)    |               |    |      |            | 
  id    |     true          | long   |  ID     |            
  mrid    |     true          | long   |  订单ID     |            
  vol    |     true          | decimal   |  成交量张数     |            
  count    |     true          | decimal   |   成交笔数     |            
  open    |     true          | decimal   |  开盘价    |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
  \</list\>    |               |     |      |          

> 之后每当 KLine 有更新时，client 会收到数据:

```json

   {
   	"ch": "market.BTC-USD.kline.1min",
   	"ts": 1489474082831,
   	"tick": {
   		"id": 1489464480,
   		"mrid": 268168237,
   		"vol": 100,
   		"count": 0,
   		"open": 7962.62,
   		"close": 7962.62,
   		"low": 7962.62,
   		"high": 7962.62,
   		"amount": 0.3
   	}
   }

```

## 请求 KLine 数据 

### 成功建立和 WebSocket API 的连接之后，向Server发送如下格式的数据来请求数据：

  `{`
  
  `"req": "market.$contract_code.kline.$period",`
  
  `"id": "id generated by client",`
  
  `"from": " type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒",`
  
  `"to": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大"`
  
  `}`

> 请求 KLine 数据请求参数的例子：

```json

    {
    "req": "market.BTC-USD.kline.1min",
    "id": "id4"
    }

```
   
### 请求参数

  参数名称  |    是否必须   |   类型  |   描述   |    默认值    |   取值范围
-------- | -------- | ------ | ------ | ------- |---------------------------------------- 
contract_code  |  true   |  string   |  合约代码   |           | 仅支持大写，"BTC-USD"  |
  period | false | string | K线周期 | | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|
  from   | true | long  |  开始时间 | | |
  to      | true | long | 结束时间 | | |
  
#### 备注

[t1, t5] 假设有 t1  ~ t5 的K线：

from: t1, to: t5, return [t1, t5].

from: t5, to: t1, which t5  > t1, return [].

from: t5, return [t5].

from: t3, return [t3, t5].

to: t5, return [t1, t5].

from: t which t3  < t  <t4, return [t4, t5].

to: t which t3  < t  <t4, return [t1, t3].

from: t1 and to: t2, should satisfy 1325347200  < t1  < t2  < 2524579200.

一次最多2000条。

### 返回参数  

  参数名称  |    是否必须   |   类型  |   描述   |
-------------- | -----------------  | ---------- |  -------------- |
  rep  |       true         |  string  |   请求参数   | 
  status  |       true         |  string  |   状态   | 
  id  |       true         |  string  |   请求id   | 
  wsid    |     true          | long   |  wsid     |           
 \<list\>(属性名称: data)    |               |    |      |            | 
  id    |     true          | long   |  ID     |            
  vol    |     true          | decimal   |  成交量张数     |            
  count    |     true          | decimal   |  成交笔数     |            
  open    |     true          | decimal   |    开盘价   |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
  \</list\>    |               |     |      |          

  

> 之后每当 KLine 有更新时，client 会收到数据：

```json
    
    {
     "rep": "market.BTC-USD.kline.1min",
     "status": "ok",
     "id": "id4",
     "wsid": 3925737956,
     "data": [
       {
        "vol": 100,
        "count": 27,
        "id": 1494478080,
        "open": 10050.00,
        "close": 10058.00,
        "low": 10050.00,
        "high": 10058.00,
        "amount": 175798.757708
       },
       {
        "vol": 300,
        "count": 28,
        "id": 1494478140,
        "open": 10058.00,
        "close": 10060.00,
        "low": 10056.00,
        "high": 10065.00,
        "amount": 158331.348600
       }
     ]
    }
    
```

## 订阅 Market Depth 数据 

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

  `{`
  
  `"sub": "market.$contract_code.depth.$type",`
  
  `"id": "id generated by client"`
  
  `}`

> 正确订阅请求参数的例子：                                   

```json

    {                                          
    "sub": "market.BTC-USD.depth.step0",       
    "id": "id5"                                
    } 
                                             
```                                 
### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| id      | string | 选填;Client 请求唯一 ID                     |
| sub   | string | 必填；订阅主题名称，market.$contract_code.depth.$step"

### 详细说明

  参数名称    |  是否必须    |  类型    |  描述      |   默认值    |  取值范围  |
-------------- |-------------- |---------- |------------ |------------ |---------------------------------------------------------------------------------|
 contract_code  |  true   |  string   |  合约代码   |           | 仅支持大写，"BTC-USD" ...  |
 type           |  true           | string     | Depth 类型        |        | (150档数据)  step0, step1, step2, step3, step4, step5（合并深度1-5）,step0时，不合并深度;(20档数据)  step6, step7, step8, step9, step10, step11（合并深度7-11）；step6时，不合并深度|

#### 备注

- 用户选择“合并深度”时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。
- step1至step5是进行了深度合并后的150档深度数据，step7至step11是进行了深度合并后的20档深度数据，对应精度如下：

| Depth 类型 | 精度 |
|----|----|
|step1、step7|0.00001|
|step2、step8|0.0001|
|step3、step9|0.001|
|step4、step10|0.01|
|step5、step11|0.1|

### 返回参数
 
参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.period | | 
ts | true | long | 数据进入行情服务器时间戳，单位：毫秒 | |
\<list\>(属性名称: tick)    |               |    |      |            | 
mrid  | true| long | 订单ID | 
id  | true| long | tick ID | 
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
ts | true | long | 深度生成时间戳，每100MS生成一次，单位：毫秒 | |
version | true | long | 版本号 | |
ch | true |  string | 数据所属的 channel，格式： market.period | | 
 \</list\>    |               |    |      |            | | 


> 之后每当 depth 有更新时，client 会收到数据，例子：

```json
 
    {
     "ch": "market.BTC-USD.depth.step0",
     "ts": 1489474082831,
     "tick":
       { 
        "mrid": 269073229,
         "id": 1539843937,
            "bids": [
             [9999.9101,1], 
             [9992.3089,2]
                    ],
             "asks": [
              [10010.9800,10],
              [10011.3900,15]
                     ],
	      "ts": 1539843937417,
	      "version": 1539843937,
	      "ch": "market.BTC-USD.depth.step0"
        }
    }
    
```
##  订阅Market Depth增量数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

{

"sub": "market.$contract_code.depth.size_${size}.high_freq",

"data_type":"incremental",

"id": "id generated by client"

}

```json
{
"sub": "market.$contract_code.depth.size_${size}.high_freq",
"data_type":"incremental",
"id": "id generated by client"
}
```
### 请求参数
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 contract_code         |  true           |  string     |  交易对            |        |  合约代码，仅支持大写，比如"BTC-USD"   |
  size           |  true           |  string     |          |        |  档位数，20:表示20档不合并的深度，150:表示150档不合并的深度  |
  data_type           |  false           |  string     |  Depth 类型        |        |  数据类型，不填默认为全量数据，"incremental"：增量数据，"snapshot"：全量数据 |


### 返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.$contract_code.depth.size_${size}.high_freq | | 
ts | true | long | 进入行情服务器系统时间点，单位：毫秒 | |
 \<tick\>    |               |    |      |            | 
mrid  | true| long | 订单ID | 
id  | true| long | tick ID | 
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
ts | true | long | 系统检测orderbook时间点，单位：毫秒 | |
version | true | long | 版本号 | |
ch | true |  string | 数据所属的 channel，格式： market.$symbol.depth.size_${size}.high_freq | | 
event | true |  string | 事件类型；"update":更新，表示推送买卖各20档或150档不合并深度的增量数据；"snapshot":快照值，表示推送买卖各20档或150档不合并深度的全量数据 | | 
 \</tick\>    |               |    |      |            | | 

### Note
1、	当"data_type"为incremental时，首次推送的"event"为"snapshot"的数据，且当重新发送订阅请求时，首次返回都是"snapshot"的数据；

2、深度即可以按照合约周期订阅，也可以按照合约代码订阅，行情系统在进行数据计算时，需要更新对应类型的数据；

3、version（版本号），是自增的序号，每次增加1，不管是增量还是全量数据,每个连接是唯一的。多个websocket连接的version是可能不同的。

4、每30ms检查一次orderbook，如果有更新，则推送，如果没有更新，则不推送。

5、如果是增量数据，要自己维护好本地的orderbook bids\asks 数据。

  
### response：

```json
 {
 "ch": "market.BTC-USD.depth.size_150.high_freq",
 "ts": 1489474082831,
 "tick":{
          "mrid": 269073229,
          "id": 1539843937,
          "bids": [
                      [9999.9101,1], 
                      [9992.3089,2]
           ],
          "asks": [
                       [10010.9800,10],
                       [10011.3900,15]
           ],
         "ts": 1539843937417,
         "version": 1539843937,
         "ch": "market.BTC-USD.depth.size_150.high_freq",
         "event":"update"
  }
}
```


## 订阅 Market Detail 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

  `{ `
  
  ` "sub": "market.$contract_code.detail", `
  
  ` "id": "id generated by client" `
  
  `} `

> 订阅 Market Detail 数据请求参数的例子：

```json
                                      
 {                                    
  "sub": "market.BTC-USD.detail",     
  "id": "id6"                         
 }                                    

```

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| id      | string | 选填;Client 请求唯一 ID                     |
| sub   | string | 必填；订阅主题名称，market.$contract_code.detail; contrac_code仅支持大写，比如:BTC-USD|
   

> 请求成功返回数据的例子：

```json

  {
	"ch": "market.BTC-USD.detail",
	"ts": 1539842340724,
	"tick": {
		"id": 1539842340,
		"mrid": 268041138,
		"open": 6740.47,
		"close": 7800,
		"high": 7800,
		"low": 6726.13,
		"amount": 477.1200312075244664773339914558562673572,
		"vol": 32414,
		"count": 1716
	  }
  }
  
```
### 返回参数

参数名称     |  是否必须    |   数据类型     |  描述  |
-------------- |  -------------- |  -------------- |  ----------------------------------------------------------  |
ch  |  true  |  string  |    数据所属的 channel，格式： market.$contract_code.detail.merged   |     
ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    
\<list\>(属性名称: tick)   |               |    |      |           
id  |  true  |  long  |    ID  |    
mrid  |  true  |  long  |    订单ID  |    
open  |  true  |  decimal  |    开盘价  |     
close  |  true  |  decimal  |    收盘价,当K线为最晚的一根时，是最新成交价  |    
high  |  true  |  decimal  |    最高价  |     
low  |  true  |  decimal  |    最低价  |     
amount  |  true  |  decimal  |    成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)  |   
vol  |  true  |  decimal  |   成交量（张），买卖双边成交量之和  |     
count  |  true  |  decimal  |   成交笔数  |     
 \</list\>    |               |    |      |  
 
 
## 请求 Trade Detail 数据

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

  `{`
  
  `"req": "market.$contract_code.trade.detail", `
  
  `"id": "id generated by client" `
  
  `} `



仅返回当前 Trade Detail

> 请求 Market Detail 数据请求参数的例子：

```json

    {
     "req": "market.BTC-USD.trade.detail",
     "id": "id8"
    }

```


### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| id      | string | 选填;Client 请求唯一 ID                     |
| sub   | string | 必填；订阅主题名称，market.$contract_code.trade.detail; contrac_code仅支持大写，比如:BTC-USD|

### 返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  数据所属的 channel，格式： market.$contract_code.trade.detail  |  |   
status  |  true  |  string  |  返回状态  |  |   
id  |  true  |  long  |  ID  |   |    
\<list\>(属性名称: data)    |               |    |      | 
id  |  true  |  long  |  ID  |   |    
price  |  true  |  string  |  价格  |   |    
amount  |  true  |  string  |  数量（张）  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
ts  |  true  |  long  |  订单成交时间  |   |    
 \</list\>    |               |    |      | 

> 请求成功返回数据的例子：

```json

  {
 "data": [{
  "amount": "2",
  "ts": 1585831661886,
  "id": 478879310000,
  "price": "6681",
  "direction": "sell"
 }],
 "id": "2a024656-74e0-11ea-a2ee-3af9d3dd9051",
 "rep": "market.BTC-USD.trade.detail",
 "status": "ok",
 "ts": 1585831672148
}
```

## 订阅 Trade Detail 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

  `{`  
  
  `"sub": "market.$contract_code.trade.detail",`
  
  `"id": "id generated by client"`
  
  `}`

#### 备注

仅能获取最近 300 个 Trade Detail 数据。


### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| id      | string | 选填;Client 请求唯一 ID                     |
| sub   | string | 必填；订阅主题名称，market.$contract_code.trade.detail; contrac_code支持大小写，比如:BTC-USD|


> 正确订阅请求参数的例子：

```json

    {
     "sub": "market.BTC-USD.trade.detail",
     "id": "id7"
    }

```

### 返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
ch  |  true  |  string  |  数据所属的 channel，格式： market.$contract_code.trade.detail  |  |   
ts  |  true  |  long  |  发送时间  |   |    
\<list\>(属性名称: tick)    |               |    |      | 
id  |  true  |  long  |  ID  |   |    
ts  |  true  |  long  |  发送时间  |   |    
\<list\>(属性名称: data)    |               |    |      | 
amount  |  true  |  decimal  |  数量（张）  |   |    
ts  |  true  |  long  |  发送时间  |   |    
id  |  true  |  long  |  tick id  |   |    
price  |  true  |  decimal  |  价格  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
 \</list\>    |               |    |      | 
 \</list\>    |               |    |      | 

> 之后每当 Trade Detail 有更新时，client 会收到数据，例子：

```json

  {
		"ch": "market.BTC-USD.trade.detail",
		"ts": 1539831709042,
		"tick": {
			"id": 265842227,
			"ts": 1539831709001,
			"data": [{
				"amount": 20,
				"ts": 1539831709001,
				"id": 265842227259096443,
				"price": 6742.25,
				"direction": "buy"
			}]
  	}
  }

```

# WebSocket订单和用户数据接口

## 订阅订单成交数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

  `{ `
  
  `"op": "sub",`
  
  `"cid": "cid",`
  
  `"topic": "orders.BTC-USD"`
  
  `} `

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称，详细主题列表请参考附录; contrac_code支持大小写，比如:BTC-USD|

> 成交详情通知数据格式说明

```json

    {
    "op": "notify", 
    "topic": "orders.BTC-USD", 
    "ts": 1489474082831, 
    "symbol": "BTC",
    "contract_code": "BTC-USD",
    "volume": 111, 
    "price": 1111, 
    "order_price_type": "limit", 
    "direction": "buy", 
    "offset": "open",
    "status": 6 ,
    "lever_rate": 10, 
    "order_id": 106837,
    "order_id_str": "88",
    "client_order_id": 10683, 
    "order_source": "web", 
    "order_type": 1, 
    "created_at": 1408076414000, 
    "trade_volume": 1, 
    "trade_turnover": 1200, 
    "fee": 0, 
    "trade_avg_price": 10, 
    "margin_frozen": 10, 
    "profit": 2, 
    "trade":[{
        "trade_id":112, 
        "id": "1232-213123-1231",
        "trade_volume":1, 
        "trade_price":123.4555,
        "trade_fee":0.234, 
        "fee_asset": "BTC", 
        "trade_turnover":34.123, 
        "created_at": 1490759594752, 
        "role": "maker" 
      }]
    }
```

### 成交推送请求数据格式说明

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | 必填;操作名称，推送固定值为 notify;                          |
| topic                   | string  | 必填;推送的主题                                              |
| ts                      | long    | 服务端应答时间戳                                             |
| symbol                  | string  | 品种ID                                                       |
| contract_code           | string  | 合约代码                                                     |
| volume                  | decimal | 委托数量                                                     |
| price                   | decimal | 委托价格                                                     |
| order_price_type        | string  | 订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制                  |
| direction               | string  | "buy":买 "sell":卖                                           |
| offset                  | string  | "open":开 "close":平                                         |
| status                  | int     | 订单状态(1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中) |
| lever_rate              | int     | 杠杆倍数                                                     |
| order_id                | long    | 订单ID                                                       |
| order_id_str            | string  | 订单ID,字符串类型                                              |
| client_order_id         | long    | 客户订单ID                                                   |
| order_source            | string     | 订单来源（system:系统 web:用户网页 api:用户API m:用户M站 risk:风控系统） |
| order_type              | int     | 订单类型  1:报单 、 2:撤单 、 3:强平、4:交割                 |
| created_at              | long    | 订单创建时间                                                 |
| trade_volume            | decimal | 成交数量                                                     |
| trade_turnover          | decimal | 成交总金额                                                   |
| fee                     | decimal | 手续费                                                       |
| trade_avg_price         | decimal | 成交均价                                                     |
| margin_frozen           | decimal | 冻结保证金                                                   |
| profit                  | decimal | 收益                                                         |
| liquidation_type               | string     | 强平类型 0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管      
| \<list\> (属性名字: trade)| true | array object |  | |
| trade_id                | long    | 与swap-api/v1/swap_matchresults返回结果中的match_id一样，是撮合结果id， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id                                                  |
| id                | string    | 全局唯一的交易标识 |
| trade_volume            | decimal | 成交量                                                       |
| trade_price             | decimal | 撮合价格                                                     |
| trade_fee               | decimal | 成交手续费                                                   |
| fee_asset               | string  | 手续费币种                                                    |
| trade_turnover          | decimal | 成交金额                                                     |
| created_at              | long    | 成交创建时间                                                 |
| role             | string  | taker或maker                                                 |
| </list\>                  |         |                                                             |


## 取消订阅订单成交数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`

  `"op": "unsub",`
  
  `"topic": "topic to unsub", `
  
  `"cid": "id generated by client",`
  
  `}`

> 正确的取消订阅请求:

```json                                

{                                  
  "op": "unsub",                   
  "topic": "orders.BTC-USD",       
  "cid": "40sG903yz80oDFWr"        
}                                  

```                                


### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名称，详细主题列列表请参考附录;contract_code支持大小写 |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | 允许   |
| orders.contract_code1 | orders.*        | 允许   |
| orders.contract_code1 | orders.contract_code1  | 允许   |
| orders.contract_code1 | orders.contract_code2  | 不允许 |
| orders.*       | orders.contract_code1  | 不允许 |


## 资产变动数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

```
{
  "op": "sub",
  "cid": "id generated by client”,
  “topic": "topic to sub”
}
```

> 正确的订阅请求:                           
                                    
```json                             
                                    
{                                   
  "op": "sub",                      
  "cid": "40sG903yz80oDFWr",        
  "topic": "accounts.BTC-USD"       
}                                   
                                    
```                                 

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| :------- | :----- | :------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称，必填 (accounts.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; contract_code支持大小写，比如BTC-USD|

> 当资产有更新时，返回的参数示例如下:

```json

{
	"op": "notify",
	"topic": "accounts.BTC-USD",
	"ts": 1489474082831,
	"event": "order.match",
	"data": [{
		"symbol": "BTC",
		"contract_code": "BTC-USD",
		"margin_balance": 1,
		"margin_static": 1,
		"margin_position": 0,
		"margin_frozen": 3.33,
		"margin_available": 0.34,
		"profit_real": 3.45,
		"profit_unreal": 7.45,
		"withdraw_available": 4.0989898,
		"risk_rate": 100,
		"liquidation_price": 100,
		"lever_rate": 10,
		"adjust_factor": 0.1
	}]
}

```

### 返回字段说明

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| ts                        | long  | 响应生成时间点，单位：毫秒                           |
| op       | string |              |
| topic    | string | 订阅主题名称|
| event                     | string  | 资产变化通知相关事件说明，比如订单创建开仓(order.open) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel) 、合约账户划转（contract.transfer)（包括外部划转）、系统（contract.system)、其他资产变化(other)   、初始资金（init）                                              |
| \<list\> (attr name: data)| true | array object |  | |
| symbol             | string    | 品种代码,"BTC","ETH"...                                             |
| contract_code             | string    | 合约代码 ,"BTC-USD"...，当 $contract_code值为 * 时代表订阅所有合约代码                                             |
| margin_balance            | decimal  | 账户权益                                                       |
| margin_static             | decimal  | 静态权益                                                     |
| margin_position           | decimal  | 持仓保证金（当前持有仓位所占用的保证金）                                                     |
| margin_frozen             | decimal | 冻结保证金                                                     |
| margin_available          | decimal | 可用保证金                                                     |
| profit_real               | decimal  | 已实现盈亏                |
| profit_unreal             | decimal  | 未实现盈亏                                          |
| risk_rate                 | decimal  |保证金率                                        |
| liquidation_price         | decimal     | 预估爆仓价 |
| withdraw_available        | decimal     | 可划转数量                                                     |
| lever_rate                | int    | 杠杆倍数                                                       |
| adjust_factor             | decimal    | 调整系数                                                       |
| \<\list> | | |  | |


## 取消订阅资产变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "accounts.BTC-USD",`
  
  `"cid": "id generated by client",`
  
  `}`

> 正确的取消订阅请求:

```json
                               
{                                 
  "op": "unsub",                  
  "topic": "accounts.BTC-USD",    
  "cid": "40sG903yz80oDFWr"       
}   
                                 
```  
                             
### 取消订阅请求数据格式说明

字段名称 | 类型   | 说明                                               |
------- | ----- | ------------------------------------------------- |
op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
cid      | string | 选填;Client 请求唯一 ID                            |
topic    | string | 必填;必填；必填；订阅主题名称，必填 (accounts.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码;contract_code支持大小写; |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| accounts.*       | accounts.*        | 允许   |
| accounts.contract_code1 | accounts.*        | 允许   |
| accounts.contract_code1 | accounts.contract_code1  | 允许   |
| accounts.contract_code1 | accounts.contract_code2  | 不允许 |
| accounts.*       | accounts.contract_code1  | 不允许 |


## 持仓变动更新数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

  `{`
  
  `"op": "sub",`
  
  `"cid": "positions.BTC-USD",`
  
  `"topic": "topic to sub"`
  
  `}`

> 正确的订阅请求:

```json
                               
{                                 
  "op": "sub",                    
  "cid": "40sG903yz80oDFWr",      
  "topic": "positions.BTC-USD"    
}
                                 
```                               

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| :------- | :----- | :------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称，必填 (positions.$contract_code)  订阅、取消订阅某个合约代码下的持仓变更信息，当 $contract_code值为 * 时代表订阅所有合约代码,contract_code支持大小写;  |


> 当持仓有更新时，返回的参数示例如下:

```json

{
	"op": "notify",
	"topic": "positions.BTC-USD",
	"ts": 1489474082831,
	"event": "order.match",
	"data": [{
		"symbol": "BTC",
		"contract_code": "BTC-USD",
		"volume": 1,
		"available": 0,
		"frozen": 1,
		"cost_open": 422.78,
		"cost_hold": 422.78,
		"profit_unreal": 0.00007096,
		"profit_rate": 0.07,
		"profit": 0.97,
		"position_margin": 3.4,
		"lever_rate": 10,
		"direction": "buy",
		"last_price": 2.97
	}]
}

```

### 返回参数

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op       | string |             |
| topic       | string |             | 订阅主题
| ts                     | long  | 响应生成时间点，单位：毫秒                           |
| event                  | string  | 持仓变化通知相关事件说明，比如订单创建平仓(order.close) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel)  、初始持仓（init）                                             |
| \<list\> (attr name: data)| true | array object |  | |
| symbol                 | string    | 品种代码 ,"BTC","ETH"...                                             |
| contract_code          | string  | 合约代码，"BTC-USD"                                                       |
| volume                 | decimal  | 持仓量                                                     |
| available              | decimal | 可平仓数量                                                     |
| frozen                 | decimal | 冻结数量                                                      |
| cost_open              | decimal  | 开仓均价                |
| cost_hold              | decimal  | 持仓均价                                          |
| profit_unreal          | decimal  |未实现盈亏                                        |
| profit_rate            | decimal     | 收益率 |
| profit                 | decimal     | 收益                                                     |
| position_margin        | decimal    | 持仓保证金                                                       |
| lever_rate             | int     | 杠杆倍数                                                      |
| direction              | string    | 仓位方向   "buy":买 "sell":卖                                                     |
| last_price             | decimal    | 最新价                                                       |
| \<\list> | | |  | |

## 取消订阅持仓变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "positions.BTC-USD",`
  
  `"cid": "id generated by client", `
  
  `} `

> 正确的取消订阅请求:

```                                  
{                                    
  "op": "unsub",                     
  "topic": "positions.BTC-USD",      
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  

### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;必填；必填；订阅主题名称，必填 (positions.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码;contract_code支持大小写,比如BTC-USD  |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | 允许   |
| positions.contract_code1 | positions.*        | 允许   |
| positions.contract_code1 | positions.contract_code1  | 允许   |
| positions.contract_code1 | positions.contract_code2  | 不允许 |
| positions.*       | positions.contract_code1  | 不允许 |

##  订阅强平订单数据(免鉴权)（sub）

### 订阅强平订单数据格式

`{`

  `“op”: “sub”,`
  
  `“topic": "public.$contract_code.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "public.BTC-USD.liquidation_orders"
}

```

### **请求参数**
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string | 订阅主题名称，必填 (public.$contract_code.liquidation_orders) 订阅某个品种下的强平订单信息；$contract_code为品种代码（BTC-USD、ETH-USD），如果值为 * 时代表订阅所有品种; contract_code支持大小写; | |

### **返回参数说明**
| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| ts   | true | long  | 服务端应答时间戳   |   |
| \<data\> | true | array object |  | |
| symbol   | true | string  | 品种代码  |  "BTC","ETH"...  |
| contract_code   | true | string  | 合约代码  |   |
| direction   | true | string  | 仓位方向 | "buy":买 "sell":卖    |
| offset   | true | string  | 开平方向 | "open":开 "close":平    |
| volume   | true | decimal  | 数量（张）  |   |
| price   | true | decimal  | 价格  |   |
| created_at   | true | long  | 订单创建时间  |   |
| \<\data> | | |  | |


> 当有订单被爆仓账户接管后，返回的参数示例如下：

```json
{
    "op":"notify",
    "topic":"public.BTC-USD.liquidation_orders",
    "ts":1580815422403,
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USD",
            "direction":"buy",
            "offset":"close",
            "volume":7,
            "price":4.236,
            "created_at":1580815422296
        }
    ]
}
```

## 取消订阅强平订单(免鉴权)（unsub）

### 取消订阅强平订单数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "public.$contract_code.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "public.BTC-USD.liquidation_orders",
  "cid": "40sG903yz80oDFWr"
}

```

### 返回参数

| 字段名称 | 类型   | 说明                                               |
| ------- | ------- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 订阅主题名称，必填 (public.$contract_code.liquidation_orders)  订阅、取消订阅某个品种下的资产变更信息，当 $contract_code值为 * 时代表订阅所有品种;  |
| ts    | long | 必填;响应生成时间点，单位：毫秒 |


> 取消订阅成功返回数据示例:

```json

{
  "op": "unsub",
  "topic": "public.BTC-USD.liquidation_orders",
  "cid": "id generated by client",
  "err-code": 0,
  "ts": 1489474081631
}

```

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| public.*.liquidationOrders      | public.*.liquidationOrders        | 允许   |
| public.$contract_code.liquidationOrders | public.*.liquidationOrders        | 允许   |
| public.contract_code1.liquidationOrders | public.contract_code1.liquidationOrders  | 允许   |
| public.contract_code1.liquidationOrders | public.contract_code2.liquidationOrders  | 不允许 |
| public.*.liquidationOrders      | public.contract_code1.liquidationOrders  | 不允许 |


## 订阅资金费率推送(免鉴权)（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "public.$contract_code.funding_rate"`
  
  `}`

### **请求参数**
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string | 订阅主题名称，必填 (public.$contract_code.funding_rate) 订阅某个品种下的强平订单信息；$contract_code为品种代码（BTC-USD、ETH-USD），如果值为 * 时代表订阅所有品种; contract_code支持大小写; | |

### 当资金费率有更新时，返回的参数示例如下

```json

{ 
      "op": "notify",            
      "topic": "public.BTC-USD.funding_rate",    
      "ts": 1489474082831,   
      "data": [
        {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "fee_asset": "BTC", 
          "funding_time": "1490759594752",
          "funding_rate": "-0.12000001",
          "estimated_rate": "-0.12000001",
          "settlement_time": "1490759594752"
        }
      ]
}
```

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   |  取值范围   |
| -------------- | ---- | ------- | -------------------------- |  ---- |
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| ts   | true | long  | 服务端应答时间戳   |   |
| \<data\>   | true | object array |     |    |
| symbol   | true | string  | 品种代码  |  "BTC","ETH"...  |
| contract_code   | true | string  | 合约代码  |   |
| fee_asset   | true | string  | 资金费币种 | "BTC","ETH"...    |
| funding_time   | true | string  | 当期资金费率时间 | "open":开 "close":平    |
| funding_rate   | true | string  | 当期资金费率  |   |
| estimated_rate   | true | string  | 下一期预测资金费率  |   |
| settlement_time   | true | string  | 结算时间  |如"1490759594752"   |
| \</data\>   |  |   |     |    |


## 取消订阅资金费率(免鉴权)（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "public.$contract_code.funding_rate",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> 正确的取消订阅请求:

```                                  
{                                    
  "op": "unsub",                     
  "topic": "public.BTC-USD.funding_rate",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;必填；必填；订阅主题名称，必填 (public.$contract_code.funding_rate)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| public.*.funding_rate       | pubic.*.funding_rate       | 允许   |
| public.contract_code1.funding_rate | public.*.funding_rate        | 允许   |
| public.contract_code1.funding_rate | public.contract_code1.funding_rate | 允许   |
| public.contract_code1.funding_rate | public.contract_code2.funding_rate  | 不允许 |
| public.*.funding_rate       | public.contract_code1.funding_rate  | 不允许 |


### 备注

推送逻辑一般是1分钟一次，但是出现以下情况时不会计算资金费率：

- 合约处于 非交易状态 （待上市，停牌，待开盘，结算中，交割中，结算完成，交割完成，下市）
- 指数update_time超过5分钟没更新，不计算资金费率
- 深度数据的updateTime超过5分钟没有更新，不计算资金费率
- 每次读取到的150档买盘深度和卖盘深度进行md5加密，如果连续5次（或以上）和前一个点的数值一致，则认为系统处于停服状态，此时不计算该点位的资金费率

## 订阅强平订单数据(sub)

### 订阅强平订单数据格式

`{`

  `“op”: “sub”,`
  
  `“topic": "topic to sub”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "liquidationOrders.BTC-USD"
}

```
### **请求参数**
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string | 订阅主题名称，必填 (liquidationOrders.$contract_code) 订阅某个品种下的强平订单信息；$contract_code为品种代码（BTC-USD、ETH-USD），如果值为 * 时代表订阅所有品种; contract_code支持大小写; | |


### 返回参数

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------- |
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| ts                 | long    | 响应生成时间点，单位：毫秒                                             |
| symbol          | string  | 币种                                                       |
| contract_code          | string  | "BTC-USD","ETH-USD"...                                                 |
| direction                 | string  | 买卖方向                                                     |
| offset              | string | 开平方向                                                     |
| volume                 | decimal | 数量（张）                                                      |
| price              | decimal  | 价格                |
| created_at              | long  | 订单创建时间                                          |


> 当有订单被爆仓账户接管后，返回的参数示例如下：

```json

{
    "op": "notify",             
    "topic": "liquidationOrders.btc",     
    "ts": 1489474082831,    
    "symbol": "BTC",
    "contract_code": "BTC-USD",     
    "direction": "buy",
    "offset": "close",
    "volume": 111,
    "price": 1111,
    "created_at": 1408076414000
}

```

## 取消订阅强平订单（unsub）

### 取消订阅强平订单数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "topic to unsub”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "liquidationOrders.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### 返回参数

| 字段名称 | 类型   | 说明                                               |
| ------- | ------- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 订阅主题名称，必填 (liquidationOrders.$contract_code)  订阅、取消订阅某个品种下的资产变更信息，当 $contract_code值为 * 时代表订阅所有品种; |
| ts    | long | 必填;响应生成时间点，单位：毫秒 |


> 取消订阅成功返回数据示例:

```json

{
  "op": "unsub",
  "topic": "liquidationOrders.btc",
  "cid": "id generated by client",
  "err-code": 0,
  "ts": 1489474081631
}

```

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(ubsub) | 规则   |
| -------------- | --------------- | ------ |
| liquidationOrders.*       | liquidationOrders.*        | 允许   |
| liquidationOrders.contract_code1 | liquidationOrders.*        | 允许   |
| liquidationOrders.contract_code1 | liquidationOrders.contract_code1  | 允许   |
| liquidationOrders.contract_code1 | liquidationOrders.contract_code2  | 不允许 |
| liquidationOrders.*       | liquidationOrders.contract_code1  | 不允许 |


## 资金费率变动数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "funding_rate.BTC-USD"`
  
  `}`

### **请求参数**
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string | 订阅主题名称，必填 (funding_rate.$contract_code) 订阅某个品种下的资金费率信息；$contract_code为品种代码（BTC-USD、ETH-USD），如果值为 * 时代表订阅所有品种; contract_code支持大小写; | |

### 当资金费率有更新时，返回的参数示例如下

```json

{
 "op": "notify",
 "topic": "funding_rate", 
 "ts": 1585753005644, 
 "data": [
   {
 "symbol": "BTC", 
 "contractCode": "BTC-USD", 
 "feeAsset": "BTC", 
 "fundingTime": "1585752960000", 
 "fundingRate": "0.000100000000000000",
 "estimatedRate": "-0.000294693121917726",
 "settlementTime": "1585771200000"
  }
  ]
 }

```

### 返回参数

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| ts                     | long  | 响应生成时间点，单位：毫秒                           |
| symbol |string | 品种代码,"BTC","ETH"... |
| contractCode  | string   |  合约代码,"BTC-USD"  |
| feeAsset | string | 资金费币种,"BTC","ETH"... |
| fundingTime | string | 当期资金费率时间 |
| fundingRate | string | 当期资金费率 |
| estimatedRate | string | 下一期预测资金费率 |
| settlementTime | string |  结算时间,如"1490759594752"  |


## 取消订阅资金费率变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "topic to unsub",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> 正确的取消订阅请求:

```                                  
{                                    
  "op": "unsub",                     
  "topic": "funding_rate.BTC-USD",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;必填；必填；订阅主题名称，必填 (funding_rate.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; contract_code支持大小写|

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| funding_rate.*       | funding_rate.*        | 允许   |
| funding_rate.contract_code1 | funding_rate.*        | 允许   |
| funding_rate.contract_code1 | funding_rate.contract_code1  | 允许   |
| funding_rate.contract_code1 | funding_rate.contract_code2  | 不允许 |
| funding_rate.*       | funding_rate.contract_code1  | 不允许 |

### 备注

推送逻辑一般是1分钟一次，但是出现以下情况时不会计算资金费率：

- 合约处于 非交易状态 （待上市，停牌，待开盘，结算中，交割中，结算完成，交割完成，下市）
- 指数update_time超过5分钟没更新，不计算资金费率
- 深度数据的updateTime超过5分钟没有更新，不计算资金费率
- 每次读取到的150档买盘深度和卖盘深度进行md5加密，如果连续5次（或以上）和前一个点的数值一致，则认为系统处于停服状态，此时不计算该点位的资金费率
