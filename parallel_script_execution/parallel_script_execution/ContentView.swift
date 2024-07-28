//
//  ContentView.swift
//  parallel_script_execution
//
//  Created by Wonjae Oh on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scriptPaths: [String] = []
    
    var body: some View {
        VStack {
            List(scriptPaths, id:\.self) {
                path in Text(path)
            }
            
            Button("Select Scripts") {
                selectScripts()
            }
            
            Button("Execute Scripts in Parallel") {
                executeScriptsInParallel(scriptPaths: scriptPaths)
            }
        }
        .padding()
    }
    func selectScripts() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.allowedContentTypes = [.swiftSource]
        panel.allowsMultipleSelection = true
        panel.canChooseDirectories = false
        
        if panel.runModal() == .OK {
            self.scriptPaths = panel.urls.map { $0.path }
        }
    }
}

#Preview {
    ContentView()
}
