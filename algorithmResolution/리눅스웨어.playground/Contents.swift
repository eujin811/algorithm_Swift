import UIKit
import Foundation

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
//func solution(_ n:Int) -> Int {
//    var answer = 3
//
//
//    func digit(_ num: Int) {
//        var numArray = [Int]()
//        for character in String(num) {
//            numArray.append(Int(String(character))!)
//        }
//        answer = numArray.reduce(0) { $0 + $1 }
//        //print("answer \(answer)")
//        if answer >= 10 { digit(answer) }
//    }
//
//    digit(n)
//
//    return answer
//}
//
//solution(10)
//
//solution(456789)
//
//solution(12345)
//
//// 홍삼 (40/40)
//func solution2(_ n: Int) -> Int {
//    var answer = 3
//
//    func digit(_ n: Int) -> Int {
//        var num = n
//        var result = 0
//        while(num != 0){
//            //print(num % 10)
//            result += num % 10
//            num = num/10;
//        }
//        //print("num \(num)")
//        //print("result \(result)")
//        if result >= 10 {
//            result = digit(result)
//        }
//        return result
//    }
//
//    answer = digit(n)
//
//
//    return answer
//}
//solution2(10)
//
//solution2(456789)
//
//solution2(12345)



//-----------------------------------------------------------------------------

// 2 -> 40점 (40/40)
/*
 문제 설명
 0부터 9까지의 정수를 영어로 읽으면 “zero, one, two, three, four, five, six, seven, eight, nine”이 됩니다. 이 단어들만 사용하여 숫자의 각 자릿수를 읽으려고 합니다. 예를 들어 147의 각 자릿수를 순서대로 읽으면 one, four, seven이 되며 붙여서 “onefourseven”이 됩니다. 읽으려고 하는 숫자 num이 매개변수로 주어질 때, 이 숫자의 각 자릿수를 위의 단어들만 사용하여 읽은 결과를 문자열 형태로 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 숫자 num의 범위 : 0 ≤ num ≤ 100,000,000, num은 정수
 return 하는 문자열은 전부 소문자이어야 합니다.
 
 입출력 예
 num    result
 147    onefourseven
 5    five
 1112    oneoneonetwo
 입출력 예 설명
 입출력 예 #1
 147은 one, four, seven으로 읽으며, 붙여서 onefourseven이 됩니다.
 
 입출력 예 #2
 5는 five로 읽으며 붙여서 five가 됩니다.
 
 입출력 예 #3
 1112는 one, one, one, two로 읽으며 붙여서 oneoneonetwo가 됩니다.
 
 
 */

//func solution(_ num:Int) -> String{
//    guard num >= 0 else { return "zero" }
//    guard num <= 100000000 else { return "overflow" }
//
//    var answer = ""
//
//    for character in String(num) {
//
//        switch character {
//        case "0":
//            answer += "zero"
//        case "1":
//            answer += "one"
//        case "2":
//            answer += "two"
//        case "3":
//            answer += "three"
//        case "4":
//            answer += "four"
//        case "5":
//            answer += "five"
//        case "6":
//            answer += "six"
//        case "7":
//            answer += "seven"
//        case "8":
//            answer += "eight"
//        case "9":
//            answer += "nine"
//        default:
//            break
//        }
//    }
//
//    print("solution answer \(answer)")
//    return answer
//}
//
//solution(147)
//
//solution(5)
//
//solution(1112)

//-----------------------------------------------------------------------------

// 3
/*
 문제 설명
 1부터 자연수를 이어쓰면 1234567891011121314..가 됩니다. 이렇게 이어쓴 숫자를 A라 할 때, n번째에 위치하는 숫자를 반환하는 함수 solution을 완성해주세요.
 
 제한사항
 숫자의 위치 n : 1 ≤ n ≤ 1,000,000,000, n은 자연수
 
 입출력 예 설명
 입출력 예 #1
 1234567....에서 다섯 번째에는 5가 위치합니다.
 
 입출력 예 #2
 12345678910111213...에서 15번째에는 2가 위치합니다.
 
 
 */



//유진 (14.6 / 50)
func solution(_ n:Int) -> Int {
    
    let (digitNum, afterdigitLenth) = digit(num: n)
    
    //print("solution digitNum \(digitNum), afterLenth \(afterdigitLenth)")
    
    var presentNum = 1
    var length = n - afterdigitLenth
    
    if digitNum == 1 {
        return n
    } else if digitNum == 2 {
        return searchNum(startNum: 10, digitNum: digitNum, overLength: length)
    }
    
    //시작 숫자 찾기
    for i in 2...digitNum {
        presentNum *= 10
    }
    //print("presentNum \(presentNum), length \(length)")
    
    
    return searchNum(startNum: presentNum, digitNum: digitNum, overLength: length)
}

// while 자릿수 > 자릿수길이 { 숫자 +1, 자릿수길이 - 숫자길이 }
// n번째 앞의 자릿수 만큼 빼고 n번째 자리의 숫자 처음부터 하나씩 추가해가면서 찾아가는 방식
func searchNum(startNum: Int, digitNum: Int, overLength: Int) -> Int {
    var length = overLength
    var presentNum = startNum
    var result = 0
    var arr = [Character]()
    while digitNum < length {      // 숫자 하나씩 추가해 가는 방식
        length -= digitNum
        presentNum += 1
        //print("length \(length), presentNum \(presentNum)  n \(digitNum)")
    }
    
    
    String(presentNum).map { arr.append($0) }
    result = Int(String(arr[length - 1]))!
    //print(arr,"--------> arr[\(length-1)] = \(arr[length-1])")
    return result
}


// 입력된 숫자의 자릿수와 직전 자리수의 길이
func digit(num: Int) -> (Int, Int) {
    var digitNum = 0
    var maxLength = 0
    var afterLength = 9
    //pattern -> a<n> = 90 * (9^n-1) * n + a<n-1>
    if num <= 9 {       // 1자리수 일때 최대길이,
        digitNum += 1
        return (digitNum, 0)
    } else if num <= 189 {  // 2자리수 일때 최대길이
        digitNum += 2
        return (digitNum, afterLength)
    }
    
    digitNum = 2
    maxLength = 189
    
    
    while num > maxLength {        // 자리수 최고값 보다 작아지면 멈춘다.
        digitNum += 1
        
        var squar = 1
        for i in 1..<digitNum-1 {
            squar *= 9
        }
        afterLength = maxLength
        maxLength += 90 * squar * digitNum
        //print("maxLength", maxLength)
    }
    
    //print("digitNum \(digitNum)")
    return (digitNum, afterLength)
}

//digit(num: 6000)

solution(5)

solution(15)

print("---------------------------")
solution(200)

//
//solution(2620)

//solution(1000000000)

//홍삼1 -> (34.8/50.0 ) 시간복잡도 높아서 효율성 떨어짐 n^2
//func solution(_ n:Int) -> Int
//{
//    var cnt = 9
//    if n < 10 {
//        return n
//    } else {
//        for i in (10...n) {
//            for j in String(i) {
//                cnt += 1
//                if cnt == n {
//                    return Int(String(j))!
//                }
//            }
//        }
//    }
//    return 1
//}

//-----------------------------------------------------------------------------

// 4 (70.0)
/*
 문제 설명
 다음과 같이 2개의 행렬 A, B를 순서대로 곱하려고 합니다.

 A x B
 2개의 행렬을 곱할때는 위와 같이 한 가지 방법으로 연산이 가능합니다.

 3개의 행렬을 곱하려고 할 때, 연산의 순서는 다음과 같이 두 가지 방법이 있을 수 있습니다.

 (A x B) x C   : A 와 B를 먼저 곱한 후 C를 곱한다.
 A x (B x C)   : B 와 C를 먼저 곱한 후 A를 곱한다.

 n개의 행렬을 순서대로 곱하려고 할 때, 가능한 연산 방법의 수를 반환하는 solution 함수를 완성하세요.

 단, 결과값이 매우 커질 수 있으므로 n개의 행렬을 순서대로 곱할 때 가능한 연산 방법의 수를 10,007로 나눈 나머지를 반환하세요.

 제한사항
 n은 1,000 이하의 자연수입니다.
 입출력 예
 n    result
 3    2
 4    5
 입출력 예 설명
 입출력 예 #1
 ((A x B) x C), (A x (B x C)) 의 두가지 입니다.

 입출력 예 #2
 (((A x B) x C) x D), ((A x B) x (C x D)), ((A x (B x C)) x D), (A x ((B x C) x D)), (A x (B x (C x D))) 의 5가지 입니다.
 */



/*
 func factorial(_ n: Int) -> Int {
     var result = 1
     for i in 0 ..< n {
         result = result * (i+1)
     }
     return result
 }
 func solution(_ n:Int) -> Int {
     return ((factorial(n) / factorial(n - 2)) / factorial(2) - 1) % 10007
 }
 */
