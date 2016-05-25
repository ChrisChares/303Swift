// create individualy scoped blocks for readability
public func scope(fn:() -> Void) {
    fn()
}
public func printScope(fn:() -> Void) {
    fn()
    print("\n")
}

//: typealias's help with readability
public typealias JSON = [String: AnyObject]
public typealias JSONArray = [JSON]

public func readJSONArray(name: String) throws -> [JSON] {
    let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")!
    let data = try NSData(contentsOfFile: path, options: [])
    let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! JSONArray
    return jsonArray
}

/* Currying */
public func curry<A, B, C>(fn: (A, B) -> C) -> (A) -> (B) -> C {
    return { a in
        return { b in
            return fn(a, b)
        }
    }
}
public func curry<A, B, C, D>(fn:(A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    return { a in
        return { b in
            return { c in
                return fn(a, b, c)
            }
        }
    }
}

/*  UIColor Linear Interpolation */
 
import UIKit

public extension UIColor {
    
    public static func interpolate(from: UIColor, to: UIColor, fraction: Float)  -> UIColor {
        
        let f = CGFloat(min(1, max(0, fraction)))
        
        let start = CGColorGetComponents(from.CGColor)
        let end = CGColorGetComponents(to.CGColor)
        
        let r = start[0] + (end[0] - start[0]) * f
        let g = start[1] + (end[1] - start[1]) * f
        let b = start[2] + (end[2] - start[2]) * f
        let a = start[3] + (end[3] - start[3]) * f
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}