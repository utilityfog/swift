//
//  main.swift
//  practice6_observer_example
//
//  Created by Wonjae Oh on 7/28/24.
//

import Foundation

// Notification names
extension Notification.Name {
    static let taskDidStart = Notification.Name("taskDidStart")
    static let taskDidComplete = Notification.Name("taskDidComplete")
}

// Task class that posts notifications
class Task {
    func start() {
        print("Task started.")
        NotificationCenter.default.post(name: .taskDidStart, object: self)
        
        // Simulate some work
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            self.complete()
        }
    }
    
    private func complete() {
        print("Task completed.")
        NotificationCenter.default.post(name: .taskDidComplete, object: self)
    }
}

// Observer class that listens for notifications
class TaskObserver {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(taskDidStart(_:)), name: .taskDidStart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(taskDidComplete(_:)), name: .taskDidComplete, object: nil)
    }
    
    @objc func taskDidStart(_ notification: Notification) {
        print("Observer received task start notification.")
    }
    
    @objc func taskDidComplete(_ notification: Notification) {
        print("Observer received task completion notification.")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// Example usage
let task = Task()
let observer = TaskObserver()
task.start()

// Keep the script running to see asynchronous output
RunLoop.main.run()

