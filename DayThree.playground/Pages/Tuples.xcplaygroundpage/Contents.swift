/*:
 [Previous](@previous)
 ## Tuples
 Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.
*/
import Shared
printScope {
    let serverResponse = (code: 200, message: "Success")
    
//    let (code, message) = serverResponse
    print(serverResponse.code)
    print(serverResponse.message)
}
//: Tuples are used all over the place, you may recognize them
printScope {
    let json = [
        "name" : "Yolando",
        "age" : 42
    ]
    for (key, value) in json {
        print("\(key): \(value)")
    }
}
printScope {
    let array = ["a","b","c"]

    
    for (i, value) in array.enumerate() {
        print("\(i): \(value)")
    }
}


func doNetworkingStuff() -> (status: Int, message: String) {
    return (404, "Not Found")
}
//: [Next](@next)
