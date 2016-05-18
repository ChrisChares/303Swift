/*:
 
 # 303Swift
 ## Day Two
 
 + Functions
 + Generics
 + More Functions
 */
import Shared
/*:
 ## Basic Syntax
*/
scope {
    func doSomething() {}
    doSomething()
}
scope {
    func doSomething() -> () {}
    doSomething()
}
scope {
    func doSomething() -> Void {}
    doSomething()
}

//: Input
scope {
    func doSomething(input: Int) {}
    doSomething(27)
}
scope {
    func doSomething(to input: Int) {}
    doSomething(to: 27)
}
scope {
    func doSomething(a: Int, b: Int) {}
    doSomething(1, b: 2)
}
scope {
    func doSomething(first a: Int, second b: Int) {}
    doSomething(first: 10, second: 12)
}

//: Returns
scope {
    func doSomething() -> Int {
        return 5
    }
    let value = doSomething()
}
