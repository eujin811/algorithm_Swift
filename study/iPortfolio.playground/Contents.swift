import UIKit

/*
 (1) TCP 통신과 UDP 통신의 차이점:
 TCP
 연결형 서비스를 지원하는 프로토콜로 인터넷 환경에서 기본으로 사용, 연결형 서비스로 가상 회선 방식을 제공한다.
 서버소켓은 연결만을 담당한다
 서버와 클라이언트는 1대1로 연결된다.
 
 UDP
 비연결형 서비스로 데이터그램 방식을 제공한다
 정보를 주고 받을 때 정보를 보내거나 받는다는 신호절차를 거치지 않는다.
 서버와 클라이언트는 1대1, 1대N, N대M 등으로 연결될 수 있다.
 
TCP보다 속도가 빠르다
 (2) TCP 통신을 사용하는 곳:
인터넷 환경

 (3) UDP 통신을 사용하는 곳:
 스트리밍
 
 
 ------------
 1.
 데이터베이스 설계시 인덱스를 적용하는 이유와 인덱스 적용에 따른 장점과 단점을 서술하시오.
 
 데이터 성능을 높이기 위해서
 장점: 데이터 검색속도의 향상, 시스템의 부하가 줄어든다.
 단점: 인덱스 생성시간이 크게 늘어난다.
 
 2.
 URL Encoding을 하는 이유와 그 방법을 서술하시오.
 
 URL 스트링에 있는 텍스트를 모든 브라우저에 제대로 전송하기 위해서 존재한다.
 브라우저 특성상 공백,문자 특수문자 여러 국가들의 언어등 아스키코드에 포함되지 않는 문자들을 사용하기 위해서

 swift 에서의 URL Encoding

 func urlEncode() -> String? {
 return self.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]{} ").inverted)
 }

 func urlDecode() -> String? {
 return self.removingPercentEncoding
 }
 
 3.
 
 4.
 폭탄 던지기 게임을 하려고 합니다. 1부터 N의 번호를 가진 사람들이 원형 탁자에 시계방향으로 앉아있습니다. 처음에는 1번 사람이 폭탄을 가지고 있습니다. 1번 사람은 폭탄을 다른 사람에게 던집니다. 폭탄을 받은 사람은 다른 사람에게 다시 폭탄을 던집니다. 폭탄을 던지는 방식은 폭탄을 받은 사람이 폭탄을 받은 횟수가 짝수 번이면 현재 자신을 기준으로 오른쪽으로 K 번째 있는 사람에게 폭탄을 던지고, 홀수 번이면 현재 자신을 기준으로 왼쪽으로 K 번째 있는 사람에게 폭탄을 던집니다. 단, 폭탄을 받은 사람이 폭탄을 M 번 받았으면 폭탄이 터지고 게임이 종료됩니다.
 매개변수로 N, M, K가 주어질 때, 게임이 종료될 때까지 폭탄이 몇 번 던져지는지를 return 하도록 solution 함수를 완성해 주세요.

 제한사항
 N : 2 이상 2000 이하의 자연수
 M : 2000 이하의 자연수
 K : N-1 이하의 자연수
 
 5.
 팰린드롬이란 뒤에서부터 읽어도 원래와 똑같은 문자열을 의미합니다.

 예를 들어, abab는 팰린드롬 문자열이 아닙니다. 하지만 뒤에 a를 추가한다면 ababa가 되어 앞에서부터 읽을 때와 뒤에서부터 읽을 때가 똑같은 팰린드롬 문자열이 되고, 이때 문자열의 길이는 5가 됩니다. 이처럼 문자열이 주어질 때, 문자열의 뒤에 적절히 문자를 추가한다면 팰린드롬인 문자열로 만들 수 있습니다.

 문자열이 주어질 때, 문자열의 뒤에 최소한의 문자를 추가해 팰린드롬 문자열로 만든 후, 만들어진 팰린드롬 문자열의 전체 길이를 return 하도록 solution 함수를 완성해주세요.
 
 
 6. 특정 테이블 칼럼의 평점을 반올림하고 소수점 2번쨰 자리까지 나타냄
 SELECT ROUND(AVG(RATE),2) AS RATE
 FROM VIDEOS

 */

//5


//4
// 1~N까지의 번호
// 짝수로 받으면 오른쪽으로 K번쨰
// 홀수로 받으면 왼쪽으로 K번쨰
// 폭탄 받은 사람이 폭탄 M번 받으면 폭탄 터지고 종료
// 게임 종료시 까지 폭탄이 몇번 던져지는지 return


import Foundation

func solution(_ n:Int, _ m:Int, _ k:Int) -> Int
{
    guard n > 1 else { return 0 }
    guard m <= 2000 else { return 0 }
    guard k <= n-1 else { return 0 }
    
    var takeNumArr = Array(repeating: 0, count: n)
    var ans = 0
    var count = 1
    var pointer = 0
    print("pointer \(pointer), count \(count)")

    let queue = Queue(n: n, k: k, m: m)
    queue.que[0] += 1
    queue.enque(/*count: 1*/)

    ans += 1
        
    while count < m {
        count = queue.enque()
        takeNumArr[pointer] = count
        ans += 1
        print("pointer \(pointer), count \(count)")

    }
    
    return ans
}

class Queue {
    let max:Int
    var front:Int
    var rear:Int
    var num:Int
    var que: [Int]
    
    var moveNum:Int
    var maxNum: Int
    
    init(n: Int, k: Int, m: Int) {
        max = n
        front = 0
        rear = 0
        num = 0
        que = Array(repeating: 0, count: max)
        moveNum = k
        self.maxNum = m
        print("queue",que.count)
    }
    func first(nextNum: Int) {
        print("first : nextNum \(nextNum)")
        rear = nextNum
        que[rear] += 1
        print("first: rear count \(que[rear])")
    }
    
    func enque(/*count: Int*/) -> Int {
//        print("enque")
//        if count % 2 != 0 {
//            print("odd")
            rear = (rear + moveNum) % max
//            if (rear + moveNum) >= max {
//                rear = (rear + )//max - rear
//            } else {
//                rear += moveNum
//
//            }
            
//        } else {
//            print("eve")
////            rear = (rear - moveNum) % max
//
//            if rear - moveNum < 0 {
//                rear = rear * -1
//            } else {
//                rear -= moveNum
//            }
//        }
        
        que[rear] += 1
        
        if que[rear] == maxNum {
                // 끝.
            print("MAXNum 달성")
        }
        print("count \(que[rear]) rear \(rear+1), ")
        return que[rear]
    }

}

//solution(5, 20, 3)
solution(3, 3, 2)

