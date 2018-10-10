//
//  Dichotomy.swift
//  LeedCode
//
//  Created by mini on 2018/10/10.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

class Dichotomy: NSObject {
    
    
    //10.10
    func mySqrt(_ x: Int) -> Int {
        
        var result = 0
        var left = 0
        var right = x
        
        if(x == 1){
            return 1
        }
        
        while right >= left {
            
            result = (left + right) / 2
            
            if(result * result  == x) {
                return result
            }else if(result * result > x) {
                
                right = result - 1
                
            }else if(result * result < x) {
                
                left = result + 1
            }
        }
        
        return right
    }
    
}
