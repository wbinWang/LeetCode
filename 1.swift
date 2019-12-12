// 1. 两数之和
let nums = [3,4,5,6,7]
let target = 13

var dict = Dictionary<Int, Int>.init()
for i in 0..<nums.count {
    let num = nums[i]
    if let x = dict[target - num] {
        print([i,x])
    }
    dict[num] = i
}
