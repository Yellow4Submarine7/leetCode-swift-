import UIKit

let a = [[1,2,3],[1,2,3],[1,2,3]]
let b = a.map { array -> [Int] in
    var mapArray = array
    mapArray.removeLast()
    return mapArray
}

for i in 0...0 {
    print(i)
}


class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count - 1
        let m = grid[0].count - 1
        if m == 0, n == 0 {
            return grid[0][0]
        }else {
            let smallGird = grid.map { row -> [Int] in
                var mapRow = row
                mapRow.removeLast()
                return mapRow
            }
            if m == 0 {
                return grid[n][m] + minPathSum(Array(grid[0..<n]))
            }else if n == 0 {
                return grid[n][m] + minPathSum(smallGird)
            }
            let a = grid[n][m] + minPathSum(Array(grid[0..<n]))
            let b = grid[n][m] + minPathSum(smallGird)
            return min(a,b)
        }
    }
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        let n = grid.count - 1
//        let m = grid[0].count - 1
//        var solutions = grid
//        for i in 0...n {
//            for j in 0...m {
//                if i == 0, j == 0 {
//                    continue;
//                }else if i == 0 {
//                    solutions[i][j] += solutions[i][j - 1]
//                }else if j == 0 {
//                    solutions[i][j] += solutions[i - 1][j]
//                }else {
//                    solutions[i][j] += min(solutions[i][j - 1], solutions[i - 1][j])
//                }
//            }
//
//        }
//        return solutions[n][m]
//    }
}


let test = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
let solution = Solution()
solution.minPathSum(test)


