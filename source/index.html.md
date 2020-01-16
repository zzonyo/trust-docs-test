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

欢迎有优秀 maker 策略且交易量大的用户参与长期做市商项目。如果您的火币现货账户或者合约账户中有折合大于5BTC资产（币币和合约账户分开统计），请提供以下信息发送邮件至：

- [MM_service@huobi.com](mailto:MM_service@huobi.com) Huobi Global（现货 / 杠杆）做市商申请；
- [dm_mm@huobi.com](mailto:dm_mm@huobi.com) HBDM（合约）做市商申请。


1. 提供 UID （需不存在返佣关系的 UID）；
2. 提供其他交易平台 maker 交易量截图证明（比如30天内成交量，或者 VIP 等级等）；
3. 请简要阐述做市方法，不需要细节。

# 合约交易接入说明

## 合约交易接口列表

### 接口列表

  权限类型  |    接口数据类型   |   请求方法      |          类型  |   描述                     |   需要验签  |
----------- |  ------------------ | ---------------------------------------- |  ---------- |  ------------------------------- |  --------------  |
读取     |  基础行情接口           |  swap-api/v1/swap_contract_info  |                 GET        |  获取合约信息                 |  否  |
读取     |  基础行情接口           |  swap-api/v1/swap_index  |                         GET        |  获取合约指数信息             |  否  |
读取     |  基础行情接口           |  swap-api/v1/contract_price_limit  |                 GET         |  获取合约最高限价和最低限价   |  否  |
读取     |  基础行情接口           |   swap-api/v1/contract_open_interest  |                  GET        |  获取当前可用合约总持仓量     |  否  |
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
读取     |  市场行情接口           |   swap/heartbeat   |                  GET        |  查询系统是否可用   |  否  |
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

访问地址联系dm_mm@huobi.com,  并提供策略服务器公网IP

## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 xxx.xxxx.com，比如 xxx.xxxx.com/api/v1/contract_order。

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

`https://xxx.xxxx.com/api/v1/contract_order?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

#### 1. 请求方法（GET 或 POST），后面添加换行符 “\n”


`GET\n`

#### 2. 添加小写的访问地址，后面添加换行符 “\n”

`
xxx.xxxx.com\n
`

#### 3. 访问方法的路径，后面添加换行符 “\n”

`
/swap-api/v1/contract_order\n
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

`xxx.xxxx.com\n`

`/api/v1/contract_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里

最终，发送到服务器的 API 请求应该为

`https://xxx.xxxx.com/api/v1/contract_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

## 访问次数限制

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

## 查询系统是否可用

通过接口`https://xxx.xxxx.com/swap/heartbeat`，可以查询系统是否可用,其中heartbeat为1是可用，为0不可用。

> 返回数据

```json
  {
  "status": "ok",
  "data": {"heartbeat": 1},
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
1010|	用户不存在               |
1011|	用户会话不存在             |
1012|	用户账户不存在             |
1013|	合约品种不存在             |
1014|	合约不存在               |
1015|	指数价格不存在             |
1016|	对手价不存在              |
1017|	查询订单不存在             |
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
1100|	用户没有开仓权限            |
1101|	用户没有平仓权限            |
1102|	用户没有入金权限            |
1103|	用户没有出金权限            |
1104|	合约交易权限,当前禁止交易       |
1105|	合约交易权限,当前只能平仓       |
1200|	登录错误                |
1220|	用户尚未开通合约交易          |
1221|	开户资金不足              |
1222|	开户天数不足              |
1223|	开户VIP等级不足           |
1224|	开户国家限制              |
1225|	开户不成功               |
1250|	无法获取HT_token        |
1251|	BTC折合资产无法获取         |
1252|	现货资产无法获取            |
1071|	订单已撤，无法撤单    |
1077|	交割结算中，当前品种资金查询失败    |
1078|	交割结算中，部分品种资金查询失败    |
1079|	交割结算中，当前品种持仓查询失败    |
1080|	交割结算中，部分品种持仓查询失败    |
1083|	账号异常，暂时无法平仓    |

## 接入说明

### 1、swap-api/v1/contract_hisorders 历史委托查询接口：

- 为了保证时效性和降低延迟，强烈建议用户使用swap-api/v1/contract_order_info获取用户订单信息接口来查询订单信息，获取合约订单信息接口从内存里面查询，无延迟，接口响应速度更快。

- 如果用户一定要使用swap-api/v1/contract_hisorders 历史委托查询接口，请尽量输入更多的查询条件，symbol、trade_type（推荐传0查询全部）、type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 2、swap-api/v1/contract_matchresults 获取历史成交记录接口：

- 为了提升查询的性能和响应速度，查询条件 symbol 、trade_type（推荐传0查询全部） 、contract_code 、create_date 尽量都输入，并且create_date输入尽量小的整数，最好只查询一天的数据；

 

### 3、swap-api/v1/contract_financial_record 查询用户财务记录接口：

- 为了提升查询的性能和响应速度，查询条件symbol、type（推荐不填查询全部）、create_date，尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 4、swap-api/v1/contract_order_detail 获取订单明细接口：

- 查询条件created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。

- 例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从contract_order下单接口返回报文中的ts中获取时间戳作为参数查询接口swap-api/v1/contract_order_detail获取订单明细，同时created_at禁止传0；；

 

### 5、swap-api/v1/contract_trigger_hisorders 获取计划委托历史委托接口：

- 为了提升查询的性能和响应速度，参数symbol、contract_code、trade_type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 6、订阅Market Depth 数据的WebSocket：

- 获得150档深度数据，使用step0, step1, step2, step3, step4, step5；

- 获得20档深度数据，使用 step6, step7, step8, step9, step10, step11；

- 由于每100ms推送一次150档全量数据，数据量比较大，如果客户端网络带宽不足或者处理不及时，webSocket断开可能比较频繁，强烈建议使用step6, step7, step8, step9, step10, step11 取20档数据。比如订阅20档数据

`{`

  `"sub": "market.BTC_CQ.depth.step6",`

  `"id": "id5"`

`}`
 

### 7、swap-api/v1/contract_order合约下单和swap-api/v1/contract_batchorder合约批量下单接口：

- 推荐传参数client_order_id（用户级别唯一），主要防止下单和批量下单接口由于网络或其它原因接口超时或者没有返回，可以根据client_order_id通过请求接口swap-api/v1/contract_order_info来快速获取订单是否下单正常或者快速获取订单信息。


## 代码实例

- <a href='https://github.com/hbdmapi/java_demo'>Java</a>

- <a href='https://github.com/hbdmapi/hbdm_Python'>Python</a>

# 永续合约市场行情接口

## 获取合约信息 

###  示例

- GET `swap-api/v1/swap_contract_info`

###  请求参数

参数名称     |  参数类型   |  必填   |  描述  |
---------------- |  -------------- |  ---------- |  ------------------------------------------------------------ |
contract_code   |  string         |  false |      "BTC-USD",不填查询所有合约  |

> Response:

```json

    {
      "status": "ok",
      "data": [
        {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "contract_size": 100,
          "price_tick": 0.001,
          "settlement_date": "1490759594752",
          "create_date": "14907595947",
          "contract_status": 1
         }
        ],
      "ts":158797866555
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
contract_code         |  string         |  true       |  "BTC-USD","ETH-USD"...  |

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
contract_code   |  string         |  true |      BTC-USD  | 合约代码

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
\<list\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒              |            |


## 获取当前可用合约总持仓量 

###  示例

- GET `swap-api/v1/swap_open_interest`

###  请求参数

参数名称 | 参数类型    | 必填    | 描述 |
---------------- |  -------------- |  ---------- |  -----------------------------------------------------------------  |
contract_code   |  string         |  false |     "BTC-USD",不填查询所有合约  |

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
contract_code   |  string         |  true |      "BTC-USD" ...  |
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
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
mrid  | true| string | 订单ID | | 
ts | true | number | 响应生成时间点，单位：毫秒 | |

## 获取K线数据

###  示例

- GET `/swap-ex/market/history/kline`

###  请求参数

参数名称    |  是否必须  |   类型     |  描述    |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  -----------------------------------------------------|
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
period  |    true  |  string  |  K线类型  |  |  1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon  |
size  |  true  |  integer    |  获取数量   |  150  |  [1,2000]  |

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
data  |  true  |  object  |    KLine 数据  |   | 
status  |    true  |  string  |    请求处理结果  |  "ok" , "error"  |
ts  |  true  |  number  |    响应生成时间点，单位：毫秒  |    | 

## 获取聚合行情

###  示例

- GET `/swap-ex/market/detail/merged`

###  请求参数

参数名称   |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
--------------  | --------------  | ---------- |  ----------  | ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |

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
tick  |  true  |  object  |    24小时成交量、开盘价和收盘价  |    |
ts  |  true  |  number  |    响应生成时间点，单位：毫秒  |    | 

## 获取市场最近成交记录

###  示例

- GET `/swap-ex/market/trade`

###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |  默认值  |  取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |

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
tick  |  true  |  object  |  Trade 数据  |    |    |   
ts  |  true  |  number  |  发送时间  |   |    |


## 批量获取最近的交易记录

###  示例

- GET `/swap-ex/market/history/trade`

###  请求参数：

参数名称     |  是否必须     | 数据类型   |  描述  |    默认值    |  取值范围  |
-------------- |  -------------- |  -------------- |  -------------------- |  ------------ |  --------------------------------------------------------------------------------  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
size  |  true  |  number  |    获取交易记录的数量  | 1  |  [1, 2000]  |

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
data  |  true  |  object  |    Trade 数据  |    |
status  |  true  |  string  |    |    "ok"，"error" |
ts  |  true  |  number  |    响应生成时间点，单位：毫秒  |    |

## 查询合约风险准备金余额和预估分摊比例

- GET `swap-api/v1/swap_risk_info`

### 请求参数

 参数名称               |   是否必须  |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  string         |  false |     "BTC-USD",不填返回所有合约  |

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
 \<data\> |  |  |  |  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC-USD" ...  |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 estimated_clawback | true  | decimal | 预估分摊比例 |  |
 \</data\> |  |  |  |  |

## 查询合约风险准备金余额历史数据

- GET `swap-api/v1/swap_insurance_fund`

### 请求参数

  参数名称                |   是否必须   |   类型    |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |

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
 \<data\> |  |  |  | 字典数据 |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 \<tick\> |  |  |  |  |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 ts | true  | long | 数据时间点，单位：毫秒 |  |
 \</tick\> |  |  |  |  |
 \</data\> |  |  |  |  |

## 查询平台阶梯调整系数

- GET `swap-api/v1/swap_adjustfactor`

### 请求参数

  参数名称                |   是否必须   |    类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code | false | string | 合约代码	 | "BTC-USD"... ,如果缺省，默认返回所有品种 |

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
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 \<list\> |  |  |  |  |
 lever_rate   | true     | decimal  | 杠杆倍数               |                |
 \<ladderDetail\> |  |  |  |  |
 min_size | true | decimal | 净持仓量的最小值 |  |
 max_size | true | decimal | 净持仓量的最大值 |  |
 ladder | true | int | 档位 |  |
 adjust_factor | true | decimal | 调整系数 |  |
 \</ladderDetail\> |  |  |  |  |
 \</list\> |  |  |  |  |
 \</data\> |  |  |  |  |

## 平台持仓量的查询

### 实例

- GET `swap-api/v1/swap_his_open_interest`

### 请求参数

|  参数名称                |   是否必须   |   类型    |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| contract_code | true | string | 合约代码   | "BTC-USD" ... |
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
| \<data\> |  |  | 字典数据 |  |
| symbol | true | string | 品种代码   | "BTC","ETH"... |
| contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
| \<tick\> |  |  |  |  |
| volume | true | decimal | 持仓量 |  |
| amount_type | true | int | 计价单位 | 1:张，2:币  |
| ts | true | long | 统计时间 |  |
| \</tick\> |  |  |  |  |
| \</data\> |  |  |  |  |

- 注意：
  
  tick字段：数组内的数据按照时间倒序排列；
  data字段：字典类型。

## 精英账户多空持仓对比-账户数

- GET `swap-api/v1/swap_elite_account_ratio`

### 请求参数

  参数名称               |   是否必须  |  类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
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
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
\<list\> |  |  |  |  |
buy_ratio | true | decimal | 净多仓的账户比例 |  |
sell_ratio | true | decimal | 净空仓的账户比例 |  |
locked_ratio | true | decimal | 锁仓的账户比例 |  |
ts | true  | long | 生成时间 |  |
\</list\> |  |  |  |  |
\</data\> |  |  |  |  |


## 精英账户多空持仓对比-持仓量

- GET `swap-api/v1/swap_elite_position_ratio`

### 请求参数

  参数名称                 |   是否必须   |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
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
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
\<list\> |  |  |  |  |
buy_ratio | true | decimal | 多仓的总持仓量占比 |  |
sell_ratio | true | decimal | 空仓的总持仓量占比 |  |
ts | true  | long | 生成时间 |  |
\</list\> |  |  |  |  |
\</data\> |  |  |  |  |

## 查询系统状态

- GET `swap-api/v1/swap_api_state`

### 请求参数

  参数名称                 |   是否必须  |   类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  false  | string |  合约代码 |  "BTC-USD"... ,如果缺省，默认返回所有合约  |


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
      "transfer_out": 1
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
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
open | true | int | 开仓下单权限："1"表示可用，“0”表示不可用 |  |
close | true | int | 平仓下单权限："1"表示可用，“0”表示不可用 |  |
cancel | true | int | 撤单权限："1"表示可用，“0”表示不可用 |  |
transfer_in | true | int | 从币币转入的权限："1"表示可用，“0”表示不可用 |  |
transfer_out | true | int | 转出至币币的权限："1"表示可用，“0”表示不可用 |  |
\</data\>|  |  |  |  |


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
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |

> Response: 

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "fee_asset": "BTC", 
      "funding_time": "1577736000",
      "funding_rate": "-0.12000001",
      "estimated_rate": "-0.12000001",
      "next_funding_time": "1577764800"
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                 |   是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
fee_asset | true  | string | 资金费币种 | "BTC","ETH"... |
funding_time | true | string | 当期资金费率时间 |  |
funding_rate | true | string | 当期资金费率 |  |
estimated_rate | true | string | 下一期预测资金费率 |  |
next_funding_time  | true | string |  下一期资金费率时间    |   |
\</data\>|  |  |  |  |

## 获取合约的历史资金费率

- GET `swap-api/v1/swap_historical_funding_rate`

### 请求参数

  参数名称                 |  是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
page_index  | false    | int    | 页码，不填默认第1页    | 1       |                                          |
page_size   | false    | int    | 不填默认20，不得多于50 | 20      |                                          |

> Response:

```json

{
  "status": "ok",
  "data": [
    {
      "symbol": "BTC",
      "contract_code": "BTC-USD",
      "fee_asset": "BTC", 
      "funding_time":"1490759594752",
      "funding_rate":"-0.00010248",
      "realized_rate":"-0.00010248"
    }
 ],
 "ts": 158797866555
}

```

### 返回参数

  参数名称                 |   是否必须  |   类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
fee_asset | true  | string | 资金费币种 | "BTC","ETH"... |
funding_time | true | string | 资金费率时间 |  |
funding_rate | true | string | 当期资金费率 |  |
realized_rate | true | string | 实际资金费率 |  |
\</data\> |  |  |  |  |


## 查询系统是否可用

- GET `swap/heartbeat`

### 返回参数

   参数名称                | 是否必须  |   类型    |   描述               |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
estimated_recovery_time | true | long | 预估恢复时间，单位：毫秒	 |  当系统状态为可用时，返回空值 |
heartbeat | true | long | 系统是否可用	 |  1是可用，为0不可用 |

> Response:

```json

{
	"status": "ok",
	"data": {
		"heartbeat": 1,
		"estimated_recovery_time": null
	},
	"ts": 1557714418033
}

```

# 合约资产接口

## 获取用户账户信息

###  示例

- POST  `swap-api/v1/swap_account_info`

###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ----------  | ------------ |  ------------------------------------------ |
contract_code   |  false          | string |     "BTC-USD"... ,如果缺省，默认返回所有合约  |  |

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
ts  |    number  |    long  |  响应生成时间点，单位：毫秒  |    | 


## 获取用户持仓信息

###  示例

- POST `swap-api/v1/swap_position_info`

###  请求参数

参数名称   |  是否必须   |  类型    |  描述    |  默认值    |  取值范围  |
-------------- |  --------------  | ---------- |  ----------  | ------------ |  ------------------------------------------  |
contract_code   |  false  | string |  合约代码 | | "BTC-USD"... ,如果缺省，默认返回所有合约  |

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
contract_code   |  false  | string |  合约代码 | | "BTC-USD"... ,如果缺省，默认返回所有合约  |

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
\<data\> |  |  |  |  |
sub_uid | true  | long | 子账户UID |  |
\<list\> |  |  |  |  |
symbol | true | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
margin_balance | true | decimal | 账户权益 |  |
liquidation_price | true | decimal | 预估强平价 |  |
risk_rate | true | decimal | 保证金率 |  |
\</list\> |  |  |  |  |
\</data\> |  |  |  |  |

- 备注

  只返回已经开通合约交易的子账户数据.


## 查询单个子账户资产信息

- POST `swap-api/v1/swap_sub_account_info`

###  请求参数


  参数名称     |   是否必须   |  类型  |  描述         |   默认值   |   取值范围                                 |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code   |  false  | string |  合约代码 | | "BTC-USD"... ,如果缺省，默认返回所有合约  |
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
\<data\> |  |  |  |  |
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
lever_rate                | true     | decimal  | 杠杆倍数               |                |
adjust_factor                | true     | decimal  | 调整系数               |                |  
margin_static                | true     | decimal  | 静态权益               |                |  
\</data\> |  |  |  |  |


- 备注

  只能查询到开通合约交易的子账户信息；
  
  子账户来过合约系统但是未开通合约交易也不返回对应的数据；

## 查询单个子账户持仓信息

- POST `swap-api/v1/swap_sub_position_info`

### 请求参数

  参数名称    |  是否必须  |  类型  |  描述        |   默认值  |  取值范围                                  |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code   |  false  | string |  合约代码 | | "BTC-USD"... ,如果缺省，默认返回所有合约  |
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
\<data\> |  |  |  |  |
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
\</data\> |  |  |  |  |

## 查询用户财务记录

- POST `swap-api/v1/swap_financial_record`

###  请求参数

参数名称                |  是否必须  |  类型   |  描述              |  取值范围       |
----------------------- | -------- | ------- | ------------------ | ------------------------------- |
contract_code | true | string | 合约代码   | "BTC-USD"... |
type | false | string | 不填查询全部类型,【查询多类型中间用，隔开】 | 平多：3，平空：4，开仓手续费-吃单：5，开仓手续费-挂单：6，平仓手续费-吃单：7，平仓手续费-挂单：8，交割平多：9，交割平空：10，交割手续费：11，强制平多：12，强制平空：13，从币币转入：14，转出至币币：15，结算未实现盈亏-多仓：16，结算未实现盈亏-空仓：17，穿仓分摊：19，系统：26，活动奖励：28，返利：29，资金费-收入：30，资金费-支出：31 |
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
\<data\> |  |  | 字典类型 |  |
\<financial_record\> |  |  |  |  |
id | true  | long |  |  |
ts | true  | long | 创建时间 |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
type | true  | int | 交易类型 | 平多：3，平空：4，开仓手续费-吃单：5，开仓手续费-挂单：6，平仓手续费-吃单：7，平仓手续费-挂单：8，交割平多：9，交割平空：10，交割手续费：11，强制平多：12，强制平空：13，从币币转入：14，转出至币币：15，结算未实现盈亏-多仓：16，结算未实现盈亏-空仓：17，穿仓分摊：19，系统：26，活动奖励：28，返利：29，资金费-收入：30，资金费-支出：31  |
amount | true  | decimal | 金额 |  |
\</financial_record\> |  |  |  |  |
total_page | true  | int | 总页数 |  |
current_page | true  | int | 当前页 |  |
total_size | true  | int | 总条数 |  |
\</data\> |  |  |  |  |

## 查询用户当前的下单量限制

- POST `swap-api/v1/swap_order_limit`


### 请求参数

  参数名称               |   是否必须   |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code   |  false  | string |  合约代码 | "BTC-USD"... ,如果缺省，默认返回所有合约 |
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单 |

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
          "open_limit": 3000,
          "close_limit": 3000
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
 \<data\> |  |  |  |  |    
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单 |
 \<list\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 open_limit | true | long | 合约开仓单笔下单量最大值 |  |
 close_limit | true | long | 合约平仓单笔下单量最大值 |  |
 \</list\>  |  |  |  |  |
 \</data\> |  |  |  |  |

## 查询用户当前的手续费费率

- POST `swap-api/v1/swap_fee`

### 请求参数

  参数名称                |  是否必须 |  类型  |   描述             |  取值范围      |
----------------------- | -------- | ------- | ------------------ | -------------- |
contract_code   |  false  | string |  合约代码 |  "BTC-USD"... ,如果缺省，默认返回所有合约  |

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
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
 open_maker_fee | true | string | 开仓挂单的手续费费率，小数形式 | |
 open_taker_fee | true | string | 开仓吃单的手续费费率，小数形式 | |
 close_maker_fee | true | string | 平仓挂单的手续费费率，小数形式 | |
 close_taker_fee | true | string | 平仓吃单的手续费费率，小数形式 | |
 \</data\>  |  |  |  |  |

## 查询用户当前的划转限制

- POST `swap-api/v1/swap_transfer_limit`

### 请求参数

  参数名称                |  是否必须  |  类型   |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code   |  false  | string |  合约代码 |  "BTC-USD"... ,如果缺省，默认返回所有合约  |

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
 contract_code   |  false  | string |  合约代码 |  "BTC-USD"... ,如果缺省，默认返回所有合约  |

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
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
buy_limit | true | decimal | 合约多仓持仓的最大值，单位为张 |  |
sell_limit | true | decimal | 合约空仓持仓的最大值，单位为张 |  |
\</data\> |  |  |  |  |

# 合约交易接口

## 合约下单 

###  示例

- POST  `swap-api/v1/swap_order`


###  请求参数

参数名  |  参数类型    |  必填   |  描述  |
-------------------- |  -------------- |  ----------  | ---------------------------------------------------------------  |
contract_code  |  string   |  true   |  合约代码,"BTC-USD"  |
client_order_id |   long  |  false  |  客户自己填写和维护，必须为数字  |
price  |  decimal  |   false  |  价格  |
volume  |    long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |    string  |    true  |  "open":开 "close":平  |
lever_rate  |  int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单]  |
order_price_type |  string  |    true  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，"fok":FOK订单，"ioc":IOC订单  |

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
\<list\>(属性名称: orders_data)  |    |    |    |  
contract_code  |  string   |  true   |  合约代码,"BTC-USD"  |
client_order_id  |  long  |  false  |  客户自己填写和维护，必须为数字  |
price  |  decimal  |   false  |  价格  |
volume  |  long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |  string  |    true  |  "open":开 "close":平  |
lever_rate  |   int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单]  |
order_price_type |  string  |    true  |  订单报价类型 "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，"fok":FOK订单，"ioc":IOC订单  |
\</list\>  |    |    |    |

###  备注

对手价下单price价格参数不用传，对手价下单价格是买一和卖一价,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单price价格参数不用传，"limit":限价，"post_only":只做maker单 需要传价格。

一次最多允许20个订单。

> Response:

```json

    {
      "status": "ok",
      "data": {
        "errors":[
          {
            "index":0,
            "err_code": 200417,
            "err_msg": "invalid contract_code"
           },
          {
            "index":3,
            "err_code": 200415,
            "err_msg": "invalid contract_code"
           }
         ],
        "success":[
          {
            "index":1,
            "order_id":161256,
            "order_id_str": "88",
            "client_order_id":1344567
           },
          {
            "index":2,
            "order_id":161257,
            "order_id_str": "88",
            "client_order_id":1344569
           }
         ]
       },
      "ts": 1490759594752
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
order_id |  false  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许撤消20个订单)  |
client_order_id  |  false  |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许撤消20个订单)  |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |

###备注：

order_id和client_order_id都可以用来撤单，同时只可以设置其中一种，如果设置了两种，默认以order_id来撤单。

撤单接口返回结果只代表撤单命令发送成功，建议根据订单查询接口查询订单的状态来确定订单是否已真正撤销。

> Response:

```json

{
  "status": "ok",
  "data": {
    "errors":[
      {
        "order_id":"161251",
        "err_code": 200417,
        "err_msg": "invalid contract_code"
       },
      {
        "order_id":161253,
        "err_code": 200415,
        "err_msg": "invalid contract_code"
       }
      ],
    "successes":[161256,1344567]
   },
  "ts": 1490759594752
}
   
```

###  返回参数

参数名称  |  是否必须  |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | -------------------------------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<list\>(属性名称: errors)  |    |    |    |    |  
order_id  |    true  |  string  |  订单ID  |    |   
err_code  |   true  |  int  |   错误码  |    |   
err_msg  |  true  |  string  |  错误信息  |    | 
\</list\>  |    |    |    |    |
successes  |   true  |  string  |  撤销成功的订单的order_id或client_order_id列表  |   |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |   |


## 全部撤单 

###  示例

- POST  `swap-api/v1/swap_cancelall`

###  请求参数

参数名称    |  是否必须    |  类型    |  描述  |
-------------- | -------------- | ---------- | ---------------------------- |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |

> Response:(多笔订单返回结果(成功订单ID,失败订单ID))

```json

    {
      "status": "ok",
      "data": {
        "errors":[
          {
            "order_id":"161251",
            "err_code": 200417,
            "err_msg": "invalid symbol"
           },
          {
            "order_id":161253,
            "err_code": 200415,
            "err_msg": "invalid symbol"
           }
          ],
        "successes":[161256,1344567]
       },
      "ts": 1490759594752
    }
    
```

###  返回参数

参数名称  |  是否必须   |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | ---------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<list\>(属性名称: errors)  |    |    |    |    |
order_id  |    true  |  String  |  订单id  |   | 
err_code  |    true  |  int  |   订单失败错误码  |   |   
err_msg  |  true  |  int  |   订单失败信息  |    | 
\</list\>    |    |    |    |    |
successes  |    true  |  string  |  成功的订单  |    |   
ts  | true  |  long  |  响应生成时间点，单位：毫秒  |   | 


## 获取合约订单信息

###  示例

- POST  `swap-api/v1/swap_order_info`

###  请求参数

参数名称  |    是否必须    |  类型    |  描述  |
------------------- | -------------- | ---------- | ------------------------------------------------------------- |
order_id  |  false  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
client_order_id   |  false  |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |

###  备注：

order_id和client_order_id都可以用来查询，同时只可以设置其中一种，如果设置了两种，默认以order_id来查询。结算后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。

> Response:

```json

    {
      "status": "ok",
      "data":[
        {
          "symbol": "BTC",
          "contract_code": "BTC-USD",
          "volume": 111,
          "price": 1111,
          "order_price_type": "limit",
          "direction": "buy",
          "offset": "open",
          "lever_rate": 10,
          "order_id": 106837,
          "order_id_str": "88",
          "client_order_id": 10683,
          "order_source": "web",
          "order_type": "1",
          "created_at": 1408076414000,
          "trade_volume": 1,
          "trade_turnover": 1200,
          "fee": 0,
          "fee_asset": "BTC", 
          "trade_avg_price": 10,
          "margin_frozen": 10,
          "profit": 10,
          "status": 0
         },
        {
          "symbol": "ETH",
          "contract_code": "BTC-USD",
          "volume": 111,
          "price": 1111,
          "order_price_type": "limit",
          "direction": "buy",
          "offset": "open",
          "lever_rate": 10,
          "order_id": 106837,
          "order_id_str": "88",
          "client_order_id": 10683,
          "order_source": "web",
          "order_type": "1",
          "created_at": 1408076414000,
          "trade_volume": 1,
          "trade_turnover": 1200,
          "fee": 0,
          "fee_asset": "BTC", 
          "trade_avg_price": 10,
          "margin_frozen": 10,
          "profit ": 10,
          "status": 0
         }
        ],
      "ts": 1490759594752
    }
    
```

###  返回数据

  参数名称  |    是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- | -------------- | ---------- | --------------------------------------------------------------------------------------------  | ---------------------------------------------------- |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<list\>(属性名称: data)  |    |    |    |    | 
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
status  |  true  |  int  |   订单状态  |  (1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中)  |  
order_type    |  true  |  string  |  订单类型  |    1:报单 、 2:撤单 、 3:强平、4:交割              |
order_source  |  true  |  string  |  订单来源  |  （1:system、2:web、3:api、4:m 5:risk、6:settlement） |   
\</list\>  |    |    |    |    |
ts  |    true  |  long  |  时间戳  |  |   


## 获取订单明细信息

###  示例

- POST `swap-api/v1/swap_order_detail`

###  请求参数

参数名称    |  是否必须     |  类型    |  描述  |
-------------- | -------------- | ---------- | ------------------------ |
contract_code  |  true   |  string   |  合约代码,"BTC-USD"  |
order_id  | true  |  long  |   订单id  |
created_at  |  false  |  long  |   下单时间戳  |
order_type  |  true  |  int  |   订单类型，1:报单 、 2:撤单 、 3:强平、4:交割  |
page_index  |    false  |  int  |   第几页,不填第一页  |
page_size  |  false  |  int  |   不填默认20，不得多于50  |

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
\<object\> (属性名称: data)  |    |    |    |    | 
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
\<list\> (属性名称: trades)  |    |    |    |    | 
trade_id  |  true  |  long  |  撮合结果id  |    |  
id     | true     | string    | 成交唯一ID               |              |  
trade_price  |  true  |  decimal  |  撮合价格  |    |
trade_volume  | true  |  decimal  |  成交量  |    |  
trade_turnover  |    true  |  decimal  |  成交金额  |    | 
trade_fee  |   true  |  decimal  |  成交手续费  |    |   
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... | 
role  |   true  |  string  |  taker或maker  |   | 
created_at  |   true  |  long  |  创建时间  |    | 
\</list\>  |    |    |    |    |   
\</object \>  |    |     |    |    |
ts  |  true  |  long  |  时间戳  |     |


## 获取合约当前未成交委托 

###  示例

- POST `swap-api/v1/swap_openorders`  

###  请求参数

  参数名称   |  是否必须    |  类型    |  描述  |  默认值    |  取值范围  |
-------------- | -------------- | ---------- | ------------------------ | ------------ | ---------------- |
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
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
\<list\>(属性名称: data)  |    |    |    |    |   
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
\</list\>  |    |    |    |    |
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
contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
trade_type  |   true  |  int  |   交易类型  |    0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平,7:交割平多,8: 交割平空  |
type  |  true  |  int  |   类型  |  1:所有订单,2:结束状态的订单  |
status  |    true  |  string  |   订单状态  |  可查询多个状态，"3,4,5" , 0:全部,3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单  |
create_date |  true  |  int  |   日期  |   可随意输入正整数，如果参数超过90则默认查询90天的数据 |
page_index  |  false  |  int  |   |  页码，不填默认第1页  |  1  | 
page_size  |  false  |  int   |  每页条数，不填默认20  |  20  | 不得多于50  |

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
            "order_price_type": "1",
            "direction": "buy",
            "offset": "open",
            "lever_rate": 10,
            "order_id": 106837,
            "order_id_str": "88",
            "order_source": "web",
            "create_date": 1408076414000,
            "trade_volume": 1,
            "trade_turnover": 1200,
            "fee": 0,
            "fee_asset": "BTC", 
            "trade_avg_price": 10,
            "margin_frozen": 10,
            "profit": 10,
            "status": 1,
            "order_type": 1
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

参数名称  |  是否必须   |  类型    |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | --------------------------------------------- | ------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |    |  
\<object\>(属性名称: data)  |    |    |    |    | 
\<list\>(属性名称: orders)  |    |    |    |    | 
order_id  |    true  |  long  |  订单ID  |  
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
symbol  |  true  |  string  |  品种代码  |
contract_code  |    true  |  string  |  合约代码  | "BTC-USD" ...  |
lever_rate  |  true  |  int  |   杠杆倍数  |  1\\5\\10\\20  |
direction  |    true  |  string  | 买卖方向 |  "buy":买 "sell":卖  |  
offset  |  true  |  string  |  开平方向  |  "open":开 "close":平  |
volume  |  true  |  decimal    |  委托数量  |    |
price  |   true  |  decimal    |  委托价格  |    | 
create_date   |  true  |  long    |  创建时间  |    | 
order_source  |  true  |  string  |  订单来源  |    | 
order_price_type  |  true  |  string  |  订单报价类型 |  1：限价单，3：对手价，4：闪电平仓，5：计划委托，6：post_only |  
margin_frozen  |    true  |  decimal    |  冻结保证金  |    |    
profit  |  true  |  decimal    |  收益  |    |
trade_volume  |  true  |  decimal    |  成交数量  |    | 
trade_turnover  |   true  |decimal    |  成交总金额  |    |    
fee  |  true  |  decimal    |  手续费  |    |   
fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
trade_avg_price  | true  |  decimal    |  成交均价  |    | 
status  |  true  |  int  |   订单状态  |    | 
order_type  |  true  |  int  |   订单类型  |  1:报单 、 2:撤单 、 3:强平、4:交割  |
\</list\>  |    |    |     |     |  
\</object\>|    |    |     |     |
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
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
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
 \<object\>(属性名称: data) |          |         |                    |              |
 \<list\>(属性名称: trades) |          |         |                    |              |
 match_id               | true     | long    | 成交ID，不唯一，可能重复               |              |
 id               | true     | string    | 成交唯一ID               |              |
 order_id               | true     | long    | 订单ID               |              |
 order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
 symbol                 | true     | string  | 品种代码               |              |
 order_source                 | true     | string  | 订单来源               |              |
 contract_code          | true     | string  | 合约代码               |  "BTC-USD" ...       |
 direction              | true     | string  | "buy":买 "sell":卖         |              |
 offset                 | true     | string  | "open":开 "close":平           |              |
 trade_volume           | true     | decimal | 成交数量               |              |
 trade_price                  | true     | decimal | 成交价格               |              |
 trade_turnover                  | true     | decimal | 成交总金额               |              |
 create_date            | true     | long    | 成交时间               |              |
 offset_profitloss                 | true     | decimal | 平仓盈亏                 |              |
 traded_fee                    | true     | decimal | 成交手续费                |              |
 fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
 role                   |   true    |       string  |  taker或maker  |         |
 \</list\>              |          |         |                    |              |
 total_page             | true     | int     | 总页数                |              |
 current_page           | true     | int     | 当前页                |              |
 total_size             | true     | int     | 总条数                |              |
 \</object\>            |          |         |                    |              |
 ts                     | true     | long    | 时间戳                |              |

### 备注

- 如果不传page_index和page_size，默认只查第一页的20条数据，详情请看参数说明:

## 闪电平仓下单

- POST `swap-api/v1/swap_lightning_close_position`

### 请求参数

   参数名称                |   是否必须  |   类型  |    描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 contract_code  |  true   |  string   |  合约代码   |  "BTC-USD" ...  |
 volume | true | Number | 委托数量（张） |  |
 direction | true | String | “buy”:买，“sell”:卖 |  |
 client_order_id | false | Number | （API）客户自己填写和维护，必须保持唯一 |  |

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
\<data\> |  |  |  | 字典 |
order_id | true  | Number | 订单ID[用户级别的，不同的用户order_id可能相同] |  |
order_id_str  |  true  |  string  |  订单ID，字符串类型  |    | 
client_order_id | false | Number | 用户自己的订单id |  |
\</data\> |  |  |  |  |


> 错误信息：

```json

{
    "status": "error",
    "err_code": 20012,
    "err_msg": "invalid contract_code",
    "ts": 1490759594752
}

```


## 获取强平订单

- GET `swap-api/v1/swap_liquidation_orders`

### 请求参数

  参数名称     |   是否必须   |   类型   |    描述         |   默认值   |   取值范围                                  |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
contract_code  |  true   |  string   |  合约代码   |    |  "BTC-USD" ... |
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
\<object\>(属性名称: data) |          |         |                    |              |
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
\</object\>            |          |         |                    |              |
ts                     | true     | long    | 时间戳                |              |


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

  访问地址联系dm_mm@huobi.com,  并提供策略服务器公网IP
 
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

  访问地址联系dm_mm@huobi.com,  并提供策略服务器公网IP  
  
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

  `xxx.xxxx.com\n`

- 访问方法的路径，后面添加换行符`\n`。

  `/notification\n`

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

### 输入参数

  参数名称  |    是否必须   |   类型   |   描述   |    默认值    |   取值范围 
--------------| -----------------| ---------- |----------| ------------| --------------------------------------------------------------------------------|
contract_code  |  true   |  string   |  合约代码   |           | "BTC-USD" ...  |
period    |     true          | string   |  K线周期     |            |1min, 5min, 15min, 30min, 1hour,4hour,1day, 1mon|

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
  \<tick\>    |               |    |      |            | 
  id    |     true          | number   |  ID     |            
  mrid    |     true          | number   |  订单ID     |            
  vol    |     true          | decimal   |  成交量张数     |            
  count    |     true          | decimal   |   成交笔数     |            
  open    |     true          | decimal   |  开盘价    |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
  \</tick\>    |               |     |      |          

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
  symbol | true | string |交易对 | |如"BTC","ETH","EOS"...|
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
  \<data\>    |               |    |      |            | 
  id    |     true          | long   |  ID     |            
  vol    |     true          | decimal   |  成交量张数     |            
  count    |     true          | decimal   |  成交笔数     |            
  open    |     true          | decimal   |    开盘价   |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)    |            
  \</data\>    |               |     |      |          

  

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

### 请求参数

  参数名称    |  是否必须    |  类型    |  描述      |   默认值    |  取值范围  |
-------------- |-------------- |---------- |------------ |------------ |---------------------------------------------------------------------------------|
 contract_code  |  true   |  string   |  合约代码   |           | "BTC-USD" ...  |
 type           |  true           | string     | Depth 类型        |        | (150档数据)  step0, step1, step2, step3, step4, step5（合并深度1-5）,step0时，不合并深度;(20档数据)  step6, step7, step8, step9, step10, step11（合并深度7-11）；step6时，不合并深度|

#### 备注

用户选择“合并深度”时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。

### 返回参数
 
参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.period | | 
ts | true | number | 响应生成时间点，单位：毫秒 | |
 \<tick\>    |               |    |      |            | 
mrid  | true| number | 订单ID | 
id  | true| number | tick ID | 
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
ts | true | number | 响应生成时间点，单位：毫秒 | |
version | true | number | 版本号 | |
ch | true |  string | 数据所属的 channel，格式： market.period | | 
 \</tick\>    |               |    |      |            | | 


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

### 请求参数

 参数名称    |  是否必须    |  类型   |  描述      |  默认值    |  取值范围   |
-------------- |-------------- |---------- |------------ |------------ |--------------------------------------------------------------------------------|
 contract_code  |  true   |  string   |  合约代码   |           | "BTC-USD" ...  |
   

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
ts  |  true  |  number  |    响应生成时间点，单位：毫秒  |    
 \<tick\>    |               |    |      |           
id  |  true  |  number  |    ID  |    
mrid  |  true  |  number  |    订单ID  |    
open  |  true  |  decimal  |    开盘价  |     
close  |  true  |  decimal  |    收盘价,当K线为最晚的一根时，是最新成交价  |    
high  |  true  |  decimal  |    最高价  |     
low  |  true  |  decimal  |    最低价  |     
amount  |  true  |  decimal  |    成交量(币), 即 sum(每一笔成交量(张)*单张合约面值/该笔成交价)  |   
vol  |  true  |  decimal  |   成交量（张），买卖双边成交量之和  |     
count  |  true  |  decimal  |   成交笔数  |     
 \</tick\>    |               |    |      |  
 
 
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

### 返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  数据所属的 channel，格式： market.$contract_code.trade.detail  |  |   
status  |  true  |  string  |  返回状态  |  |   
id  |  true  |  number  |  ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  number  |  ID  |   |    
price  |  true  |  decimal  |  价格  |   |    
amount  |  true  |  decimal  |  数量（张）  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
ts  |  true  |  number  |  订单成交时间  |   |    
 \</data\>    |               |    |      | 

> 请求成功返回数据的例子：

```json

    {
     "ch": "market.BTC-USD.trade.detail",
     "ts": 1489474082831,
     "data": [
              {
               "id":601595424,
               "price":10195.64,
               "amount":100,
               "direction":"buy",
               "ts":1494495766000
               },
              {
              "id":601595423,
              "price":10195.64,
              "amount":200,
              "direction":"buy",
              "ts":1494495711000
              }
            ]
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

### 请求参数

  参数名称     |  是否必须     |  类型     |  描述     |  默认值     |  取值范围  |
-------------- |-------------- |---------- |---------- |------------ |--------------------------------------------------------------------------------|
 contract_code  |  true   |  string   |  合约代码   |           | "BTC-USD" ...  |

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
ts  |  true  |  number  |  发送时间  |   |    
 \<tick\>    |               |    |      | 
id  |  true  |  number  |  ID  |   |    
ts  |  true  |  number  |  发送时间  |   |    
 \<data\>    |               |    |      | 
amount  |  true  |  decimal  |  数量（张）  |   |    
ts  |  true  |  number  |  发送时间  |   |    
id  |  true  |  number  |  tick id  |   |    
price  |  true  |  decimal  |  价格  |   |    
direction  |  true  |  string  |  买卖方向  |   |    
 \</data\>    |               |    |      | 
 \</tick\>    |               |    |      | 

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
  
  `"cid": "id generated by client",`
  
  `"topic": "topic to sub"`
  
  `} `

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称，详细主题列表请参考附录; |

> 成交详情通知数据格式说明

```json

    {
    "op": "notify", 
    "topic": "orders.btc", 
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
| order_source            | int     | 订单来源（system:系统 web:用户网页 api:用户API m:用户M站 risk:风控系统） |
| order_type              | int     | 订单类型  1:报单 、 2:撤单 、 3:强平、4:交割                 |
| created_at              | long    | 订单创建时间                                                 |
| trade_volume            | decimal | 成交数量                                                     |
| trade_turnover          | decimal | 成交总金额                                                   |
| fee                     | decimal | 手续费                                                       |
| trade_avg_price         | decimal | 成交均价                                                     |
| margin_frozen           | decimal | 冻结保证金                                                   |
| profit                  | decimal | 收益                                                         |
| <list>(属性名称: trade) |         |                                                              |
| trade_id                | long    | 撮合结果id 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id                                                  |
| id                | string    | 成交唯一ID |
| trade_volume            | decimal | 成交量                                                       |
| trade_price             | decimal | 撮合价格                                                     |
| trade_fee               | decimal | 成交手续费                                                   |
| fee_asset               | string  | 手续费币种                                                    |
| trade_turnover          | decimal | 成交金额                                                     |
| created_at              | long    | 成交创建时间                                                 |
| role             | string  | taker或maker                                                 |
| </list>                  |         |                                                             |


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
| topic    | string | 必填;待取消订阅主题名称，详细主题列列表请参考附录; |


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
| topic    | string | 必填；订阅主题名称，必填 (accounts.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; |

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
| event                     | string  | 资产变化通知相关事件说明，比如订单创建开仓(order.open) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel) 、合约账户划转（contract.transfer)（包括外部划转）、系统（contract.system)、其他资产变化(other)   、初始资金（init）                                              |
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
| lever_rate                | decimal    | 杠杆倍数                                                       |
| adjust_factor             | decimal    | 调整系数                                                       |


## 取消订阅资产变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "topic to unsub",`
  
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
topic    | string | 必填;必填；必填；订阅主题名称，必填 (accounts.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; |

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
  
  `"cid": "id generated by client",`
  
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
| topic    | string | 必填；订阅主题名称，必填 (positions.$contract_code)  订阅、取消订阅某个合约代码下的持仓变更信息，当 $contract_code值为 * 时代表订阅所有合约代码 |


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
| ts                     | long  | 响应生成时间点，单位：毫秒                           |
| event                  | string  | 持仓变化通知相关事件说明，比如订单创建平仓(order.close) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel)  、初始持仓（init）                                             |
| symbol                 | string    | 品种代码 ,"BTC","ETH"...                                             |
| contract_code          | decimal  | 合约代码，"BTC-USD"                                                       |
| volume                 | decimal  | 持仓量                                                     |
| available              | decimal | 可平仓数量                                                     |
| frozen                 | decimal | 冻结数量                                                      |
| cost_open              | decimal  | 开仓均价                |
| cost_hold              | decimal  | 持仓均价                                          |
| profit_unreal          | decimal  |未实现盈亏                                        |
| profit_rate            | decimal     | 收益率 |
| profit                 | decimal     | 收益                                                     |
| position_margin        | decimal    | 持仓保证金                                                       |
| lever_rate             | decimal     | 杠杆倍数                                                      |
| direction              | decimal    | 仓位方向   "buy":买 "sell":卖                                                     |
| last_price             | decimal    | 最新价                                                       |


## 取消订阅持仓变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "topic to unsub",`
  
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
| topic    | string | 必填;必填；必填；订阅主题名称，必填 (positions.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | 允许   |
| positions.contract_code1 | positions.*        | 允许   |
| positions.contract_code1 | positions.contract_code1  | 允许   |
| positions.contract_code1 | positions.contract_code2  | 不允许 |
| positions.*       | positions.contract_code1  | 不允许 |



## 获取强平订单数据(sub)

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
  "topic": "liquidationOrders.btc"
}

```

### 返回参数

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------- |
| ts                 | number    | 响应生成时间点，单位：毫秒                                             |
| symbol          | string  | 币种                                                       |
| contract_code          | string  | "BTC-USD","ETH-USD"...                                                 |
| direction                 | string  | 买卖方向                                                     |
| offset              | string | 开平方向                                                     |
| volume                 | decimal | 数量（张）                                                      |
| price              | decimal  | 价格                |
| created_at              | number  | 订单创建时间                                          |


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

## 取消订阅强平订单数据格式（unsub）

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
| topic    | string | 订阅主题名称，必填 (positions.$contract_code)  订阅、取消订阅某个品种下的资产变更信息，当 $contract_code值为 * 时代表订阅所有品种; |
| ts    | number | 必填;响应生成时间点，单位：毫秒 |


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

### 当资金费率有更新时，返回的参数示例如下

```json

{
	"op": "notify",
	"topic": "funding_rate.BTC-USD",
	"ts": 1489474082831,
	"data": [{
		"symbol": "BTC",
		"contract_code": "BTC-USD",
		"fee_asset": "BTC",
		"funding_time": "1490759594752",
		"funding_rate": "-0.12000001",
		"estimated_rate": "-0.12000001",
		"settlement_time": "1490759594752"
	}]
}

```

### 返回参数

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| ts                     | long  | 响应生成时间点，单位：毫秒                           |
| symbol |string | 品种代码,"BTC","ETH"... |
| contract_code  | string   |  合约代码,"BTC-USD"  |
| fee_asset | string | 资金费币种,"BTC","ETH"... |
| funding_time | string | 当期资金费率时间 |
| funding_rate | string | 当期资金费率 |
| estimated_rate | string | 下一期预测资金费率 |
| settlement_time | string |  结算时间,如"1490759594752"  |


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
| topic    | string | 必填;必填；必填；订阅主题名称，必填 (funding_rate.$contract_code)  订阅、取消订阅某个合约代码下的资产变更信息，当 $contract_code值为 * 时代表订阅所有合约代码; |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| funding_rate.*       | funding_rate.*        | 允许   |
| funding_rate.contract_code1 | funding_rate.*        | 允许   |
| funding_rate.contract_code1 | funding_rate.contract_code1  | 允许   |
| funding_rate.contract_code1 | funding_rate.contract_code2  | 不允许 |
| funding_rate.*       | funding_rate.contract_code1  | 不允许 |
