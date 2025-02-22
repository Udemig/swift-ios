//
//  DriverAnnotation.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 22.02.2025.
//

import Foundation
import MapKit

class DriverAnnotation: NSObject, MKAnnotation{
    dynamic var coordinate: CLLocationCoordinate2D
    var uid: String
    
    init(coordinate: CLLocationCoordinate2D, uid: String) {
        self.coordinate = coordinate
        self.uid = uid
    }
    
    func updateaAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.2) {
            self.coordinate = coordinate
        }
    }
}
