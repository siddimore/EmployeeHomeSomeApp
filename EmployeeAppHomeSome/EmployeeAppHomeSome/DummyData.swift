//
//  DummyData.swift
//  EmployeeAppHomeSome
//
//  Created by Siddharth More on 1/23/17.
//  Copyright © 2017 Siddharth More. All rights reserved.
//

import Foundation

class DummyData {
    
    var itemName: String?
    var quantity:String?
    
//    {
//    set {
//    self.itemName = newValue
//    }
//    get {
//    return self.itemName
//    }
//    }
//     {
//    set {
//    self.quantity = newValue
//    }
//    get {
//    return self.quantity
//    }
//    }
    
    init(inputName:String?,  inputQuantity:String?) {
        
        self.itemName = inputName
        self.quantity = inputQuantity
    }
}
