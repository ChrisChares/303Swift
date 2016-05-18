import Shared
/*:
 ## Optionals
 ### Or: Why nil everywhere might have actually been a really bad idea
 
+ [Are null references really a bad thing?](http://programmers.stackexchange.com/questions/12777/are-null-references-really-a-bad-thing)
+ [Null References: The Billion Dollar Mistake](http://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare)
 
Swift variables cannot be nil without being explicitly marked for that possibility.  Enter the optional.
*/
//scope { let a : Int = nil } //Nil cannot initialize specified type 'Int'
scope { let a : Int? = 42 }
scope { let a : Int? = nil }
scope {
    let a : Int? = 42
    print(a) // "Optional(42)"
}
//: You'll notice that `print(a)` printed "Optional(42)" instead of just 42.  This is because optionals represent a wrapper over a potential value, or nil.  They must be unwrapped before use.
scope {
    let a: Int? = 42
//    let b = a + 5 //error: value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
}
//: There are two ways to unwrap an optional.  The first uses the *danger* and *assertion* modifier of `!` and is called forced unwrapping
scope {
    let a: Int? = 42
    let b = a! + 5
}
//: But what happens if a was nil?
scope {
    let a: Int? = nil
    // Oh god runtime explosion
//    let b = a! + 5 //fatal error: unexpectedly found nil while unwrapping an Optional value
}
//: That's not very safe.  For a safer way of dealing with optionals, Swift provides the `if-let` statement.  `if-let` combines a nil check with variable assignment into a single statement.
scope {
    let optionalInteger: Int? = 42
    print(optionalInteger) // "Optional(42)"
    if let integer = optionalInteger {
        print(integer) // "42"
    }
}
//: The provided code block will only be executed if the optional unwrapping succeeds
scope {
    let optionalInteger: Int? = nil
    if let integer = optionalInteger {
        print(integer) // Never executed because optionalInteger is nil
    }
}
//: Sometimes a mere nil check is insufficient validation.  Enter the `where` clause
scope {
    let optionalString: String? = "Hello"
    if let string = optionalString where string.characters.count > 0 {
        // Executed because optionalString is non-nil and has more than zero characters
        print(string) // "Hello"
    }
}
//: `if-let` statements can be chained, with subsequent statements utilizing the results of preceding statements.  If any statement fails, the entire statement fails
import Foundation // for NSURL
scope {
    let optionalStringURL: String? = "https://www.google.com"
    if let stringURL = optionalStringURL,
        let url = NSURL(string: stringURL) {
        print(url)
    }
}
/*:
 ## Implicitly Unwrapped Optionals
 ### Or: The real world is ugly
 
 So far we've been existing in a very clean and ordered world.  Things are either optional or not and must be explicitly treated as such.  Enter Implicitly Unwrapped Optionals.  An IUO can be nil, but is treated as though it never will be.  Just like Java and NullPointerExceptions!  Yay!  They are defined with the ever dangerous `!` in place of the optional `?`
*/
scope {
    let a: Int! = 42
    print(a) // "42" NOT "Optional(42)"
}
scope {
    let a: Int! = nil
//    print(a) // fatal error: unexpectedly found nil while unwrapping an Optional value
}
//: Why would such a horrible thing exist?  Because you don't always have control over the initialization of a type.  UIViewController and IBOutlets are a great example.
import UIKit
class ViewController : UIViewController {
    // You'll see this a lot
    @IBOutlet var tableView: UITableView!
}
//: The rules for class initialization demand that all non optional variables are initialized before exiting the `init()` function.  The NIB/Storyboard view controller loading process doesn't work like this however.  It will initialize the view controller via `initWithCoder`, *then* connect the outlets.  Thus we make an *assumption* (remember !) that by the time we are interacting with our view controller code, `tableView` will never be nil.  If it does happen to be nil, we want an immediate crash to indicate we set up our outlets wrong.  
