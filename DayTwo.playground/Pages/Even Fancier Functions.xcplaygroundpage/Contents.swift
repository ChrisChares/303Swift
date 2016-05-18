//: [Previous](@previous)

import Shared

//: Filter
scope {
    let array = [1,2,3,4,5]
    array.filter { (input: Int) -> Bool in
        return input % 2 == 0
    }
    array.filter { $0 > 3 }
}

scope {
    let array = [1,2,3,4,5]
    
    typealias FilterFunction = (Int) -> Bool
    
    func filter(xs: [Int], fn: FilterFunction) -> [Int] {
        var result = [Int]()
        for x in xs {
            if fn(x) {
                result.append(x)
            }
        }
        return result
    }
}





//: Map
scope {
    let xs = [1,2,3,4,5]
    xs.map { input in
        return input * 2
    }
}

scope {
    
}






//: [Next](@next)
