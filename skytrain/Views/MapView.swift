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
    @Binding var selectedStation: Station

    private let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.703119561182797, longitude: 100.75187358910955), span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {        
        Map(coordinateRegion: .constant(self.region), annotationItems: self.stationViewModel.allStations) { station in
            MapAnnotation(coordinate: station.coordinate) {
                AnnotationView(station: station, selectedStation: self.$selectedStation)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
