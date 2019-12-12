//3、无重复字符的最长子串
let s = "aaaa"
let n = s.count
var i = 0
var j = 0
var max_n = 0
var one = Dictionary<Substring , Int>.init()
var start = s.startIndex
while j < n {
    let chat1 = s[start..<s.index(start, offsetBy: 1)]
    if let j_1 = one[chat1] {
        i = max(i, j_1)
    }
    j += 1
    one[chat1] = j
    max_n = max(max_n, j - i)
    start = s.index(start, offsetBy: 1)
}
print(max_n)

//let n = s.count
//var i = 0
//var j = 0
//var max_n = 0
//var chats = Set<Substring>.init()
//var one = Dictionary<Substring , Int>.init()
//while i < n && j < n {
//    s.index(s.startIndex, offsetBy: j)
//    let start = s.index(s.startIndex, offsetBy: j)
//    let end = s.index(start, offsetBy: 1)
//    let chat1 = s[start..<end]
//    if chats.contains(chat1) {
//
//        let i_start = s.index(s.startIndex, offsetBy: i)
//        let i_end = s.index(i_start, offsetBy: 1)
//        let i_chat = s[i_start..<i_end]
//
//        chats.remove(i_chat)
//        i += 1
//    }else {
//        chats.insert(chat1)
//        one[chat1] = j
//        j += 1
//        max_n = max(max_n, j - i)
//    }
//}
//print(max_n)
//let s = "abcdabcdabcd"
//var maxLenght : Int = (s.count == 0) ? 0 : 1
//var one = Dictionary<Substring , Int>.init()
//var i : Int = 0
//while i < s.count {
//    let start = s.index(s.startIndex, offsetBy: i)
//    let end = s.index(s.startIndex, offsetBy: i + 1)
//    let chat1 = s[start..<end]
//
//    if let x1 = one[chat1] {
//        if maxLenght < one.count {
//            maxLenght = one.count
//        }
//        i = x1
//        one.removeAll()
//    }else {
//        one[chat1] = i
//        if maxLenght < one.count {
//            maxLenght = one.count
//        }
//    }
//    i += 1
//}
//////return maxLenght
//print(maxLenght)
