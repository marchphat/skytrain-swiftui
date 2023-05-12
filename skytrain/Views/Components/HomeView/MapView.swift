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
    @Binding var previuosViewState: ViewState
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    
    //MARK: - Suvarnabhumi ARL
    var defaultStation = CLLocationCoordinate2D(latitude:  13.703119561182797, longitude:  100.75187358910955)
    
    
    private var region: MKCoordinateRegion {
        switch previuosViewState {
        case .searchFromStation:
            let centerCoordinate = selectedFromStation?.coordinate ?? defaultStation
            return MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
        case .searchToStation:
            let centerCoordinate = selectedToStation?.coordinate ?? defaultStation
            return MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
        default:
            let centerCoordinate = defaultStation
            return MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
        }
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region), annotationItems: stationViewModel.allStations) { station in
            MapAnnotation(coordinate: station.coordinate) {
                AnnotationView(station: station)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
