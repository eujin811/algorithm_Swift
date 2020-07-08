# Programmers 문제 풀이

## Contents
- [2019 Summer/Winter Coding](https://github.com/eujin811/algorithm_Swift/tree/master/programmersTest#2019)
	- [멀쩡한 사각형](https://github.com/eujin811/algorithm_Swift/tree/master/programmersTest#%EB%A9%80%EC%A9%A1%ED%95%9C-%EC%82%AC%EA%B0%81%ED%98%95)
	- [종이접기](https://github.com/eujin811/algorithm_Swift/tree/master/programmersTest#%EC%A2%85%EC%9D%B4%EC%A0%91%EA%B8%B0)
	- [지형이동](https://github.com/eujin811/algorithm_Swift/tree/master/programmersTest#%EC%A7%80%ED%98%95-%EC%9D%B4%EB%8F%99)

- [~2018 Summer/Winter Coding](https://github.com/eujin811/algorithm_Swift/tree/master/programmersTest#2018)

- [그외]()

# 2019

## 멀쩡한 사각형
- 문제
	- 가로 길이가 Wcm, 세로 길이가 Hcm인 직사각형 종이가 있습니다. 종이에는 가로, 세로 방향과 평행하게 격자 형태로 선이 그어져 있으며, 모든 격자칸은 1cm x 1cm 크기입니다. 이 종이를 격자 선을 따라 1cm × 1cm의 정사각형으로 잘라 사용할 예정이었는데, 누군가가 이 종이를 대각선 꼭지점 2개를 잇는 방향으로 잘라 놓았습니다. 그러므로 현재 직사각형 종이는 크기가 같은 직각삼각형 2개로 나누어진 상태입니다. 새로운 종이를 구할 수 없는 상태이기 때문에, 이 종이에서 원래 종이의 가로, 세로 방향과 평행하게 1cm × 1cm로 잘라 사용할 수 있는 만큼만 사용하기로 하였습니다.  가로의 길이 W와 세로의 길이 H가 주어질 때, 사용할 수 있는 정사각형의 개수를 구하는 solution 함수를 완성해 주세요.
- 제한사항
	- W, H: 1억 이하의 자연수
- 입출력 예

| W | H | result
|:---------:|:----------:|:--------:|
| 8 | 12  | 80 | 

- 입출력 예 설명
	-  가로가 8, 세로가 12인 직사각형을 대각선 방향으로 자르면 총 16개 정사각형을 사용할 수 없게 됩니다. 원래 직사각형에서는 96개의 정사각형을 만들 수 있었으므로, 96 - 16 = 80 을 반환합니다.

   ```swift
	func solution(_ w:Int, _ h:Int) -> Int64 {
    	   guard w != h else { return Int64( w * h - w) }
    	   guard w != 1, h != 1 else { return 0 }
     
    	   var answer: Int64 = 0
    
    	   let g = gcd(w,h)
    	   let numberOfBreaks = g > 1 ? w + h - g : w + h - 1
    
    	   answer = Int64( w * h - numberOfBreaks )
    
    	   return answer
	}

	func gcd(_ a: Int, _ b: Int) -> Int {
    	   guard b > 0 else { return a }
    		
    	   return gcd(b, a % b)
	}	
	
   ```

## 종이접기

## 지형 이동



## ~2018

## 그외

