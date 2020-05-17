# algorithm

## Content

- [Stack](https://github.com/eujin811/algorithm_Swift/tree/master/study#stack)
- [Queue](https://github.com/eujin811/algorithm_Swift/tree/master/study#queue)



------------------------------------------------
## Stack
- LIFO (선입후출, 후입선출)
- push: 데이터 넣을 때
- pop: 데이터 꺼낼 때
- top: 가장 마지막에 넣은 데이터
- 간단버전
   ```swift
	class Stack {
	  private var array = [Int]()

	  init(size: Int) { }

	  func push(_ num: Int) {
	  	array.append(num)
	  }
	  
	  func pop() -> Int {
		return array.isEmpty ? -1 : array.removeLast()
		//return array.popLast() ?? -1
	  }
	 
	  func size() -> Int {
		return array.count
	  }

	  func isEmpty() -> Int {
		return array.isEmpty ? 1 : 0
	  }

	  func top() -> Int {
		return array.last ?? -1
	  }
	}	
   ```
- 정석
   ```swift
	class Stack {
	  private var cArray: [Int}
	  private var head = 0

	  init(size: Int) {
		self.cArray = Array<Int>(repeating: 0, count: size)
	  }

	  func push(_ num: Int) {
		cArray[head] = num
		head += 1
	  }

	  func pop() -> Int {
		if head == 0 { return -1 } 
		else {
			let pop = cArray[head]
			head -= 1
			return pop
		}
	  }

	  func size() -> Int {
		return head
	  }

	  func isEmpty() -> Int {
		if head == 0 { return 1 } 
		else { return 0 }
	  }
	  func top() -> Int {
		guard head != 0 else { return -1 }
		
		return cArray[head - 1]
	  }
	}
	
	}
   ```
## Queue
- FIFO(선입선출)
- BFS 알고리즘에서 활용
- enqueue: 큐에서 데이터를 넣는 작업
- dequeue: 큐에서 데이터를 꺼내는 작업
- front: 데이터 꺼내는 쪽(맨앞)
- rear: 데이터를 넣는 쪽 (맨뒤)
- peek: 가장 앞의 데이터 알려줌

   ```swift
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
   ```


