/*:
 [Previous](@previous)
 ## Fancier Functions
*/
import Shared
//: **Pure Functions**
scope {
    //: One input, one output, no external state
    func doSomething(input: Int) -> Int {
        return input * 2
    }
}
//: **Anonymous Functions**
scope {
    let multiplier = { (input: Int) in
        return input * 2
    }
    let four = multiplier(2)
}
//: A **closure** is an anonymous function that captures state of the surrounding environment http://stackoverflow.com/questions/4912116/closure-vs-anonymous-function-difference
scope {
    var i = 0
    let iterate = { () -> Int in
        i += 1
        return i
    }
    
    while i < 5 {
        print(iterate())
    }
    print("\n")
}

//: **Higher Order Functions** https://en.wikipedia.org/wiki/Higher-order_function
scope {
    func doSomething(fn: () -> Void) {
        fn()
    }
    doSomething({ () -> Void in
        //wait this looks suspiciously familiar...
    })
}

//: Functions-as-Parameters syntax
func doSomething(times times: Int, fn:(Int) -> Void) {
    for i in 0..<times {
        fn(i)
    }
}

doSomething(times: 1, fn: { (i: Int) -> Void in
    print("Hello \(i)")
})
print("\n")

doSomething(times: 2) { (i: Int) -> Void in
    print("Hello \(i)")
}
print("\n")

doSomething(times: 3) { i in
    print("Hello \(i)")
}
print("\n")

doSomething(times: 4) { print("Hello \($0)") }
//: [Next](@next)
