//: [Previous](@previous)

import Shared

//: Anonymous Function
scope {
    let multiplier = { (input: Int) in
        return input * 2
    }
    let four = multiplier(2)
}

//: A closure is an anonymous function that captures state of the surrounding environment http://stackoverflow.com/questions/4912116/closure-vs-anonymous-function-difference
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

//: Higher Order Functions https://en.wikipedia.org/wiki/Higher-order_function
scope {
    func doSomething(fn: () -> Void) { fn() }
    doSomething({
        //wait this looks suspiciously familiar...
    })
}


func oneTwoThree(fn: (Int) -> Void) {
    for i in 1...3 {
        fn(i)
    }
}

oneTwoThree({ (input: Int) in
    print(input)
})
print("\n")

oneTwoThree { (input: Int) in
    print(input + 1)
}
print("\n")

oneTwoThree { input in
    print(input + 2)
}
print("\n")

oneTwoThree { print($0 + 3) }
print("\n")




//: [Next](@next)
