**--- title: Huobi Trust API Document

language_tabs: # must be one of https://git.io/vQNgJ
- json

toc_footers:
- <a href='https://www.huobihktrust.com/zh-hk/user/api/'>Creating API Key </a>
  includes:

search: true
---

# Change Log

<style>
table {
    max-width:100%
}
table th {
    white-space: nowrap; /*表頭內容強製在一行顯示*/
}
</style>

| Effective time<br>(UTC+8) | Endpoints | Change | General Info |
| -------------------------------- | --------- | ------ | ------------ |
| September 16, 2021               | -         | -      | -            |


# Introduction

Welcome to Huobi Trust API!

This document is the only official documentation for Huobi Trust API, and the capabilities and services provided by Huobi Trust API will be continuously updated here.

The API documentation mainly includes the following parts:

Part 1: Overview

- **Quick Start**: It gives a brief and comprehensive introduction to Huobi Trust API, applicable to beginners of Huobi Trust API.
- **FAQ**: It includes frequently asked questions in the course of using Huobi Trust API but irrelevant to specific APIs.
- **Contact Us**: It guides you to contact us for solutions to various questions.

Part 2:  A detailed introduction to each type of API endpoints, explained as follows:

- **Introduction**: It briefly introduces this type of endpoint, including notes and descriptions.
- ***Specific API***: It details the following information about each API: usage, rate limit, request and response Parameters.
- **Common Error Code**: It lists common error codes and their descriptions.
- **FAQ**: It introduces frequently asked questions about the endpoint and their answers.

# Quick Start

## Preparation

To use API, log in to the Huobi Trust website, create an API key, complete the permission settings, and then you can get started in developing and trading based on this document.

You can click <a href='https://www.huobihktrust.com/en-us/user/api/ '>here</a> to create an API key.

Up to 20 API keys can be created for each account. Each API key can be assigned the read/write/trade permission.

Permission description is as follows:

- Read permission: It only applies to data query, such as asset list query.

After API creation, make sure the following information are memorized or noted down:

- `Access Key`: API access key

- `Secret Key`: The key for encrypted signature authentication (applicable only upon request)

<aside class="notice">
Up to 20 IP addresses (either host IP or network IP address) can be bound to an API key.
</aside>
<aside class="warning">
<red><b>Risk reminder</b></red>: both of keys above are closely related to the account security. Please <b>do not</b> disclose them to anyone else.The disclosure of an API key may cause the loss of your asset (even if you have not assigned the withdrawal permission to the key). If your API keys are exposed to the public, please delete the keys as soon as possible.
</aside>

## SDK and Code Demonstration

[Java](https://github.com/huobitrustapi/huobi_Java) | [Python3](https://github.com/huobitrustapi/huobi_Python) | [C++](https://github.com/huobitrustapi/huobi_Cpp) | [C#](https://github.com/huobitrustapi/huobi_CSharp) | [Go](https://github.com/huobitrustapi/huobi_golang)

**For more code instances, see**

[https://github.com/huobitrustapi?tab=repositories](https://github.com/huobitrustapi?tab=repositories)

## API Type

Huobi Trust provides you with two types of API. You can select any of the following to query assets based on application scenarios and your preferences.

### REST API

Representational State Transfer (REST) is a popular communication mechanism based on HTTP. Each URL represents a resource.

Developers are advised to query assets using the REST API.

### WebSocket API

WebSocket is a new protocol in HTML5. It provides full duplex connecting a client and a server via just one handshake. The server can push information to the client based on the given rules.

It is recommended that developers use WebSocket API to query information, such as market conditions and market depth.

**API Authentication**

Both APIs above contain public and private interfaces.

A public interface is used to obtain the basic information and market data. Calling the public interface requires no authentication.

A private interface is used to manage trades and accounts.Your API key is required to generate the signature for each private request.

## Access URL
The domain name is "api.huobihktrust.com".

**REST API**

**`https://api.huobihktrust.com`**

<aside class="notice">
Please access Huobi Trust API with an IP address other than from the Chinese mainland.
</aside>
<aside class="notice">
Due to high latency and poor stability, it is not recommended to access Huobi Trust API via proxy.
</aside>
<aside class="notice">
Access with the Hong Kong-based AWS cloud server is recommended to ensure the stability of the API service. Connection stability may not be guaranteed if a client from the Chinese mainland is used.
</aside>

## Signature Authentication

### Signature Description

An API request is most probably tampered during the internet transmission. To ensure that the request will not be changed, signature authentication via your API key is required for all private interfaces, against public interfaces (basic information and market data), to check whether parameters or parameter values are changed during the transmission. Each API key requires permissions to access a corresponding endpoint. A newly created API key needs to be configured with permissions. Before using API, check the permissions the interface required and confirm that your API key has the same permission.

A valid request consists of the following parts:

- API Path: address that accesses a server, such as api.huobihktrust.com/v1/open/apiKeyDemo
- API access ID (AccessKeyId): an access key of the API key you created
- Signature method (SignatureMethod): a Hash-based protocol used by users to generate the signature. HmacSHA256 is used.
- Signature version (SignatureVersion): a version for a signature protocol. Version 2 is used.
- Timestamp: time (UTC) when you issue a request. For example: 2017-05-11T16:22:06. A query request containing this value contributes to prevent a third party from intercepting your request.
- Mandatory and optional parameters: Each method contains both mandatory and optional parameters. You can view these parameters and their meanings in the method description.
  - For the GET request, each method's original parameters must be signed.
  - For the POST request, each method's original parameters needn't be signed, but they should be included in the request body.
- Signature: a value as a result of computation. It ensures that the signature is valid, and the request is not tampered.

### Signing Steps

The signature may be different if the request parameters is different using HMAC. Therefore, the request should be normalized before signing. Here's an example: A request to query the order details

A full request URL to query the order details is as follows:

`https://api.huobihktrust.com/v1/open/apiKeyDemo?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

**1. Request Method (GET or POST). Append a newline character "\n".**

For example: `GET\n`

**2. Add an access domain name in lowercase letter followed by a newline character "\n".**

For example: `api.huobihktrust.com\n`

**3. Access the method path followed by a new line character "\n".**

For example, apiKeyDemo: <br>
`/v1/open/apiKeyDemo\n`

For example, WebSocket v2<br>
`/ws/v2`

**4. Encode parameters in URL and sort them based on ASCII code.**

For example, the following is the original order of URL-encoded request parameters:


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`demo-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
Encoded in UTF-8 and URL. Hexadecimal characters must be capitalized. For example, ":" will be encoded as "%3A", and a space as "%20".
</aside>
<aside class="notice">
Timestamp must be added in the "YYYY-MM-DDThh:mm:ss" format and encoded in URL.The timestamp is valid for 5 minutes.
</aside>

After sorting

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`demo-id=1234567890`

**5. Connect all parameters using "&" in the above sequence.**


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx& SignatureMethod=HmacSHA256& SignatureVersion=2& Timestamp=2017-05-11T15%3A19%3A30& demo-id=1234567890`

**6. The final character string that generates the signature is as follows:**

`GET\n`

`api.huobihktrust.com\n`

`v1/open/apiKeyDemo\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx& SignatureMethod=HmacSHA256& SignatureVersion=2& Timestamp=2017-05-11T15%3A19%3A30& demo-id=1234567890`


**7. Generate a digital signature using your secret key and the request character string generated in step 2.**


1. Regard the request character string and API secret key obtained as two parameters and call the HmacSHA256 Hash function to obtain the Hash value.
2. Encode the Hash value in base-64. The value obtained can be used as a digital signature to call API.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

**8. Add the generated digital signature into the request.**

For the REST API:

1. Add all mandatory authentication parameters to the path parameters used to call the API.
2. Add the URL-encoded digital signature to the path parameters, named as "Signature".

Finally, the API request sent to the server should be as follows:

`https://api.huobihktrust.com/v1/open/apiKeyDemo?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&demo-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`


# Access Description

## Overview

| Category | Links                 | Description            |
| -------- | --------------------- | ---------------------- |
| Testing  | /v1/open/apiKeyDemo/* | API Key Test Endpoints |
| Account  | /v1/open/account/*    | Asset Endpoints        |


It is a general category where some endpoints are not covered. Please check the relevant endpoints documents based on your needs.

## New Rate-Limit Rules

- As of now, new rate-limit rules are being introduced, and will apply to APIs that are separately marked with a rate-limit value labelled as NEW.

- New rate limit rules are a UID-based scheme. The combined rate of requests simultaneously made by all API Keys created under the same UID to a single endpoint is required not to exceed the rate limit allowed by this endpoint.

- Users may check out the rate-limit status and the expiry time of the concerned time window in Http Header's "X-HB-RateLimit-Requests-Remain" (rate limits remained) and "X-HB-RateLimit-Requests-Expire" (expiry time of a window),  respectively, and adjust request frequency accordingly in a dynamic manner.

## Rate-Limit Rules

For API endpoints other than those already separately marked as NEW -<br>
* Each API key is limited to up to 10 requests per second.<br>
* If an interface does not require an API key, each IP address can initiate up to 10 requests per second.<br>

For example:

* 10 requests per second can be initiated to call the endpoints related to asset orders.


## Request Format

All API requests are RESTFUL. Only two request methods are allowed: GET and POST.

* GET request: all parameters are in the path parameter.
* POST request: All parameters are formatted as JSON and put in the request body.

## Response Format

All interfaces are in JSON format.The JSON definition of the v1 interface is different from that of the v2 interface.

**Response format**: The top layer has three fields: `code`, `message`, and `data`.The first two fields indicate the error code and error message. The actual business data is in the `data` field.

An instance of the response format is as follows:

```json
{
  "code": 200,
  "message": "",
  "data": // per API response data in nested JSON object
}
```

| Name    | Type   | Description                    |
| ------- | ------ | ------------------------------ |
| code    | int    | API response code              |
| message | string | Error information (if any)     |
| data    | object | Data returned by the interface |

## Type

In this document, the description of the data type in JSON format is as follows:

- `string`: a string is a data type quoted by double quotation marks (")
- `int`: 32-bit integer that describes status code, size and count
- `long`: 64-bit integer that describes ID and timestamp
- `float`: a floating point that describes amount and price. High-precision floating points are advised in the program.
- `object`: an object, containing a subobject {}
- `array`: an array, containing multiple objects

## Best Practices

### Security
- Strong advice: Do not expose your API keys to anyone (including third-party software or institutions) since API keys inherit your account’s permissions. Any exposure may cause losses of your information or funds. If your API key is exposed to the public, please delete it as soon as possible and create a new key.

### Public
**API access advice**

- It is not recommended that a temporary domain name or the proxy mode be used to access Huobi Trust API in the Chinese mainland. The API connection may be not stable in such way.
- The Hong kong-based AWS cloud server is recommended for access.
- Official domain name: api.huobihktrust.com


**New rate-limit rules**

- At present, the latest rate-limit rule is being introduced, and the new rule applies to the interface with the rate-limit value marked separately.

- Users may check out the rate-limit status and the expiry time of the concerned time window in Http Header's "X-HB-RateLimit-Requests-Remain" (rate limit remained) and "X-HB-RateLimit-Requests-Expire" (expiry time of a window), respectively, and adjust request frequency accordingly in a dynamic manner.

- The frequency of simultaneous requests from each API key to a single node under the same UID cannot exceed the maximum access frequency allowed by the node per unit time.


# FAQs

This section lists common questions, such as network, signature, or common errors.

For problems of an API type or a specific API, see error codes and common problems in each endpoint section.

### Q1: How many API keys can be created for a user account?

Up to 20 API keys can be created for each account. Each API key can be assigned the read/write/trade permission.

The permission description is as follows:

- Read permission: It only applies to querying data, such as asset query.

### Q2: Why does disconnection or timeout occur frequently?

Please check possible reasons below:

1. The user's server in the Chinese mainland does not guarantee a stable connection. The Japanese AWS cloud server is recommended.

### Q3: Why does the signature authentication always fail?

Please check the following potential reasons:


1. Signature parameters should be sorted by the ASCII code. For example, the original parameters are as follows:

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

To be sorted as follows:

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2. The signature string requires the URL encoding. For example:

- `:` will be encoded as `%3A` and a space will be encoded as `%20`.
- Timestamp in the format of `YYYY-MM-DDThh:mm:ss` will be URL-encoded as `2017-05-11T15%3A19%3A30`.

3. The base-64 encoding is required for the signature.

4. The GET request parameters should be in the signature string.

5. The UTC time is converted to YYYY-MM-DDTHH:mm:ss.

6. The time difference between your timestamp and the standard time should be less than 1 minute.

7. The host in the signature text should be the same as that in your API request.

The proxy may change the request host, so you can try without proxy.

Or, the network library may include the endpoints in the host, in which case you may try including the ports in the host used in signature, e.g. "api.huobihktrust.com:443".

8. The hidden text in the access key and secret key may impact the signature.

[SDK](https://github.com/huobitrustapi) in multiple languages is supported. You can refer to the SDK signature or the instances of signature codes in the following languages.

<a href='https://github.com/huobitrustapi/huobi_Java/blob/master/java_signature_demo.md'>JAVA signature example</a> | <a href='https://github.com/huobitrustapi/huobi_Python/blob/master/example/python_signature_demo.md'> Python signature example</a> | <a href='https://github.com/huobitrustapi/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++ signature example</a>

### Q4: Why does the endpoint return the error message "Incorrect Access Key"?

Please check the correctness of the access key in the URL request, such as:

1. The access key is not transmitted.
2. The length of the access key is incorrect.
3. The access key is invalid / has already been deleted.
4. Incorrect parameters or unencoded special characters in the URL request will mislead the server when the access key is resolved.

### Q5: Why does the endpoint return the error message "gateway-internal-error"?

Please check below possible reasons:

1. A network issue or an internal error of the server may occur, please try again later.
2. Whether the format to send data is correct (standard JSON format is required)
3. The header in the POST request should be `Content-Type:application/json`.

### Q6: Why does the endpoint return error message "login-required"?

Please check below possible reasons:

1. The AccessKey parameter is not transmitted to the URL request.
2. The Signature parameter is not transmitted to the URL request.

### Q7: Why does the REST API return HTTP 405 error message "method-not-allowed"?

This error indicates that a non-existent REST API is called. Please check whether the path is correct. Due to the Nginx setting, the request path is case sensitive. Please follow the path definition in document.

# Contact Us

## Technical Support

If you have any other questions, you can select any of the following to contact us:

- Contact customer support from Help Center or send email to cs@huobitrust.com.

If you encounter API errors, please give us feedback using the below template:

`1. Problem description`
`2. UID, Account ID, and Order ID (if related with account and order)`
`3. Raw URL request`
`4. Raw JSON request (if any)`
`5. Raw JSON response`
`6. Problem time and frequency (such as, when this problem occurs, and whether it is reproducible)`
`7. Pre-signed text (mandatory for authentication issue)`


The below is an example:

`1. Problem description: signature error`
`2. UID: 123456`
`3. Raw URL request: GET https://api.huobihktrust.com/v1/open/apiKeyDemo/forRead?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`
`4. Raw JSON request: N/A`
`5. Raw JSON response: {"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key error]","data":null}`
`6. Problem time and frequency: It occurs every time`
`7. Pre-signed text:`
`GET\n`
`api.huobihktrust.com\n`
`/v1/open/apiKeyDemo/forRead\n`
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`

Note: It is safe to share your access key. The access key only proves your identity, but will not affect your account safety. Remember **never** share your secret key to anyone. If you expose your secret key by accident, please [delete](https://www.hbg.com/zh-cn/apikey/) the related API key immediately to avoid potential losses.

# Account Endpoints

Account endpoints provide functions such as user binding and information query.

<aside class="notice">Generate the signatures to access the account endpoints.</aside>

## User Authentication（for Minter only）

Account binding is temporarily completed by Huobi Trust according to the signature information. The signing process refers to the common API key signing process (Huobi Trust generates a special API key and provides it to the Minter, which should be used separately from the API key obtained from the Huobi Trust website). Finally, the login address should be as follows:

${Huobi Trust website login url}?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&outerUserId=1234567890&callBackUrl=${callback url}&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D

### HTTP Request

- GET `Huobi Trust website login url`

### Request Parameters

| Name             | Required | Type   | Description  | Default Value | Value Range |                                                                      
| ---------------- | -------- | ------ | ------------ | ------------- | ----------- |
| AccessKeyId      | true     | string | Access key for external system authentication (generated and provided by Huobi Trust) |        |          |
| outerUserId      | true     | string | Unique identification of users from external system |        |          |                                               
| callbackUrl      | true     | string | Callback URL |        |          |                                                                           
| SignatureMethod  | true     | string | Signature method: HmacSHA256 |        |          |                                                          
| SignatureVersion | true     | string | Signature version: 2 |        |          |                                                                    
| Timestamp        | true     | string | Timestamp (e.g.: 2017-05-11T15%3A19%3A30) |        |          |                                              
| Signature        | true     | string | Signature data |        |          |                                                                         




## User Authentication Information Query

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v1/open/merchant/user/getAuthInfo`

### Request Parameters

| Name        | Required | Type   | Description                              | Default Value | Value Range |
| ----------- | -------- | ------ | ---------------------------------------- | ------------- | ----------- |
| outerUserId | true     | string | (External User ID) unique authentication |               |             |

> Request:

```
https://api.huobihktrust.com/v1/open/merchant/user/getAuthInfo?&SignatureVersion=2&x-b3-traceid=a9900d8e-4bcf-4066-9abf-8e0a3acf7d21&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=N70oF0Jrsi1v4Fhs92xhxTG0sNkwHFVGNOsexRKcMOI%3D&outerUserId=testzy5&SignatureMethod=HmacSHA256&Timestamp=2022-06-29T03%3A44%3A20

```

> Response:

```json
{
  "code": 200,
  "data": {
    "outerUserId": "testzy5",
    "outerUid": "1457228443811871"
  },
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name        | Type   | Description                  | Value Range |
| ----------- | ------ | ---------------------------- | ----------- |
| outerUserId | string | External user authentication |             |
| outerUid    | string | External UID                 |             |

## Sub-Accounts Added

API key permission: trade<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/uc/user/create`

### Request Parameters

| Name           | Required | Type   | Description                    | Default Value | Value Range |
| -------------- | -------- | ------ | ------------------------------ | ------------- | ----------- |
| loginName      | true     | string | Username in email only         |               |             |
| password       | true     | string | Password (32-digit MD5)        |               |             |
| repeatPassword | true     | string | Repeat password (32-digit MD5) |               |             |
| fingerprint    | true     | string | Fingerprint (32-digit MD5)     |               |             |
> Request:


```json
{
  "loginName": "1234569@qq.com",
  "password": "7fa8282ad93047a4d6fe6111c93b308a",
  "repeatPassword": "7fa8282ad93047a4d6fe6111c93b308a",
  "fingerprint": "7fa8282ad93047a4d6fe6111c93b308a"
}
```

> Response:

```json
{
  "code": 200,
  "data": 121849591,
  "success": true
}
```


### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | long    | User UID                   |             |


## Obtaining Sub-Account Lists

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/uc/user/queryChildList`

### Request Parameters

| Name      | Required | Type   | Description                       | Default Value | Value Range |
| --------- | -------- | ------ | --------------------------------- | ------------- | ----------- |
| loginName | false    | string | Username in email only            |               | |           |
| size      | false    | int    | Pieces of data displayed per page |               |             |
| current   | false    | int    | Page number                       |               |             |
> Request:

```json
{
  "size": 1,
  "current": 1
}
```

> Response:

```json
{
  "code": 200,
  "data": {
    "records": [
      {
        "id": 4585,
        "uid": 115461860,
        "loginName": "13123@qq.com",
        "sumBalance": "2544198.45889661",
        "status": 1,
        "remark": "1Qaz2wsx@",
        "bindGa": true,
        "rank": 2,
        "deep": 1,
        "createdAt": 1652956563000,
        "updatedAt": 1656315932000,
        "hasChild": true,
        "source": "custody",
        "userType": 1
      }
    ],
    "total": 18,
    "size": 1,
    "current": 1,
    "pages": 18
  },
  "success": true
}
```


### Response Data

| Name    | Type   | Description                | Value Range |
| ------- | ------ | -------------------------- | ----------- |
| code    | int    | Status code                |             |
| message | string | Error description (if any) |             |
| data    | object | Service data               |             |

Description of the data:

| Name    | Type    | Description         | Value Range |
| ------- | ------- | ------------------- | ----------- |
| total   | integer | Total records       |             |
| size    | int     | Records per page    |             |
| current | int     | Current page number |             |
| pages   | int     | Total pages         |             |
| records | object  | Service data        |             |

Description of the records:

| Name      | Type   | Description                                | Value Range         |
| --------- | ------ | ------------------------------------------ | ------------------- |
| uid       | long   | User UID                                   |                     |
| loginName | string | Login Name                                 |                     |
| rank      | int    | User level                                 |                     |
| status    | int    | Status                                     | 1: Normal 2: Frozen |
| hasChild  | object | Whether an account at a lower level exists |                     |


# Asset Endpoints

## Introduction

Account endpoints provide functions such as account and balance query.

<aside class="notice">Generate the signatures to access the account endpoints.</aside>

## Account Information Query (Current Account)

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

The following account types can be queried:

hbt-custody: fund account; hb-spot: trading account

### HTTP Request

- GET `/v1/open/account/get`

### Request Parameters

| Name   | Required | Type   | Description                                         | Default Value | Value Range |
| ------ | -------- | ------ | --------------------------------------------------- | ------------- | ----------- |
| source | true     | string | hbt-custody: fund account; hb-spot: trading account |               |             |
> Request:

```
https://api.huobihktrust.com/v1/open/account/get?&SignatureVersion=2&x-b3-traceid=13aff565a1054ba39267d7f4ac17be96&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=5%2FfzwQQhT9hwOfqYvsK06iAjARpWlNSGycMh1CWxYis%3D&SignatureMethod=HmacSHA256&source=hbt-custody&Timestamp=2022-06-29T07%3A46%3A19
```

> Response:

```json
{
  "code": 200,
  "data": [
    {
      "currencyDisplayName": "BTC（BTC）",
      "currency": "btc",
      "state": "normal",
      "balance": "57226.000000000000000000",
      "suspense": "0.000000000000000000",
      "price": {
        "symbol": "btcusd",
        "high": 20855.367948511263,
        "close": 20853.889169664755,
        "open": 20855.367948511263,
        "amount": 15.724957,
        "vol": 332714.20416247,
        "count": 64
      }
    },
    {
      "currencyDisplayName": "USDT（ERC20）",
      "currency": "usdt",
      "state": "normal",
      "balance": "69952.000000000000000000",
      "suspense": "0.000000000000000000",
      "price": {
        "symbol": "usdtusd",
        "high": 0.9991748962879672,
        "close": 0.9991748962879672,
        "open": 0.9991748962879672,
        "amount": 0,
        "vol": 0,
        "count": 0
      }
    }
  ],
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name     | Type   | Description         | Value Range |
| -------- | ------ | ------------------- | ----------- |
| currency | string | Token               |             |
| balance  | string | Balance             |             |
| suspense | string | Frozen amount       |             |
| price    | object | Denominated in USDT |             |

Description of the price field (Sourced: Huobi Global):

| Name     | Type   | Description                               | Value Range |
| -------- | ------ | ----------------------------------------- | ----------- |
| currency | string | Token                                     |             |
| symbol   | string | Trading pair                              |             |
| high     | number | The highest price in past 24 hours        |             |
| close    | number | Latest price                              |             |
| open     | number | Opening price in past 24 hours            |             |
| amount   | number | Aggregate trading volume in past 24 hours |             |
| vol      | number | Aggregate trading value in past 24 hours  |             |
| count    | number | Number of trades in past 24 hours         |             |

## Querying Asset Details in a Huobi Trust Account (Sub-Account Supported)

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v1/open/account/getByUserId`

### Request Parameters

| Name     | Required | Type   | Description  | Default Value | Value Range               |
| -------- | -------- | ------ | ------------ | ------------- | ------------------------- |
| uid      | true     | long   | User UID     |               |                           |
| source   | true     | string | Account type |               | Fund account: hbt-custody |
| currency | false    | string | Token        |               |                           |
> Request:

```
https://api.huobihktrust.com/v1/open/account/getByUserId?&uid=115460188&SignatureVersion=2&x-b3-traceid=ee9b49e213ef47468ea51add1d99b479&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=D64r4rrYUXQhPMhNX3y9WHExBVID7wPpSVYud3V0f%2B0%3D&SignatureMethod=HmacSHA256&source=hbt-custody&Timestamp=2022-06-29T07%3A50%3A51
```

> Response:

```json
{
  "code": 200,
  "data": [
    {
      "currencyDisplayName": "BTC（BTC）",
      "currency": "btc",
      "state": "normal",
      "balance": "57226.000000000000000000",
      "suspense": "0.000000000000000000",
      "price": {
        "symbol": "btcusd",
        "high": 20855.367948511263,
        "close": 20853.889169664755,
        "open": 20855.367948511263,
        "amount": 15.724957,
        "vol": 332714.20416247,
        "count": 64
      }
    },
    {
      "currencyDisplayName": "USDT（ERC20）",
      "currency": "usdt",
      "state": "normal",
      "balance": "69952.000000000000000000",
      "suspense": "0.000000000000000000",
      "price": {
        "symbol": "usdtusd",
        "high": 0.9991748962879672,
        "close": 0.9991748962879672,
        "open": 0.9991748962879672,
        "amount": 0,
        "vol": 0,
        "count": 0
      }
    }
  ],
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | list    | Service data               |             |

Description of the data field:

| Name     | Type   | Description    | Value Range |
| -------- | ------ | -------------- | ----------- |
| currency | string | Token          |             |
| chain    | string | Chain          |             |
| state    | string | Account status | normal      |
| balance  | string | Balance        |             |
| suspense | string | Frozen amount  |             |


# Asset Records

## Introduction

Asset record endpoints provide functions such as querying deposit, withdrawal, and transfer records.

<aside class="notice">Generate the signatures to access the asset record endpoints.</aside>

## Withdrawal Record Query (Not recommended. Please use "Withdrawal Endpoints" -> "Withdrawal Record Query /v1/open/deposit/list")

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v2/external/deposit/finance/history`

### Request Parameters

| Name      | Required | Type   | Description    | Default Value | Value Range |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
| --------- | -------- | ------ | --- | ------ | -------- |
| currency  | false    | string | Token |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
| startTime | false    | long   | Start time (ms) |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
| endTime   | false    | long   | End time (ms) |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
| from      | false    | long   | Start ID |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
| direct    | false    | string | Direction: "prev" and "next" (prev - in ascending order from the start order ID; next - in descending order from the start order ID) |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
| size      | false    | int    | Results queried per page (if optional parameters are not transmitted, 10 records are displayed per page by default. Otherwise, 1 to 500 records can be displayed.) |        |          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
| state     | false    | int    | Collection of the withdrawal status codes (multiple codes are separated by commas). Withdrawal order status: (1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |               |             |


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

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | list    | Service data               |             |

Description of the data field:

| Name         | Type   | Description       | Value Range |
| ------------ | ------ | ----------------- | ----------- |
| currency     | string | Token             |             |
| amount       | string | Balance           |             |
| chain        | string | Frozen amount     |             |
| errorCode    | object | Error code        |             |
| errorMsg     | object | Error information |             |
| fees         | object | Fee               |             |
| id           | object | ID                |             |
| label        | object | Label             |             |
| state        | object | Status            |             |
| toAddress    | object | Address           |             |
| toAddressTag | object | Address tag       |             |
| txHash       | object | txHash            |             |
| type         | string | Type              |             |
| createAt     | long   | Creation time     |             |
| updateAt     | long   | Update time       |             |


                                                         |                                                           |
## Withdrawal Record Query (Not recommended. Please use "Withdrawal Endpoints" -> "Withdrawal Record Query /v1/open/withdraw/allList")

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v2/external/withdraw/list`

### Request Parameters

| Name      | Required | Type   | Description | Default Value | Value Range |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| --------- | -------- | ------ | ----------- | ------------- | ----------- |
| currency  | false    | string | Token       |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
| startTime | false    | long   | Start time (ms)  |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| endTime   | false    | long   | End time (ms)    |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| from      | false    | long   | Start ID         |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| direct    | false    | string | Direction: "prev" and "next" (prev - in ascending order from the start order ID; next - in descending order from the start order ID) |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
| size      | false    | int    | Results queried per page (if optional parameters are not transmitted, 10 records are displayed per page by default. Otherwise, 1 to 500 records can be displayed.) |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
| state     | false    | int    | Collection of the withdrawal status codes (multiple codes are separated by commas). Withdrawal order status: (1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |               |             |


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

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | list    | Service data               |             |

Description of the data field:

| Name                | Type    | Description                      | Value Range |
| ------------------- | ------- | -------------------------------- | ----------- |
| currency            | string  | Token                            |             |
| amount              | string  | Balance                          |             |
| blockchainConfirm   | integer | Number of confirmations          |             |
| depositSafeConfirms | integer | Number of security confirmations |             |
| errorCode           | object  | Error code                       |             |
| errorMsg            | object  | Error information                |             |
| id                  | object  | ID                               |             |
| state               | object  | Status                           |             |
| txHash              | object  | txHash                           |             |
| type                | string  | Type                             |             |
| createAt            | long    | Creation time                    |             |
| updateAt            | long    | Update time                      |             |

# Transfer Endpoints

## Introduction

Transfer endpoints provide functions such as account transfer and query.

<aside class="notice">Generate the signatures to access the account endpoints.</aside>

## UID Transfer Record Query

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/api/uid-transfer/page`

### Request Parameters

| Name          | Required | Type    | Description            | Default Value | Value Range |                                                                                                                                                                                                                                                                                                                                     
| ------------- | -------- | ------- | ---------------------- | ------------- | ----------- |
| currency      | false    | string  | Token                  |               |             |                                                                                                                                                                                                                                                                                                                                         
| clientOrderId | false    | string  | Transfer order         |               |             |                                                                                                                                                                                                                                                                                                                                     
| status        | false    | string  | Order status           |               | Status: jumio, audit, audit_refuse, multi_audit_, multi_audit_fail, success, fail Note: jumio: face recognition; audit: manual auditing; audit_refuse:  refused by manual auditing; multi_audit: being audited by multiple people; multi_audit_fail: failed by multiple people audit; success: transfer succeeded; fail: transfer failed |
| createTime    | false    | object  | Application start time |               |             |                                                                                                                                                                                                                                                                                                                                     
| updateTime    | false    | object  | Application end time   |               |             |                                                                                                                                                                                                                                                                                                                                     
| current       | false    | integer | Current page           |               |             |                                                                                                                                                                                                                                                                                                                                     
| size          | false    | string  | Page size              |               |             |                                                                                                                                                                                                                                                                                                                                     

Description of the createTime/updateTime field:

| Name  | Type    | Description | Value Range                            |
| ----- | ------- | ----------- | -------------------------------------- |
| start | integer | Start time  | Accurate to ms (start time included)   |
| end   | integer | End time    | Accurate to ms (end time not included) |
> Request:

```json
{
  "size": 1,
  "current": 1
}
```

> Response:

```json
{
  "code": 200,
  "data": {
    "records": [
      {
        "id": 1300,
        "fromUid": 1457228443811871,
        "phone": "1001",
        "email": "",
        "toUserName": "924****1001",
        "currency": "btc",
        "amount": 12.0,
        "clientOrderId": "1540976534049787904",
        "status": "success",
        "refuse": "",
        "createdAt": 1656232410334,
        "updatedAt": 1656232410559
      }
    ],
    "total": 1,
    "size": 1,
    "current": 1,
    "pages": 1
  },
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name          | Type    | Description  | Value Range |                                                                                                                                                                                                                                                                                                                                     
| ------------- | ------- | ------------ | ----------- |
| id            | number  | Data ID      |             |                                                                                                                                                                                                                                                                                                                                       
| clientOrderId | string  | Transfer order ID |             |                                                                                                                                                                                                                                                                                                                                  
| fromUid       | string  | Payer's UID       |             |                                                                                                                                                                                                                                                                                                                                  
| toUid         | string  | Recipient's UID   |             |                                                                                                                                                                                                                                                                                                                                  
| toUserName    | string  | Recipient's account |             |                                                                                                                                                                                                                                                                                                                                
| state         | string  | Status: jumio, audit, audit_refuse, multi_audit, multi_audit_fail, success, fail Note: jumio: face recognition; audit: manual auditing; audit_refuse: manual auditing refused; multi_audit: being audited by multiple people; multi_audit_fail: being audited by multiple people failed; success: transfer succeeded; fail: transfer failed |             |
| state         | string  | Status            |             |                                                                                                                                                                                                                                                                                                                                  
| amount        | number  | Amount            |             |                                                                                                                                                                                                                                                                                                                                  
| refuse        | string  | Rejection reasons |             |                                                                                                                                                                                                                                                                                                                                  
| createdTime   | integer | Creation time     |             |                                                                                                                                                                                                                                                                                                                                  
| updatedTime   | integer | Update time       |             |                                                                                                                                                                                                                                                                                                                                  


## Transfer (UID) Endpoints

API key permission: write<br> Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/api/uid-transfer`

### Request Parameters

| Name     | Required | Type    | Description                                  | Default Value | Value Range |
| -------- | -------- | ------- | -------------------------------------------- | ------------- | ----------- |
| toUid    | true     | integer | Recipient's UID                              |               |             |
| phone    | false    | string  | Last four digits of recipient's phone number |               |             |
| currency | true     | string  | Token                                        |               |             |
| amount   | true     | number  | Amount                                       |               |             |
> Request:

```json
{
  "amount": 1,
  "currency": "btc",
  "toUid": "1457228443811871",
  "phone": "2346"
}
```

> Response:

```json
{
  "code": 200,
  "data": {
    "clientOrderId": "1542076280883056640",
    "status": "multi_audit"
  },
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name          | Type   | Description       | Value Range |
| ------------- | ------ | ----------------- | ----------- |
| clientOrderId | string | Transfer order ID |             |

## Inter-Account Transfer

API key permission: write<br> Rate-limit value (NEW): 100/2 seconds Note: used for transfer between main and sub-accounts

### HTTP Request

- POST `/v2/account/account-transfer`

### Request Parameters

| Name            | Required | Type   | Description      | Default Value | Value Range  |                                                             
| --------------- | -------- | ------ | --------------   | ------------- | ------------ |
| fromUser        | true     | long   | Payer's user ID (not UID. ID = UID without the last digit)     |               |                                                                           |
| toUser          | true     | long   | Recipient's user ID (not UID. ID = UID without the last digit) |               |                                                                           |
| fromAccountType | true     | string | Payment account                                                |               | custody                                                                   |
| toAccountType   | true     | string | Recipient account type                                         |               | custody                                                                   |
| currency        | true     | string | Token                                                          |               |                                                                           |
| amount          | true     | string | Amount                                                         |               |                                                                           |
| direction       | true     | int    | Transfer direction                                             |               | 1: transfer from main to sub account 2: transfer from sub to main account |
| source          | true     | string | Customer identification                                        |               | e.g.: custody                                                             |
| sourceOrderId   | true     | string | Customer order ID                                              |               | Unique with length ≤64                                                    |

> Request:

```json
{
  "fromAccountType": "custody",
  "toUser": 11546800,
  "sourceOrderId": "1488386774794272",
  "amount": "100.000000000000000000",
  "toAccountType": "custody",
  "fromUser": 11582367,
  "currency": "btc",
  "source": "brokerage",
  "direction": "2"
}
```

> Response:

```json
{
  "code": 200,
  "data": null
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |


# Deposit Endpoints
## Introduction

Deposit endpoints provide functions such as deposit address query and deposit record query.

<aside class="notice">Generate the signatures to access the deposit endpoints.</aside>

## Deposit Address Query

API key permission: read<br> Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v1/open/address/get`

### Request Parameters

| Name         | Required | Type   | Description  | Default Value | Value Range    |                                            
| ------------ | -------- | ------ | ------------ | ------------- | -------------- |
| uid          | true     | long   | User UID     |               |                |                                            
| currency     | true     | string | Token        |               |                |                                            
| chain        | true     | string | Chain        |               |                |                                            
| businessType | true     | string | Account type | custody       | custody (asset account) and dedicated (dedicated account) |

> Request:

```
https://api.huobihktrust.com/v1/open/address/get?&uid=115460188&SignatureVersion=2&chain=btc&x-b3-traceid=3506b8c7ea7042bbbfd97092a12103cf&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=wYyL3cvYnL8uH63gf4C3xw798k0wSAmqVpWX4hjnt%2Bc%3D&currency=btc&SignatureMethod=HmacSHA256&businessType=custody&Timestamp=2022-06-29T08%3A35%3A00
```

> Response:

```json
{
    "code": 200,
    "data": {
        "address": "1CV37JenquEVC1Mu96X5aggV8g3uRmTveJ",
        "businessType": "custody",
        "tag": ""
    },
    "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name         | Type    | Description  | Value Range |
| ------------ | ------- | ------------ | ----------- |
| id           | long    | Primary key  |             |
| currency     | string  | Token        |             |
| chain        | string  | Chain        |             |
| address      | string  | Address      |             |
| businessType | string  | Account type |             |
| weight       | integer | Weight       |             |

## Deposit Record Query

API key permission: read<br> Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v1/open/deposit/list`

### Request Parameters

| Name               | Required | Type   | Description  | Default Value | Value Range |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| ------------------ | -------- | ------ | ------------ | ------------- | ----------- |
| currency           | false    | string | Token        |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| startTime          | false    | long   | Start time (ms)              |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| endTime            | false    | long   | End time (ms)                |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| updatedAtStartTime | false    | long   | Start time (ms)              |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| updatedAtEndTime   | false    | long   | End time (ms)                |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| type               | false    | string |                              |               |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| pagenum            | false    | int    | Page number                  | 1             |             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
| pagesize           | false    | int    | Pieces of records per page   | 10            | 0-200       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
| state              | false    | int    | Collection of the withdrawal status codes (multiple codes are separated by commas). Withdrawal order status: (1, "pre-submitted"),(2, "invalid"),(3, "submitted"),(4, "reexamine"),(5, "canceled"),(6, "pass"),(7, "reject"),(8, "pre-transfer"),(9, "wallet-transfer"),(10, "wallet-reject"),(11, "confirmed"),(12, "confirm-error"),(13, "repealed"),(14, "normal-account-frozen"),(20, "created-without-risk-action"),(21, "account-frozen"),(22, "risk-action-assign"),(23, "risk-action-success"),(24, "risk-action-fail"),(25, "risk-action-timeout"),(30, "pre-withdraw-created"),(31, "pre-withdraw-confirmed"),(32, "pre-withdraw-launch-begin"),(33, "pre-withdraw-launch-success"),(34, "pre-withdraw-launch-failed"),(35, "pre-withdraw-canceled"),(40, "settlement-withdraw-processing"),(41, "settlement-withdraw-partially-completed"),(42, "settlement-withdraw-failed"),(43, "reexamine-reject"),(44, "reexamine-dismissed") |               |             |

> Request:

```
https://api.huobihktrust.com/v1/open/deposit/list?&SignatureVersion=2&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=GRSQMbCet%2Br%2Bdib16hyFuafeS4WwC%2BC2vJm2mtzc4KA%3D&pagesize=1&SignatureMethod=HmacSHA256&pagenum=1&Timestamp=2022-06-29T08%3A38%3A22
```

> Response:

```json
{
  "code": 200,
  "data": {
    "pagenum": 1,
    "pagesize": 1,
    "rows": 4,
    "list": [
      {
        "currencyDisplayName": "USDT（ERC20）",
        "amount": "60000.000000000000000000",
        "blockchainConfirm": 99999999,
        "createdAt": 1656301933428,
        "currency": "usdt",
        "depositSafeConfirms": 12,
        "id": 1189,
        "state": "safe",
        "businessType": "custody",
        "txHash": "JenquEVC1Mu96X12",
        "userId": 11546018,
        "type": "normal deposit"
      }
    ]
  },
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name     | Type | Description                | Value Range |
| -------- | ---- | -------------------------- | ----------- |
| pagenum  | int  | Page number                |             |
| pagesize | int  | Pieces of records per page |             |
| rows     | int  | Total records              |             |
| list     | list | Data list                  |             |

Description of the list field:

| Name                | Type   | Description                      | Value Range |                                                                                                                                                                                             
| ------------------- | ------ | -------------------------------- | ----------- |
| id                  | long   | Order ID                         |             |                                                                                                                                                                                              
| userId              | long   | User ID                          |             |                                                                                                                                                                                              
| currency            | string | Token                            |             |                                                                                                                                                                                              
| amount              | string | Amount                           |             |                                                                                                                                                                                              
| txHash              | string | Transaction Hash                 |             |                                                                                                                                                                                              
| depositSafeConfirms | int    | Number of security confirmations |             |                                                                                                                                                                                              
| state               | string | Status                           | confirming, orphan, orphan-confirming, orphan-confirmed, rollback-orphan, rollback-confirming, rollback-confirmed, orphan-safe, rollback-safe, waiting-tiny-amount, large-amount-examine, confirmed, safe |
| businessType        | string | Account type                     |             |                                                                                                                                                                                              

# Withdrawal Endpoints
## Introduction

Withdrawal endpoints provide functions such as adding withdrawal addresses and withdrawal address lists, querying transaction fees, withdrawal, querying withdrawal records, and querying tokens and chains.

<aside class="notice">Generate the signatures to access the withdrawal endpoints.</aside>

## Adding Withdrawal Addresses

API key permission: transfer<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/withdraw/address/add`

### Request Parameters

| Name        | Required | Type   | Description                 | Default Value | Value Range            |
| ----------- | -------- | ------ | --------------------------- | ------------- | ---------------------- |
| currency    | true     | string | Token                       |               |                        |
| chain       | true     | string | Chain                       |               |                        |
| address     | true     | string | Address                     |               | Length ≤100            |
| label       | true     | string | Address tag                 |               | Unique with length ≤20 |
| withdrawTo  | true     | int    | Whether used for withdrawal |               | 1: Yes 0: No           |
| depositFrom | true     | int    | Whether used for deposit    |               | 1: Yes 0: No           |
| extra       | true     | string | Beneficiary information     |               | User's UID available   |
> Request:

```json
{
  "chain": "usdterc20",
  "address": "1CZ3AXtAcHLZJ9bnBN9df3KgkWWz8Mh4LW",
  "authToken": "133aec05c3844356800bce6a53ac8e28",
  "extra": "O115822617@Bro.com",
  "depositFrom": "0",
  "currency": "usdt",
  "label": "1488557514424352",
  "withdrawTo": "1"
}
```

> Response:

```json
{
  "code": 200,
  "data": {
    "orderId": 815,
    "addressId": 11235,
    "state": "DONE",
    "riskActionV2Data": {
      "orderId": 815,
      "orderState": "DONE",
      "actionToken": "3738414007889960960",
      "actions": null,
      "handlerDown": 0
    }
  }
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | object  | Service data               |             |

Description of the data field:

| Name      | Type   | Description    | Value Range                               |
| --------- | ------ | -------------- | ----------------------------------------- |
| orderId   | long   | Order ID       |                                           |
| addressId | long   | Address ID     |                                           |
| state     | string | Address status | DONE (submitted) FAIL (submission failed) |

## Querying Withdrawal Address Lists per Page

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- POST `/v1/open/withdraw/address/list`

### Request Parameters

| Name      | Required | Type   | Description     | Default Value | Value Range |                                                                                                                                                      
| --------- | -------- | ------ | --------------- | ------------- | ----------- |
| uid       | false    | long   | User UID        |               |             |                                                                                                                                                      
| label     | false    | string | Address tag     |               |             |                                                                                                                                                      
| currency  | false    | string | Token           |               |             |                                                                                                                                                      
| chain     | false    | string | Chain           |               |             |                                                                                                                                                      
| startTime | false    | long   | Start time (ms) |               |             |                                                                                                                                                  
| endTime   | false    | long   | End time (ms)   |               |             |                                                                                                                                                  
| from      | false    | long   | Start ID        |               |             |                                                                                                                                                  
| direct    | false    | string | Direction: prev - Previous page; next - Next page |               |             |                                                                                                                
| size      | false    | int    | Results queried per page (if optional parameters are not transmitted, 10 records are displayed per page by default. Otherwise, 1 to 20 records can be displayed.) |               |             |
| status    | false    | string | new - newly added, failed - failed to add, whitelisted - added successfully |               |             |                                                                                      

> Request:

```json
{
    "from": 11171,
    "direct": "next",
    "size": 1
}
```

> Response:

```json
{
  "code": 200,
  "data": [
    {
      "currencyDisplayName": "ETH（ETH）",
      "address": "bBcab6404e9f58E76eed6a0d09d6fbf3451a416F",
      "chain": "eth",
      "extra": "{\"addrProofFile\":[],\"authType\":30}",
      "label": "ETH",
      "tag": "",
      "currency": "eth",
      "createdAt": "1654509708456",
      "updatedAt": "1654509708485",
      "id": 11171,
      "userId": 11546018,
      "status": "whitelisted",
      "withdrawTo": 1,
      "organizationId": 0,
      "depositFrom": 0,
      "auditStatus": 2
    }
  ],
  "success": true
}
```

### Response Data

| Name    | Required | Type    | Description                | Value Range |
| ------- | -------- | ------- | -------------------------- | ----------- |
| code    | true     | integer | Status code                |             |
| message | false    | string  | Error description (if any) |             |
| data    | false    | list    | Service data               |             |

Description of the data field:

| Name        | Type   | Description                                                                 | Value Range |
| ----------- | ------ | --------------------------------------------------------------------------- | ----------- |
| id          | long   | Address ID                                                                  |             |
| currency    | string | Token                                                                       |             |
| chain       | string | Chain                                                                       |             |
| address     | string | Address                                                                     |             |
| label       | string | Address tag                                                                 |             |
| status      | string | new - newly added, failed - failed to add, whitelisted - added successfully |             |
| auditStatus | int    | Status of being audited by superior: 1. auditing; 2. approved; 3. refused   |             |
| createdAt   | long   | Creation time (timestamp)                                                   |             |
| updatedAt   | long   | Update time (timestamp)                                                     |             |

## Withdrawal Fee Query

API key permission: read<br>
Rate-limit (NEW): 100/2 seconds Application scenario: query the fee before withdrawal. Actual withdrawal amount = Withdrawal amount - Fee

### HTTP Request

- GET `/v1/open/withdraw/getWithdrawFee`

### Request Parameters

| Name     | Required | Type   | Description                                         | Default Value | Value Range |
| -------- | -------- | ------ | --------------------------------------------------- | ------------- | ----------- |
| amount   | true     | string | Withdrawal amount (value range depending on tokens) |               |             |
| currency | true     | string | Token                                               |               |             |
| chain    | false    | string | Chain                                               |               |             |
> Request:

```
https://api.huobihktrust.com/v1/open/withdraw/getWithdrawFee?&SignatureVersion=2&amount=1&chain=btc&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=NW6%2FA5RvHjT8lDZri3fimLhEtBTSaAeKKxj%2FBr9fyOg%3D&currency=btc&SignatureMethod=HmacSHA256&Timestamp=2022-06-29T08%3A49%3A39
```

> Response:

```json
{
  "code": 200,
  "data": "0.11111111",
  "success": true
}
```

### Response Data

| Name    | Type    | Description                | Value Range |
| ------- | ------- | -------------------------- | ----------- |
| code    | integer | Status code                |             |
| message | string  | Error description (if any) |             |
| data    | string  | Service data: fee value    |             |

## Withdrawal

API key permission: withdrawal<br> Rate-limit (NEW): 100/2 seconds Note: Actural withdrawal amount = Withdrawal amount - Fee

### HTTP Request

- POST `/v1/open/withdraw/doWithdraw`

### Request Parameters

| Name           | Required | Type   | Description                                                | Default Value | Value Range                                           |
| -------------- | -------- | ------ | ---------------------------------------------------------- | ------------- | ----------------------------------------------------- |
| amount         | true     | string | Withdrawal amount (the value range depends on tokens)      |               |                                                       |
| currency       | true     | string | Token                                                      |               |                                                       |
| chain          | true     | string | Chain                                                      |               |                                                       |
| toAddressId    | true     | string | Address ID                                                 |               |                                                       |
| toAddress      | true     | string | Address                                                    |               |                                                       |
| toAddressLabel | false    | string | Address tag                                                |               |                                                       |
| withdrawType   | false    | string | Withdrawal type                                            |               | fast (fast withdrawal) and normal (normal withdrawal) |
| sourceOrderId  | true     | string | Customer order ID (not repeated)                           |               | Length <=64                                           |
| source         | true     | string | Customer tag (one fixed value per customer)                |               | e.g.: custody                                         |
| uid            | true     | string | User UID                                                   |               |                                                       |
| fees           | false    | string | Trading fee (obtained by calling the trading fee endpoint) |               |                                                       |
> Request:

```json
{
  "sourceOrderId": "1488574459412512",
  "uid": 115468007,
  "amount": "169999.000000000000000000",
  "chain": "usdterc20",
  "fees": "1.000000000000000000",
  "withdrawType": "fast",
  "currency": "usdt",
  "source": "brokerage",
  "toAddress": "1EgLXFgzx9K6o6uvsP6BxB7V8iEuLEiWqQ",
  "toAddressLabel": "1488560116989984",
  "toAddressId": 11236
}
```

> Response:

```json
{
  "code": 200,
  "data": {
    "withdrawOrderId": "55476840"
  }
}
```

### Response Data

| Name    | Type    | Description                | Value Range |
| ------- | ------- | -------------------------- | ----------- |
| code    | integer | Status code                |             |
| message | string  | Error description (if any) |             |
| data    | object  | Service data               |             |

Description of the data field:

| Name                   | Type   | Description       | Value Range |
| ---------------------- | ------ | ----------------- | ----------- |
| withdrawOrderId        | long   | Order ID          |             |
| withdrawCreateResponse | object | Order information |             |

Description of the withdrawCreateResponse field:

| Name             | Type   | Description                 | Value Range |
| ---------------- | ------ | --------------------------- | ----------- |
| orderId          | long   | Order ID                    |             |
| riskActionV2Data | object | Risk management information |             |

Description of the riskActionV2Data field:

| Name       | Type   | Description  | Value Range |
| ---------- | ------ | ------------ | ----------- |
| orderState | string | Order status |             |

## Withdrawal Record Query

API key permission: read<br>
Rate-limit value (NEW): 100/2 seconds

### HTTP Request

- GET `/v1/open/withdraw/allList`

### Request Parameters

| Name               | Required | Type   | Description                                                | Default Value | Value Range |
| ------------------ | -------- | ------ | ---------------------------------------------------------- | ------------- | ----------- |
| uid                | false    | long   | User UID                                                   |               |             |
| currency           | false    | string | Token                                                      |               |             |
| startTime          | false    | long   | Timestamp                                                  |               |             |
| endTime            | false    | long   | Timestamp                                                  |               |             |
| updatedAtStartTime | false    | long   | Start time (ms)                                            |               |             |
| updatedAtEndTime   | false    | long   | End time (ms)                                              |               |             |
| pagesize           | false    | int    | Pieces of data displayed per page                          | 10            | 0-200       |
| pagenum            | false    | int    | Page number                                                |               |             |
| ids                | false    | string | Withdrawal order ID. Multiple IDs are separated by commas. |               |             |
> Request:

```
https://api.huobihktrust.com/v1/open/withdraw/allList?&SignatureVersion=2&AccessKeyId=8f00e20e-vf25treb80-dcde4948-e5067&Signature=zoc5DtPgKrBJV0adV%2Fq%2Fsi38YE5XtZQqon6Pr9ZDUpA%3D&pagesize=1&SignatureMethod=HmacSHA256&pagenum=1&Timestamp=2022-06-29T08%3A52%3A34
```

> Response:

```json
{
  "code": 200,
  "data": {
    "pagenum": 1,
    "pagesize": 1,
    "rows": 1,
    "list": [
      {
        "currencyDisplayName": "BTC（BTC）",
        "id": 55473740,
        "type": "fast withdraw",
        "userId": 11546018,
        "currency": "btc",
        "amount": "10.000000000000000000",
        "fees": "0.000000000000000000",
        "state": "4",
        "dwState": "confirmed",
        "txHash": "",
        "chain": "btc",
        "toAddress": "1F5XbLksc33XrzdYAxACgGDWF9jAHeA7Hq",
        "toAddrTag": "",
        "createAt": 1656232131197,
        "updateAt": 1656492721745,
        "errorCode": "",
        "errorMsg": "",
        "walletUpdateAt": 1656232131321,
        "withdrawType": 1,
        "amlResult": "{\"process-status\":null,\"id\":null,\"error\":null,\"risk-score\":null,\"aml-support\":true,\"new-address\":null,\"error-msg\":\"\"}",
        "basicAuditState": "2",
        "gas": "0",
        "gasCurrency": "",
        "businessType": "custody",
        "safeConfirms": 0,
        "walletConfirms": 0
      }
    ]
  },
  "success": true
}
```

### Response Data

| Name    | Type    | Description                | Value Range |
| ------- | ------- | -------------------------- | ----------- |
| code    | integer | Status code                |             |
| message | string  | Error description (if any) |             |
| data    | object  | Service data               |             |

Description of the data field:

| Name     | Type | Description                       | Value Range |
| -------- | ---- | --------------------------------- | ----------- |
| pagesize | int  | Pieces of data displayed per page |             |
| pagenum  | int  | Page number                       |             |
| rows     | int  | Total records                     |             |
| list     | list | Service data                      |             |

Description of the list field:

| Name      | Type   | Description               | Value Range      |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| --------- | ------ | ------------------------- | ---------------- |
| id        | long   | Order ID                  |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| type      | string | Withdrawal type           |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| currency  | string | Token                     |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| chain     | string | Chain                     |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| toAddress | string | Address                   |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| amount    | string | Amount                    |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                       
| fee       | string | Fee                       |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                      
| createAt  | long   | Creation time（timestamp） |                  |                                                                                                                                                                                                                                                                                                                                                                                                                                       
| updateAt   | long   | Update time (timestamp）   |                 |                                                                                                                                                                                                                                                                                                                                                                                                                                       
| state     | string | Status                    | -1 (initialized), 1 (to be audited), 2 (first audit approved), 3 (first audit failed), 4 (review approved), 5 (review failed), 6 (review rejected), 11 (automatic auditing), 99 (invalid record)                                                                                                                                                                                                                                                       |
| dwState   | string | Withdrawal status         | pre-submitted, submitted, reexamine, canceled, pass, pre-transfer, wallet-transfer, normal-account-frozen, created-without-risk-action, account-frozen, risk-action-assign, risk-action-success, risk-action-fail, risk-action-timeout, settlement-withdraw-processing, settlement-withdraw-partially-completed, invalid, reject, wallet-reject, confirm-error, repealed, settlement-withdraw-failed, reexamine-reject, reexamine-dismissed, confirmed |  


