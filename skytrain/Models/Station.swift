//
//  Station.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import Foundation
import CoreLocation

struct Station: Identifiable, Codable, Equatable {
    let id: String?
    let name: String?
    let latitude: Double
    let longitude: Double
    let serviceType: String?
    let departure: Int
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}

enum ServiceType: String, CaseIterable {
    case all = "ALL"
    case bts = "BTS"
    case mrt = "MRT"
    case arl = "ARL"
}

