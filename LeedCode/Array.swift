//
//  File.swift
//  LeedCode
//
//  Created by mini on 2018/8/3.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

class Array: NSObject {
    
    func twoSun(_ nums: [Int], _ target: Int) ->[Int] {
        
        var dict = [String: Int]()
        for i in 0..<nums.count {
            let pre = target - nums[i]
            if let temp = dict[String(pre)] {
                return [i, temp]
            }else{
                dict[String(nums[i])] = i
            }
        }
        
        return [-1, -1]
    }
    
    
    func ambiguousCoordinates(_ S: String) -> [String] {
        let starIndex = S.index(S.startIndex, offsetBy: 1)
        let endIndex = S.index(S.endIndex, offsetBy: -1)
        let numStr = String(S[starIndex..<endIndex])
        return["q"]
    }
    
    
    func arrangeCoins(_ n: Int) -> Int {
        if(n == 1) {
            return n
        }
        var start = 1
        var end = n
        while start < end {
            let mid: Int = (start + end) / 2
            let sum: Int = ((mid + 1) * mid) / 2
            if(sum == n) {
                return mid
            }
            if(sum > n) {
                end = mid
            }else{
                start = mid + 1
            }
        }
        return end - 1
    }
    
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if(nums.count <= 1) {
            
            return nums.count
        }
        var count: Int = 0
        for i in 1 ..< nums.count {
            if(nums[count] != nums[i]) {
                count += 1
                nums[count] = nums[i]
            }
        }
        
        return count + 1
    }
    
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int{
        
        var count: Int = 0
        for i in 0 ..< nums.count {
            if(nums[i] != val) {
                nums[count] = nums[i]
                count += 1
                
            }
        }
        
        return count
    }
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        if(nums.count == 0) {
            return 0
        }
        
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            
            let mid: Int = start + (end - start) / 2
            
            if(nums[mid] == target) {
                return mid
            }
            if(nums[mid] < target) {
                start = mid + 1
            }else{
                end = mid - 1
            }
        }
        return start
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if(nums.count < 2) {
            return nums[0]
        }
        var sum = [Int]()
        sum.append(nums[0])
        var max = nums[0]
        for i in 1..<nums.count {
            let tempMax = sum[i - 1] + nums[i] >= nums[i] ? (sum[i - 1] + nums[i]) : nums[i]
            sum.append(tempMax)
            if(sum[i] >= max) {
                max = sum[i]
            }
        }
        return max
    }
    
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var temp = digits
        let index: Int = digits.count - 1
        var count: Int =  1
        for i in 0 ..< digits.count {
            let sum = count + digits[index - i]
            temp[index - i] = sum % 10
            count = sum / 10
        }
        if (count > 0) {
            temp.insert(count, at: 0)
        }
        return temp
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        if(n <= 0) {
            return
        }
        var i = 0
        var j = 0
        let lenght = nums1.count
        while (j < n  && i < lenght) {
            var temp = lenght - 1
            
            if(nums1[i] >= nums2[j]) {
                while temp > i {
                    nums1[temp] = nums1[temp - 1]
                    
                    temp = temp - 1
                }
                nums1[i] = nums2[j]
                i += 1
                j += 1
            }else {
                i += 1
            }
            
        }
        while j < n {
            nums1[m + j] = nums2[j]
            j += 1
            
        }
        
    }
    
    
    func generate(_ numRows: Int) -> [[Int]] {
        if(numRows == 0) {
            return []
        }
        if(numRows == 1) {
            return [[1]]
        }
        if (numRows == 2) {
            return[[1], [1,1]]
        }
        var result: [[Int]] = [[1],[1,1]]
        for i in 0 ..< (numRows - 2) {
            
            var newArray: [Int] = [1]
            let lastArray = result.last
            if let last = lastArray {
                for j in 1 ..< last.count {
                    let newVaule = last[j] + last[j - 1]
                    newArray.append(newVaule)
                }
            }
            newArray.append(1)
            
            result.append(newArray)
        }
        
        return result
    }
    
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var old: [Int] = [1,1]
        var new: [Int] = [1]
        for i in 1 ..< rowIndex + 1 {
            new = [1]
            //print(new)
            if (i >= 2) {
                for j in 1 ..< old.count  {
                    let newItem = old[j] + old[j - 1]
                    new.append(newItem)
                }
            }
            new.append(1)
            old = new
            print(i)
            print(new)
        }
        
        return new
    }
    
    
    func maxProfit(_ prices: [Int]) -> Int {
        var sur = 0
        if(prices.count < 1) {
            return sur
        }
        var buy = prices[0]
        var saril = buy
        for i in 1 ..< prices.count {
            if(buy > prices[i]) {
                buy = prices[i]
                saril = buy
            }else{
                if((prices[i] - buy) > sur) {
                    saril = prices[i]
                    sur = prices[i] - buy
                }
            }
        }
        return sur
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        var sum = 0
        if(prices.count < 1) {
            return sum
        }
        var buy = prices[0]
        var saril = buy
        
        for i in 1 ..< prices.count {
            if(prices[i] > saril) {
                saril = prices[i]
            }else {
                sum = sum + saril -  buy
                buy = prices[i]
                saril = buy
            }
        }
        if(saril > buy) {
            sum = sum + saril - buy
        }
            
        return sum
    }
    
    func maxProfit3(_ prices: [Int]) -> Int {
        var sum = 0
        if(prices.count < 1) {
            return sum
        }
        var resultArray: [Int] = [0, 0]
        var buy = prices[0]
        var saril = buy
        for i in 1 ..< prices.count {
            
            if(prices[i] > saril) {
                saril = prices[i]
            }else {
                let gold = saril - buy
                let first = resultArray[0] + gold
                let second = resultArray[1] + gold
                if(first > second) {
                    resultArray[1] = gold
                }else{
                    resultArray[0] = gold
                }
                
                buy = prices[i]
                saril = buy
            }
        }
        
        if(saril > buy) {
            let gold = saril - buy
            let first = resultArray[0] + gold
            let second = resultArray[1] + gold
            if(first > second) {
                resultArray[1] = gold
            }else{
                resultArray[0] = gold
            }
        }
        sum = resultArray[0]  + resultArray[1]
        return sum
    }
    
}
