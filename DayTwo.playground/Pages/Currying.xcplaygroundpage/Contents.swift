/*:
[Previous](@previous)

## Currying
### It's a thing
 
**From Wikipedia**
 
In mathematics and computer science, currying is the technique of translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument. It was introduced by Gottlob Frege, developed by Moses Schönfinkel, and further developed by Haskell Curry.
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

let redToBlue = curry(UIColor.interpolate)(UIColor.redColor())(UIColor.blueColor())

redToBlue(0.0)
redToBlue(0.25)
redToBlue(0.5)
redToBlue(0.75)
redToBlue(1.0)

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
