//
//  MainView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @State private var viewState = ViewState.home
    @State private var selectedFromStation: Station?
    @State private var selectedToStation: Station?
    @State private var previousViewSate: ViewState = ViewState.home
    
    var body: some View {
        ZStack {
            MapView(previuosViewState: $previousViewSate,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation)
            
            switch viewState {
            case .home:
                StationSearchBox(
                    viewState: $viewState,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation
                )
                
            case .searchFromStation, .searchToStation:
                StationListView(
                    viewState: $viewState,
                    selectedFromStation: $selectedFromStation,
                    selectedToStation: $selectedToStation,
                    previousViewState: $previousViewSate
                )
            }
        }
    }
}

