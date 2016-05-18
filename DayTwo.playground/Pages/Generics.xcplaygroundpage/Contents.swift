/*:
[Previous](@previous)

## Generics 
### For Fun and Profit
 
 *From the Swift Book:*
 
 Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.
 
 Generics are one of the most powerful features of Swift, and much of the Swift standard library is built with generic code. In fact, you’ve been using generics throughout the Language Guide, even if you didn’t realize it. For example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.
*/
import Shared
//: Queue's are FIFO data structures
scope {
    struct Queue {
        var array = [Int]()
        
        mutating func push(input: Int) {
            array.append(input)
        }
        
        mutating func pop() -> Int? {
            guard array.count > 0 else { return nil }
            return array.removeFirst()
        }
    }
    
    var queue = Queue()
    queue.push(15)
    queue.pop() //15
    queue.pop() //nil
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
