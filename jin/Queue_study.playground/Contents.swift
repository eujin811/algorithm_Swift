import UIKit
import Foundation
/*
 
 */

class Queue {
    private var queue = Array<Int>(repeating: 0, count: 1000)
    private var front = 0
    private var rear = 0
    
    func push(_ data: Int) {
        queue[rear] = data
        rear += 1
    }
    
    func pop() -> Int {
        let data = queue[front]
        queue[front] = 0
        front += 1
        return data
    }
    
    func isEmpty() -> Bool {
        return front == rear
    }
    
    func size() -> Int {
        return rear - front
    }
    
    func peek() -> Int {
        return queue[front]
    }
}
