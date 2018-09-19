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
    
    //8.10
    func thirdMax(_ nums: [Int]) -> Int {
        
        var first: Int = Int(Int64.min)
        var second: Int = Int(Int64.min)
        var third: Int = Int(Int64.min)
        
        for num in nums {
            if (num > first) {
                third = second
                second = first
                first = num
            }else if(num > second && num < first) {
                
                third = second
                
                second = num
            }else if (num > third && num < second ){
                third = num
            }
        }
        
        return (third == Int(Int64.min)  || third == second) ?  first : third
    }
    
    //8.13
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        var array = nums
        var result: [Int] = []
        
        for i in 0 ..< array.count {
            let idx:Int = abs(nums[i]) - 1
            //array[idx] = (array[idx] > 0) ? (-array[idx]) : array[idx]
            array[idx] = (array[idx] > 0) ? (-array[idx]) : array[idx]
            
            
        }
        for j in 0 ..< array.count {
            if(array[j] > 0) {
                result.append(j + 1)
            }
        }
        
        return result
    }
    
    func maximumProduct(_ nums: [Int]) -> Int {
        var first: Int = Int(Int32.min)
        var second: Int = Int(Int32.min)
        var third: Int = Int(Int32.min)
        
        var min1: Int = 0
        var min2: Int = 0
        for item in nums {
            
            if(item >= first) {
                third = second
                second = first
                first = item
            }else if(item >= second && item < first) {
                
                third = second
                second = item
                
            }else if(item >= third && item < second) {
                
                third  = item
            }
            
            if( item < 0) {
                if(min2 == 0 && min1 == 0) {
                    min2 = item
                }else if(item <= min2) {
                    min1 = min2
                    min2 = item
                    
                }else if(item <= min1 && item > min2) {
                    min1 = item
                }
            }
        }
        print(first,second,third)
        print( min1, min2)
        var max = first * second * third
        if(min2 < 0 && min1 < 0) {
            let temp = first * min2 * min1
            if(temp > max){
                max = temp
            }
        }
        
        return max
    }
    
    //8.14
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        var temp = 0
        for itme in nums {
            
            if(itme == 1) {
                temp += 1
                
                max = max > temp ? max : temp
            }else {
                temp = 0
            }
        }
        print(max)
        return max
    }
    
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        if(k > nums.count) {
            print("error")
        }else{
            print(k)
        }
        var max: Double = Double(Int64.min)
        var sum = 0
        for i in 0 ..< nums.count {
            sum = sum + nums[i]
            if(i > k - 1) {
                sum = sum - nums[i - k]
            }
            let temp: Double = Double(sum) / Double(k)
            if((i + 1) >= k && temp > max) {
                max = temp
            }
        }
        print(max)
        return max
    }
    
    //8.15
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var diffCount = 0
        var dict: [String: Int] = [:]
        for num in nums {
            var addCount = 0
            var redCount = 0
            var addKey = dict["\(num + k)"]
            var redKey = dict["\(num - k)"]
            
            while ((addKey != nil  || redKey != nil)   && k != 0) {
                if let add = addKey {
                    addKey = dict["\(add + k)"]//add + k
                    addCount += 1
                }
                if let red = redKey {
                    redKey = dict["\(red - k)"]//red - k
                    redCount += 1
                }
            }
             dict["\(num)"] = num
            let temp = addCount > redCount ? addCount : redCount
            
            diffCount = temp > diffCount ? temp : diffCount
            
        }
        if(k == 0) {
            diffCount = nums.count - dict.count
        }
        print(diffCount)
        return diffCount
    }
    
    func reverse(_ x: Int) -> Int {
        var result = 0
        if(x <= Int(Int32.min)) {
            return result
        }
        var IntChar = x
        IntChar = IntChar < 0 ? -IntChar : IntChar
        
        IntChar = IntChar % 10 == 0 ? IntChar / 10 : IntChar
        
        let intStr = "\(IntChar)"
        
        let resultStr = String(intStr.reversed())
        
        if(x < 0) {
            
            result = -1 * Int(resultStr)!
        }else{
            result = Int(resultStr)!
        }
        if(result > Int(Int32.max) || result < Int(Int32.min)) {
            return 0
        }
        return result
    }
    
    
   
    
 
    
}
