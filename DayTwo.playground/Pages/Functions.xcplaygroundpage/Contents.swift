//: Playground - noun: a place where people can play
import Shared

//: All the same
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

//: Returns
scope {
    func doSomething() -> Int {
        return 5
    }
    let value = doSomething()
}