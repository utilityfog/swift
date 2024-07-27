//
//  ContentView.swift
//  practice2_add_two_ListNode
//
//  Created by Wonjae Oh on 7/27/24.
//

import SwiftUI

// Problem URL: https://leetcode.com/problems/add-two-numbers

struct ContentView: View {
    private let l1 = createListNode(from: [2,4,3,1])
    private let l2 = createListNode(from: [5,6,4])
    
    var body: some View {
        VStack {
            Text("Input List 1: \(listNodeToString(l1))")
            Text("Input List 2: \(listNodeToString(l2))")
            
            let solution = CorrectSolution()
            if let result = solution.addTwoNumbers(l1, l2) {
                Text("Output List: \(listNodeToString(result))")
            }
        }
        .padding()
    }
}

func createListNode(from array: [Int]) -> ListNode? {
    let dummy = ListNode(0)
    var current = dummy
    for num in array {
        current.next = ListNode(num)
        current = current.next!
    }
    return dummy.next
}

func listNodeToString(_ node: ListNode?) -> String {
    var current = node
    var result = ""
    while current != nil {
        result = "\(current!.val)" + result
        current = current!.next
    }
    return result
}

#Preview {
    ContentView()
}
