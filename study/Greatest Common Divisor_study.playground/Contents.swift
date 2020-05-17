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
