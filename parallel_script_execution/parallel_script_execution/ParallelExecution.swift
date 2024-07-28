//
//  ParallelExecution.swift
//  parallel_script_execution
//
//  Created by Wonjae Oh on 7/28/24.
//

import Foundation

// Function to execute a script and save the result to a file
func executeScript(scriptPath: String, resultFileName: String) {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/swift")
    process.arguments = [scriptPath]
    
    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    process.standardError = outputPipe

    do {
        try process.run()
        process.waitUntilExit()
        
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? "Error reading output"
        
        let resultURL = URL(fileURLWithPath: resultFileName)
        try output.write(to: resultURL, atomically: true, encoding: .utf8)
        
        print("\(scriptPath) execution completed. Result saved to \(resultFileName).")
    } catch {
        print("Failed to execute \(scriptPath): \(error)")
    }
}

func executeScriptsInParallel(scriptPaths: [String]) {
    let resultFiles = scriptPaths.enumerated().map { "result\($0.offset + 1).txt" }

    // Create a Dispatch Group to manage concurrent execution
    let dispatchGroup = DispatchGroup()

    // Execute each script in parallel
    for (scriptPath, resultFile) in zip(scriptPaths, resultFiles) {
        dispatchGroup.enter()
        DispatchQueue.global().async {
            executeScript(scriptPath: scriptPath, resultFileName: resultFile)
            dispatchGroup.leave()
        }
    }

    // Wait for all scripts to finish
    dispatchGroup.notify(queue: .main) {
        print("All scripts executed.")
        exit(EXIT_SUCCESS)
    }

    // Keep the script running until all scripts are executed
    RunLoop.main.run()
}
