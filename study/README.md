# algorithm

## Content

- [Stack](https://github.com/eujin811/algorithm_Swift/tree/master/study#stack)
- [Queue](https://github.com/eujin811/algorithm_Swift/tree/master/study#queue)
- [최대공약수](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%B5%9C%EB%8C%80%EA%B3%B5%EC%95%BD%EC%88%98gcd-greatest-common-divisor)
	- [유클리드 호제](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%9C%A0%ED%81%B4%EB%A6%AC%EB%93%9C-%ED%98%B8%EC%A0%9C%EB%B2%95)
- [최소공배수](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%B5%9C%EC%86%8C%EA%B3%B5%EB%B0%B0%EC%88%98lcm-least-common-multiple)
- [소수](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%86%8C%EC%88%98)
	- [에라토스테네스 체](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%97%90%EB%9D%BC%ED%86%A0%EC%8A%A4%ED%85%8C%EB%84%A4%EC%8A%A4-%EC%B2%B4)
- [팩토리얼](https://github.com/eujin811/algorithm_Swift/tree/master/study#%ED%8C%A9%ED%86%A0%EB%A6%AC%EC%96%BC)

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

## 최대공약수(GCD, Greatest Common Divisor)
- 두 수 A와 B의 공통된 약수 중에서 가장 큰 정수
- A와 B를 각각 2부터 min(A, B)까지의 모든 정수로 나누어 보면서 둘다 나누어 떨어지게 되는 가장 큰 수를 구한다.
- 시간복잡도 O(n)
   ```swift
	var g = 1

	for i in 2...min(a,b) {
	   if a % i == 0 && b % i == 0 {
		g = i
	   }
	}
	
	// min(a,b) 둘중 작은것 반
   ```
## 유클리드 호제법
- A를 B로 나눈 나머지를 R라고 할 때(단, A>B), GCD(A, B) = GCD(B, R)과 같다
- (1071, 1029) = (1029, 42) = (42, 21) = (21,0) = 21
- 시간복잡도 O(log N)
- 재귀적 활용
   ```swift
	func GCD(num1 a: Int, num2 b: Int) -> Int {
	   if b == 0 { return a }
	   else { return GCD(num1: b, num2: a % b)
	}
   ```
- 반복문 활용
   ```swift
	func GCD(num1 a: Int, num2 b: Int) -> Int {
	   var a = a, b = b
	   
	   while b != 0 {
		var r = a % b
		a = b
		b = r
	   }
	   return a
	}
   ```
## 최소공배수(LCM, Least Common Multiple)
- 최소공배수: 두 정수의 공통된 배수 중에서 가장 작은 정수
- 두 정수 A * B = 최소 공약수 * 최소 공배수
- 최소공배수를 l, 최소공약수를 g라 할 때 l = (a*b) / g
   ```swift
	func GCD(_ n: Int, _ m: Int) -> Int {
	   if m == 0 { return n }
	   else { return GCD(m, n%m) }
 	}

	func LCD(_ a: Int, _ b: Int) -> Int {
	   let gcd = GCD(a, b)
	   return (a*b) / gcd
	}
   ```
## 소수

## 에라토스테네스 체

## 팩토리얼
