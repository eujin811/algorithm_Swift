import UIKit

// 1 -> 40점 (40/40)
/*
 자연수 n의 각 자리 숫자를 더하면 새로운 자연수 n' 을 만들 수 있습니다. 또 새로운 자연수 n'의 각 자릿수를 더하여 새로운 자연수 n''을 만들 수 있습니다. 이 과정을 계속 반복하면 최종적으로 한 자리 숫자를 만들 수 있습니다. 예를 들어
 
 456789의 각 자리 숫자를 더하면 4 + 5 + 6 + 7 + 8 + 9 = 39
 39는 3 + 9 = 12
 12는 1 + 2 = 3
 과 같이 반복하여 한 자리 숫자 3을 얻을 수 있습니다.
 
 자연수 n이 주어졌을 때 각 자릿수를 더하는 과정을 반복하여 한 자리 숫자를 만들어 반환하는 함수를 완성해 주세요.
 
 제한사항
 n은 10이상 231 - 1 이하입니다.
 
 입출력 예
 n    result
 10    1
 456789    3
 입출력 예 설명
 입출력 예 #1
 1 + 0 = 1 이므로 1을 반환합니다.
 
 입출력 예 #2
 4 + 5 + 6 + 7 + 8 + 9 = 39
 3 + 9 = 12
 1 + 2 = 3 이므로 3을 반환합니다.
 */
// 나 (40/40)
func solution(_ n:Int) -> Int {
    var answer = 3


    func digit(_ num: Int) {
        var numArray = [Int]()
        for character in String(num) {
            numArray.append(Int(String(character))!)
        }
        answer = numArray.reduce(0) { $0 + $1 }
        //print("answer \(answer)")
        if answer >= 10 { digit(answer) }
    }

    digit(n)

    return answer
}

solution(10)

solution(456789)

solution(12345)
//
//// 홍삼 (40/40)
func solution2(_ n: Int) -> Int {
    var answer = 3

    func digit(_ n: Int) -> Int {
        var num = n
        var result = 0
        while(num != 0){
            //print(num % 10)
            result += num % 10
            num = num/10;
        }
        //print("num \(num)")
        //print("result \(result)")
        if result >= 10 {
            result = digit(result)
        }
        return result
    }

    answer = digit(n)


    return answer
}
solution2(10)

solution2(456789)

solution2(12345)

