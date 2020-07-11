import UIKit

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
func solution2(_ n:Int) -> Int
{
    var cnt = 9
    if n < 10 {
        return n
    } else {
        for i in (10...n) {
            for j in String(i) {
                cnt += 1
                if cnt == n {
                    return Int(String(j))!
                }
            }
        }
    }
    return 1
}
