//2. 两数相加

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    // 最终方法
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head = ListNode.init(0)
        var curr = head
        var _ll1 = l1
        var _ll2 = l2
        var carry : Int = 0
        while (_ll1 != nil || _ll2 != nil) {
            let x1 = _ll1?.val ?? 0
            let x2 = _ll2?.val ?? 0
            var num = x1 + x2 + carry
            if num > 9 {
                carry = 1
                num = num % 10
            }else {
                carry = 0
            }
            let one = ListNode.init(num)
            curr.next = one
            curr = one
            _ll1 = _ll1?.next
            _ll2 = _ll2?.next
        }
        if carry == 1 {
            let one = ListNode.init(1)
            curr.next = one
        }
        return head.next
    }

    func num2node(_ num : Int) -> ListNode? {
        if num > 9 {
            let node = ListNode.init(num % 10)
            node.next = self.num2node(num / 10)
            return node
        }
        return nil
    }

    var nodes : Array<ListNode>!

    // 进位1
    /// - Parameter num1: 需要增加的数值
    /// - Parameter index: 操作位置在nodes里面
    func carryOne(num1 : Int, index : Int) {
        var num = num1
        if index < self.nodes.count {
            num += self.nodes[index].val
        }
        var add1 = 0

        if num > 9 {
            num = num % 10
            add1 = 1
        }

        if index < self.nodes.count {

        }
        if index < self.nodes.count {
            // 修改数据
            self.nodes[index].val = num
        }else {
            // 最后添加一个
            let one = ListNode.init(num)
            if self.nodes.last != nil {
                self.nodes.last!.next = one
            }
            self.nodes.append(one)
        }

        if add1 == 1 {
            // 向后进一位
            let a = ListNode.init(1)
            self.nodes.append(a)
            self.nodes[index].next = a
        }
    }

    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        self.nodes = Array<ListNode>.init()

        var _ll1 = l1
        var _ll2 = l2
        var index = 0
        while true {
            // 全为nil
            if _ll1 == nil && _ll2 == nil {
                return self.nodes.first
            }else {
                if _ll1 == nil {
                    if index < self.nodes.count {
                        self.carryOne(num1: _ll2!.val, index: index)
                        _ll1 = nil
                        _ll2 = _ll2!.next
                    }else {
                        self.nodes.last?.next = _ll2
                        return self.nodes.first
                    }
                }else if _ll2 == nil {
                    if index < self.nodes.count {
                        self.carryOne(num1: _ll1!.val, index: index)
                        _ll1 = _ll1!.next
                        _ll2 = nil
                    }else {
                        self.nodes.last?.next = _ll1
                        return self.nodes.first
                    }
                }else {
                    self.carryOne(num1: _ll1!.val + _ll2!.val, index: index)
                    _ll1 = _ll1!.next
                    _ll2 = _ll2!.next
                }
            }

            index += 1
        }

        return self.nodes.last
    }
}
