/*:
 [Previous](@previous)
 ## All Together Now
 ### Type safe, error driven JSON parsing
*/
import Foundation

let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")!
let data = try! NSData(contentsOfFile: path, options: [])
let jsonArray = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! JSONArray

//: Define a custom error type to describe issues we might run into while parsing
enum ParsingError : ErrorType {
    case MissingRequiredField(field: String)
    case InvalidURL
}

//: We prefer structs to classes http://stackoverflow.com/a/24232845/1226668
struct User {
//: Nested types allow us to keep the name space clean within the module
    enum Gender : String {
        case Unknown
        case Male
        case Female
    }
//: Constant, rather than variable values
    let id: Int
    let firstName: String
    let lastName: String
    let url: NSURL
    let gender: Gender
    let emoji: String
    
//: Computed properties can be used to provide business logic
    var name: String {
        return "\(firstName) \(lastName)"
    }
}

//: Extensions give us a way to cleanly structure our code.  Separate extensions for protocol compliance are a useful pattern.  Types that adhere to `CustomStringConvertible` are printable.  You'll probably recognize the `description` variable from Objective-C.
extension User : CustomStringConvertible {
    var description: String {
        return "\(emoji) \(name)\n"
    }
}

func userFromJSON(json: JSON) throws -> User {
//: We use guards to break from the function early in error cases
    guard let id = json["id"] as? Int else { throw ParsingError.MissingRequiredField(field: "id") }
    guard let firstName = json["first_name"] as? String else { throw ParsingError.MissingRequiredField(field: "first_name") }
    guard let lastName = json["last_name"] as? String else { throw ParsingError.MissingRequiredField(field: "last_name") }
    
    guard let stringURL = json["url"] as? String,
        let url = NSURL(string: stringURL) where url.scheme == "https" else {
            throw ParsingError.InvalidURL
    }
    
//: Constants don't have to be initialized inline.  The initialization can also happen from within an *exhaustive* conditional statement like if/if-let/switch.  The compiler will error if the conditional is not exhaustive (i.e. no `else` or `default` statement)
    let gender: User.Gender
    if let genderString = json["gender"] as? String,
        let genderEnum = User.Gender(rawValue: genderString) {
        gender = genderEnum
    } else {
        gender = .Unknown
    }
//: The nil coalescing operator `??` is sugar for working with potential nils and default values. If the statement to the left of the question marks evaluates as non-nil, it is used.  Otherwise, a default value provided to the right of the `??` is used.
    let emoji = json["emoji"] as? String ?? "😑"
//: Preceding statement is equivalent to the following, in increasing verboseness.
    scope {
        let emoji = json["emoji"] as? String != nil ? json["emoji"] as! String : "😑"
    }
    scope {
        let emoji: String
        if let e = json["emoji"] as? String {
            emoji = e
        } else {
            emoji = "😑"
        }
    }
    
    return User(id: id, firstName: firstName, lastName: lastName, url: url, gender: gender, emoji: emoji)
}




let users = jsonArray.flatMap { try? userFromJSON($0) }

print(users)
print("Parsed \(users.count)/100 valid users")

//: [Next](@next)
