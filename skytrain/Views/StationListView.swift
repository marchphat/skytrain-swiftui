//
//  StationListView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import SwiftUI

//struct StationListView: View {
//    @ObservedObject var stationViewModel = StationViewModel()
//    @State private var changeView = false
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                StationSearchBar(text: self.$stationViewModel.searchStation)
//
//                List(self.stationViewModel.selectedStations) { station in
//                    StationSearchCell(station: station)
//                        .onTapGesture {
//                            self.stationViewModel.updateSearchText(with: station)
//                            self.changeView = true
//                        }
//                        .fullScreenCover(isPresented: self.$changeView, content: {
//                            let selectedStation = self.stationViewModel.selectedStations.first(where: { $0.name == self.stationViewModel.searchStation })
//                            if let station = selectedStation {
//                                StationDetailView(station: station) {
//                                    self.changeView = false
//                                    self.stationViewModel.searchStation = ""
//                                }
//                            }
//                        })
//                }
//            }
//            .navigationTitle("Search")
//            .onChange(of: self.stationViewModel.searchStation) { station in
//                self.stationViewModel.search(station)
//            }
//            .onAppear {
//                self.stationViewModel.search("")
//            }
//        }
//    }
//}


struct StationListView: View {
    @ObservedObject var stationViewModel = StationViewModel()
    @State private var filterOption: ServiceType = .all
    @State private var selectedStation: Station?
    
    
    var body: some View {
        VStack {
            
            //MARK: - Page Title
            Text("Origin Station")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
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
                Text("ALL").tag(ServiceType.all)
                Text("BTS").tag(ServiceType.bts)
                Text("MRT").tag(ServiceType.mrt)
                Text("ARL").tag(ServiceType.arl)
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
        .onAppear {
            self.stationViewModel.search("", with: self.filterOption)
        }
    }
}
