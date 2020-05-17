import UIKit
import Foundation
/*
 최대공약수(GCD)
 
 
 */

//1. O(n)

func gcd1(num1 a: Int, num2 b: Int) -> Int{
    var g = 1
    for i in 2...min(a, b) {
        if a % i == 0 && b % i == 0 {
            g = i
        }
    }
    
    return g
}

gcd1(num1: 11, num2: 22)

//2. 유클리드 호제법 재귀적 표현
func GCDHJ1(num1 a: Int, num2 b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return GCDHJ1(num1: b, num2: a % b)
    }
}


GCDHJ1(num1: 21, num2: 24)
GCDHJ1(num1: 24, num2: 21)
GCDHJ1(num1: 1071, num2: 1029)


//3. 유클리드 호제법 반복문 활용
func GCD(num1 a: Int, num2 b: Int) -> Int {
    var a = a, b = b
    
    while b != 0 {
        var r = a % b
        a = b
        b = r
    }
    return a
}

GCD(num1: 1071, num2: 1029)
