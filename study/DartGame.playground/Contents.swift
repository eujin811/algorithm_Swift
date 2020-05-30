import UIKit
/*

 점수: 1~10점
(S) Singles -> 1제곱,
(D) Double -> 2제곱,
(T) Triple -> 3제곱
    점수마다 존재
    
(*) 스타상 -> 해당 점수 및 직전 점수 2배,
         처음부터 나올수 있음(처음에는 첫번째 점수만 2배),
         중첩가능(4배)
         아차상과 중첩 가능 (-2배)
(#) 아차상 -> 해당 점수 마이너스
         스타상과 중첩 가능 (-2배)
        
    둘중 하나만 존재
 
 정수, 문자, 옵션 으로 이루어진 문자열 3세트 -> Int
 점수 0~10
 보너스 S, D, T 중 하나
 옵션 *, # 중 하나, 혹은 없을 수 있음
 */

func bonus(check: Character, num: Int) -> Int {
    switch check {
    case "S":
        return num
    case "D":
        return num * num
    case "T":
        return num * num * num
    default:
        return num
    }
}

func options(checkOption: Character, lastOption: Character?, num: Int, lastNum: Int?) -> (Int, Int?) {
    
    var result: Int
    var lastResult: Int?
    
    if checkOption == "*" {     // 스타상
        result = num * 2
        
        guard lastNum != nil else { return (result, nil) }
        lastResult = lastNum! * 2
    } else {                    // 아차상
        result = num * -1
    }
    
    return (result, lastResult)
}

func solution(_ dartResult: String ) -> Int {
    var scoreArr = [Int]()
    var dartStr = [Character]()
    var lastOption: Character?
    
    for charcter in dartResult {
        dartStr.append(charcter)
    }
     
    for i in 0..<dartStr.count {
        guard var num = Int(String(dartStr[i])) else { continue }
        var optionCount = i+2
        var bonusCount = i+1
        
        // 숫자가 두자리일때
        if let secondeNum = Int(String(dartStr[i+1])) {
            let number = Int(String(dartStr[i]) + String(dartStr[i+1]))
            num = number!
            optionCount += 1
            bonusCount += 1
            
        }
        
        let score = bonus(check: dartStr[bonusCount], num: num)

        // Option있을때
        if dartStr.count > optionCount && (dartStr[optionCount] == "*" || dartStr[optionCount] == "#" ) {
            let secondScore = options(checkOption: dartStr[optionCount], lastOption: lastOption, num: score, lastNum: scoreArr.last)
            let lastScore = secondScore.1
            

            if lastScore != nil {       // 지난 스코어 있을 때
                scoreArr.removeLast()
                scoreArr.append(lastScore!)
            }
            
            scoreArr.append(secondScore.0)

        } else {    // Option없을 때
            lastOption = nil
            scoreArr.append(score)
        }

    }
    return scoreArr.reduce(0) {
        $0 + $1
    }
}

//ok
solution("1S2D*3T")     // 37
solution("1D2S0T")      // 3
solution("1T2D3D#")     // -4
solution("1S*2T*3S")    // 23
solution("1D2S3T*")     // 59
solution("1D#2S*3S")    // 5

//Not
solution("1D2S#10S")    // 9 <---



