import UIKit
/*
소수: 1과 자신밖에 없는 수, 2이상 N-1이하의 자연수로 나누어 떨어지면 안됨
*/

// 소수인지? 모두 나누기
// 시간복잡도 O(n)
func primeNumber(number: Int) -> Bool {
    guard number > 1 else { return false }
    guard number != 2 else { return true }
    
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

primeNumber(number: 1)
primeNumber(number: 2)
primeNumber(number: 3)
primeNumber(number: 11)
primeNumber(number: 21)

// N/2까지 나누기
// 시간복잡도 O(n)
func primeNumber2(number: Int) -> Bool {
    guard number > 1 else { return false }
    guard number > 3 else { return true }
    
    for i in 2...(number/2) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

primeNumber2(number: 1)
primeNumber2(number: 2)
primeNumber2(number: 3)
primeNumber2(number: 11)
primeNumber2(number: 21)


// 소수찾기
// O(n√n)
