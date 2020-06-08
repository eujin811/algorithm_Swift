import UIKit

var str = "Single List"

final class Node{
    var value: String?
    var next: Node?
    
    init(value: String) { self.value = value }
}

protocol LinkedListStack {
    var size: Int { get }           // 전체 개수
    var isEmpty: Bool { get }       // 노드가 있는지 여부
    func push(node: Node)           // 데이터 삽입
    func pop() -> String?           // 데이터 추출
    func peek() -> String?          // 마지막 데이터 확인
}

final class SingleLinkedList: LinkedListStack {
    var size: Int = 0 {
        didSet { size = size < 0 ? 0 : size }
    }
    var isEmpty: Bool { return head.next == nil }
    
    
    private var head: Node = Node(value: "")
    private var lastNode: Node? {
        guard var node = head.next else { return nil }      // 사이즈 0일 때,
        while let nextNode = node.next {                    //
            node = nextNode
        }
        return node                                         // 사이즈 1일 때,
    }
    
    func push(node newNode: Node) {
        size += 1
        guard let node = lastNode else { return head.next = newNode }   // 처음 값 넣을 때
        node.next = newNode
    }
    
    func pop() -> String? {
        size -= 1
        guard var node = head.next else { return nil }  // 사이즈가 0일 경우
        while let nextNode = node.next {                // 사이즈가 2이상
            guard nextNode.next != nil else {           // 꼬리가 없을 경우 마지막 노드 지우고 리턴
                node.next = nil
                return nextNode.value
            }
            node = nextNode                             // 꼬리가 있을 경우 노드에 다음노드 넣어서 무한루프
        }
        // 사이즈가 1일 경우 head.next까지가 끝일 때.
        head.next = nil
        return node.value
    }
    
    func peek() -> String? {
        guard let node = lastNode else { return nil }
        return node.value
    }
    
    
}

let singleList = SingleLinkedList()
singleList.push(node: Node.init(value: "A"))
singleList.push(node: Node.init(value: "B"))

singleList.push(node: Node.init(value: "C"))

singleList.push(node: Node.init(value: "D"))

singleList.size

singleList.pop()
singleList.peek()

singleList.isEmpty

singleList.pop()
singleList.size

singleList.pop()
singleList.size
singleList.pop()
singleList.size

singleList.pop()
singleList.size
