//
//  StationListView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var stationViewModel = StationViewModel()
    @State private var filterOption: Line = .all
    @State private var selectedStation: Station?
    @Binding var viewState: ViewState
    @State private var paddingTop: CGFloat = 429
    
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.spring()) {
                    self.viewState = .home
                }
            }) {
                ZStack {
                    Circle()
                        .fill(Color(red: 231/255, green: 231/255, blue: 231/255))
                        .frame(width: 25, height: 25)
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color(red: 108/255, green: 108/255, blue: 108/255))
                }
            }
            .padding(.top, 20)
            .padding(.trailing, 25)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            //MARK: - Page Title
            Text("Origin Station")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //MARK: - Search Bar
            StationSearchBar(text: self.$stationViewModel.searchStation)
                .onChange(of: self.stationViewModel.searchStation) { station in
                    self.stationViewModel.search(station, with: self.filterOption)
                }
            
            //MARK: - Search Bar Filter
            Picker(selection: $filterOption, label: Text("Filter By")) {
                Text("ALL").tag(Line.all)
                Text("BTS").tag(Line.bts)
                Text("MRT").tag(Line.mrt)
                Text("ARL").tag(Line.arl)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            .onChange(of: self.filterOption) { _ in
                self.stationViewModel.filterStations(self.filterOption)
            }
            
            Divider()
                .padding(.top, 8)
            
            //MARK: - List of Stations
            ScrollView (.vertical, showsIndicators: true) {
                ForEach(self.stationViewModel.selectedStations) { station in
                    ZStack {
                        Rectangle()
                            .fill(Color.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedStation = station
                            }
                        
                        StationSearchCell(station: station)
                    }
                    .padding(.top, 8)
                    .fullScreenCover(item: self.$selectedStation) { station in
                        StationDetailView(station: station) {
                            self.selectedStation = nil
                            self.stationViewModel.searchStation = ""
                        }
                    }
                    
                    
                    Divider()
                        .padding(.horizontal, 20)
                }
            }
            
        }
        .padding(.top, paddingTop)
        .onAppear {
            self.stationViewModel.search("", with: self.filterOption)
            
            withAnimation(.default) {
                self.paddingTop = 0
            }
        }
        .background(.white)
    
    }
}
