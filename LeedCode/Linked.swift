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

public class TreeNode {
    
    public var val: Int
    
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
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
    
    
    //9.12
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        let newHead: ListNode?  = ListNode.init(-1)
        newHead?.next = head
        
        var pre = newHead
        var curr = pre?.next
        var next = curr?.next
        
        while curr != nil {
            
            pre?.next = next
            curr?.next = next?.next
            next?.next = curr
            
            pre = curr
            curr = pre?.next
            next = curr?.next
        }
        
        return newHead?.next
    }
    
    
    //25. k个一组翻转链表
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var count = k
        
        let newHead: ListNode? = ListNode.init(-1)
        newHead?.next = head
        
        var left = newHead
        
        var end = theEnd(newHead, k)
    
        while end != nil {
            let temp = left?.next
            
            let fir = left?.next
            let sec = fir?.next
            let thi = sec?.next
            
            //while (fir != end)
            
            
            
            
            temp?.next = end?.next
            left?.next = end
            left = temp
            end = theEnd(left, k)
        }
        
        return newHead?.next
    }
    
    func theEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var newHead = head
        var count = k
        while count > 0 {
            
            newHead = newHead?.next
            
            count -= 1
        }
        
        return newHead
    }
    
    
    //10.22
    func hasCycle(_ head: ListNode?) ->Bool {
        
        var slow = head
        var fast = head
        
        while (slow != nil && fast != nil) {
            
            slow = slow?.next
            
            fast = fast?.next?.next
            
            if(fast === slow) {
                return true
            }
        }
        
        return false
    }
    
    //  10.26
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if (p != nil  && q != nil) {
            return ((p?.val == q?.val) && (isSameTree( p?.left, q?.left) && isSameTree(p?.right, q?.right)))
        }else if(p == nil && q == nil) {
            return true
        }else{
            return false
        }
    }
    
    //  11.4
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        if(root == nil) { return true}
        
        return symmetric(root?.left, root?.right)
    }
    
    func  symmetric(_ left: TreeNode?, _ right: TreeNode?) ->Bool {
        
        if(left == nil && right == nil){return true}
        
        if(left == nil || right == nil){return false}
        
        return ((left?.val == right?.val) &&  symmetric(left?.left, right?.right) && symmetric(left?.right, right?.left))
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        var max = 0
        
        if(root != nil) {
            max += 1
            
            let left = maxDepth(root?.left)
            
            let  right = maxDepth(root?.right)
            
            max += left > right ? left : right
            
        }
        
        return max
    }
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        
        if(root == nil){return result}
        
        var rowQueue: [TreeNode] = [root!]
        
        while rowQueue.count > 0 {
            
            var tempTree = [TreeNode]()
            
            var tempInt = [Int]()
            
            for item in rowQueue {
                
                tempInt.append(item.val)
                
                if(item.left != nil){tempTree.append(item.left!)}
                
                if(item.right != nil) {tempTree.append(item.right!)}
                
            }
            
            rowQueue.removeAll()
            rowQueue += tempTree
            result.insert(tempInt, at: 0)
            
        }
        
        return result
    }
    
    //MARK: ******不支持  swift  11.12
    
    /*
     public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
     if(headA == null || headB == null)
     return null;
     ListNode tHeadA = headA,tHeadB = headB;
     int countA = countLength(headA);
     int countB = countLength(headB);
     if(countA > countB){
     for(int i=0;i<countA - countB;i++)
     tHeadA = tHeadA.next;
     }else{
     for(int i=0;i<countB - countA;i++)
     tHeadB = tHeadB.next;
     }
     while(tHeadA != null && tHeadB != null){
     if(tHeadA==tHeadB)
     return tHeadA;
     else{
     tHeadA = tHeadA.next;
     tHeadB = tHeadB.next;
     }
     }
     return null;
     }
     public int countLength(ListNode head){
     int num = 0;
     while(head != null){
     num++;
     head = head.next;
     }
     return num;
     }
     */
    
    
}
