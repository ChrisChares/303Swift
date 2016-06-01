//
//  ViewController.swift
//  CrimeMapper
//
//  Created by Chris Chares on 6/1/16.
//  Copyright © 2016 Chris Chares. All rights reserved.
//

import UIKit
import MapKit

typealias JSON = [String: AnyObject]

struct GCD {
    static func dispatchBackground(fn: () -> Void) {
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        dispatch_async(queue, fn)
    }
    
    static func dispatchMain(fn: () -> Void) {
        let queue = dispatch_get_main_queue()
        dispatch_async(queue, fn)
    }
}

enum CrimeMapperError : ErrorType {
    case UnableToParseJSON
}

class Crime : NSObject {
    let name: String
    let latitude: Double
    let longitude: Double
    
    init(json: JSON) throws {
        guard let name = json["title"] as? String,
            let lat = json["lat"] as? Double,
            let lon = json["lon"] as? Double else {
                throw CrimeMapperError.UnableToParseJSON
        }
        
        self.name = name
        self.latitude = lat
        self.longitude = lon
    }
}

extension Crime : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var title: String? { return name }
}


class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            Set initial region
        */
        let denver = CLLocationCoordinate2D(latitude: 39.7391500, longitude: -104.984700)
        let region = MKCoordinateRegion(center: denver, span: MKCoordinateSpanMake(0.05, 0.05))
        mapView.setRegion(region, animated: false)

        /*
            Create a loading spinner
        */
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.startAnimating()
        loadingSpinner.color = UIColor.blackColor()
        self.navigationItem.titleView = loadingSpinner
        
        self.navigationItem.prompt = "Loading..."
        
        /*
            Load all crimes in the background so we don't lock the UI up
        */
        GCD.dispatchBackground {
            
            let startTime = NSDate()
            
            let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")!
            let data = try! NSData(contentsOfFile: path, options: [])
            let jsonArray = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! [JSON]
            
            let crimes = jsonArray.flatMap { try? Crime(json: $0) }
            /*
             Move execution back to the main thread for UI updates
             */
            GCD.dispatchMain {

                self.mapView.addAnnotations(crimes)
                /*
                    Hide progress indicators
                */
                self.navigationItem.prompt = nil
                self.navigationItem.titleView = nil
                
                print("Loaded \(crimes.count) crimes, took \(-1 * startTime.timeIntervalSinceNow) seconds")
            }
        }
    }
}

