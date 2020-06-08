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
- [다이나믹 프로그래밍](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EB%8B%A4%EC%9D%B4%EB%82%98%EB%AF%B9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D)
- [그래프 Graph](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B7%B8%EB%9E%98%ED%94%84graph)
	- [BFS]()
	- [DFS]()
- [트리 Tree](https://github.com/eujin811/algorithm_Swift/tree/master/study#%ED%8A%B8%EB%A6%ACtree)
- [MST](https://github.com/eujin811/algorithm_Swift/tree/master/study#mstminimum-spanning-tree)
- [최단경로](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%B5%9C%EB%8B%A8%EA%B2%BD%EB%A1%9Csingle-source-shortest-path)


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

## 다이나믹 프로그래밍
- 동적 계획법
- 문제의 크기를 기준으로 큰 문제를 작은 크기의 문제 여러개로 나누고 각각의 문제를 풀어서 합침
- ex: 피보나치 수열
   
   ```swift
	// O(2^n) 
	func fibonacci(_ n: Int) -> Int {
	   guard n > 1 else { return n }
	   return fibonacci(n-1) + fibonacci(n-2)
	}  
   ```

   ```swift
	// O(n)
	var memo = [Int: Int]()
	func fibonacci2(_ n: Int) -> Int {
	   guard n > 1 else { return n }
	   if let value = memo[n], memo[n]! > 0 {
		return value
	   } else {
		memo[n] = fibonacci2(n-1) + fibonacci2(n-2)
		return memo[n] ?? 0
	   }
	}
   ```


# 그래프(Graph)
- G = (V,E)
	- V : 정점, Node, Vertex
	- E : 간선, Edge, 정점 간의 관계
- 경로(Path)
	- 정점 A에서 비로 가는 간선의 연속
	- A -> C -> D -> E -> B
- 사이클(Cycle)
	- 시작점과 도착점이 같은 경로
	- A -> C -> B -> A
  <p align="center">
  <img src="assets/Graph/Graph_Cycle.jpeg" alt="집합 기본 메소드" height="50%" width="50%">
  </p>
- 단순 경로와 단순 사이클
	- 같은 정점을 두번 이상 방문하지 않는 경로/사이클
- 뱡향이 있는 그래프
	- 정해진 방향으로만 갈 수 있는 그래프
	- A -> E로 갈 수 있지만 E -> A로 갈 수 없음
- 양방향 그래프
	- 방향이 없는 그래프
- 루프
	- 간선의 양 끝점이 같은 경우
- 가중치
	- A에서 B로 이동하는 거리, 시간, 이동하는데 필요한 비용 
	- 가중치가 별도로 표시되지 않으면 1을 나타냄
- 차수(Degree)
	- 정점에 연결되어 있는 간선의 개수
	- 방향이 있는 그래프의 경우 In-degree, Out-degree로 나뉨
		- In-degree: 해당 정점으로 들어오는 뱡향의 간선 수
		- Out-degree: 해당 정점에서 나가는 방향의 간선 
## BFS

## DFS


## 트리(Tree)

## MST(Minimum Spanning Tree)

## 최단경로(Single Source Shortest Path)
