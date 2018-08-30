//
//  String.swift
//  LeedCode
//
//  Created by mini on 2018/8/20.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

class Strings: NSObject {
    
    //MARK: ******8.20
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
    
    
    func romanToInt(_ s: String) -> Int {
        var temp = 0
        var sum = 0
        var intVaule = 0
        for str in s {
            switch str {
            case "I":
                intVaule = 1
            case "V":
                intVaule = 5
            case "X":
                intVaule = 10
            case "L":
                intVaule = 50
            case "C":
                intVaule = 100
            case "D":
                intVaule = 500
            case "M":
                intVaule = 1000
            default:
                print("error")
            }
            var result = intVaule
            if(temp < intVaule) {
                result = intVaule - 2 * temp
            }
            
            sum = sum + result
            
            temp = intVaule
        }
        
        
        return sum
    }
    
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var publicStr: String = ""
        if strs.count == 0 {
            return publicStr
        }
        var temp : String = ""
        let firstStr = strs[0]
        var indexC = 0
        for i in firstStr {
            temp = temp + "\(i)"
            for j in 0 ..< strs.count {
                let str = strs[j]
                let char = str.index(of: i)
                if(char == firstStr.index(of: i)) {
                    if(j == strs.count - 1) {
                        publicStr = temp.count > publicStr.count ? temp : publicStr
                    }else{
                        continue
                    }

                }else{
                    temp = ""
                }
            }
            indexC += 1
        }
        
        return publicStr
    }
    
    ///8.21
    func isValid(_ s: String) -> Bool {
        if(s.count % 2 != 0) {
            return false
        }
        var result = [String]()
        for char in s {
            let count = result.count
            let str = "\(char)"
            if(count == 0) {
                result.append(str)
            }else {
                let lastStr = result[count - 1]
                if((lastStr == "(" && str == ")") ||
                    (lastStr == "[" && str == "]") ||
                    (lastStr == "{" && str == "}")) {
                    result.remove(at: (count - 1))
                }else{
                    result.append(str)
                }
                
            }
        
        }
        
        if(result.count != 0) {
            return false
        }
        
        return true
        
    }
    
    
    //8.24
    
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if( needle == "" || haystack == needle) {
            return 0
        }
        if (haystack.contains(needle)) {
            for (index, vaule) in haystack.enumerated(){
                let secC = needle.first ?? " "
                print(vaule, secC)
                if (vaule == secC) {
                    let indexl = haystack.index(haystack.startIndex, offsetBy: index)
                    if haystack.count >= (index  + needle.count){
                        let indexR = haystack.index(indexl, offsetBy: needle.count)
                        let sub = haystack[indexl..<indexR]
                        print(sub)
                        if sub == needle {
                            return index
                        }
                    }
                    
                }
                
            }
        }
        return -1
    }
    
    //8.27
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var sum = 0
        var strDic: [String: Int] = [:]
        var temp = 0
        var index = 0
        
        for char in s {
            index += 1
            let charStr = "\(char)"
            let dicChar = strDic[charStr]
           
            if let intStr = dicChar {
                strDic["\(char)"] = index
                temp = index - intStr
                sum = sum > temp ? sum : temp
                
            }else{
                strDic["\(char)"] = index
                //temp = index - intStr
                temp += 1
                sum = sum > temp ? sum : temp
            }
        }
        return sum
    }
    
}


