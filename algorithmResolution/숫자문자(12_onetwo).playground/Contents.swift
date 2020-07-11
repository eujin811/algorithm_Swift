import UIKit
import Foundation
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

func solution(_ num:Int) -> String{
    guard num >= 0 else { return "zero" }
    guard num <= 100000000 else { return "overflow" }

    var answer = ""

    for character in String(num) {

        switch character {
        case "0":
            answer += "zero"
        case "1":
            answer += "one"
        case "2":
            answer += "two"
        case "3":
            answer += "three"
        case "4":
            answer += "four"
        case "5":
            answer += "five"
        case "6":
            answer += "six"
        case "7":
            answer += "seven"
        case "8":
            answer += "eight"
        case "9":
            answer += "nine"
        default:
            break
        }
    }

    print("solution answer \(answer)")
    return answer
}

solution(147)

solution(5)

solution(1112)
