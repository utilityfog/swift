//
//  RemoveRepeats.swift
//  practice3_remove_repeats
//
//  Created by Wonjae Oh on 7/27/24.
//

import Foundation

// Problem URL: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii

class Solution {
    // inout variables can be passed into a function and also be read after some operations are done to itself.
    func removeDuplicates(_ nums: inout [Int]) -> Int? {
        // Good use of guard statement; guard can be used like a ternary operator to conditionally execute logic at a given point in a code block.
        guard nums.count > 1 else { return nums.count }
        
        var writeIndex = 1
        var count = 1
        
        // 1..< iterates a range without its last element
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                count += 1
            } else {
                count = 1
            }
            
            if count <= 2 {
                nums[writeIndex] = nums[i]
                writeIndex += 1
            }
        }
        
        return writeIndex
    }
}
