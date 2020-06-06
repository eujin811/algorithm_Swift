import UIKit

/*
 격자선을 따라 움직이는 기계가 있습니다. 격자는 1 x 1 크기인 칸들로 이루어져 있습니다. 기계는 처음에 격자선의 교차점 위에 놓여있으며 상, 하, 좌, 우로 거리 1 만큼씩 움직일 수 있습니다.

 이때, 기계가 움직인 기록이 주어지면 기계가 전부 움직인 후 기계의 동선에서 1x1 크기 정사각형이 몇 개가 보이는지 알아보려 합니다.

 예를 들어 [상, 우, 하, 좌]로 기계를 움직였다면 기계의 동선은 아래 그림과 같으며, 기계의 동선에서 1x1 크기 정사각형 1개가 보입니다.
 기계가 움직인 기록을 담은 배열 moves가 주어질때, 기계가 전부 움직인 후 기계의 동선에서 보이는 1x1 크기 정사각형 개수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 moves의 길이는 1 이상 500 이하입니다.
 moves의 원소는 상, 하, 좌, 우를 나타내는 길이가 1인 문자열입니다.
 상, 하, 좌, 우는 각각 U, D, L, R로 나타냅니다.
 격자 평면은 무한히 크다고 가정합니다.

 */


import Foundation

func nextCheck(element1: String, element2: String, element3: String, element4: String) -> (Bool, [String] ) {
    let result = element1 + element2 + element3 + element4
    var resultArr = [element1, element2, element3, element4]
    
    switch result {
    case "URDL":
        return (true, resultArr)
    case "ULDR":
        return (true, resultArr)
    case "DRUL":
        return (true, resultArr)
    case "DLUR":
        return (true, resultArr)
    case "LURD":
        return (true, resultArr)
    case "RULD":
        return (true, resultArr)
    case "LDRU":
        return (true, resultArr)
    case "RDLU":
        return (true, resultArr)
    default:
        resultArr.removeAll()
        return (false, resultArr)
    }
}

func checkFunc(_ moves: [String]) -> ([Int], [String]) {
    var flag: Bool
    var resultArr = [String]()
    
    for i in 0...moves.count - 4 {
        
        (flag, resultArr) = nextCheck(element1: moves[i], element2: moves[i+1], element3: moves[i+2], element4: moves[i+3])
        
        //
        if flag {
            print("flag true,  \([i, i+1, i+2, i+3]), \(resultArr)")
            return ([i, i+1, i+2, i+3], resultArr)
            break
        }
        
    }
    
    return ([Int](), [String]())
}

func solution(_ moves:[String]) -> Int {
    var movesArr = moves
    var result = 0
    var movesIndexs = [Int]()
    var movesSelect = [String]()
    var movesBeforeSelect = [String]()

    
    while movesArr.count >= 4 {
        print("movesArr \(movesArr), result \(result)")
        movesBeforeSelect = movesSelect
        (movesIndexs, movesSelect) = checkFunc(movesArr)
        
        if movesIndexs.count == 4 && movesBeforeSelect != movesSelect {
            result += 1
            print("movewIndex \(movesIndexs)")
            movesArr.remove(at: movesIndexs[3])
            movesArr.remove(at: movesIndexs[2])
            movesArr.remove(at: movesIndexs[1])
            movesArr.remove(at: movesIndexs[0])

        } else if movesBeforeSelect == movesSelect && movesArr.count >= 4 {
            break
        }
        print("movesIndex = \(movesIndexs), movesArr = \(movesArr) while 순환 \n\n")
        
    }
    
    return result
}

print("\n 1")
solution(["U", "R", "D", "L", "U", "R", "D", "L"])


print("\n 2")
solution(["U", "U", "R", "D", "L", "L", "L", "U", "R", "D", "D", "D", "L", "U", "R", "R", "R", "D", "L", "U"])

print("\n 3")
solution(["U", "L", "D", "R", "R", "D", "D", "L", "U", "U"])
