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
    
    /*
     异或的特性：
     1.恒定律：A ^ 0 = A
     2.归零率：A ^ A = 0
     3.交换律：A ^ B = B ^ A
     4.结合律：(A ^ B) ^ C = A ^ (B ^ C)
     */
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        var result = 0
        
        for item in nums {
            result = result ^ item
        }
        return result
    }
    
}
