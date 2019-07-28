//
//  SwiftExtensions.swift
//  GenericRest
//
//  Created by Mukesh on 11/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

enum MyError: Error {
    case Empty
    case Invalid
}

extension URLRequest {
    
    static func getRequestWithConfiguration(_ urlString: String?) -> URLRequest? {
        
        guard var urlRequest = urlRequestWithConfig(urlString) else {
            return nil
        }
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    static func postRequestWithConfiguration(_ urlString: String?, requestJson: [String : Any]?) -> URLRequest? {
        guard var urlRequest = urlRequestWithConfig(urlString) else {
            return nil
        }
        urlRequest.httpMethod = "POST"
        if let requestBody = requestJson {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
            } catch {
                debugPrint("Unexpected error: \(error).")
            }
        }
        return urlRequest
    }
    
    private static func urlRequestWithConfig(_ urlString: String?) -> URLRequest? {
        
        guard let givenURLString = urlString, let urlComponent = URLComponents.init(string: givenURLString), let url = urlComponent.url else {
            return nil
        }
        var urlRequest: URLRequest = URLRequest.init(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}

extension NSDictionary {
    
    class func dictionaryWithDataObject(_ receiveData : Data?) throws -> NSDictionary? {
        
        if receiveData == nil {
            throw MyError.Empty
        }
        do {
            let dictionary = try JSONSerialization.jsonObject(with: receiveData!, options: JSONSerialization.ReadingOptions.allowFragments)
            return dictionary as? NSDictionary
        }
        catch let error as NSError {
            print(error.localizedDescription)
            throw MyError.Invalid
        }
    }
}
