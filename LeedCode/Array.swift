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
        
        if(n <= 0){
            return
        }
        var target = nums2[0]
        var left = 0
        var right = m - 1
        
        while n > 0 {
            var mid: Int = left + (right - left) / 2
            
        }
    }
}
