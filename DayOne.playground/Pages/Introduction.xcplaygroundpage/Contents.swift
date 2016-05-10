//: [Previous](@previous)


//: Playground - noun: a place where people can play

/**
 + Type Inference
 + Mutability
 + Optionals
 + if-let, guard
 + Initializers
 + Error Handling
 */


/**
 Not all type information has to be provided explicitly, the compiler will do its best to guess what you meant.  This is called type inference
 */
scope {
    // These pairs of statements are equivelent, but in each example the compiler is allowed to infer the type instead of explicitly listing it
    let a = 42 // Type: Int
    let b : Int = 42 // Type: Int
    
    let c = "Hello" // Type: String
    let d : String = "Goodbye" // Type: String
    
    //  error: Cannot convert value of type 'Int' to specified type 'String'
    //  let e : String = 42
}

/**
 Swift favors immutability
 
 let vs var
 */
scope {
    // A value defined with 'let' is a constant and cannot be redefined
    let a = 42
    
    // error: cannot assign to let constant
    // a = 33
    
    // A Value defined with 'var' is a variable and can be redefined at will
    var b = 42
    b = 12
    
    // Prefer lets over vars.  Easier for a human to reason about and easier for the compiler to optimize
}

//: [Next](@next)

