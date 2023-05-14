//
//  Station.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import Foundation
import CoreLocation

struct Station: Decodable, Equatable, Identifiable {
    let id: String?
    let name: String?
    let latitude: Double
    let longitude: Double
    let line: String?
    let lineColor: String?
    var arriveTime: String?
    let isExtended: Bool
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "station_id"
        case name = "station_name"
        case latitude = "station_latitude"
        case longitude = "station_longitude"
        case line = "station_line"
        case lineColor = "station_linecolor"
        case arriveTime = "arriveTime"
        case isExtended = "is_extended"
    }
}

enum StationLine: String, CaseIterable {
    case all = "all"
    case bts = "bts"
    case mrt = "mrt"
    case arl = "arl"
}

