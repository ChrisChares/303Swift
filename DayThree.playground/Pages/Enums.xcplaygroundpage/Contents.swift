/*:
 
 # 303Swift
 ## Day Three
 
 + Enums
 + Tuples
 + Extensions
 + Protocols
 
 [Swift book on enums](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID145)
 
 An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
 */
import Shared
//: `printScope` prints a new line character after the scope exits for readability
printScope {
//: Enum definition
    enum Device {
        case iPhone
        case iPad
    }
//: They are iterated with switch statements
    let type = Device.iPhone
    switch type {
    case .iPhone:
        print("iPhone")
    case .iPad:
        print("iPad")
    }
}
//: They can be backed with a raw value
printScope {
    enum Device : String {
        case iPhone = "iPhone"
        case iPad = "iPad"
    }
    let type = Device.iPad
    print(type.rawValue)
}
//: Enums are full fledged types and can include methods and computed properties
printScope {
    enum State : String {
        case CO = "co"
        case HI = "hi"
        case NM = "nm"
        case NY = "ny"
        
        var name: String {
            switch self {
            case .CO: return "Colorado"
            case .HI: return "Hawaii"
            case .NM: return "New Mexico"
            case .NY: return "New York"
            }
        }
    }
    
    let state: State = .CO
    print(state.rawValue)
    print(state.name)
}
//: They can also have associated values
printScope {
    enum FeudalUser {
        case Serf
        case Baron(title: String)
    }
    
    let users: [FeudalUser] = [.Serf, .Serf, .Serf, .Baron(title: "Rotundness")]
    
    for user in users {
        switch user {
        case .Serf: print("Back to work")
        case .Baron(let title): print("Welcome, Your \(title)")
        }
    }
}
//: Enums work great for errors
printScope {
    enum APIError: ErrorType {
        case NotFound
        case ParsedError(code: Int, message: String)
    }
    
    func doNetworking() throws {}
    
    do {
        try doNetworking()
    } catch APIError.ParsedError(let code, let message) {
        print("Error \(code) | \(message)")
    } catch APIError.NotFound {
        print("404 Not Found")
    } catch {
        print("Unknown Error")
    }
}

//: [Next](@next)
