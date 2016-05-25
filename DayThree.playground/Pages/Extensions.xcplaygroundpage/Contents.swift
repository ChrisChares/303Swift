/*:
 [Previous](@previous)
 ## Extensions
 Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.)
 */
import Shared

//: String length is annoying, let's make it prettier
"Hello".characters.count

extension String {
    var length: Int {
        return characters.count
    }
}

"Hello".length

//: Protocol Extensions are very useful
extension SequenceType {
    func isFilter<T>() -> [T] {
        var array = [T]()
        for obj in self {
            if let typedObject = obj as? T {
                array.append(typedObject)
            }
        }
        return array
    }
}

let mixedArray = [1,2,3,4,"Rick Sanchez", "Morty Sanchez"]
let integers: [Int] = mixedArray.isFilter()
print(mixedArray.isFilter() as [Int])

let strings: [String] = mixedArray.isFilter()
print(mixedArray.isFilter() as [String])

//: [Next](@next)
