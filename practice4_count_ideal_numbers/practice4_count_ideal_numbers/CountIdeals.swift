//
//  CountIdeals.swift
//  practice4_count_ideal_numbers
//
//  Created by Wonjae Oh on 7/27/24.
//

import Foundation
import Darwin

// Problem Statement: given a range [low, high], count the number of ideal numbers. An ideal number is a positive integer that can be expressed in the form of 3^x * 5^y with x and y being nonnegative integers.

class Solution {
    func countIdeals(_ low: Int, _ high: Int) -> Int? {
        var count = 0
        var powerOfThree = 1
        
        // Iterate over powers of 3
        while powerOfThree <= high {
            var powerOfFive = 1
            
            // Iterate over powers of 5
            while powerOfThree * powerOfFive <= high {
                let idealNumber = powerOfThree * powerOfFive
                if idealNumber >= low {
                    count += 1
                }
                powerOfFive *= 5
            }
            
            powerOfThree *= 3
        }
        
        return count
    }
}
