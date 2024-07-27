//
//  ContentView.swift
//  practice4_count_ideal_numbers
//
//  Created by Wonjae Oh on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let min = 15
            let max = 75
            let solution = Solution()
            Text("min: \(min), max: \(max)")
            Text("Number of Ideal Numbers: \(solution.countIdeals(min,max)!)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
