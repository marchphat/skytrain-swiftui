//
//  StationSearchCell.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

//                NavigationLink(destination: StationDetailView(station: self.station)) {
//                    VStack(alignment: .leading) {
//                        Text(self.station.name ?? "")
//                            .font(.headline)
//                        Text("\(self.station.latitude), \(self.station.longitude)")
//                            .font(.subheadline)
//                    }
//                }


//        VStack(alignment: .leading) {
//            Text(self.station.name ?? "")
//
//            Text("\(self.station.latitude), \(self.station.longitude)")
//        }


import SwiftUI

struct StationSearchCell: View {
    var station: Station
    @State var image_name: String = "questionmark"
    
    var body: some View {
        HStack {
            
            //MARK: - Station Logo
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.gray.opacity(0.2), lineWidth: 4)
                    )
                
                Image(self.image_name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            
            //MARK: - Station Details
            VStack(alignment: .leading) {
                HStack {
                    Text(self.station.id ?? "ID Not found")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Text(self.station.name ?? "Unknown Station")
                    .font(.body)
                    .lineLimit(1)
                
            }
            .padding(.leading, 10)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        .onAppear {
            switch self.station.serviceType {
            case "BTS":
                self.image_name = "bts-logo"
            case "MRT":
                self.image_name = "mrt-logo"
            case "ARL":
                self.image_name = "arl-logo"
            default:
                self.image_name = "questionmark-logo"
            }
        }
        
    }
}
