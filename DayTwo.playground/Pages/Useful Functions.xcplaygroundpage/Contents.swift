/*:
 [Previous](@previous)
 ## Useful Functions
 ### Or:  What are higher order functions and why do they keep following me around
 */
import Shared
//: Sample Data
let users = try! readJSONArray("data")
let integers = [1,2,3,4,5]
/*:
----
 
 ## Filter
 **Filter** iterates over every item in a collection and creates a new array consisting of those that pass a test
*/
scope {
    integers.filter { (input: Int) -> Bool in
        return input % 2 == 0
    }
    
    let loveyUsers = users.filter {
        if let emoji = $0["emoji"] as? String {
            return emoji == "😍"
        } else {
            return false
        }
    }
    
    print(loveyUsers.count)
}
scope {
//: **typealias** helps with readability
    typealias FilterFunction = (Int) -> Bool
    
    func filter(xs: [Int], fn: FilterFunction) -> [Int] {
        var result = [Int]()
        for x in xs {
            if fn(x) {
                result.append(x)
            }
        }
        return result
    }
    
    filter(integers) {
        return $0 % 2 == 0
    }
}
/*:
-----
 
## Map
**Map** iterates over every item in a collection, transforming it according to a function.  It then returns a new array containing the transformed values
*/
scope {
    integers.map { $0 * 2 }
//: The input and return types don't have to be the same
    let alphabet = "abcdefghijklmnopqrstuvwxyz".characters
    let characters = integers.map { alphabet[alphabet.startIndex.advancedBy($0)] }
    print(characters)
}
scope {
    typealias MapFunction = (Int) -> Int
    func map(xs: [Int], fn: MapFunction) -> [Int] {
        var result = [Int]()
        for x in xs {
            let newValue = fn(x)
            result.append(newValue)
        }
        return result
    }
    map(integers) { $0 * 2 }
}
//: [Next](@next)
