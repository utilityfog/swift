//
//  ContentView.swift
//  Live_Coding_Exam
//
//  Created by Wonjae Oh on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let id1 = 25035633875
            let id2 = 13027833775
            
            Text("Input 1: \(id1)")
            Text("Input 2: \(id2)")
            
            let solution = Solution()
            if let result1 = solution.extractGender(id1) {
                Text("Output: \(result1)")
            }
            if let result2 = solution.extractGender(id2) {
                Text("Output: \(result2)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
