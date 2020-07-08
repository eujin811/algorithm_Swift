import UIKit

/*
 다이나믹 프로그래밍
 - 동적 계획법
 - 문제의 크기를 기준으로 큰 문제를 작은 크기의 문제 여러개로 나누고 각각의 문제를 풀어서 합침
 */

//피보나치 수열

// O(2^n)
//func fibonacci(_ n: Int) -> Int{
//    guard n > 1 else { return n }
//
//    return fibonacci(n - 1) + fibonacci(n - 2)
//}
//
//fibonacci(10)
//fibonacci(100)

// O(n)
var memo = [Int: Int]()
func fibonacci2(_ n: Int) -> Int {
    guard n > 1 else { return n }
    if let value = memo[n], memo[n]! > 0 {
        return value
    } else {
        memo[n] = fibonacci2(n-1) + fibonacci2(n - 2)
        return memo[n] ?? 0
    }
}

fibonacci2(10)
fibonacci2(30)
