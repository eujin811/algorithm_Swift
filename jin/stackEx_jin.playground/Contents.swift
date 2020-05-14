import UIKit

/*
 2020.05.14
 김유진
 Stack - LIFO 선입후출 혹은 후입선출이라고 한다.
 
 push: 데이터를 넣을 때
 pop: 데이터를 꺼낼 때
 top: 가장 마지막에 넣은 데이터
 bottom: 가장 처음 넣은 데이터

 ptr: 포인터
 
 
 출처: Do it! 자료구조와 함께 배우는 알고리즘 입문 (자바편) - Bohyoh Shibata
 출처: 씩이블로그 (https://the-brain-of-sic2.tistory.com/18)
 */




final class Stack<Element> {
    
    var storage = Array<Element>()
    
    init() { }
    
    init(_ element: [Element]) {
        storage = element
    }
    
    func push(_ element: Element) {
        storage.append(element)
    }
    
    func pop() -> Element? {
        return storage.popLast()
    }
    
    
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        let stackElements = storage.map{ "\($0)"}.reversed().joined(separator: "\n")
        
        return stackElements
    }
}

func example(of description: String, action: () -> ()) {
    print("---Example of \(description)---")
    action()
}

example(of: "Stack -> Int push") {
    var stack = Stack<Int>()
    var arr = Array(1...3)
    arr.forEach {
        stack.push($0)
    }
    
    print(stack)
}

example(of: "Stack -> Int pop") {
    var stack = Stack<Int>()
    var arr = Array(1...3)
    arr.forEach {
        stack.push($0)
    }
    
    stack.pop()
    print(stack)
}

example(of: "Stack -> Char") {
    let arr = ["a", "b", "c", "d"]
    var stack = Stack(arr)
    print(stack)
}
