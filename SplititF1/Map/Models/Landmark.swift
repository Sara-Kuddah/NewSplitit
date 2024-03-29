//
//  Landmark.swift
//  Places
//
//  Created by Abeer on 7/29/22.
//

import Foundation

import MapKit

struct Landmark: Identifiable, Hashable {
    
    let placemark: MKPlacemark
    
    let id = UUID()
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
    var coordinateLat: CLLocationDegrees {
        self.placemark.coordinate.latitude
    }
    

    var coordinateLong: CLLocationDegrees {
        self.placemark.coordinate.longitude
    }
   
}
