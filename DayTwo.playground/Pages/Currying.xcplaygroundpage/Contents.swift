/*:
[Previous](@previous)

## Currying
### It's a thing
*/
import Shared

func multiply(a: Int, _ b: Int) -> Int {
    return a * b
}
multiply(10, 20)

scope {
    func curriedMultiply(a: Int) -> (Int) -> Int {
        return { b in
            return a * b
        }
    }

    curriedMultiply(10)(20)
    
    let timesTen = curriedMultiply(10)
    timesTen(20)
    timesTen(10)
}

scope {
    let curriedMultiply = curry(multiply)
    
    let timesTen = curriedMultiply(10)
    timesTen(10)
    timesTen(20)
}

print("Hello")

let redToBlue = curry(UIColor.interpolate)(UIColor.redColor())(UIColor.blueColor())


import XCPlayground

let slider = UISlider()
XCPlaygroundPage.currentPage.liveView = slider

class Responder : NSObject {
    func sliderChanged(slider: UISlider) {
        let color = redToBlue(slider.value)
        slider.thumbTintColor = color
        slider.tintColor = color
    }
}

let responder = Responder()

slider.addTarget(responder, action: #selector(Responder.sliderChanged(_:)), forControlEvents: .ValueChanged)

//: [Next](@next)
