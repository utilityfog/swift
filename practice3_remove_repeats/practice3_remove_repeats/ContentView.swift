//
//  ContentView.swift
//  practice3_remove_repeats
//
//  Created by Wonjae Oh on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            var nums: [Int] = [1,1,1,1,2,2,3,3,3,4,4]
            Text("nums \(nums)")
            let solution = Solution()
            // Conditional binding need to receive an optional
            if let result = solution.removeDuplicates(&nums) { // Must use &nums to make it an inout argument
                Text("Output: \(result), \(nums)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
