//
//  MapView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject private var stationViewModel = StationViewModel()
    @Binding var previousView: ViewState
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    
    //MARK: - Suvarnabhumi ARL
    private let defaultStation = CLLocationCoordinate2D(latitude:  13.703119561182797, longitude:  100.75187358910955)
    
    private var region: MKCoordinateRegion {
        let centerCoordinate: CLLocationCoordinate2D?
        switch previousView {
        case .searchFromStation:
            centerCoordinate = selectedFromStation?.coordinate
        case .searchToStation:
            centerCoordinate = selectedToStation?.coordinate
        default:
            centerCoordinate = nil
        }
        
        return MKCoordinateRegion(center: centerCoordinate ?? defaultStation,
                                  span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
    }

    
    var body: some View {
        Map(coordinateRegion: .constant(region),
            annotationItems: stationViewModel.allStations) { station in
            
            MapAnnotation(coordinate: station.coordinate) {
                AnnotationView(station: station)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
