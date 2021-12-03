**---
title: Huobi Trust API 文檔

language_tabs: # must be one of https://git.io/vQNgJ
- json

toc_footers:
- <a href='https://www.huobihktrust.com/zh-hk/user/api/'>創建 API Key </a>
  includes:

search: true
---

# 更新日誌

<style>
table {
    max-width:100%
}
table th {
    white-space: nowrap; /*表頭內容強製在一行顯示*/
}
</style>



| 生效時間<br>(UTC +8) | 接口     | 變化      | 摘要         |
| ---------- | --------- | --------- | --------------- |
| 2021.9.16 | - | - | - |


# 簡介
---
title: Huobi Trust API 文檔

language_tabs: # must be one of https://git.io/vQNgJ
- json

toc_footers:
- <a href='https://www.huobihktrust.com/zh-hk/user/api/'>創建 API Key </a>
  includes:

search: true
---

# 更新日誌

<style>
table {
    max-width:100%
}
table th {
    white-space: nowrap; /*表頭內容強製在一行顯示*/
}
</style>



| 生效時間<br>(UTC +8) | 接口     | 變化      | 摘要         |
| ---------- | --------- | --------- | --------------- |
| 2021.9.16 | - | - | - |


# 簡介

歡迎使用Huobi Trust API！

此文檔是Huobi Trust API的唯一官方文檔，Huobi Trust API提供的功能和服務會在此文檔持續更新。

以下是現貨API文檔各章節主要內容

第一部分是概要介紹：

- **快速入門**：該章節對Huobi Trust API做了簡單且全方位的介紹，適合第一次使用Huobi Trust API的用戶。
- **常見問題**：該章節列舉了使用Huobi Trust API時常見的、和具體API無關的通用問題。
- **聯系我們**：該章節介紹了針對不同問題，如何聯系我們。

第二部分是每個接口類的詳細介紹，每個接口類一個章節，每個章節分為如下內容：

- **簡介**：對該接口類進行簡單介紹，包括一些註意事項和說明。
- ***具體接口***：介紹每個接口的用途、限頻、請求、參數、返回等詳細信息。
- **常見錯誤碼**：介紹該接口類下常見的錯誤碼及其說明。
- **常見問題**：介紹該接口類下常見問題和解答。

# 快速入門

## 接入準備

如需使用API ，請先登錄網頁端，完成API key的申請和權限配置，再據此文檔詳情進行開發和交易。

您可以點擊 <a href='https://www.huobihktrust.com/zh-hk/user/api/ '>這裏 </a> 創建 API Key。

每個用戶可創建20組Api Key，每個Api Key可對應設置讀取權限。

權限說明如下：

- 讀取權限：讀取權限用於對數據的查詢接口，例如：資產列表查詢等。

創建成功後請務必記住以下信息：

- `Access Key`  API 訪問密鑰

- `Secret Key`  簽名認證加密所使用的密鑰（僅申請時可見）

<aside class="notice">
每個 API Key 最多可綁定 20個IP 地址(主機地址或網絡地址)。
</aside>
<aside class="warning">
<red><b>風險提示</b></red>：這兩個密鑰與賬號安全緊密相關，無論何時都請勿將二者<b>同時</b>向其它人透露。API Key的泄露可能會造成您的資產損失（即使未開通提幣權限），若發現API Key泄露請盡快刪除該API Key。
</aside>

## SDK與代碼示例

[Java](https://github.com/huobitrustapi/huobi_Java) | [Python3](https://github.com/huobitrustapi/huobi_Python) | [C++](https://github.com/huobitrustapi/huobi_Cpp) | [C#](https://github.com/huobitrustapi/huobi_CSharp) | [Go](https://github.com/huobitrustapi/huobi_golang)

**其它代碼示例**

[https://github.com/huobitrustapi?tab=repositories](https://github.com/huobitrustapi?tab=repositories)

## 接口類型

香港信托為用戶提供兩種接口，您可根據自己的使用場景和偏好來選擇適合的方式進行查詢資產。

### REST API

REST，即Representational State Transfer的縮寫，是目前較為流行的基於HTTP的一種通信機製，每一個URL代表一種資源。

使用API進行資產查詢，建議開發者使用REST API進行操作。

### WebSocket API

WebSocket是HTML5一種新的協議（Protocol）。它實現了客戶端與服務器全雙工通信，通過一次簡單的握手就可以建立客戶端和服務器連接，服務器可以根據業務規則主動推送信息給客戶端。

市場行情和買賣深度等信息，建議開發者使用WebSocket API進行獲取。

**接口鑒權**

以上兩種接口均包含公共接口和私有接口兩種類型。

公共接口可用於獲取基礎信息和行情數據。公共接口無需認證即可調用。

私有接口可用於交易管理和賬戶管理。每個私有請求必須使用您的API Key進行簽名驗證。

## 接入URLs
您可以使用api.huobihktrust.com域名。

**REST API**

**`https://api.huobihktrust.com`**

<aside class="notice">
請使用中國大陸以外的 IP 訪問Huobi Trust API。
</aside>
<aside class="notice">
鑒於延遲高和穩定性差等原因，不建議通過代理的方式訪問Huobi Trust API。
</aside>
<aside class="notice">
為保證API服務的穩定性，建議使用日本AWS雲服務器進行訪問。如使用中國大陸境內的客戶端服務器，連接的穩定性將難以保證。
</aside>

## 簽名認證

### 簽名說明

API 請求在通過 internet 傳輸的過程中極有可能被篡改，為了確保請求未被更改，除公共接口（基礎信息，行情數據）外的私有接口均必須使用您的 API Key 做簽名認證，以校驗參數或參數值在傳輸途中是否發生了更改。
每一個API Key需要有適當的權限才能訪問相應的接口，每個新創建的API Key都需要分配權限。在使用接口前，請查看每個接口的權限類型，並確認你的API Key有相應的權限。

一個合法的請求由以下幾部分組成：

- 方法請求地址：即訪問服務器地址 api.huobihktrust.com，比如 api.huobihktrust.com/v1/open/apiKeyDemo。
- API 訪問Id（AccessKeyId）：您申請的 API Key 中的 Access Key。
- 簽名方法（SignatureMethod）：用戶計算簽名的基於哈希的協議，此處使用 HmacSHA256。
- 簽名版本（SignatureVersion）：簽名協議的版本，此處使用2。
- 時間戳（Timestamp）：您發出請求的時間 (UTC 時間)  。如：2017-05-11T16:22:06。在查詢請求中包含此值有助於防止第三方截取您的請求。
- 必選和可選參數：每個方法都有一組用於定義 API 調用的必需參數和可選參數。可以在每個方法的說明中查看這些參數及其含義。
  - 對於 GET 請求，每個方法自帶的參數都需要進行簽名運算。
  - 對於 POST 請求，每個方法自帶的參數不進行簽名認證，並且需要放在 body 中。
- 簽名：簽名計算得出的值，用於確保簽名有效和未被篡改。

### 簽名步驟

規範要計算簽名的請求 因為使用 HMAC 進行簽名計算時，使用不同內容計算得到的結果會完全不同。所以在進行簽名計算前，請先對請求進行規範化處理。下面以查詢某訂單詳情請求為例進行說明：

查詢某訂單詳情時完整的請求URL

`https://api.huobihktrust.com/v1/open/apiKeyDemo?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

**1. 請求方法（GET 或 POST，WebSocket用GET），後面添加換行符 「\n」**

例如：
`GET\n`

**2. 添加小寫的訪問域名，後面添加換行符 「\n」**

例如：
`
api.huobihktrust.com\n
`

**3. 訪問方法的路徑，後面添加換行符 「\n」**

例如apiKeyDemo：<br>
`
/v1/open/apiKeyDemo\n
`

例如WebSocket v2<br>
`
/ws/v2
`

**4. 對參數進行URL編碼，並且按照ASCII碼順序進行排序**

例如，下面是請求參數的原始順序，且進行URL編碼後


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`demo-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 編碼，且進行了 URL 編碼，十六進製字符必須大寫，如 「:」 會被編碼為 「%3A」 ，空格被編碼為 「%20」。
</aside>
<aside class="notice">
時間戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加並且進行 URL 編碼。時間戳有效時間5分鐘。
</aside>

經過排序之後

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`demo-id=1234567890`

**5. 按照以上順序，將各參數使用字符 「&」 連接**


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`

**6. 組成最終的要進行簽名計算的字符串如下**

`GET\n`

`api.huobihktrust.com\n`

`v1/open/apiKeyDemo\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`


**7. 用上一步裏生成的 「請求字符串」 和你的密鑰 (Secret Key) 生成一個數字簽名**


1. 將上一步得到的請求字符串和 API 私鑰作為兩個參數，調用HmacSHA256哈希函數來獲得哈希值。
2. 將此哈希值用base-64編碼，得到的值作為此次接口調用的數字簽名。

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

**8. 將生成的數字簽名加入到請求裏**

對於Rest接口：

1. 把所有必須的認證參數添加到接口調用的路徑參數裏
2. 把數字簽名在URL編碼後加入到路徑參數裏，參數名為「Signature」。

最終，發送到服務器的 API 請求應該為

`https://api.huobihktrust.com/v1/open/apiKeyDemo?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&demo-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`


# 接入說明

## 接口概覽

| 接口分類       | 分類鏈接                     | 概述                                             |
| -------------- | ---------------------------- | ------------------------------------------------ |
| 測試類         | /v1/open/apiKeyDemo/*        | apiKey測試相關接口       |
| 賬戶類         | /v1/open/account/*           | 賬戶相關接口             |


該分類為大類整理，部分接口未遵循此規則，請根據需求查看有關接口文檔。

## 新限頻規則

- 當前，新限頻規則正在逐步上線中，已單獨標註限頻值的接口且該限頻值被標註為NEW的接口適用新限頻規則。

- 新限頻規則采用基於UID的限頻機製，即，同一UID下各API Key同時對某單個節點請求的頻率不能超出單位時間內該節點最大允許訪問次數的限製。

- 用戶可根據Http Header中的"X-HB-RateLimit-Requests-Remain"（限頻剩余次數）及"X-HB-RateLimit-Requests-Expire"（窗口過期時間）查看當前限頻使用情況，以及所在時間窗口的過期時間，根據該數值動態調整您的請求頻率。

## 限頻規則

除已單獨標註限頻值為NEW的接口外 -<br>
* 每個API Key 在1秒之內限製10次<br>
* 若接口不需要API Key，則每個IP在1秒內限製10次<br>

比如：

* 資產訂單類接口調用根據API Key進行限頻：1秒10次


## 請求格式

所有的API請求都是restful，目前只有兩種方法：GET和POST

* GET請求：所有的參數都在路徑參數裏
* POST請求，所有參數以JSON格式發送在請求主體（body）裏

## 返回格式

所有的接口都是JSON格式。其中v1和v2接口的JSON定義略有區別。

**接口返回格式**：最上層有三個字段：`code`, `message` 和 `data`。前兩個字段表示返回碼和錯誤消息，實際的業務數據在`data`字段裏。

以下是一個返回格式的樣例：

```json
{
  "code": 200,
  "message": "",
  "data": // per API response data in nested JSON object
}
```

| 參數名稱 | 數據類型 | 描述               |
| -------- | -------- | ------------------ |
| code     | int      | API接口返回碼      |
| message  | string   | 錯誤消息（如果有） |
| data     | object   | 接口返回數據主體   |

## 數據類型

本文檔對JSON格式中數據類型的描述做如下約定：

- `string`: 字符串類型，用雙引號（"）引用
- `int`: 32位整數，主要涉及到狀態碼、大小、次數等
- `long`: 64位整數，主要涉及到Id和時間戳
- `float`: 浮點數，主要涉及到金額和價格，建議程序中使用高精度浮點型
- `object`: 對象，包含一個子對象{}
- `array`: 數組，包含多個對象

## 最佳實踐

###安全類
- 強烈建議：不要將API Key暴露給任何人（包括第三方軟件或機構），API Key代表了您的賬戶權限，API Key的暴露可能會對您的信息、資金造成損失，若API Key泄露，請盡快刪除並重新創建。

###公共類
**API訪問建議**

- 不建議在中國大陸境內使用臨時域名以及代理的方式訪問Huobi Trust API，此類方式訪問API連接的穩定性很難保證。
- 建議使用日本AWS雲服務器進行訪問。
- 官方域名api.huobihktrust.com。


**新限頻規則**

- 當前最新限頻規則正在逐步上線中，已單獨標註限頻值的接口適用新限頻規則。

- 用戶可根據Http Header中「X-HB-RateLimit-Requests-Remain（限頻剩余次數）」，「X-HB-RateLimit-Requests-Expire（窗口過期時間）」查看當前限頻使用情況，以及所在時間窗口的過期時間，根據該數值動態調整您的請求頻率。

- 同一UID下各API Key同時對某單個節點請求的頻率不能超出單位時間內該節點最大允許訪問次數的限製。


# 常見問題

本章列舉了和具體API無關的通用常見問題，如網絡、簽名或通用錯誤等。

針對某類或某個API的問題，請查看每章API的錯誤碼和常見問題。

### Q1：一個用戶可以申請多少個API Key？

每個用戶可創建20組API Key，每個API Key可對應設置讀取權限。

以下是權限的說明：

- 讀取權限：讀取權限用於對數據的查詢接口，例如：資產查詢等。

### Q2：為什麽經常出現斷線、超時的情況？

請檢查是否屬於以下情況：

1. 客戶端服務器如在中國大陸境內，連接的穩定性很難保證，建議使用日本AWS雲服務器進行訪問。

### Q3：為什麽簽名認證總返回失敗？

請檢查如下可能的原因：


1、簽名參數應該按照ASCII碼排序。比如下面是原始的參數：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

排序之後應該為：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2、簽名串需進行URL編碼。比如：

- 冒號 `:`會被編碼為`%3A`，空格會被編碼為 `%20`
- 時間戳需要格式化為 `YYYY-MM-DDThh:mm:ss` ，經過URL編碼之後為 `2017-05-11T15%3A19%3A30`

3、簽名需進行 base64 編碼

4、Get請求參數需在簽名串中

5、時間為UTC時間轉換為YYYY-MM-DDTHH:mm:ss

6、檢查本機時間與標準時間是否存在偏差（偏差應小於1分鐘）

7、簽名時所帶Host應與請求接口時Host相同

如果您使用了代理，代理可能會改變請求Host，可以嘗試去掉代理；

或者，您使用的網絡連接庫可能會把端口包含在Host內，可以嘗試在簽名用到的Host中包含端口，如「api.huobihktrust.com:443"

8、Access Key 與 Secret Key中是否存在隱藏特殊字符，影響簽名

當前官方已支持多種語言的[SDK](https://github.com/huobitrustapi)，可以參考SDK的簽名實現，或者以下三種語言的簽名樣例代碼

<a href='https://github.com/huobitrustapi/huobi_Java/blob/master/java_signature_demo.md'>JAVA簽名樣例代碼</a> | <a href='https://github.com/huobitrustapi/huobi_Python/blob/master/example/python_signature_demo.md'>Python簽名樣例代碼</a>   | <a href='https://github.com/huobitrustapi/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++簽名樣例代碼 </a>

### Q7：調用接口返回Incorrect Access Key 錯誤是什麽原因？

請檢查URL請求中Access Key是否傳遞準確，例如：

1. Access Key沒有傳遞
2. Access Key位數不準確
3. Access Key已經被刪除
4. URL請求中參數拼接錯誤或者特殊字符沒有進行編碼導致服務端對AccessKey解析不正確

### Q8：調用接口返回 gateway-internal-error 錯誤是什麽原因？

請檢查是否屬於以下情況：

1. 可能為網絡原因或服務內部錯誤，請稍後進行重試。
2. 發送數據格式是否正確（需要標準JSON格式）。
3. POST請求頭header需要聲明為`Content-Type:application/json` 。

### Q9：調用接口返回 login-required 錯誤是什麽原因？

請檢查是否屬於以下情況：

1. 未將AccessKey參數帶入URL中。
2. 未將Signature參數帶入URL中。

### Q10: 調用Rest接口返回HTTP 405錯誤 method-not-allowed 是什麽原因？

該錯誤表明調用了不存在的Rest接口，請檢查Rest接口路徑是否準確。由於Nginx的設置，請求路徑(Path)是大小寫敏感的，請嚴格按照文檔聲明的大小寫。

# 聯系我們

## 技術支持

使用過程中如有問題或者建議，您可選擇以下任一方式聯系我們：

- 通過官網的「幫助中心」或者發送郵件至support@huobihktrust.com聯系客服。

如您遇到API錯誤，請按照如下模板向我們反饋問題。

`1. 問題描述`
`2. 問題發生的用戶Id(UID)，賬戶Id和訂單Id(如果和賬戶、訂單有關系)`
`3. 完整的URL請求`
`4. 完整的JSON格式的請求參數（如果有）`
`5. 完整的JSON格式的返回結果`
`6. 問題出現時間和頻率（如何時開始出現，是否可以重現）`
`7. 簽名前字符串（如果是簽名認證錯誤）`


下方是一個應用了模版的例子：

`1. 問題簡要說明：簽名錯誤`
`2. UID：123456`
`3. 完整的URL請求：GET https://api.huobihktrust.com/v1/open/apiKeyDemo/forRead?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`
`4. 完整的JSON格式的參數：無`
`5. 完整的JSON格式的返回：{"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key錯誤]","data":null}`
`6. 問題出現頻率：每次都會出現`
`7. 簽名前字符串`
`GET\n`
`api.huobihktrust.com\n`
`/v1/open/apiKeyDemo/forRead\n`
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`

註意：Access Key僅能證明您的身份，不會影響您賬戶的安全。切記**不**要將Secret Key信息分享給任何人，若您不小心將Secret Key暴露，請盡快[刪除](https://www.hbg.com/zh-cn/apikey/)其對應的API Key，以免造成您的賬戶損失。

# 用戶相關

賬戶相關接口提供了用戶綁定、信息查詢等查詢轉等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## 鑄幣商用戶鑒權

用戶綁定，暫時由信託根據簽名信息自主完成
簽名流程參照api key加簽流程(秘鑰由信託單獨生成同步給機構，與用戶個人的api key區分使用)
最終，登錄的地址應該為

${信託web頁面登錄url}?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&outerUserId=1234567890&callBackUrl=${回調url}&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

### HTTP 請求

- GET `信託web頁面登錄url`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| AccessKeyId | true     | string | 外部系統鑒權access key(由信託服務生成，提供) |        |          |
| outerUserId | true     | string | 外部系統用戶唯一標識 |        |          |
| callbackUrl | true     | string | 回調url |        |          |
| SignatureMethod | true     | string | 簽名方法（HmacSHA256） |        |          |
| SignatureVersion | true     | string | 簽名版本（2） |        |          |
| Timestamp | true     | string | 時間戳（例如：2017-05-11T15%3A19%3A30） |        |          |
| Signature | true     | string | 簽名數據 |        |          |




## 用戶鑒權信息查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/merchant/user/getAuthInfo`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| outerUserId | true     | string | （外部系统用户id）外部系统用户唯一标识 |        |          |


> Response:

```json
{
  "code": 200,
  "data": [
    {
      "outerUserId": "213123D1231",
      "outerUid": "12312317263123"
    }
  ],
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| outerUserId  | string   | 外部系统用户标识           |                                                            |
| outerUid   | string   | 外部uid           |                                                            |


# 划转相關

## 簡介

劃轉相關接口提供了賬戶劃轉、查詢等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## UID劃轉記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/api/uid-transfer/list`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| clientOrderId | false     | string | 劃轉訂單編號 |        |          |
| currency | false     | string | 幣種 |        |          |
| status | false     | string | 狀態 |        |      狀態 枚举: jumio,audit,audit_refuse,multi_audit_refuse,multi_audit_fail,success,fail 枚举备注: jumio :人脸识别验证 audit :人工审核中 audit_refuse :人工审核拒绝 multi_audit_refuse :多人审批验证中 multi_audit_fail :多人审批验证失败 success :划转成功 fail :划转失败     |
| startTime | false     | string | 开始时间 |        |          |
| endTime | false     | string | 结束时间 |        |          |
| direction | false     | string | 分页方向 |        |          |
| fromId | false     | string | 分页开始id |        |          |
| size | false     | string | 分页大小 |        |          |


> Response:

```json
{
  "code": 200,
  "data": [
    {
      "id": 1,
      "clientOrderId": "12312223131",
      "fromUid": "123123131",
      "toUid": "23213131312",
      "toUserName": "test@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000,
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    },
    {
      "id": 2,
      "clientOrderId": "12312223131",
      "fromUid": "12312223131",
      "toUid": "2321313331312",
      "toUserName": "tes12t@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000",
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    }
  ],
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| id  | number   | 数据id           |                                                            |
| clientOrderId  | string   | 劃轉订单id           |                                                            |
| fromUid  | string   | 劃轉方uid           |                                                            |
| toUid  | string   | 收款方uid           |                                                            |
| toUserName  | string   | 收款方註冊賬號           |                                                            |
| state  | string   | 狀態 枚举: jumio,audit,audit_refuse,multi_audit_refuse,multi_audit_fail,success,fail 枚举备注: jumio :人脸识别验证 audit :人工审核中 audit_refuse :人工审核拒绝 multi_audit_refuse :多人审批验证中 multi_audit_fail :多人审批验证失败 success :划转成功 fail :划转失败          |                                                            |
| state  | string   | 狀態           |                                                            |
| amount   | number   | 金額           |                                                            |
| refuse  | string   | 拒絕原因           |                                                            |
| createdTime  | integer   | 創建時間           |                                                            |
| updatedTime  | integer   | 更新時間           |                                                            |

## UID劃轉記錄分页查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/api/uid-transfer/page`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| clientOrderId | false     | string | 划转订单 |        |          |
| status | false     | string | 订单状态 |        |     狀態 枚举: jumio,audit,audit_refuse,multi_audit_refuse,multi_audit_fail,success,fail 枚举备注: jumio :人脸识别验证 audit :人工审核中 audit_refuse :人工审核拒绝 multi_audit_refuse :多人审批验证中 multi_audit_fail :多人审批验证失败 success :划转成功 fail :划转失败      |
| createTime | false     | object | 申请时间 |        |          |
| updateTime | false     | object | 申请时间 |        |          |
| current | false     | integer | 当前页码 |        |          |
| size | false     | string | 分页大小 |        |          |
| direction | false     | integer | 排序方向 -1asc 1desc |        |          |

createTime/updateTime 字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| start  | integer   | 开始时间           |        精确到毫秒  闭                                                 |
| end  | integer   | 结束时间           |          精确到毫秒  开                                              |


> Response:

```json
{
  "code": 200,
  "data": [
    {
      "id": 1,
      "clientOrderId": "12312223131",
      "fromUid": "123123131",
      "toUid": "23213131312",
      "toUserName": "test@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000,
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    },
    {
      "id": 2,
      "clientOrderId": "12312223131",
      "fromUid": "12312223131",
      "toUid": "2321313331312",
      "toUserName": "tes12t@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000",
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    }
  ],
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| id  | number   | 数据id           |                                                            |
| clientOrderId  | string   | 劃轉订单id           |                                                            |
| fromUid  | string   | 劃轉方uid           |                                                            |
| toUid  | string   | 收款方uid           |                                                            |
| toUserName  | string   | 收款方註冊賬號           |                                                            |
| state  | string   | 狀態 枚举: jumio,audit,audit_refuse,multi_audit_refuse,multi_audit_fail,success,fail 枚举备注: jumio :人脸识别验证 audit :人工审核中 audit_refuse :人工审核拒绝 multi_audit_refuse :多人审批验证中 multi_audit_fail :多人审批验证失败 success :划转成功 fail :划转失败          |                                                            |
| state  | string   | 狀態           |                                                            |
| amount   | number   | 金額           |                                                            |
| refuse  | string   | 拒絕原因           |                                                            |
| createdTime  | integer   | 創建時間           |                                                            |
| updatedTime  | integer   | 更新時間           |                                                            |


## UID划转

API Key 權限：寫權限<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/api/uid-transfer`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| toUid | true     | integer | 收款方用户uid |        |          |
| phone | true     | string | 收款方手机号后四位 |        |          |
| currency | true     | string | 幣種 |        |          |
| amount | true     | number | 金额 |        |          |

> Response:

```json
{
  "code": 200,
  "data" {
    "clientOrderId": "213123123131"
  }: 
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| clientOrderId  | string   | 劃轉订单id           |                                                            |


# 賬戶相關

## 簡介

賬戶相關接口提供了賬戶、余額等查詢轉等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## 賬戶信息查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

查詢指定類型賬戶，支持以下賬戶類型：

hb-spot：資金賬戶， hbt-custody：交易賬戶

### HTTP 請求

- GET `/v1/open/account/get`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| source | true     | string | hb-spot：資金賬戶，hbt-custody：交易賬戶 |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| balance   | string   | 余額           |                                                            |
| suspense  | string   | 凍結金額        |                                                            |
| price     | object   | 折合usdt行情    |                                                            |

price字段說明（數據來源火幣 Global）

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| symbol    | string   | 交易對          |                                                            |
| high      | number   | 24小時最高價     |                                                            |
| close     | number   | 最新價          |                                                            |
| open      | number   | 24小時開盤價    |                                                            |
| amount    | number   | 24小時成交量    |                                                            |
| vol       | number   | 24小時成交額    |                                                            |
| count     | number   | 24小時成交筆數	  |




# 資產記錄

## 簡介

資產記錄相關接口提供了充幣、提幣、劃轉記錄等查詢轉等功能。

<aside class="notice">訪問資產記錄相關接口需要進行簽名認證。</aside>

## 充幣記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v2/external/deposit/finance/history`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述    | 默認值 | 取值範圍 |
| --------- | -------- | ------ | --- | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| startTime | false     | long | 查询起始时间(毫秒) |        |          |
| endTime | false     | long | 查询结束时间(毫秒) |        |          |
| from | false     | long | 查询起始ID |        |          |
| direct | false     | string | 方向："prev", "next"（prev 时间由近及远， next时间由远及近） |        |          |
| size | false     | int | 分页查询查询结果条数（如不传，默认每页展示10条记录，取值区间[1,500]） |        |          |
| state | false     | int | 提币状态代码集合(多个用英文逗号分隔) 提币单状态:(1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | list    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| amount   | string   | 余額           |                                                            |
| chain  | string   | 凍結金額        |                                                            |
| errorCode     | object   | 錯誤碼    |                                                            |
| errorMsg     | object   | 錯誤信息    |                                                            |
| fees     | object   | 手续费	    |                                                            |
| id     | object   | id    |                                                            |
| label     | object   | 標籤    |                                                            |
| state     | object   | 状态    |                                                            |
| toAddress     | object   | 地址    |                                                            |
| toAddressTag     | object   | 地址标签    |                                                            |
| txHash     | object   | txHash    |                                                            |
| type     | string   | 类型    |                                                            |
| createAt     | long   | 創建時間    |                                                            |
| updateAt     | long   | 更新時間    |                                                            |

                                                         |                                                           |
## 提幣記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v2/external/deposit/finance/history`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述    | 默認值 | 取值範圍 |
| --------- | -------- | ------ | --- | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| startTime | false     | long | 查询起始时间(毫秒) |        |          |
| endTime | false     | long | 查询结束时间(毫秒) |        |          |
| from | false     | long | 查询起始ID |        |          |
| direct | false     | string | 方向："prev", "next"（prev 时间由近及远， next时间由远及近） |        |          |
| size | false     | int | 分页查询查询结果条数（如不传，默认每页展示10条记录，取值区间[1,500]） |        |          |
| state | false     | int | 提币状态代码集合(多个用英文逗号分隔) 提币单状态:(1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | list    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| amount   | string   | 余額           |                                                            |
| blockchainConfirm | integer   | 確認次數 |                                                            |
| depositSafeConfirms | integer | 安全確認次數 |                                                            |
| errorCode     | object   | 錯誤碼    |                                                            |
| errorMsg     | object   | 錯誤信息    |                                                            |
| id     | object   | id    |                                                            |
| state     | object   | 状态    |                                                            |
| txHash     | object   | txHash    |                                                            |
| type     | string   | 类型    |                                                            |
| createAt     | long   | 創建時間    |                                                            |
| updateAt     | long   | 更新時間    |                                                            |

歡迎使用Huobi Trust API！

此文檔是Huobi Trust API的唯一官方文檔，Huobi Trust API提供的功能和服務會在此文檔持續更新。

以下是現貨API文檔各章節主要內容

第一部分是概要介紹：

- **快速入門**：該章節對Huobi Trust API做了簡單且全方位的介紹，適合第一次使用Huobi Trust API的用戶。
- **常見問題**：該章節列舉了使用Huobi Trust API時常見的、和具體API無關的通用問題。
- **聯系我們**：該章節介紹了針對不同問題，如何聯系我們。

第二部分是每個接口類的詳細介紹，每個接口類一個章節，每個章節分為如下內容：

- **簡介**：對該接口類進行簡單介紹，包括一些註意事項和說明。
- ***具體接口***：介紹每個接口的用途、限頻、請求、參數、返回等詳細信息。
- **常見錯誤碼**：介紹該接口類下常見的錯誤碼及其說明。
- **常見問題**：介紹該接口類下常見問題和解答。

# 快速入門

## 接入準備

如需使用API ，請先登錄網頁端，完成API key的申請和權限配置，再據此文檔詳情進行開發和交易。

您可以點擊 <a href='https://www.huobihktrust.com/zh-hk/user/api/ '>這裏 </a> 創建 API Key。

每個用戶可創建20組Api Key，每個Api Key可對應設置讀取權限。

權限說明如下：

- 讀取權限：讀取權限用於對數據的查詢接口，例如：資產列表查詢等。

創建成功後請務必記住以下信息：

- `Access Key`  API 訪問密鑰

- `Secret Key`  簽名認證加密所使用的密鑰（僅申請時可見）

<aside class="notice">
每個 API Key 最多可綁定 20個IP 地址(主機地址或網絡地址)。
</aside>
<aside class="warning">
<red><b>風險提示</b></red>：這兩個密鑰與賬號安全緊密相關，無論何時都請勿將二者<b>同時</b>向其它人透露。API Key的泄露可能會造成您的資產損失（即使未開通提幣權限），若發現API Key泄露請盡快刪除該API Key。
</aside>

## SDK與代碼示例

[Java](https://github.com/huobitrustapi/huobi_Java) | [Python3](https://github.com/huobitrustapi/huobi_Python) | [C++](https://github.com/huobitrustapi/huobi_Cpp) | [C#](https://github.com/huobitrustapi/huobi_CSharp) | [Go](https://github.com/huobitrustapi/huobi_golang)

**其它代碼示例**

[https://github.com/huobitrustapi?tab=repositories](https://github.com/huobitrustapi?tab=repositories)

## 接口類型

香港信托為用戶提供兩種接口，您可根據自己的使用場景和偏好來選擇適合的方式進行查詢資產。

### REST API

REST，即Representational State Transfer的縮寫，是目前較為流行的基於HTTP的一種通信機製，每一個URL代表一種資源。

使用API進行資產查詢，建議開發者使用REST API進行操作。

### WebSocket API

WebSocket是HTML5一種新的協議（Protocol）。它實現了客戶端與服務器全雙工通信，通過一次簡單的握手就可以建立客戶端和服務器連接，服務器可以根據業務規則主動推送信息給客戶端。

市場行情和買賣深度等信息，建議開發者使用WebSocket API進行獲取。

**接口鑒權**

以上兩種接口均包含公共接口和私有接口兩種類型。

公共接口可用於獲取基礎信息和行情數據。公共接口無需認證即可調用。

私有接口可用於交易管理和賬戶管理。每個私有請求必須使用您的API Key進行簽名驗證。

## 接入URLs
您可以使用www.huobihktrust.com域名。

**REST API**

**`https://www.huobihktrust.com`**

<aside class="notice">
請使用中國大陸以外的 IP 訪問Huobi Trust API。
</aside>
<aside class="notice">
鑒於延遲高和穩定性差等原因，不建議通過代理的方式訪問Huobi Trust API。
</aside>
<aside class="notice">
為保證API服務的穩定性，建議使用日本AWS雲服務器進行訪問。如使用中國大陸境內的客戶端服務器，連接的穩定性將難以保證。
</aside>

## 簽名認證

### 簽名說明

API 請求在通過 internet 傳輸的過程中極有可能被篡改，為了確保請求未被更改，除公共接口（基礎信息，行情數據）外的私有接口均必須使用您的 API Key 做簽名認證，以校驗參數或參數值在傳輸途中是否發生了更改。
每一個API Key需要有適當的權限才能訪問相應的接口，每個新創建的API Key都需要分配權限。在使用接口前，請查看每個接口的權限類型，並確認你的API Key有相應的權限。

一個合法的請求由以下幾部分組成：

- 方法請求地址：即訪問服務器地址 www.huobihktrust.com，比如 www.huobihktrust.com/v1/open/apiKeyDemo。
- API 訪問Id（AccessKeyId）：您申請的 API Key 中的 Access Key。
- 簽名方法（SignatureMethod）：用戶計算簽名的基於哈希的協議，此處使用 HmacSHA256。
- 簽名版本（SignatureVersion）：簽名協議的版本，此處使用2。
- 時間戳（Timestamp）：您發出請求的時間 (UTC 時間)  。如：2017-05-11T16:22:06。在查詢請求中包含此值有助於防止第三方截取您的請求。
- 必選和可選參數：每個方法都有一組用於定義 API 調用的必需參數和可選參數。可以在每個方法的說明中查看這些參數及其含義。
  - 對於 GET 請求，每個方法自帶的參數都需要進行簽名運算。
  - 對於 POST 請求，每個方法自帶的參數不進行簽名認證，並且需要放在 body 中。
- 簽名：簽名計算得出的值，用於確保簽名有效和未被篡改。

### 簽名步驟

規範要計算簽名的請求 因為使用 HMAC 進行簽名計算時，使用不同內容計算得到的結果會完全不同。所以在進行簽名計算前，請先對請求進行規範化處理。下面以查詢某訂單詳情請求為例進行說明：

查詢某訂單詳情時完整的請求URL

`https://www.huobihktrust.com/v1/open/apiKeyDemo?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

**1. 請求方法（GET 或 POST，WebSocket用GET），後面添加換行符 「\n」**

例如：
`GET\n`

**2. 添加小寫的訪問域名，後面添加換行符 「\n」**

例如：
`
www.huobihktrust.com\n
`

**3. 訪問方法的路徑，後面添加換行符 「\n」**

例如apiKeyDemo：<br>
`
/v1/open/apiKeyDemo\n
`

例如WebSocket v2<br>
`
/ws/v2
`

**4. 對參數進行URL編碼，並且按照ASCII碼順序進行排序**

例如，下面是請求參數的原始順序，且進行URL編碼後


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`demo-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 編碼，且進行了 URL 編碼，十六進製字符必須大寫，如 「:」 會被編碼為 「%3A」 ，空格被編碼為 「%20」。
</aside>
<aside class="notice">
時間戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加並且進行 URL 編碼。時間戳有效時間5分鐘。
</aside>

經過排序之後

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`demo-id=1234567890`

**5. 按照以上順序，將各參數使用字符 「&」 連接**


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`

**6. 組成最終的要進行簽名計算的字符串如下**

`GET\n`

`www.huobihktrust.com\n`

`v1/open/apiKeyDemo\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&demo-id=1234567890`


**7. 用上一步裏生成的 「請求字符串」 和你的密鑰 (Secret Key) 生成一個數字簽名**


1. 將上一步得到的請求字符串和 API 私鑰作為兩個參數，調用HmacSHA256哈希函數來獲得哈希值。
2. 將此哈希值用base-64編碼，得到的值作為此次接口調用的數字簽名。

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

**8. 將生成的數字簽名加入到請求裏**

對於Rest接口：

1. 把所有必須的認證參數添加到接口調用的路徑參數裏
2. 把數字簽名在URL編碼後加入到路徑參數裏，參數名為「Signature」。

最終，發送到服務器的 API 請求應該為

`https://www.huobihktrust.com/v1/open/apiKeyDemo?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&demo-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`


# 接入說明

## 接口概覽

| 接口分類       | 分類鏈接                     | 概述                                             |
| -------------- | ---------------------------- | ------------------------------------------------ |
| 測試類         | /v1/open/apiKeyDemo/*        | apiKey測試相關接口       |
| 賬戶類         | /v1/open/account/*           | 賬戶相關接口             |


該分類為大類整理，部分接口未遵循此規則，請根據需求查看有關接口文檔。

## 新限頻規則

- 當前，新限頻規則正在逐步上線中，已單獨標註限頻值的接口且該限頻值被標註為NEW的接口適用新限頻規則。

- 新限頻規則采用基於UID的限頻機製，即，同一UID下各API Key同時對某單個節點請求的頻率不能超出單位時間內該節點最大允許訪問次數的限製。

- 用戶可根據Http Header中的"X-HB-RateLimit-Requests-Remain"（限頻剩余次數）及"X-HB-RateLimit-Requests-Expire"（窗口過期時間）查看當前限頻使用情況，以及所在時間窗口的過期時間，根據該數值動態調整您的請求頻率。

## 限頻規則

除已單獨標註限頻值為NEW的接口外 -<br>
* 每個API Key 在1秒之內限製10次<br>
* 若接口不需要API Key，則每個IP在1秒內限製10次<br>

比如：

* 資產訂單類接口調用根據API Key進行限頻：1秒10次


## 請求格式

所有的API請求都是restful，目前只有兩種方法：GET和POST

* GET請求：所有的參數都在路徑參數裏
* POST請求，所有參數以JSON格式發送在請求主體（body）裏

## 返回格式

所有的接口都是JSON格式。其中v1和v2接口的JSON定義略有區別。

**接口返回格式**：最上層有三個字段：`code`, `message` 和 `data`。前兩個字段表示返回碼和錯誤消息，實際的業務數據在`data`字段裏。

以下是一個返回格式的樣例：

```json
{
  "code": 200,
  "message": "",
  "data": // per API response data in nested JSON object
}
```

| 參數名稱 | 數據類型 | 描述               |
| -------- | -------- | ------------------ |
| code     | int      | API接口返回碼      |
| message  | string   | 錯誤消息（如果有） |
| data     | object   | 接口返回數據主體   |

## 數據類型

本文檔對JSON格式中數據類型的描述做如下約定：

- `string`: 字符串類型，用雙引號（"）引用
- `int`: 32位整數，主要涉及到狀態碼、大小、次數等
- `long`: 64位整數，主要涉及到Id和時間戳
- `float`: 浮點數，主要涉及到金額和價格，建議程序中使用高精度浮點型
- `object`: 對象，包含一個子對象{}
- `array`: 數組，包含多個對象

## 最佳實踐

###安全類
- 強烈建議：不要將API Key暴露給任何人（包括第三方軟件或機構），API Key代表了您的賬戶權限，API Key的暴露可能會對您的信息、資金造成損失，若API Key泄露，請盡快刪除並重新創建。

###公共類
**API訪問建議**

- 不建議在中國大陸境內使用臨時域名以及代理的方式訪問Huobi Trust API，此類方式訪問API連接的穩定性很難保證。
- 建議使用日本AWS雲服務器進行訪問。
- 官方域名www.huobihktrust.com。


**新限頻規則**

- 當前最新限頻規則正在逐步上線中，已單獨標註限頻值的接口適用新限頻規則。

- 用戶可根據Http Header中「X-HB-RateLimit-Requests-Remain（限頻剩余次數）」，「X-HB-RateLimit-Requests-Expire（窗口過期時間）」查看當前限頻使用情況，以及所在時間窗口的過期時間，根據該數值動態調整您的請求頻率。

- 同一UID下各API Key同時對某單個節點請求的頻率不能超出單位時間內該節點最大允許訪問次數的限製。


# 常見問題

本章列舉了和具體API無關的通用常見問題，如網絡、簽名或通用錯誤等。

針對某類或某個API的問題，請查看每章API的錯誤碼和常見問題。

### Q1：一個用戶可以申請多少個API Key？

每個用戶可創建20組API Key，每個API Key可對應設置讀取權限。

以下是權限的說明：

- 讀取權限：讀取權限用於對數據的查詢接口，例如：資產查詢等。

### Q2：為什麽經常出現斷線、超時的情況？

請檢查是否屬於以下情況：

1. 客戶端服務器如在中國大陸境內，連接的穩定性很難保證，建議使用日本AWS雲服務器進行訪問。

### Q3：為什麽簽名認證總返回失敗？

請檢查如下可能的原因：


1、簽名參數應該按照ASCII碼排序。比如下面是原始的參數：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

排序之後應該為：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2、簽名串需進行URL編碼。比如：

- 冒號 `:`會被編碼為`%3A`，空格會被編碼為 `%20`
- 時間戳需要格式化為 `YYYY-MM-DDThh:mm:ss` ，經過URL編碼之後為 `2017-05-11T15%3A19%3A30`

3、簽名需進行 base64 編碼

4、Get請求參數需在簽名串中

5、時間為UTC時間轉換為YYYY-MM-DDTHH:mm:ss

6、檢查本機時間與標準時間是否存在偏差（偏差應小於1分鐘）

7、簽名時所帶Host應與請求接口時Host相同

如果您使用了代理，代理可能會改變請求Host，可以嘗試去掉代理；

或者，您使用的網絡連接庫可能會把端口包含在Host內，可以嘗試在簽名用到的Host中包含端口，如「www.huobihktrust.com:443"

8、Access Key 與 Secret Key中是否存在隱藏特殊字符，影響簽名

當前官方已支持多種語言的[SDK](https://github.com/huobitrustapi)，可以參考SDK的簽名實現，或者以下三種語言的簽名樣例代碼

<a href='https://github.com/huobitrustapi/huobi_Java/blob/master/java_signature_demo.md'>JAVA簽名樣例代碼</a> | <a href='https://github.com/huobitrustapi/huobi_Python/blob/master/example/python_signature_demo.md'>Python簽名樣例代碼</a>   | <a href='https://github.com/huobitrustapi/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++簽名樣例代碼 </a>

### Q7：調用接口返回Incorrect Access Key 錯誤是什麽原因？

請檢查URL請求中Access Key是否傳遞準確，例如：

1. Access Key沒有傳遞
2. Access Key位數不準確
3. Access Key已經被刪除
4. URL請求中參數拼接錯誤或者特殊字符沒有進行編碼導致服務端對AccessKey解析不正確

### Q8：調用接口返回 gateway-internal-error 錯誤是什麽原因？

請檢查是否屬於以下情況：

1. 可能為網絡原因或服務內部錯誤，請稍後進行重試。
2. 發送數據格式是否正確（需要標準JSON格式）。
3. POST請求頭header需要聲明為`Content-Type:application/json` 。

### Q9：調用接口返回 login-required 錯誤是什麽原因？

請檢查是否屬於以下情況：

1. 未將AccessKey參數帶入URL中。
2. 未將Signature參數帶入URL中。

### Q10: 調用Rest接口返回HTTP 405錯誤 method-not-allowed 是什麽原因？

該錯誤表明調用了不存在的Rest接口，請檢查Rest接口路徑是否準確。由於Nginx的設置，請求路徑(Path)是大小寫敏感的，請嚴格按照文檔聲明的大小寫。

# 聯系我們

## 技術支持

使用過程中如有問題或者建議，您可選擇以下任一方式聯系我們：

- 通過官網的「幫助中心」或者發送郵件至support@huobihktrust.com聯系客服。

如您遇到API錯誤，請按照如下模板向我們反饋問題。

`1. 問題描述`
`2. 問題發生的用戶Id(UID)，賬戶Id和訂單Id(如果和賬戶、訂單有關系)`
`3. 完整的URL請求`
`4. 完整的JSON格式的請求參數（如果有）`
`5. 完整的JSON格式的返回結果`
`6. 問題出現時間和頻率（如何時開始出現，是否可以重現）`
`7. 簽名前字符串（如果是簽名認證錯誤）`


下方是一個應用了模版的例子：

`1. 問題簡要說明：簽名錯誤`
`2. UID：123456`
`3. 完整的URL請求：GET https://www.huobihktrust.com/v1/open/apiKeyDemo/forRead?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`
`4. 完整的JSON格式的參數：無`
`5. 完整的JSON格式的返回：{"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key錯誤]","data":null}`
`6. 問題出現頻率：每次都會出現`
`7. 簽名前字符串`
`GET\n`
`www.huobihktrust.com\n`
`/v1/open/apiKeyDemo/forRead\n`
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`

註意：Access Key僅能證明您的身份，不會影響您賬戶的安全。切記**不**要將Secret Key信息分享給任何人，若您不小心將Secret Key暴露，請盡快[刪除](https://www.hbg.com/zh-cn/apikey/)其對應的API Key，以免造成您的賬戶損失。

# 用戶相關

賬戶相關接口提供了用戶綁定、信息查詢等查詢轉等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## 用戶鑒權

用戶綁定，暫時由信託根據簽名信息自主完成
簽名流程參照api key加簽流程(秘鑰由信託單獨生成同步給機構，與用戶個人的api key區分使用)
最終，登錄的地址應該為

${信託web頁面登錄url}?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&outerUserId=1234567890&callBackUrl=${回調url}&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

### HTTP 請求

- GET `信託web頁面登錄url`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| AccessKeyId | true     | string | 外部系統鑒權access key(由信託服務生成，提供) |        |          |
| outerUserId | true     | string | 外部系統用戶唯一標識 |        |          |
| callbackUrl | true     | string | 回調url |        |          |
| SignatureMethod | true     | string | 簽名方法（HmacSHA256） |        |          |
| SignatureVersion | true     | string | 簽名版本（2） |        |          |
| Timestamp | true     | string | 時間戳（例如：2017-05-11T15%3A19%3A30） |        |          |
| Signature | true     | string | 簽名數據 |        |          |




## 用戶基础信息查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/user/getBaseInfo`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| outerUserId | true     | string | （外部系统用户id）外部系统用户唯一标识 |        |          |


> Response:

```json
{
  "code": 200,
  "data": [
    {
      "outerUserId": "213123D1231",
      "outerUid": "12312317263123"
    }
  ],
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| outerUserId  | string   | 外部系统用户标识           |                                                            |
| outerUid   | string   | 外部uid           |                                                            |


# 划转相關

## 簡介

劃轉相關接口提供了賬戶劃轉、查詢等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## UID劃轉記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/api/uid-transfer/list`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| startTime | false     | string | 开始时间 |        |          |
| endTime | false     | string | 结束时间 |        |          |
| direction | false     | string | 分页方向 |        |          |
| fromId | false     | string | 分页开始id |        |          |
| size | false     | string | 分页大小 |        |          |


> Response:

```json
{
  "code": 200,
  "data": [
    {
      "id": 1,
      "clientOrderId": "12312223131",
      "fromUid": "123123131",
      "toUid": "23213131312",
      "toUserName": "test@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000,
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    },
    {
      "id": 2,
      "clientOrderId": "12312223131",
      "fromUid": "12312223131",
      "toUid": "2321313331312",
      "toUserName": "tes12t@163.com",
      "currency": "usdt",
      "state": "audit_refuse",
      "amount": 10120.558300000000000000",
      "refuse": "拒绝原因",
      "createdTime": 1637075011000,
      "updatedTime": 1637075011000
    }
  ],
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| id  | number   | 数据id           |                                                            |
| clientOrderId  | string   | 劃轉订单id           |                                                            |
| fromUid  | string   | 劃轉方uid           |                                                            |
| toUid  | string   | 收款方uid           |                                                            |
| toUserName  | string   | 收款方註冊賬號           |                                                            |
| state  | string   | 狀態 枚举: jumio,audit,audit_refuse,multi_audit_refuse,multi_audit_fail,success,fail 枚举备注: jumio :人脸识别验证 audit :人工审核中 audit_refuse :人工审核拒绝 multi_audit_refuse :多人审批验证中 multi_audit_fail :多人审批验证失败 success :划转成功 fail :划转失败          |                                                            |
| state  | string   | 狀態           |                                                            |
| amount   | number   | 金額           |                                                            |
| refuse  | string   | 拒絕原因           |                                                            |
| createdTime  | integer   | 創建時間           |                                                            |
| updatedTime  | integer   | 更新時間           |                                                            |


## UID划转

API Key 權限：寫權限<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v1/open/api/uid-transfer`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| toUid | true     | integer | 收款方用户uid |        |          |
| phone | true     | string | 收款方手机号后四位 |        |          |
| currency | true     | string | 幣種 |        |          |
| amount | true     | number | 金额 |        |          |

> Response:

```json
{
  "code": 200,
  "data" {
    "clientOrderId": "213123123131"
  }: 
  "success": true
}
```

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| clientOrderId  | string   | 劃轉订单id           |                                                            |


# 賬戶相關

## 簡介

賬戶相關接口提供了賬戶、余額等查詢轉等功能。

<aside class="notice">訪問賬戶相關的接口需要進行簽名認證。</aside>

## 賬戶信息查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

查詢指定類型賬戶，支持以下賬戶類型：

hb-spot：資金賬戶， hbt-custody：交易賬戶

### HTTP 請求

- GET `/v1/open/account/get`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述                                                         | 默認值 | 取值範圍 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| source | true     | string | hb-spot：資金賬戶，hbt-custody：交易賬戶 |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | object    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| balance   | string   | 余額           |                                                            |
| suspense  | string   | 凍結金額        |                                                            |
| price     | object   | 折合usdt行情    |                                                            |

price字段說明（數據來源火幣 Global）

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| symbol    | string   | 交易對          |                                                            |
| high      | number   | 24小時最高價     |                                                            |
| close     | number   | 最新價          |                                                            |
| open      | number   | 24小時開盤價    |                                                            |
| amount    | number   | 24小時成交量    |                                                            |
| vol       | number   | 24小時成交額    |                                                            |
| count     | number   | 24小時成交筆數	  |




# 資產記錄

## 簡介

資產記錄相關接口提供了充幣、提幣、劃轉記錄等查詢轉等功能。

<aside class="notice">訪問資產記錄相關接口需要進行簽名認證。</aside>

## 充幣記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v2/external/deposit/finance/history`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述    | 默認值 | 取值範圍 |
| --------- | -------- | ------ | --- | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| startTime | false     | long | 查询起始时间(毫秒) |        |          |
| endTime | false     | long | 查询结束时间(毫秒) |        |          |
| from | false     | long | 查询起始ID |        |          |
| direct | false     | string | 方向："prev", "next"（prev 时间由近及远， next时间由远及近） |        |          |
| size | false     | int | 分页查询查询结果条数（如不传，默认每页展示10条记录，取值区间[1,500]） |        |          |
| state | false     | int | 提币状态代码集合(多个用英文逗号分隔) 提币单状态:(1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | list    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| amount   | string   | 余額           |                                                            |
| chain  | string   | 凍結金額        |                                                            |
| errorCode     | object   | 錯誤碼    |                                                            |
| errorMsg     | object   | 錯誤信息    |                                                            |
| fees     | object   | 手续费	    |                                                            |
| id     | object   | id    |                                                            |
| label     | object   | 標籤    |                                                            |
| state     | object   | 状态    |                                                            |
| toAddress     | object   | 地址    |                                                            |
| toAddressTag     | object   | 地址标签    |                                                            |
| txHash     | object   | txHash    |                                                            |
| type     | string   | 类型    |                                                            |
| createAt     | long   | 創建時間    |                                                            |
| updateAt     | long   | 更新時間    |                                                            |

                                                         |                                                           |
## 提幣記錄查詢

API Key 權限：讀取<br>
限頻值（NEW）：100次/2s

### HTTP 請求

- GET `/v2/external/deposit/finance/history`

### 請求參數

| 參數名稱   | 是否必須 | 類型   | 描述    | 默認值 | 取值範圍 |
| --------- | -------- | ------ | --- | ------ | -------- |
| currency | false     | string | 幣種 |        |          |
| startTime | false     | long | 查询起始时间(毫秒) |        |          |
| endTime | false     | long | 查询结束时间(毫秒) |        |          |
| from | false     | long | 查询起始ID |        |          |
| direct | false     | string | 方向："prev", "next"（prev 时间由近及远， next时间由远及近） |        |          |
| size | false     | int | 分页查询查询结果条数（如不传，默认每页展示10条记录，取值区间[1,500]） |        |          |
| state | false     | int | 提币状态代码集合(多个用英文逗号分隔) 提币单状态:(1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |        |          |


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

### 響應數據

| 參數名稱 | 是否必須 | 數據類型 | 描述     | 取值範圍                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| code         | true    | integer     | 狀態碼  | |
| message      | false   | string    | 錯誤描述（如有）| |
| data         | false   | list    | 業務數據 ||

data字段說明

| 參數名稱 | 數據類型 | 描述           | 取值範圍                                                     |
| -------- | -------- | -------------- | ------------------------------------------------------------ |
| currency  | string   | 幣種           |                                                            |
| amount   | string   | 余額           |                                                            |
| blockchainConfirm | integer   | 確認次數 |                                                            |
| depositSafeConfirms | integer | 安全確認次數 |                                                            |
| errorCode     | object   | 錯誤碼    |                                                            |
| errorMsg     | object   | 錯誤信息    |                                                            |
| id     | object   | id    |                                                            |
| state     | object   | 状态    |                                                            |
| txHash     | object   | txHash    |                                                            |
| type     | string   | 类型    |                                                            |
| createAt     | long   | 創建時間    |                                                            |
| updateAt     | long   | 更新時間    |                                                            |
**
