import UIKit

// 인접 행렬(Adjacent Matrix)
// 2차원 배열
// 행렬의 크기 V^2

let edges = [[1, 2], [1, 3], [2, 3], [2, 4], [2, 5], [3, 5], [4, 5]]

var adjacentMatrix = [[Int]](repeating: [Int](repeating: 0, count: edges.count), count: edges.count)

for edge in edges {
    let n1 = edge[0], n2 = edge[1]
    adjacentMatrix[n1][n2] = 1
    adjacentMatrix[n2][n1] = 1
}





