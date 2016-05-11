/*:
 
 # 303Swift
 ## Day One
 
 + Basic Typing
 + Optionals
 + Error Handling
*/
/*:
 Swift is a statically typed language.  Not all type information has to be provided explicitly, however, the compiler will do its best to guess what you meant.  This is called type inference
*/
scope { let obj = 42 } // Int
scope { let obj: Int = 42 } // Int
scope { let obj = "Hello" } // String
scope { let obj : String = "Hello" } // String
//: Types are strictly enforced
//scope { let obj: String = 42 } //  error: Cannot convert value of type 'Int' to specified type 'String'
/*:
 ## `let` vs `var`
 ### Immutability is good for the soul
*/
//: A value defined with 'let' is an immutable constant and cannot be redefined
scope {
    let a = 42
//  a = 33 //error: cannot assign to let constant
}
//: A value defined with `var` can be reassigned
scope {
    var a = 42
    a = 33
}
//: This behavior goes deeper with structs, which can mark functions and variables as mutating.  Mutating members are only available on mutable structs (defined with `var`).  We will get more into structs vs classes in later weeks.
scope {
    var array = [1]
    array.append(2)
}
scope {
    let array = [1]
//  array.append(2) //error: cannot use mutating member on immutable value: 'array' is a 'let' constant
}
/*:
 ## `!` and `?`
 ### Danger and the Optional
 
 You will see both `!` and `?` in a number of different contexts in Swift like optionals, error handling and type casting.  While the context may change, their core meaning is always just about the same.
 
+ `?` implies an optional, or possible nil value
+ `!` implies an assertion, or a time when you're so certain of an outcome that the app should crash immediately if you're wrong.
 
[Next: Optionals](@next)
*/