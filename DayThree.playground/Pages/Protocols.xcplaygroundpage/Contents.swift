/*:
 
 [Previous](@previous)
 
 ## Protocols 
 
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
*/
import Shared

class Pet {
    let name: String
    init(name: String) {
        self.name = name
    }
}
//: Protocols can represent traits
protocol Vocal {
    func vocalize()
}
protocol Flying {
    func fly()
}
extension Flying {
    func fly() {
        print("Flap flap flap")
    }
}
//: Animal subclasses
class Dog : Pet, Vocal {
    func vocalize() {
        print("Dog goes woof")
    }
}
class Parakeet : Pet, Vocal, Flying {
    func vocalize() {
        print("Parakeet goes SQUAAAAK")
    }
}
printScope {
    
    let fido = Dog(name: "Fido")
    print(fido.name)
    fido.vocalize()
    
    let pets: [Pet] = [Dog(name: "Fido"), Parakeet(name: "Flappy")]
    for pet in pets {
        print(pet.name)
    }
    
    let vocalPets = pets.isFilter() as [Vocal]
    let flyingPets = pets.isFilter() as [Flying]
    
    for loudPet in vocalPets {
        loudPet.vocalize()
    }
    print("\n")
    
    for flyingPet in flyingPets {
        flyingPet.fly()
    }
}


//: ### Utilizing Existing Protocols
protocol Sample {
    var whatAmI: String { get set }
}


class Note {
    let author: String
    let message: String
    
    init(author: String, message: String) {
        self.author = author
        self.message = message
    }
    
}

let note = Note(author: "Rick Sanchez", message: "Get: Crystals, Meeseeks Box, Whiskey")

extension Note : CustomStringConvertible {
    var description: String {
       return "\(author)'s Note\n\(message)"
    }
}
print(note)

class LocatedNote : NSObject {
    let author: String
    let message: String
    
    let latitude: Double
    let longitude: Double
    
    init(author: String, message: String, lat: Double, lon: Double) {
        self.author = author
        self.message = message
        latitude = lat
        longitude = lon
    }
    
    override var description: String {
        return "YOLO"
    }
}

let locatedNote = LocatedNote(author: "Rick Sanchez", message: "Crystals, Meeseeks Box, Whiskey", lat: 39.742043, lon: -104.991531)

import MapKit

protocol Annotation {
    var coordinate: CLLocationCoordinate2D { get }
    var title: String? { get }
}


extension LocatedNote : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    var title: String? {
        return "\(author)'s Note"
    }
}

import XCPlayground

@objc protocol AProtocol {
    func doSomething()
    optional func doSomethingElse()
}

class SampleDelegate : NSObject, MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(mapView: MKMapView) {
        print(" Map View Done")
    }
}

let sampleDelegate = SampleDelegate()

let stringURL = "http://google.com"

import Foundation

let url = NSURL(string: stringURL)!
print(url.host)
print(url.lastPathComponent)


let mapView = MKMapView()
mapView.delegate = sampleDelegate
mapView.frame = CGRectMake(0, 0, 320, 320)
mapView.addAnnotation(locatedNote)

//Display it
XCPlaygroundPage.currentPage.liveView = mapView
//: [Next](@next)
