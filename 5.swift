// 5 最长回文子串
// swift运行太慢了，我换python吧
let s = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"

// 中心扩展法
func charAt(str : String, index : Int) -> Substring {
    let s = str.index(str.startIndex, offsetBy: index)
    let e = str.index(str.startIndex, offsetBy: index + 1)
    return str[s..<e]
}

func subStr(str : String, start : Int, end : Int) -> String {
    let s = str.index(str.startIndex, offsetBy: start)
    let e = str.index(str.startIndex, offsetBy: end)
    return String(str[s...e])
}

func xxx(str : String, left : Int, right : Int) -> Int {
    var L = left
    var R = right
    while L >= 0, R < str.count, charAt(str: str, index: L) == charAt(str: str, index: R) {
        L -= 1
        R += 1
    }
    return R - L - 1
}

var start = 0
var end = 0
for i in 0..<s.count {
    //print("--- i =",i)
    let len1 = xxx(str: s, left: i, right: i)
    let len2 = xxx(str: s, left: i, right: i + 1)
    let len = max(len1, len2)
    if len > end - start {
        start = i - (len - 1) / 2
        end = i + len / 2
        //print(start, end, len)
    }
}
let maxStr = subStr(str: s, start: start, end: end)
print(maxStr)

/**
// 暴力法
let start = s.startIndex
var maxStr = ""
for i in 0..<s.count {
    //print("i=",i)
    var _start = s.index(start, offsetBy: i)
    var _end = s.index(start, offsetBy: i + 1)
    let s1 = s[_start..<_end]
    if i == 0 {
        maxStr = String(s1)
    }else {
        _start = s.index(_start, offsetBy: -1)
        _end = s.index(_end, offsetBy: -1)
        let pc = s[_start..<_end]
        var ppc : Substring = ""
        if i > 1 {
            _start = s.index(_start, offsetBy: -1)
            _end = s.index(_end, offsetBy: -1)
            ppc = s[_start..<_end]
        }
        
        var x = 0
        if s1 == pc {
            let _maxStr = [pc,s1].joined()
            if _maxStr.count > maxStr.count {
                maxStr = _maxStr
            }
            var j = 1
            //print("j==1")
            while true {
                let plus = i + j
                let surplus = i - j - 1 - x
                //print(plus,surplus)
                if plus < s.count && surplus >= 0 {
                    let plus_s = s.index(start, offsetBy: plus)
                    let plus_e = s.index(start, offsetBy: plus + 1)
                    let surplus_s = s.index(start, offsetBy: surplus)
                    let surplus_e = s.index(start, offsetBy: surplus + 1)
                    if s[plus_s..<plus_e] == s[surplus_s..<surplus_e] {
                        // 替换最大值
                        let __s = s.index(start, offsetBy: surplus)
                        let __e = s.index(start, offsetBy: plus)
                        let _maxStr = String(s[__s...__e ])
                        if _maxStr.count > maxStr.count {
                            maxStr = _maxStr
                        }
                        j += 1
                    }else {
                        break
                    }
                }else {
                    break
                }
            }
        }
        if s1 == ppc {
            x = 1
            let _maxStr = [ppc,pc,s1].joined()
            if _maxStr.count > maxStr.count {
                maxStr = _maxStr
            }
            var j = 1
            //print("j==1")
            while true {
                let plus = i + j
                let surplus = i - j - 1 - x
                //print(plus,surplus)
                if plus < s.count && surplus >= 0 {
                    let plus_s = s.index(start, offsetBy: plus)
                    let plus_e = s.index(start, offsetBy: plus + 1)
                    let surplus_s = s.index(start, offsetBy: surplus)
                    let surplus_e = s.index(start, offsetBy: surplus + 1)
                    if s[plus_s..<plus_e] == s[surplus_s..<surplus_e] {
                        // 替换最大值
                        let __s = s.index(start, offsetBy: surplus)
                        let __e = s.index(start, offsetBy: plus)
                        let _maxStr = String(s[__s...__e ])
                        if _maxStr.count > maxStr.count {
                            maxStr = _maxStr
                        }
                        j += 1
                    }else {
                        break
                    }
                }else {
                    break
                }
            }
        }
    }
}
print(maxStr)
*/

