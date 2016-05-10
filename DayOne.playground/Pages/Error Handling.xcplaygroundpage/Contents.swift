//: [Previous](@previous)

import Foundation

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
