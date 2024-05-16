//
//  locationViewModel .swift
//  hikeApp
//
//  Created by 임석현 on R 6/07/07.
//

import Foundation
import UIKit
import CoreLocation

class locationViewModel : UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        // Location Service = ON
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
        } else {
            print("OFF")
        }
    }
    // 위치 정보 계속 업데이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        if let location = locations.first {
            print("위도 : \(location.coordinate.latitude)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
}
