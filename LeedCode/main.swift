//
//  main.swift
//  LeedCode
//
//  Created by mini on 2018/8/3.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import Foundation

let testArray = Array.init()
let testString = Strings.init()
let linked = Linked()
let num1: [Int] =  [1,8,6,2,5,4,8,3,7]

let str = "MMMMMCMXXII"


//testArray.findPairs(num1, 0)
//MMMMMCMXXII
//print(testString.maxArea(num1))

//print(testString.intToRoman(8))

let link1 = ListNode.init(1)
let link2 = ListNode.init(2)
let link3 = ListNode.init(3)
let link4 = ListNode.init(4)
let link5 = ListNode.init(5)

//link1.next = link2
//link2.next = link3
//link3.next = link4
//link4.next = link5

let temp = linked.generateParenthesis(2)

for item in temp {
    print(item)
}
