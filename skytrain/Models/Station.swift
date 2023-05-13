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
    let line: String?
    let lineColor: String?
    let arriveTime: String?
    let isExtended: Bool
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}

enum StationLine: String, CaseIterable {
    case all = "all"
    case bts = "bts"
    case mrt = "mrt"
    case arl = "arl"
}

