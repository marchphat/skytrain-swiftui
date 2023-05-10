//
//  MainView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedStation = Station(id: "", name: "", latitude: 0.0, longitude: 0.0, line: "", lineColor: "", arriveTime: "", isExtended: false)
    @State private var viewState = ViewState.home
    
    var body: some View {
        ZStack {
            MapView(selectedStation: self.$selectedStation)
            
            switch viewState {
            case .home:
                StationSearchBox(viewState: self.$viewState)
                
            case .searchingForStation:
                StationListView(viewState: self.$viewState)
            }
        }
    }
}
