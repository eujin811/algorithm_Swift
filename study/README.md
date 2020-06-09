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
- [SingleLinkedList]()
- [DoubleLinkedList]()
- [그래프 Graph](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B7%B8%EB%9E%98%ED%94%84graph)
	- [그래프표현](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B7%B8%EB%9E%98%ED%94%84%EC%9D%98-%ED%91%9C%ED%98%84)
	- [인접 행렬](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%9D%B8%EC%A0%91-%ED%96%89%EB%A0%AC)
	- [인접 리스트](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EC%9D%B8%EC%A0%91-%EB%A6%AC%EC%8A%A4%ED%8A%B8)
	- [간선 리스트](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B0%84%EC%84%A0-%EB%A6%AC%EC%8A%A4%ED%8A%B8)
	- [공간 복잡도](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B3%B5%EA%B0%84%EB%B3%B5%EC%9E%A1%EB%8F%84)
	- [그래프 탐색](https://github.com/eujin811/algorithm_Swift/tree/master/study#%EA%B7%B8%EB%9E%98%ED%94%84-%ED%83%90%EC%83%89)
	- [BFS 너비 우선 탐색](https://github.com/eujin811/algorithm_Swift/tree/master/study#bfs)
	- [DFS 깊이 우선 탐색](https://github.com/eujin811/algorithm_Swift/tree/master/study#dfs)
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

## SingleLinkedList

- 하나의 포인터 멤버로 다른 노드 데이터를 가르키는 것 (HEAD 없이 TAIL만 존재)
- 앞으로 돌아갈 수 없으며, 중간 위치로 바로 접근하지 못 함.
- Head 노드 주소를 잃어버리면 데이터 전체 접근 불가, 중간이 유실되면 그 이후 노드들에 접근이 불가능하다.
- Queue 구현에 많이 사용, 랜덤 엑세스 성능이 낮고 불안정
- push: 데이터 삽입
- pop: 데이터 추출
- peek: 마지막 데이터 확인

   ```swift
	final class Node {
	   var value: String?
	   var next: Node?

	   init(value: String) { self.value = value }
	}	

	protocol LinkedListStack {
	   var size: Int { get }
	   var isEmpty: Bool { get }
	   func push(node: Node)
	   func pop() -> String?
	   func peek() -> String?
	}

	final class SingleLinkedList: LinkedListStack {
	   var size: Int = 0 {
		didSet { size = size < 0 ? 0 : size } 	// size 최저 0개 
	   }
	   var isEmpty: Bool { return head.next == nil }
	
	   private var head: Node = Node(value: "")
	   private var lastNode: Node? {
		guard var node = head.next else { return nil } 	// 사이즈 0일 때
		while let nextNode = node.next {
		   node = nextNode
		}
		return node
	   }

	   func push(node newNode: Node {
		size += 1
		guard let node = lastNode else { return head.next = newNode }	// 처음 값을 넣을 때 

		node.next = newNode
	   }
	
	   func pop() -> String? {
		size -= 1
		guard var node = head.next else { return nil }	// size = 0
		while let nextNode = node.next {		// size >= 2
		   guard nextNode.next != nil else {		// next 없을 경우 마지막 노드 지움
			node.next = nil
			return nextNode.value
		   }
		   node = nextNode				// next있으면 다음 노드 넣어줌
		}
		// size = 1	 head.next가 끝일 경우
		head.next = nil
		return node.value
	   }

	   func peek() -> String? {
		guard let node = lastNode else { return nil }
		return node.value
	   }

	}
   ```



## DoubleLinkedList
- HEAD가 이전, TAIL이 이후 노드 데이터를 가르킨다.
- 끊어진 체인 복구 가능
   ```swift
	final class Node {
	   let value: String
	   weak var previous: Node?	// 이전 node
	   var next: Node?		// 다음 node

	   init(value: String) {
		self.value = value
	   }
	   deinit {
		print("\(value) Node has deinitialized")
	   }
	}

	final class DoubleLinkedList {
	   private var head: Node?
	   private weak var tail: Node?

	   var first: Node? { return head }
	   var last: Node? { return tail }
	   var isEmpty: Bool { return head == nil }
	   var count: Int {
		guard var node = head else { return 0 }

		var count = 1
		while let nextNode = node.next {
		   count += 1
		   node = nextNode
		}
		return count
	   }

	   func append(node: Node) {
		if let tailNode = tail {
		   tailNode.next = node
		   node.previous = tailNode
		} else {
		   head = node
		}
		tail = node
	   }

	   func insert(node newNode: Node, at index: Int) {
		var node = head
		for _ in 0..<index {
		   node = node?.next
		}

		guard node != nil else { return print("index error") }

		newNode.previous = node?.previous
		newNode.next = node
		node?.previous?.next = newNode
		node?.previous = newNode
	   }

	   func node(at index: Int) -> Node? {
		var node = head
		for _ in 0..<index {
		   node = node?.next
		}
		return node
	   }

	   func node(by value: String) -> Node? {
		var node = head
		while node?.value != value {
		   node = node?.next
		}
		return node
	   }

	   func remove(at index: Int) -> String? {
		guard let node = node(at: index) else { return nil }

		if node === head {
		   head = node.next
		} else if node === tail {
		   tail = node.previous
		}

		node.previous?.next = node.next
		node.next?.previous = node.previous

		return node.value
	   }

	   func removeNode(by value: String) -> Bool {
		guard let node = node(by: vlue) else { return false }
		
		if node === head {
		   head = node.next
		} else if node === tail {
		   tail = node.previous
		}

		node.previous?.next = node.next
		node.next?.previous = node.previous

		return true
	   }

	   func removeAll() {
		head = nil
		tail = nil
	   }

	   func scanValues() {
		var values: [String] = []
		var node = head 

		while let _ = node {
		   values.append(node!.value)
		   node = node!.next
		}
		print("Values:", values)
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
  <p align="center">
  <img src="../assets/Graph/Graph_Path.png" alt="집합 기본 메소드" height="50%" width="50%">
  </p>

- 사이클(Cycle)
	- 시작점과 도착점이 같은 경로
	- A -> C -> B -> A
  <p align="center">
  <img src="../assets/Graph/Graph_Cycle.png" alt="집합 기본 메소드" height="50%" width="50%">
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
  <p align="center">
  <img src="../Assets/Graph/Graph_loop.png" alt="집합 기본 메소드" height="50%" width="50%">
  </p>

- 가중치
	- A에서 B로 이동하는 거리, 시간, 이동하는데 필요한 비용 
	- 가중치가 별도로 표시되지 않으면 1을 나타냄
  <p align="center">
  <img src="./Assets/Graph/Graph_Weight.png" alt="집합 기본 메소드" height="50%" width="50%">
  </p>

- 차수(Degree)
	- 정점에 연결되어 있는 간선의 개수
	- 방향이 있는 그래프의 경우 In-degree, Out-degree로 나뉨
		- In-degree: 해당 정점으로 들어오는 뱡향의 간선 수
		- Out-degree: 해당 정점에서 나가는 방향의 간선 
## 그래프의 표현
	- 정점(Node): [1, 2, 3, 4, 5, 6]
	- 간선: [(1,2), (1,5), (2,5), ...(4,6)]
- 저장 방법: 한 정점 X와 연결된 간선을 효율적으로 찾는 구조를 만듬.
	- 인접 행렬과 인접 리스트의 구조로 저장
	- 단순 1차원 배열로 저장한다면 어떤 정점을 찾기 위해 배열을 모두 순회해야 하므로 비효율

## 인접 행렬
- 정점의 개수 V, 간선 E에 대해 2차원 배열로 저장 (V*V)
	- 2차원 배열의 크기: V^2
	- 하나의 정점과 연결된 모든 간선을 구하는 시간: O(V)
		- 인접 행렬에서 하나의 행 또는 열에 대해 V개의 열 또는 행을 모두 살펴봐야 함

- 가중치가 없는 그래프
	- 정점 A에서 B로 가는 간선이 있으면 1, 없으면 0 저장
		- 1과 5는 방향 없는 간선이므로, 1->5, 5->1 두가지로 저장
- 가중치가 있는 그래프
	- 정점 A에서 B로 가는 간선이 있으면 가중치 w, 없으면 0저장

## 인접 리스트
- 정점의 개수 V에 대해 연결되어 있는 정점을 크기 V인 리스트 형태로 저장 -> 개수가 곧 간선이 된다.
	- 정점이 몇 개가 있을지 모르므로 연결 리스트를 사용해서 저장한다.
- 가중치가 없는 그래프
	- 연결된 정점을 저장
		- A[1] 2, 5
		- A[2] 1, 3, 4, 5
- 가중치가 있는 그래프
	- 연결된 정점과 가중치를 묶어서 저장
		- A[1] (2,2) (5,7)
		- A[2] (1,2) (3,2) 

## 간선 리스트
- 인접 리스트를 사용해야 하지만 라이브러리를 사용하기 싫고, 링크드 리스트를 구현하는 것도 싫을 때
- 배열 E에 간선을 모두 저장하고, 출발점을 기준으로 개수를 세서 정점에 연결된 간선 수를 별도의 배열에 저장한 뒤 각 index의 값들을 누적하여 E에 몇 번째 index에 해당 간선이 저장되어 있는지 검사하는 방법

## 공간복잡도
- 인접 행렬: O(V^2)
- 인접 리스트: O(E)
- 인접 행렬에 비해 인접 리스트를 사용하면 사용하는 공간이나 소요 시간에서 더 성능이 좋아 리스트를 사용해 구현한다.
	- 인접 행렬은 임의의 정점 사이에 간선이 있는지 없는지 구하는 경우를 제외 하고는 효율이 덜어진다.
	- 하나의 정저과 연결될 모든 간선을 찾는 경우 -> 인접 리스트

## 그래프 탐색
- 임의의 정점에서 시작하여 연결된 모든 정점을 1번씩 방문하는 것

## BFS
- 너비 우선 탐색
- 현재 node에서 탐색 가능한 node를 모두 queue에 넣고 head에 있는 node에 대해 BFS를 반복수행
- Qeue에 push되는 순간 방문한 것으로 check해야함. 그렇지 않으면 node를 중복으로 방문하는 경우가 생기고, BFS가 아니다.
- Queue가 모두 비어있으면 종료
- 인접행렬보다 인접리스트를 사용하는게 더 빠르고 좋다.
        - 인접 행렬: O(V^2) -> V개의 node에 대해 인접행렬을 V번 검사해야 함
        - 인접 리스트: O(V+E) -> V개의 node에 대해 각각 차수만큼만 탐색
- 장점
	- 너비를 우선으로 탐색하기 때문에 답이 되는 경로가 여러 개인 경우에도 최단경로임을 보장합니다.
	- 최단경로가 존재한다면, 어느 한 경로가 무한히 깊어진다 해도 최단경로를 반드시 찾을 수 있습니다.
	- 노드의 수가 적고 깊이가 얕은 해가 존재할 때 유리하다.
- 단점
	- 재귀호출을 사용하는 DFS와 달리 큐를 이용해 다음에 탐색할 노드들을 저장하기 때문에 노드의 수가 많을수록 필요없는 노드들까지 저장해야하기 때문에 큰 저장공간이 필요하다.
	- 노드의 수가 늘어나면 탐색해야하는 노드 또한 많아지기 때문에 비현실적이다.

- 평균 탐색 노드의 수 
	- (b: 가지수, d: 깊이)
	- (B^d-1)/(b-1) +(1+b^d)/2

## DFS
- 깊이 우선 탐색
- 탐색할 여러 개의 정점 중 하나를 선택하여 탐색해 나가고, 더 이상 탐색할 정점이 없으면 이전 정점으로 돌아가서 다른 정점을 탐색하는 방법
- Stack을 사용해서 탐색하는 노드를 push하며 최대한 많이 탐색하고, 더 이상 탐색할 노드가 없으면(간선이 없으면) 이전 노드로 되돌아가면서 pop
- Stack이 비어있으면 탐색 종료
- 함수 재귀 호출 사용 -> 메모리 Stack 영역을 사용하여 같은 동작
- 인접 행렬보다 인접리스트를 사용하는게 더 빠르고 좋다.
	- 인접 행렬: O(V^2) -> V개의 node에 대해 인접행렬을 V번 검사해야 함
	- 인접 리스트: O(V+E) -> V개의 node에 대해 각각 차수만큼만 탐색
- 장점
	- BFS에 비해 저장공간의 필요성이 적다. 백트랙킹을 해야하는 노드들만 저장해주면 된다.
	- 찾아야하는 노드가 깊은 단계에 있을수록, 그 노드가 좌측에 있을수록 BFS보다 유리하다.

- 단점
	- 답이 아닌 경로가 매우 깊을 경우 그 경로에 깊이 빠질 우려가 있다.
	- 지금까지 찾은 최단경로가 끝까지 탐색했을 때의 최단경로가 된다는 보장이 없다.

## 트리(Tree)

## MST(Minimum Spanning Tree)

## 최단경로(Single Source Shortest Path)
