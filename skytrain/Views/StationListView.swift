//
//  StationListView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import SwiftUI

struct StationListView: View {
    @StateObject var stationViewModel = StationViewModel()
    
    @State private var paddingTop: CGFloat = 429
    @State private var selectedStationLine: Line = .all
    @State private var hasAppeared = false
    
    @Binding var viewState: ViewState
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    @Binding var previousViewState: ViewState
    
    var body: some View {
        VStack {
            StationSearchCloseButton(viewState: $viewState)
            
            
            Text(viewState == .searchFromStation ? "Starting Station" : "Destination Station")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            StationSearchBar(text: $stationViewModel.searchStation)
                .onChange(of: stationViewModel.searchStation) { _ in
                    stationViewModel.filterSelectedStation(selectedStationLine, viewState: viewState, selectedFromStation: selectedFromStation, selectedToStation: selectedToStation)
                }
            
            
            StationSearchBarFilter(stationLine: $selectedStationLine)
                .onChange(of: selectedStationLine) { _ in
                    stationViewModel.filterSelectedStation(selectedStationLine, viewState: viewState, selectedFromStation: selectedFromStation, selectedToStation: selectedToStation)
                }
            
            Divider()
                .padding(.top, 8)
            
            StationSearchList(selectedStation: $stationViewModel.selectedStations,
                              viewState: $viewState,
                              selectedFromStation: $selectedFromStation,
                              selectedToStation: $selectedToStation, previousViewState: $previousViewState)
            
        }
        .padding(.top, paddingTop)
        .background(Color.white)
        .onAppear(perform: {
            stationViewModel.filterSelectedStation(selectedStationLine, viewState: viewState, selectedFromStation: selectedFromStation, selectedToStation: selectedToStation)

            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                paddingTop = 0
            }
        })
        
    }
}

