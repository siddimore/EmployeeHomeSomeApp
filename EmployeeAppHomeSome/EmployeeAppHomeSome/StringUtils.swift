
//
//  StringUtils.swift
//  Sydne
//
//  Created by Rahul Chabukswar on 7/19/15.
//  Copyright (c) 2015 Phontabulous, Inc. All rights reserved.
//

import Foundation


import Foundation

class StringUtils {
    
    class func trim(input: String!) -> String! {
        
        if (input == nil) {
            return nil
        }
        
        return input.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)

    }
    
    class func isNilOrEmpry(input: String!) -> Bool {
        
        if (input == nil || input.isEmpty) {
            return true
        }
        
        return false
    }
    
    class func length(input: String!) -> Int {
        
        if (input == nil) {
            return 0
        }
        
        return input.characters.count
    }
    
    class func split(input: String!) -> [String] {
        
        var output = [String]()
        
        if (input == nil || input.isEmpty) {
            return output
        }
        
        output = [input.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)]
        
        return output
    }
    
    //    class func isNumeric(input: String!) -> Bool {
    //
    //        if (input == nil) {
    //            return false
    //        }
    //    }
}
