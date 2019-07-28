//
//  CustomerViewController.swift
//  GenericRest
//
//  Created by Mukesh on 11/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {
    
    private let customerVM = CustomerViewModel()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // Just a sample - This REST call will always fail - Replace with your logic in all appropriate places
        
//        customerVM.getCustomer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
