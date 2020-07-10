import UIKit

import Foundation

/*
 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
 
 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
 
 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
 
 제한 조건
 시험은 최대 10,000 문제로 구성되어있습니다.
 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.
 입출력 예
 answers    return
 [1,2,3,4,5]    [1]
 [1,3,2,4,2]    [1,2,3]
 입출력 예 설명
 입출력 예 #1
 
 수포자 1은 모든 문제를 맞혔습니다.
 수포자 2는 모든 문제를 틀렸습니다.
 수포자 3은 모든 문제를 틀렸습니다.
 따라서 가장 문제를 많이 맞힌 사람은 수포자 1입니다.
 
 입출력 예 #2
 
 모든 사람이 2문제씩을 맞췄습니다.
 */



func solution(_ answers:[Int]) -> [Int] {
    let firstStudent = [1,2,3,4,5]          // i % 5
    let secondStudent = [2,1,2,3,2,4,2,5]   // i % 8
    let thirdStudent = [3,3,1,1,2,2,4,4,5,5]    // i % 10
    
    var cost = [0,0,0]
    var result = [Int]()
    
    /*
     answers.enumerated().forEach { index, value in
     if firstStudent[index % 5] == value {
     cost[0] += 1
     }
     if secondStudent[index % 8] == value {
     cost[1] += 1
     }
     if thirdStudent[index % 10] == value {
     cost[2] += 1
     }
     }
     */
    
    for i in 0..<answers.count {
        
        if firstStudent[i % 5] == answers[i] {
            cost[0] += 1
        }
        if secondStudent[i % 8] == answers[i] {
            cost[1] += 1
        }
        if thirdStudent[i % 10] == answers[i] {
            cost[2] += 1
        }
    }
    
    
    let maxCost = max(cost[0], cost[1], cost[2])
    
    if maxCost == cost[0] {
        result.append(1)
    }
    
    if maxCost == cost[1] {
        result.append(2)
    }
    if maxCost == cost[2] {
        result.append(3)
    }
    
    
    return result
}

print("------1------")
solution([1,2,3,4,5])

print("------2------")
solution([1, 3, 2, 4, 2])


//  다른사람
func solution2(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1,2,3,4,5],
        b: [2,1,2,3,2,4,2,5],
        c: [3,3,1,1,2,2,4,4,5,5]
    )
    var cost = [1:0, 2:0, 3:0]
    //    print(answers.enumerated())
    for (index, value) in answers.enumerated() {
        if value == answer.a[index % 5] { cost[1] = cost[1]! + 1 }
        if value == answer.b[index % 8] { cost[2] = cost[2]! + 1 }
        if value == answer.c[index % 10] { cost[3] = cost[3]! + 1}
    }
    
//    print(cost)
//    print(cost.sorted{ $0.key < $1.key }.filter { $0.value == cost.values.max()})

    return cost.sorted{ $0.key < $1.key }.filter { $0.value == cost.values.max()}.map{ $0.key }
}

print("------1------")
solution2([1,2,3,4,5])

print("------2------")
solution2([1, 3, 2, 4, 2])
