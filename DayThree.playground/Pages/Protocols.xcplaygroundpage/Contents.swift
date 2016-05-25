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
    func fly() {
        print("Parakeet flap flap flaps away")
    }
}
printScope {
    let pets: [Pet] = [Dog(name: "Fido"), Parakeet(name: "Flappy")]
    
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
class Note {
    let author: String
    let message: String
    
    init(author: String, message: String) {
        self.author = author
        self.message = message
    }
}

let note = Note(author: "Rick Sanchez", message: "Get: Crystals, Meeseeks Box, Whiskey")
print(note)

//extension Note : CustomStringConvertible {
//    var description: String {
//       return "\(author)'s Note\n\(message)"
//    }
//}

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
}

let locatedNote = LocatedNote(author: "Rick Sanchez", message: "Crystals, Meeseeks Box, Whiskey", lat: 39.742043, lon: -104.991531)

import MapKit

extension LocatedNote : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    var title: String? {
        return "\(author)'s Note"
    }
}

import XCPlayground

let mapView = MKMapView()
mapView.frame = CGRectMake(0, 0, 320, 320)
mapView.addAnnotation(locatedNote)

//Display it
XCPlaygroundPage.currentPage.liveView = mapView
//: [Next](@next)
