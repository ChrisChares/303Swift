//: [Previous](@previous)

//: Deep dive https://realm.io/news/testing-swift-error-type/
//: The best damn thing on error handling you'll ever read https://github.com/apple/swift/blob/master/docs/ErrorHandlingRationale.rst
import Foundation


//: # Error Handling
/**
    Error handling is:
    + Automatily Propogated
    + Statically Typed
    + Explicit
    + Dad?
 
 
 Swift errors are an empty protocol `ErrorType` which NSError adheres to for backwards compatibility
 ## An Error consists of 2 things
    + Domain
    + Code
*/

//: The values of domain and code are obvious with
scope {
    let error = NSError(domain: NSURLErrorDomain, code: 337, userInfo: nil)
}



//: ErrorType, NSError adheres to it
enum Error : ErrorType {
    case Random
}


func throwsError(input: Int) throws {
    if input % 2 == 0 {
        throw Error.Random
    } else {
        throw NSError(domain: "com.test.test", code: 307, userInfo: nil)
    }
}

do {
    defer {
        print("Hello")
    }
    try throwsError(0)
} catch let error {
    print("Caught Error \(error)")
}



//: [Next](@next)
