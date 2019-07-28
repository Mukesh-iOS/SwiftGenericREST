//
//  CustomerViewModel.swift
//  GenericRest
//
//  Created by Mukesh on 11/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

let retryCount: Int = 3

class CustomerViewModel: NSObject {
    
    var custInfo: CustomerInfo?
    
    func getCustomer(_ customerId: String? = "51") {
        
        let urlRequest = CustomerInfo.customerRequest(customerId ?? "0")
        
        WebServiceRequest.serviceRequest(serviceURL: urlRequest.url, resultStruct: CustomerInfo.self) { [weak self] (customerInfo, error) in
            
            guard let weakSelf = self, let info = customerInfo as? CustomerInfo else {
                
                return
            }
            weakSelf.custInfo = info
        }
    }
}
