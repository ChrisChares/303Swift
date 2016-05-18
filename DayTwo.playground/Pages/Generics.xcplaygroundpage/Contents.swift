/*:
[Previous](@previous)

## Generics 
### For Fun and Profit
*/
import Shared
//: Queue's are FIFO data structures
struct IntQueue {
    var array = [Int]()
    
    mutating func push(input: Int) {
        array.append(input)
    }
    
    mutating func pop() -> Int? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
}

scope {
    var queue = IntQueue()
    queue.push(15)
    queue.pop()
    queue.pop()
}

//: Generic Queue
struct Queue<T> {
    var array = [T]()
    mutating func push(input: T) {
        array.append(input)
    }
    
    mutating func pop() -> T? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
}

scope {
    var queue = Queue<Int>()
    queue.push(27)
    print(queue.pop())
}

scope {
    var queue = Queue<String>()
    queue.push("Hello")
    print(queue.pop())
}

//: Functions can be generic too.  Generics can also be constrained.  In this case, T can represent anything that is Comparable.
func isThis<T: Comparable>(a: T, before b: T) -> Bool {
    return a < b
}

isThis("A", before: "B")
isThis(5, before: 3)
//: [Next](@next)
