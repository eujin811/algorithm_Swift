import UIKit

/*
 2020.05.14
 Queue - FIFO, 선입선출
 
 enqueue: 큐에 데이터를 넣는 작업
 dequeue: 큐에서 데이터를 꺼내는 작업
 
 front: 데이터를 꺼내는 쪽 (맨앞)
 rear: 데이터를 넣는 쪽 (맨뒤)
 
 peek 가장 앞의 큐알려준다.
 */


protocol Queue {
    associatedtype Element
    
    mutating func enQueue(_ element: Element) -> Bool
    mutating func deQueue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }      // 가장 앞의 큐 보기용.
}

struct QueueArray<T>: Queue {
    private var array = Array<T>()
    
    init() {}
    
    var isEmpty: Bool{
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enQueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func deQueue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}


extension QueueArray: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}


var queueArray = QueueArray<String>()
queueArray.enQueue("jinjin")
queueArray.enQueue("sunny")
queueArray.enQueue("kk")
print(queueArray)
queueArray.deQueue()
print(queueArray)
