//
//  StationSearchBarFilter.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 12/5/2566 BE.
//

import SwiftUI

struct StationSearchBarFilter: View {
    @Binding var stationLine: Line
    
    var body: some View {
        Picker(selection: $stationLine, label: Text("Filter By")) {
            Text("ALL").tag(Line.all)
            Text("BTS").tag(Line.bts)
            Text("MRT").tag(Line.mrt)
            Text("ARL").tag(Line.arl)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, 20)
    }
}
