//: [Previous](@previous)

import Foundation

enum ExampleEnum {
    case Huh
}

/**
    Swift has two parent objects, Any and AnyObject
 */
scope {
    let objectType = NSObject()
    let enumType = ExampleEnum.Huh
    let closureType = {
        print("Hello")
    }
    
    /*
        There are multiple different ways to typecast in Swift.  First, if the type you are casting to is less restrictive than the original, you can just do so.
    */
    let integerType: Int = 12
    let a: Any = integerType
    
    let mutableArray: NSMutableArray = NSMutableArray()
    let array: NSArray = mutableArray
    
    /*
        A forced typecast in swift takes the form of `as!` and is functionally the most similar to typecasting in other languages.  As opposed to Objective-C, a miscast will immediately crash the app instead of waiting until you message the miscasted object
    */
    let xs: [Any] = [1, 2, 3, 4]
    let integer = xs[0] as! Int
    // We happen to know (despite its type signature) that xs's contains only integers.  We use this information to make an assertion (as!).  But what if we're not this certain and don't want to crash the app if we are wrong?
    let stringOptional = xs[0] as? String //nil because xs[0] is an Int
    // You can also use this optional typecasting pattern within an if-let statement
    if let string = xs[0] as? String {
        //will never be executed because xs[0] is an Int
    }
}

//: [Next](@next)
