//: [Previous](@previous)

/*:
 ## 120. 三角形最小路径和
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。

 例如，给定三角形：
 ```
 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 ```
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 说明：

 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 */

/*:
## 120. 思路
 
 动态规划：空间复杂度为O(n),时间复杂度为O(n^2)
 
 自顶向下
 
 1. 使用一个solution数组空间为n（三角形行数-也是单行最大元素个数），solution[n]保存前n - 1行的第n个结点的最短路径和
 2. 遍历前一行可以到达当前行的结点j的solution[j]与solution[j - 1]（注意j与j-1是否存在的边界条件），找到它们中比较小的与当前行的结点j的求和存入solution[j]
 3. 最后的solution就是走到最后一行的所有情况最小的路径和，取其中最小的即是正确答案
 */
import Foundation
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        if n == 0 {
            return 0
        }
        var solution = [Int](repeating: 0, count: n)
        for i in 0..<n {
            var j = i
            while j >= 0 {
                if j == 0 {
                    solution[j] = solution[j] + triangle[i][j]
                }else if j == i {
                    solution[j] = solution[j - 1] + triangle[i][j]
                }else {
                    solution[j] = min(solution[j - 1], solution[j]) + triangle[i][j]
                }
                j -= 1
            }
        }
        var min = Int.max
        for i in 0..<solution.count {
            if (solution[i] < min) {
                min = solution[i]
            }
        }
        return min
    }
}
let solution = Solution()
solution.minimumTotal([
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
])

//: [Next](@next)
