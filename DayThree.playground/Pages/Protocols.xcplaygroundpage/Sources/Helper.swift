import Foundation

public extension SequenceType {
    public func isFilter<T>() -> [T] {
        var array = [T]()
        for obj in self {
            if let typedObject = obj as? T {
                array.append(typedObject)
            }
        }
        return array
    }
}