/**
 Optionals
 
 Optionals in Swift are indicated by a '?' mark and have to be explictly marked as such in order to accept nil as a value
 */
scope {
//:  let a : Int = nil
//:  error: nil cannot initialize specified type 'Int'

    let a : Int? = nil
    print(a) // nil
    
    var b : Int? = nil
    b = 43
    print(b) // Optional(43)
}

/**
    You'll notice that `print(b)` printed "Optional(43)" instead of 43, this is because optionals need to be unwrapped before they can be used
 */
scope {
    var optionalInteger : Int? = 42
    
//  print(optionalInteger + 5)
//  error: value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
    
    // There are two ways to unwrap an optional.  The first is called a forced unwrap and utilizing a `!`
    print(optionalInteger! + 5) // 47
    
//: `!` in Swift mean danger.  In this case the app will crash at runtime immediately if optionalInteger happens to be nil.  You can think of force unwrapping like an assertion.  Very dangerous and only to be used in situations where a nil value puts the app in an invalid state from which it *should* crash
    optionalInteger = nil
//    print(optionalInteger! + 5)
//    fatal error: unexpectedly found nil while unwrapping an Optional value
}

/**
    Luckily you don't have to make a crashing assertion everytime you unwrap a variable.  This is where the if-let concept comes in
 */
scope {
    let optionalString : String? = "Hello"
    if let string = optionalString {
        print(string.dynamicType) // String (Non-optional!)
        // string is only bound within this inner scope
        print(string) // "Hello"
    }
}
scope {
    let optionalString : String? = nil
    if let string = optionalString {
        // this code block will never be executed because optionalString is nil
    }
}
//: Sometimes a mere nil/not nil check is insufficient for control flow purposes.  Swift has a `where` block for this
scope {
    let optionalString : String? = ""
    if let string = optionalString where string.characters.count > 0 {
        // this code block will never be executed because although optionalString is not nil, 'string' doesn't pass the where block
    }
}


