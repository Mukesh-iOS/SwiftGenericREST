//
//  CustomerModel.swift
//  GenericRest
//
//  Created by Mukesh on 11/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

struct CustomerInfo: Codable{
    
    private enum CodingKeys: String, CodingKey{
        case customer
        case age
        case address
        case purpose
    }
    let customer: String?
    var age: Int?
    let address: String?
    let purpose: String?
    
    
    private static var customerUrl: String {
        return "BASE_URL"
    }
    
    static func customerRequest(_ id: String) -> URLRequest{
        
        let urlString = customerUrl + id
        return URLRequest.getRequestWithConfiguration(urlString)!
    }
}

