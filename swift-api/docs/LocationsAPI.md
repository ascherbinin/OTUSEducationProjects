# LocationsAPI

All URIs are relative to *https://rickandmortyapi.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**locations**](LocationsAPI.md#locations) | **GET** /location/ | Locations List


# **locations**
```swift
    open class func locations(page: Int? = nil, completion: @escaping (_ data: LocationsList?, _ error: Error?) -> Void)
```

Locations List

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let page = 987 // Int | number of page (optional)

// Locations List
LocationsAPI.locations(page: page) { (response, error) in
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
 **page** | **Int** | number of page | [optional] 

### Return type

[**LocationsList**](LocationsList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

