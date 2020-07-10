import UIKit
import Foundation
/*
 ***문제***
 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.

 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.
 
 ***제한사항***
 
 전체 학생의 수는 2명 이상 30명 이하입니다.
 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
 
 ***입출력 예***
 n    lost    reserve    return
 5    [2, 4]    [1, 3, 5]    5
 5    [2, 4]    [3]    4
 3    [3]    [1]    2
 
 
 */

/*
 
 
 n : 전체 학생 수 (2~30)
 lost : 도난당한 학생 번호 담긴 배열 (1~n)
 resere : 여벌 체육복 가져온 학생 번호 담긴 배열 (1~n)      // 도난당하면 못빌려줌 1벌만 도난당함.
 체격별로 번호순, 여벌옷 있는 사람 앞뒤 번호만 빌려줄 수 있음
 체육복 입은 학생만 참여할 수 있는데 몇명 참여 가능??
*/

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    //
    guard n >= 2 || n <= 30 else { return 0 }
    guard lost.count > 1 || lost.count <= n else { return 0 }
    guard reserve.count > 1 || reserve.count <= n else { return 0 }
    
    var clothesNum = Array(repeating: 1, count: n)      // 인당 갖고 있는 옷
    
    for value in lost {                 // 잃어버린 사람 옷 개수 -1
        clothesNum[value-1] -= 1
    }
    for value in reserve {              // 여벌옷 있는 사람 옷 개수 +1
        clothesNum[value-1] += 1
    }
    
//    print(clothesNum)
   
    
    for i in 0..<clothesNum.count {                     // 옷 못갖고 있는 사람만 확인한다.
        guard clothesNum[i] == 0 else { continue }
        
        if i == 0 {                                     // 첫번째 학생의 경우 뒷사람 2개면 하나 빌리고 count up
            if clothesNum[i+1] > 1 {
                clothesNum[i+1] -= 1
                clothesNum[i] += 1
            }
        } else if i != 0 && i < clothesNum.count-1 {        // 2~n-1 학생의 경우 뒷사람 앞사람 뒤지고 있으면 하나 빌리고 count up
            if clothesNum[i+1] > 1 {                    //앞사람 뒤짐
                clothesNum[i+1] -= 1
                clothesNum[i] += 1
            } else if clothesNum[i-1] > 1 {             //뒷사람 뒤짐
                clothesNum[i-1] -= 1
                clothesNum[i] += 1
            }
        } else if i == clothesNum.count-1 {                 // n번째 학생 앞사람 뒤지고 있으면 하나 빌린다. count up
            
            if clothesNum[i-1] > 1 {
                clothesNum[i-1] -= 1
                clothesNum[i] += 1
            }
        }
    }
    //    print(clothesNum)

    return clothesNum.filter { $0 > 0 }.count
}

//solution(3, [1], [2,3])
solution(5, [2,4], [1,3,5])

solution(5, [2,4], [3])

solution(3, [3], [1])

//solution(5, [2,5], [1,3])
