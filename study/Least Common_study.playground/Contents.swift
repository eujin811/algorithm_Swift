import UIKit

/*
 최소 공배수
 두 정수의 공통된 배수 중에서 가장 작은 정수
 
 A * B = 최소 공약수 * 최소 공배수
 최소공배수를 l,최소공약수를 g라 할 때 l = (a*b) / g
 
 */



func GCD(_ n: Int, _ m: Int) -> Int {
    if m == 0 { return n }
    else { return GCD(m, n%m) }
}
func LCD(_ a: Int,_ b: Int) -> Int {
    let gcd = GCD(a, b)
    return (a * b) / gcd
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcd: Int
    let lcd: Int
    
    gcd = GCD(n, m)
    lcd = LCD(n, m)
    
    return [gcd, lcd]
}

solution(1, 4500)
solution(6, 10)
solution(13, 17)
