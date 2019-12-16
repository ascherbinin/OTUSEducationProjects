# CharactersAPI

All URIs are relative to *https://rickandmortyapi.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**charactersGet**](CharactersAPI.md#charactersget) | **GET** /character/ | Characters List


# **charactersGet**
```swift
    open class func charactersGet(page: Int? = nil, completion: @escaping (_ data: CharactersList?, _ error: Error?) -> Void)
```

Characters List

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let page = 987 // Int | number of page (optional)

// Characters List
CharactersAPI.charactersGet(page: page) { (response, error) in
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

[**CharactersList**](CharactersList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

