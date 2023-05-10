//
//  MainView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedStation: Station = Station(id: "", name: "", latitude: 0.0, longitude: 0.0, serviceType: "", departure: 0)
    
    var body: some View {
        ZStack {
            MapView(selectedStation: self.$selectedStation)
            
            StationSearchBox()
        }
    }
}
