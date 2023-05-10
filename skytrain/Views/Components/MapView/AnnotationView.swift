//
//  annotationView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct AnnotationView: View {
    let station: Station
    @State private var showSelected: Bool = false
    @State var image_name: String = "questionmark-pin"
    @Binding var selectedStation: Station

    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(width: 50, height: 50)

                Image(self.image_name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            Image(systemName: "arrowtriangle.down.fill")
                .font(.system(size: 10, weight: .black))
                .foregroundColor(Color(.systemBackground))
                .offset(x: 0, y: -5)
            
        }
        .compositingGroup()
        .scaleEffect(self.showSelected ? 1.8 : 1, anchor: .bottom)
        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: self.showSelected)
        .onTapGesture {
            self.selectedStation = self.station
        }
        .onChange(of: self.selectedStation) { newStation in
            if self.station.id != newStation.id {
                self.showSelected = false
            } else {
                self.showSelected.toggle()
            }
        }
        .onAppear {
            switch self.station.line {
            case "bts":
                self.image_name = "bts-green-pin"
            case "mrt":
                self.image_name = "mrt-pin"
            case "arl":
                self.image_name = "arl-pin"
            default:
                self.image_name = "questionmark-pin"
            }
        }
    }
}
