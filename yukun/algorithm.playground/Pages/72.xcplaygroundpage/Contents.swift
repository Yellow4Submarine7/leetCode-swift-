import UIKit

/*:
 ## 72. 编辑距离
 给定两个单词 word1 和 word2，计算出将 word1 转换成 word2 所使用的最少操作数 。

 你可以对一个单词进行如下三种操作：

 插入一个字符
 删除一个字符
 替换一个字符
 示例 1:
 ```
 输入: word1 = "horse", word2 = "ros"
 输出: 3
 解释:
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')
 ```
 示例 2:
 ```
 输入: word1 = "intention", word2 = "execution"
 输出: 5
 解释:
 intention -> inention (删除 't')
 inention -> enention (将 'i' 替换为 'e')
 enention -> exention (将 'n' 替换为 'x')
 exention -> exection (将 'n' 替换为 'c')
 exection -> execution (插入 'u')
 ```
 */
/*:
## 72. 思路
 
 递归思路：
 如果字符一样就不做操作
 如果字符不一样，那么尝试对b
 1. 插入：字符串a往前走一步
 2. 删除：字符串b往前走一步
 3. 替换：字符串a,b同时前进
 

 
 动态规划 自底向上 遍历字符
 
 > dp[i-1][j-1]:存储 s1[0..i] 和 s2[0..j] 的最小编辑距离
 
 如果字符一样，则与a,b各减少一个字符的子串相同结果
 如果字符不一样，那么尝试对b
 1. 插入：b不变，a添加一个字符的父串相同结果
 2. 删除：a不变，b减少一个字符的子串相同结果
 3. 替换：a,b各减少一个字符的子串相同结果
 
 [例图](https://mmbiz.qpic.cn/mmbiz_png/map09icNxZ4k5NKSib1ss6fnzSpHpahjDw3B41UlTr2jOIH3SH7jvaYZTK5Qic2ZIHTEOztTRmpwd1K5v5FXrZHhw/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)
 
 */



#imageLiteral(resourceName: "640.jpeg")
class Solution {
//    func minDistance(_ word1: String, _ word2: String) -> Int {
//        if word1.isEmpty {
//            return word2.count
//        }
//        if word2.isEmpty {
//            return word1.count
//        }
//        var disArr = Array(repeating: ([Int](repeating: 0, count: word2.count + 1)), count: word1.count + 1)
//        for i in 0...word1.count {
//            disArr[i][0] = i
//        }
//
//        for j in 0...word2.count {
//            disArr[0][j] = j
//        }
//
//        for i in 1...word1.count {
//            for j in 1...word2.count {
//                let word1Index = word1.index(word1.startIndex, offsetBy: i - 1)
//                let word2Index = word2.index(word1.startIndex, offsetBy: j - 1)
//                if (word1[word1Index] == word2[word2Index]) {
//                    disArr[i][j] = disArr[i - 1][j - 1]
//                }else{
//                    disArr[i][j] = min(disArr[i - 1][j], min(disArr[i][j - 1], disArr[i - 1][j - 1])) + 1
//                }
//            }
//        }
//
//        return disArr[word1.count][word2.count]
//    }
    // 优化
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty {
            return word2.count
        }
        if word2.isEmpty {
            return word1.count
        }
        var disArr = Array(repeating: ([Int](repeating: 0, count: word2.count + 1)), count: word1.count + 1)
        for i in 0...word1.count {
            disArr[i][0] = i
        }
        
        for j in 0...word2.count {
            disArr[0][j] = j
        }
        
        
        let word1Arr = Array(word1)
        let word2Arr = Array(word2)
        
        for i in 1...word1.count {
            for j in 1...word2.count {
                if (word1Arr[i - 1] == word2Arr[j - 1]) {
                    disArr[i][j] = disArr[i - 1][j - 1]
                }else{
                    disArr[i][j] = min(disArr[i - 1][j], min(disArr[i][j - 1], disArr[i - 1][j - 1])) + 1
                }
            }
        }
        
        return disArr[word1.count][word2.count]
    }
}

let solution = Solution()
solution.minDistance("horse", "ros")
solution.minDistance("intention", "execution")
solution.minDistance("plasma", "altruism")
