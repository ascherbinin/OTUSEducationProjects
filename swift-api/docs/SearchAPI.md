# SearchAPI

All URIs are relative to *https://api.github.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchReposGet**](SearchAPI.md#searchreposget) | **GET** /search/repositories | Repository List


# **searchReposGet**
```swift
    open class func searchReposGet(q: String, order: Order, completion: @escaping (_ data: RepositoryList?, _ error: Error?) -> Void)
```

Repository List

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let q = "q_example" // String | Query
let order = Order() // Order | Sort

// Repository List
SearchAPI.searchReposGet(q: q, order: order) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String** | Query | 
 **order** | [**Order**](.md) | Sort | 

### Return type

[**RepositoryList**](RepositoryList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

