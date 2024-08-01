//
//  GenderExtractor.swift
//  Live_Coding_Exam
//
//  Created by Wonjae Oh on 7/28/24.
//

import Foundation

class Solution {
    // function that receives id of an individual and extracts their gender by extracting the related character
    func extractGender(_ id: Int) -> String? {
        let remainder = id % 200
        
        let is_three_digit = remainder / 100
        
        if is_three_digit == 1 {
            return "female"
        }
        else {
            return "male"
        }
    }

//    12121233612
//    /100
//    121212336
//    byte(12121233612/100)
//    236 & 1
}
