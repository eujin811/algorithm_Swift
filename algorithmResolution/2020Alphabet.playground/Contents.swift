import UIKit

/*
 문제 설명
 정연이는 상.하.좌.우를 의미하는 버튼 4개^ , v , < , >와 알파벳 버튼 6개A, B, C, X, Y, Z를 사용하는 게임을 개발하고 있습니다. 이 게임은 앞서 언급한 10개의 버튼으로 커맨드를 입력하여 다양한 스킬을 사용할 수 있습니다. 그리고 각각의 스킬을 사용하기 위해 눌러야 하는 버튼의 순서와 스킬을 사용하면 획득할 수 있는 점수가 정해져 있습니다. 커맨드에 포함된 버튼 중, 스킬 사용에 쓰이지 않은 버튼은 1점을 획득하게 되고, 하나의 버튼은 최대 한 개의 스킬을 사용할 때만 쓰일 수 있습니다.
 아래는 5개의 스킬이 존재하고, 플레이어가 <v>AB^CYv^XAZ 라는 커맨드를 순서대로 입력했을 때, 스킬을 사용하는 다양한 방법에 대한 예시입니다.

 스킬 번호    버튼 순서    점수
 1    v>AB^CYv^XA    50
 2    <v>A    18
 3    ^XAZ    20
 4    Yv^XA    30
 5    >AB^    25
 플레이어 커맨드    <v>AB^CYv^XAZ
 사용된 스킬 번호    스킬에 쓰인 버튼    획득 점수
 1      v>AB^CYv^XA    50 + 2 = 52
 5, 4        >AB^ Yv^XA    25 + 30 + 4 = 59
 2, 3    <v>A     ^XAZ    18 + 20 + 5 = 43
 2, 4    <v>A  Yv^XA    18 + 30 + 4 = 52
 없음    없음    13
 플레이어의 커맨드로 5번 스킬>AB^, 4번 스킬Yv^XA을 사용해서 55점을 얻고, 스킬 사용에 쓰이지 않은 버튼 4개< v C Z로 4점을 획득하여 총 59점을 얻는 것이 최대한 높은 점수를 얻는 방법입니다. 만약 아무런 스킬을 사용하지 않는다면, 플레이어의 커맨드가 총 13개므로, 13점을 얻게 됩니다.

 플레이어의 커맨드 command, 스킬을 사용할 때 눌러야 하는 버튼 순서 buttons, 스킬을 사용했을 때 얻을 수 있는 점수 scores가 매개변수로 주어질 때, 플레이어가 획득할 수 있는 최대 점수를 계산해서 return 하도록 solution함수를 완성해주세요.

 제한사항
 command는 길이 1이상 1,000 이하인 문자열입니다.
 buttons의 길이는 1이상 100 이하입니다.
 buttons의 원소는 스킬을 사용하는데 필요한 버튼 순서입니다. 1번 스킬에 대한 버튼 순서부터 차례대로 주어집니다.
 buttons의 원소는 길이 1이상 100 이하인 문자열입니다.
 buttons의 원소와 command는 대문자 알파벳 A, B, C, X, Y, Z와 특수문자 <, >, ^, 그리고 소문자 알파벳 v로만 이루어져 있습니다.
 buttons를 구성하는 원소에는 중복된 값이 없습니다. 즉, 스킬이 다르면 눌러야 하는 버튼 순서도 다릅니다.
 scores의 길이는 buttons의 길이와 같습니다.
 scores의 원소는 스킬을 사용했을 때 얻을 수 있는 점수입니다. 1번 스킬에 대한 점수부터 순서대로 주어집니다.
 scores의 원소는 1이상 10,000 이하인 자연수입니다.
 
 입출력 예
 command    buttons    scores    result
 "<v>AB^CYv^XAZ"    ["v>AB^CYv^XA","<v>A","^XAZ","Yv^XA",">AB^"]    [50, 18, 20, 30, 25]    59
 "ABCXYZ"    ["BCXY"]    [2]    6
 "ABCXYZ"    ["CXYZ","AB"]    [2,3]    7
 */


import Foundation

func skill(command: String, skill: String, score: Int) -> Int {
    
    var commandArr = [Character]()
    var skillArr = [Character]()
    var skillCount = skill.count
    
    for char in command {
        commandArr.append(char)
        
    }
    for char in skill {
        skillArr.append(char)
    }
    
    for i in 0...commandArr.count - skillCount {
        //만약에
        if commandArr[i] == skillArr[0] {
            var test = commandArr[i...skillCount]
            if test == skillArr {
                return score
            }
            print(commandArr[i...skillCount])
        }
    }
    
    
}

skill(command: "<v>AB^CYv^XAZ", skill: "v>AB^CYv^XA")


func solution(_ command:String, _ buttons:[String], _ scores:[Int]) -> Int {
    
    var commandArr = [Character]()
    
    
    for char in command {
        commandArr.append(char)
        
    }
    
    
    
    return 0
}


solution("<v>AB^CYv^XAZ", ["v>AB^CYv^XA","<v>A","^XAZ","Yv^XA",">AB^"], [50, 18, 20, 30, 25])   // 59

solution("ABCXYZ", ["BCXY"], [2])       //6
solution("ABCXYZ", ["CXYZ","AB"], [2,3])
