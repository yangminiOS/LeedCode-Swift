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
                
                combinationSumDFS(start: i , sum: sum + vaule, target: target, item: temp, list: list)
                
                temp.removeLast()
            }
        }
        
    }
    
    //9.19
    
    static func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        let cand = candidates
        
        let sortCand = cand.sorted()
        
        if sortCand.count == 0 {
            return collectList
        }
        
        combinationSumDFS(start: 0, sum: 0, target: target, item: [Int](), list: sortCand)
        
        return collectList
    }
    
    
    static private func combinationSumDFS2(start: Int, sum: Int, target: Int, item: [Int], list: [Int]) {
        
        var temp = item
        
        if(sum == target) {
            
            collectList.append(temp)
            
        }else if(sum > target) {
            
            return
            
        }else {
            
            for i in start ..< list.count {
                
                if(i > start && list[i] == list[i - 1]) {
                    continue
                }
                let vaule = list[i]
                
                temp.append(vaule)
                
                combinationSumDFS(start: i + 1, sum: sum + vaule, target: target, item: temp, list: list)
                
                temp.removeLast()
            }
        }
        
    }
    
    static func permute(_ nums: [Int]) -> [[Int]] {
        
        if(nums.count == 0) {
            return collectList
        }
        
        permuteDFS(nums, start: 0, tempList: [Int]())
        
        return collectList
    }
    
    static func permuteDFS(_ nums: [Int], start: Int, tempList: [Int]) {
        
        var temp = tempList
        
        if(temp.count == nums.count) {
            
            collectList.append(temp)
            print(temp)
        }else {
            
            for i in 0 ..< nums.count {
                
                if( temp.contains(nums[i])) {
                    continue
                }
                
                temp.append(nums[i])
                
                permuteDFS(nums, start: (i + 1), tempList: temp)
                
                temp.removeLast()
            }
            
        }
        
    }
    
    var preArray: [[Int]] = []
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        permuteUniqueDFS(start: 0, nums: nums, temp: [Int]())
        
        return preArray
    }
    
    func permuteUniqueDFS(start: Int, nums: [Int], temp: [Int]) {
        
        var tempList = temp
        
        if(tempList.count == nums.count) {
            
            preArray.append(tempList)
        }else {
            
            for i in  0 ..< nums.count {
                if (i != start && nums[i] == nums[start]){
                    continue
                }
                let item = nums[i]
                
                tempList.append(item)
                
                permuteUniqueDFS(start: i + 1, nums: nums, temp: tempList)
                
                tempList.removeLast()
            }
            
        }
    }
    
    //10.10
    
    func climbStairs(_ n: Int) -> Int {
        
        var count = 0
        
        climbStairsDFS(count: &count, N: n)
        
        return count
    }
    
    func climbStairsDFS( count: inout Int, N: Int) {
        let temp = N
        
        if(temp < 0) {
            
            return
        }
        
        if(temp == 0) {
            count = count + 1
        }
        
       
        
        if(temp - 1 >= 0) {
            
            climbStairsDFS(count: &count, N: (temp - 1))
        }
        
        if(temp - 2 >= 0) {
            
            climbStairsDFS(count: &count, N: (temp - 2))
        }
    }
    
    func climbStairs1(_ n: Int) -> Int {
        
        if(n == 1){
            return 1
        }else if(n == 2) {
            return 2
        }else{
           return climbStairs1(n - 1) +  climbStairs1(n - 2)
        }
    }
  
    func climbStairs2(_ n: Int) -> Int {
        if(n == 1){
            return 1
        }else if(n == 2) {
            return 2
        }else{
            var ans = [Int](repeating: 0, count: n)
            
            ans[0] = 1
            ans[1] = 2
            for i in 2 ..< n {
                ans[i] = ans[i - 1] + ans[i - 2]
            }
            
            return ans[n - 1]
        }
        
    }
    
}
