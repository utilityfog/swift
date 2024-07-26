//
//  ContentView.swift
//  practice1_app
//
//  Created by Wonjae Oh on 7/26/24.
//

import SwiftUI

struct ContentView: View {
    enum Emoji: String, CaseIterable {
        case 😎,😭,😇,😱
    }
    @State var selection: Emoji = .😎
    var body: some View {
        NavigationView {
            VStack {
//                For some reason, when using NavigationView in a macos app, one needs to have a default VStack before the actual VStack that will be displayed in order for NavigationView to properly contain the target VStack
            }
            .frame(width: 0)
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                
                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) {
                        emoji in Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
            .navigationTitle("Emoji Lovers!")
        }
    }
}

#Preview {
    ContentView()
}
