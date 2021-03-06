//
// LocationsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class LocationsAPI {
    /**
     Locations List
     
     - parameter page: (query) number of page (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func locations(page: Int? = nil, completion: @escaping ((_ data: LocationsList?,_ error: Error?) -> Void)) {
        locationsWithRequestBuilder(page: page).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Locations List
     - GET /location/
     - parameter page: (query) number of page (optional)
     - returns: RequestBuilder<LocationsList> 
     */
    open class func locationsWithRequestBuilder(page: Int? = nil) -> RequestBuilder<LocationsList> {
        let path = "/location/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<LocationsList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
