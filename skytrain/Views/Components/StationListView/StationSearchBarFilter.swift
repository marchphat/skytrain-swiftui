//
//  StationSearchBarFilter.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 12/5/2566 BE.
//

import SwiftUI

struct StationSearchBarFilter: View {
    @Binding var selectedStationLine: StationLine
    
    var body: some View {
        Picker(selection: $selectedStationLine, label: Text("Filter By")) {
            Text("ALL").tag(StationLine.all)
            Text("BTS").tag(StationLine.bts)
            Text("MRT").tag(StationLine.mrt)
            Text("ARL").tag(StationLine.arl)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, 20)
    }
}
