//
//  StationDetailView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import SwiftUI

struct StationDetailView: View {
    var station: Station
    let backToPreviousView: () -> Void
    
    var body: some View {
        VStack {
            Text(self.station.name ?? "")
                .font(.title)
            
            Text("Latitude: \(self.station.latitude)\nLongitude: \(self.station.longitude)")
                .font(.subheadline)
            
            Button("Back") {
                backToPreviousView()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
        }
    }
}
