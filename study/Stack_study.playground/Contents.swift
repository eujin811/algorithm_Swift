import UIKit

import Foundation

/*
 pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 스택에 들어있는 정수의 개수를 출력한다.
 empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
 top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 */

func solution(_ s: String) -> String {
  return ""
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


final class Stack {
//    var arr = [String]()
//    var head = 0
    
    private var storage = [Any]()
    
//    init() {
//        self.array = Array<Int>(repeating: 0, count: size)
//    }
    
    func isEmpty() -> Bool {
        storage.isEmpty
    }
    
    func pop() -> Any {
        return storage.popLast() as? String ?? -1
        //return arrayisEmpty ? -1 : array.removeLast()
        
        /*
         let pop = array[head]
         head -= 1
         if head == 0  { return -1 }
         else {
            let pop = arr[head]
            head -= 1
            return pop
         }
         */
    }
    
    func push(content: Any) {
        storage.append(content)
        
        //크기가 지정된 경우
        /*
         array[head] = n
         head += 1
         */
    }
    
    func size() -> Int {
        return storage.count
        
        /*
         return head
         */
    }
    
    
    
}

