//
//  MainView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @State private var currentView = ViewState.home
    @State private var selectedFromStation: Station?
    @State private var selectedToStation: Station?
    @State private var previousView: ViewState = ViewState.home
    
    var body: some View {
        ZStack {
            MapView(previousView: $previousView,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation)
            
            switch currentView {
            case .home:
                StationSearchBox(
                    currentView: $currentView,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation
                )
                
            case .searchFromStation, .searchToStation:
                StationListView(
                    currentView: $currentView,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation,
                    previousView: $previousView
                )
                
            case .getRoutes:
                RouteListView(selectedFromStation: $selectedFromStation,
                          selectedToStation: $selectedToStation, currentView: $currentView)
            }
        }
    }
}

