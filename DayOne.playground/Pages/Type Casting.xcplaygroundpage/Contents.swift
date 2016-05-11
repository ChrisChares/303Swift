/*: 
 [Previous](@previous)
 
 ## Type Casting
 ### Can't escape it
 
 First, if the type you are casting to is less restrictive than the original, you can just do so.
*/
scope {
    let a: Int = 12
    let b: Any = a
}
//: You can check types with the `is` keyword
scope {
    let a = 42
    let b: Any = a
    print(b is Int) // true
}

//: When you need to go from less restrictive to more restrictive, you have to type cast.  Enter `as?` and `as!`.  Can you guess the difference?
scope {
    let a = 42
    let b: Any = a
    let c = (b as! Int) + 5 // Will crash immediately if b is not an Int
}
//: as? returns an optional of the new type
scope {
    let a = 42
    let b: Any = a
    let c = b as? String // nil
}
//: You can use as? in if-lets!  This is very useful when dealing with dynamicly typed data (like JSON) in a type safe fashion.
import Foundation
scope {
    let json: JSON = ["url": NSURL(string: "https://google.com")!]
    if let url = json["url"] as? NSURL {
        print(url.scheme) //https
    }
}
scope {
    let json: JSON = ["url": NSURL(string: "https://google.com")!]
    if let url = json["url"] as? String {
        //never executed because json["url"] is of type NSURL
    }
}
//: [Next](@next)
