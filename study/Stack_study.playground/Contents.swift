import UIKit

import Foundation

/*
 push X: 정수 X를 스택에 넣는 연산이다.
 pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 스택에 들어있는 정수의 개수를 출력한다.
 empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
 top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 */


class GenericStack<T> {
    private var array = [T]()
    
    func push(_ value: T) {
        array.append(value)
    }
}

class Stack {
    private var cArray: [Int]
    private var head = 0
    
//    private var array = [Int]()
    
    init(size: Int) {
        self.cArray = Array<Int>(repeating: 0, count: size)
    }
    
    func push(_ num: Int) {
        cArray[head] = num
        head += 1
        
        //        array.append(num)
    }
    
    func pop() -> Int {
        if head == 0 {
            return -1
        } else {
            let pop = cArray[head]
            head -= 1
            return pop
        }
        //return array.isEmpty ? -1 : array.removeLast()
        //array.popLast()
    }
    
    func size() -> Int {
        return head
        //return array.count
    }
    
    func isEmpty() -> Int {
        if head == 0 {
            return 1
        } else {
            return 0
        }
        // return array.isEmpty ? 1 : 0
    }
    
    func top() -> Int {
        guard head != 0 else { return -1 }
        return cArray[head - 1]
        //return array.last ?? -1
    }
}

let myStack = Stack(size: 1000)

func solution(_ s: String) -> Int {
    
    let comp = s.components(separatedBy: " ")
    
    switch comp[0] {
    case "push":
        guard let value = Int(comp[1]) else { return -1 }
        myStack.push(value)
        return value
    case "pop":
        return myStack.pop()
    case "size":
        return myStack.size()
    case "empty":
        return myStack.isEmpty()
    case "top":
        return myStack.top()
    default:
        return -1
    }
    
}

let inputs = [
  "push 1",
  "push 2",
  "top",
  "size",
  "empty",
  "pop",
  "pop",
  "pop",
  "size",
  "empty",
  "pop",
  "push 3",
  "empty",
  "top"
]
inputs.forEach { print(solution($0)) }

print("--------- 2번 ---------")
let input2 = ["pop", "top", "push 123", "top", "pop", "top", "pop"]
input2.forEach { print(solution($0)) }
