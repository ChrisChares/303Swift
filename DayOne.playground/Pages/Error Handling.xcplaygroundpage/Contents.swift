/*:
 [Previous](@previous)

 ## Error Handling
 ### Or: Stop worrying and love the automatic propagation
 
 Swift error handling is:
 + Automatically propagated
 + Typed
 + Marked
 
 Obj-C error handling is:
 + A shitshow
 + Manually propogated
 + Typed
 + Marked
 
And that's just `NSError`, let's pretend `NSException` doesn't exist.
 
Chris Lattner wrote a very, very good treatise on _why_ Swift Error handling is the way it is.  If you want to understand where Swift fits into the wider world of programming language error handling, [read it](https://github.com/apple/swift/blob/master/docs/ErrorHandlingRationale.rst)

Swift errors are an empty protocol `ErrorType` which `NSError` adheres to for backwards compatibility
 
[Way more than you ever wanted to know about the NSError / ErrorType bridge](https://realm.io/news/testing-swift-error-type/)

An Error consists of (at minimum) 2 things
 + Domain
 + Code

The values of domain and code are obvious with NSError
*/
import Foundation
scope {
    let error = NSError(domain: NSURLErrorDomain, code: 337, userInfo: nil)
}
/*:
 When we create error types in Swift, we create enums that adhere to ErrorType. In this case, the enum type becomes the Domain and the enum case becomes the Code.
 
Domain: CustomError, Code: Random
*/
enum CustomError : ErrorType {
    case Random
    case Specific(message: String)
}
//: Functions that can throw are marked as such in their declaration.  A function that `throws` can throw any kind of ErrorType
func throwsError(input: Int) throws {
    if input % 7 == 0 {
        throw CustomError.Specific(message: "Divisible by 7.  Don't do that")
    }
    else if input % 5 == 0 {
        throw CustomError.Specific(message: "Divisible by 5.  Don't do that")
    }
    else if input == 1337 {
        throw NSError(domain: "com.sourcechode", code: 1337, userInfo: nil)
    }
    else {
        throw CustomError.Random
    }
}
/*: 
 There are 3 different ways to execute a throwing function.
 + `try`
 + `try!`
 + `try?`

 `try` is the most involved and utilizes a style of `try-catch-finally` you may recognize from Java or Javascript
*/
do { // `do` reprents a block of code that contains throwable methods
    try throwsError(0) // individual calls that may throw are marked with `try`
} catch let error { // `catch` follows `do` and is executed in the case of errors
    print("Caught Error \(error)")
}
//: If your `do` block has the potential to throw multiple types of errors you can use a pattern matching type block to differentiate them.  This can be useful to distinguish, say a networking error from a json parsing error.
do {
    try throwsError(15)
} catch CustomError.Specific(let message) {
    print(message)
} catch is CustomError {
    print("Generic custom error")
} catch let error as NSError where error.domain == NSURLErrorDomain {
    print("Networking error")
} catch {
    print("Unknown Error")
}
//: If your code requires cleanup regardless of success or failure, you can use a `defer` block.
do {
    defer { // `defer` blocks are executed when the current scope exits.  Think Java's `finally`
        print("Hello")
    }
    try throwsError(15)
} catch {}
//: You can probably already guess what `try!` and `try?` do.  Use `try!` when you want to assert that a throwing method will never throw an error for your input.  As usual, the cost of screwing up this assertion is a runtime crash.
//try! throwsError(15) // fatal error
//: `try?` returns an optional based on errors.  It will be nil if there was a thrown error.  Note that using `try?`, while simple, completely strips any error information you may have gotten from the `try` variant.
try? throwsError(5) //nil BUT WHY
//: [Next](@next)
