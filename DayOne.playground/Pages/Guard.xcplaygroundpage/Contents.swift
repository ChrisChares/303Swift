import Shared
/*:
 [Previous](@previous)
 
 ## Guard
 ### Minimal Magic, Maximum Readability
 ### Or:  Fuck the PoD
 */
enum LengthError : ErrorType {
    case NonExistant
    case TooLong
    case TooShort
}

//: Validating function input is a very common problem.  It can also be very ugly and lead to some very convoluted logic and a potential "Pyramid of Doom".
scope {
    //: This (contrived) function returns the input string if its size is "just right"
    func goldilocks(input: String?) throws -> String {
        if let input = input {
            
            if input.characters.count > 10 {
                throw LengthError.TooLong
            } else if input.characters.count < 5 {
                throw LengthError.TooShort
            } else {
                return input
            }
        } else {
            throw LengthError.NonExistant
        }
    }
}
//: We can rewrite that convoluted function with `guard` statements to be much easier to follow.  The very purpose of `guard` is to _return early due to invalid input_.  There is minimal magic involved.  The only requirement of a guard is that it _must_ exit the parent scope immediately.
scope {
    func goldilocks(input: String?) throws -> String {
//: guard statements can make use of a very similar pattern to `if-let`.  Except with `guard`, the variable is bound to the _parent scope_ of the guard statement.  In this case, if input is nil we immediately throw an error and exit.  If it isn't, the variable `string` is bound as a non optional for use in the rest of the parent scope.
        guard let string = input else { throw LengthError.NonExistant }
        guard string.characters.count < 10 else { throw LengthError.TooLong }
        guard string.characters.count > 5 else { throw LengthError.TooShort }
        
        return string
    }
}
//: As you can see, the intent of our rewritten `goldilocks` function is much more clear after using guards








//: [Next](@next)
