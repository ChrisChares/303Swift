/*:
 [Previous](@previous)
 ## Useful Functions, revisited
 ### Or:  Implementing actually useful functions
 */
import Shared
//: Sample Data
let users = try! readJSONArray("data")
/*:
 ----
 
 ## Filter
 */
scope {
    func filter<T>(xs: [T], fn: (T) -> Bool) -> [T] {
        var result = [T]()
        for x in xs {
            if fn(x) {
                result.append(x)
            }
        }
        return result
    }
    
    let ruths = filter(users) {
        return $0["first_name"] as? String == "Ruth"
    }
    print("Found \(ruths.count) Ruths")
}
/*:
 -----
 
 ## Map
*/
scope {
    func map<T, E>(xs: [T], fn: (T) -> E) -> [E] {
        var result = [E]()
        for x in xs {
            let newValue = fn(x)
            result.append(newValue)
        }
        return result
    }
    
    let firstNames = map(users) {
        return $0["first_name"]!
    }
}

/*:
----
 
## Reduce
**Reduces** a collection to a single value
*/
scope {
    let emojiString = users.reduce("", combine: { (sum, user) -> String in
        if let emoji = user["emoji"] as? String {
            return sum + emoji
        } else {
            return sum
        }
    })
    print(emojiString)
}
scope {
    func reduce<T, E>(xs: [T], initial: E, combine: (E, T) -> E) -> E {
        var result = initial
        for x in xs {
            result = combine(result, x)
        }
        return result
    }
}

//: Generic, Higher Order Functions can be used to solve all kinds of problems.  Here we're going to count occurances of an arbitrary object in a collection
scope {
    func count<T: Equatable>(xs: [T], fn: (T) -> Bool ) -> Int {
        var count = 0
        for x in xs {
            if fn(x) {
                count += 1
            }
        }
        return count
    }
    
    let ruthsCount = count(users) { $0["first_name"] as? String == "Ruth" }
    print("Found \(ruthsCount) with our custom count function")
}
//: [Next](@next)
