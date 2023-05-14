//
//  Route.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 15/5/2566 BE.
//

import Foundation

struct Route: Decodable, Equatable, Identifiable {
    let id: String?
    let name: String?
    let latitude: Double
    let longitude: Double
    let line: String?
    let lineColor: String?
    var arriveTime: String?
    let isExtended: Bool
    
//    let id: String?
//    let name: String?
//    let line: String?
//    let lineColor: String?
//    var arriveTime: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "station_id"
//        case name = "station_name"
//        case line = "station_line"
//        case lineColor = "station_linecolor"
//        case arriveTime = "arriveTime"
//    }
}
