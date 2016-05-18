// create individualy scoped blocks for readability
public func scope(fn:() -> Void) { fn() }

//: typealias's help with readability
public typealias JSON = [String: AnyObject]
public typealias JSONArray = [JSON]