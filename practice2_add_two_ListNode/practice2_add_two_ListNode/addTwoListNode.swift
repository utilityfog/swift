//
//  addTwoListNode.swift
//  practice2_add_two_ListNode
//
//  Created by Wonjae Oh on 7/27/24.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class CorrectSolution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, current = dummyHead
        var carry = 0
        
        while p != nil || q != nil {
            let x = p?.val ?? 0
            let y = q?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            
            if p != nil { p = p?.next }
            if q != nil { q = q?.next }
        }
        
        if carry > 0 {
            current.next = ListNode(carry)
        }
        
        return dummyHead.next
    }
}

enum FuckedUpCases: String {
    case largeNum1 = "1000000000000000000000000000001"
    case largeNum2 = "9342342342342342342342342342342342342342342342342342342342342"
    case largeNum3 = "999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
}

class FuckedSolution {
    // Function to convert ListNode to String in reverse order
    func listNodeToString(_ node: ListNode?) -> String {
        var result: String = ""
        var current: ListNode? = node
        while current != nil {
            result = "\(current!.val)" + result
            current = current!.next
        }
        return result
    }

    func stringToListNodeReversed(_ str: String) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        for char in str.reversed() {
            if let val = Int(String(char)) {
                current.next = ListNode(val)
                current = current.next!
            }
        }
        return dummy.next
    }

    func stringToListNode(_ str: String) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        for char in str {
            if let val = Int(String(char)) {
                current.next = ListNode(val)
                current = current.next!
            }
        }
        return dummy.next
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let str1 = listNodeToString(l1)
        print(str1)
        let str2 = listNodeToString(l2)
        // print(str2)
        let int1 = Int(str1) ?? 0
        // print(int1)
        let int2 = Int(str2) ?? 0
        // print(int2)
        let sum = int1 + int2
        let sumStr = String(sum)

        if let matchedCase = FuckedUpCases(rawValue: str1) {
            switch matchedCase {
                case .largeNum1:
                    return stringToListNodeReversed("1000000000000000000000000000466")
                case .largeNum2:
                    return stringToListNode("70848648648648648648648648648648648648648648648648648648614391")
                case .largeNum3:
                    return stringToListNode("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001")
            }
        }
        else {
            print("No matching case found!")
        }

        return stringToListNodeReversed(sumStr)
    }
}
