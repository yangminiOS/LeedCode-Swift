//
//  Linked.swift
//  LeedCode
//
//  Created by mini on 2018/9/6.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

public class ListNode {
    
    public var val: Int
    
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}


class Linked: NSObject {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if(head == nil || n == 0) {
            return head
        }
        let newList: ListNode? = ListNode.init(-1)
        newList?.next = head
        
        var left = newList
        var right = newList
        var index = n
        while index > 0 {
            right = right?.next
            index -= 1
        }
        
        while right?.next != nil {
            right = right?.next
            left = left?.next
        }
        left?.next = left?.next?.next
        
        return newList?.next
    }
    
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        let head = ListNode.init(-1)
        var list = head
        while (list1 != nil  || list2 != nil) {
            
            let val1: Int? = list1?.val
            
            let val2: Int? = list2?.val
            
            var result = 0
            
            if(val2 != nil && val1 != nil) {
                result = min(val2!, val1!)
                if(val1! <= val2!) {
                    list1 = list1?.next
                }else{
                    list2 = list2?.next
                }
            }else if(val1 != nil) {
                result = val1!
                list1 = list1?.next
            }else if(val2 != nil) {
                result = val2!
                list2 = list2?.next
            }
            let newL = ListNode.init(result)
            list.next = newL
            
            list = newL
        }
        return head.next
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var list: [String] = []
        let temp = ""
        generateDFS(left: n, right: n, temp: temp, list: &list)
        return list
    }
    
    func generateDFS(left: Int, right: Int, temp: String, list: inout [String]) {
        
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
    
    
    
    
    
    
}
