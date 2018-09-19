//
//  DFS.swift
//  LeedCode
//
//  Created by mini on 2018/9/18.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

class DFS: NSObject {
    
    static func generateParenthesis(_ n: Int) -> [String] {
        var list: [String] = []
        let temp = ""
        generateDFS(left: n, right: n, temp: temp, list: &list)
        return list
    }
    
    static private func generateDFS(left: Int, right: Int, temp: String, list: inout [String]) {
        
        if(left > right) {
            return
        }
        
        if(left == 0 && right == 0) {
            list.append(temp)
        }else{
            
            if left > 0 {
                generateDFS(left: left - 1, right: right, temp: temp +  "(", list: &list)
            }
            
            if right > 0 {
                
                generateDFS(left: left, right: right - 1, temp: temp + ")", list: &list)
            }
        }
    }
    
    //9.17
    
    static var collectList: [[Int]] = []
    
    static func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        collectList.removeAll()
        
        if candidates.count == 0 {
            return collectList
        }
        
        combinationSumDFS(start: 0, sum: 0, target: target, item: [Int](), list: candidates)
        
        return collectList
    }
    
    
    static private func combinationSumDFS(start: Int, sum: Int, target: Int, item: [Int], list: [Int]) {
        
        var temp = item
        
        if(sum == target) {
            
            collectList.append(temp)
            
        }else if(sum > target) {
            
            return
            
        }else {
            
            for i in start ..< list.count {
                
                let vaule = list[i]
                
                temp.append(vaule)
                
                combinationSumDFS(start: i, sum: sum + vaule, target: target, item: temp, list: list)
                
                temp.removeLast()
            }
        }
        
    }
    
}
