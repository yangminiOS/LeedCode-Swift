//
//  String.swift
//  LeedCode
//
//  Created by mini on 2018/8/20.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

class Strings: NSObject {
    
    
    func isPalindrome(_ x: Int) -> Bool {
        
        let temp = "\(x)"
        let intString = String(temp.reversed())
        let result: Int? = Int(intString)
        
        if let intRes = result {
            if (intRes == x) {
                return true
            }
        }
        
        return false
    }
    
    
    
    
    
    
    
    
    
}


