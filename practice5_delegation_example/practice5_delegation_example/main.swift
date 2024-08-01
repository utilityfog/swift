//
//  main.swift
//  practice5_delegation_example
//
//  Created by Wonjae Oh on 7/28/24.
//

import Foundation

// Protocol defining the delegate's responsibilities
protocol TaskDelegate: AnyObject {
    func taskDidStart(_ task: Task)
    func taskDidComplete(_ task: Task)
}

// Task class that uses a delegate to notify about its status
class Task {
    weak var delegate: TaskDelegate?
    
    func start() {
        print("Task started.")
        delegate?.taskDidStart(self)
        
        // Simulate some work
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            self.complete()
        }
    }
    
    private func complete() {
        print("Task completed.")
        delegate?.taskDidComplete(self)
    }
}

// Class that acts as the delegate
class TaskHandler: TaskDelegate {
    func taskDidStart(_ task: Task) {
        print("Delegate received task start notification.")
    }
    
    func taskDidComplete(_ task: Task) {
        print("Delegate received task completion notification.")
    }
}

// Example usage
let task = Task()
let handler = TaskHandler()
task.delegate = handler
task.start()

// Keep the script running to see asynchronous output
RunLoop.main.run()

