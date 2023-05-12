//
//  StationSearchCell.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//
import SwiftUI

struct StationSearchCell: View {
    @State var image_name: String = "questionmark-logo"
    var station: Station
    
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
                
                Image(image_name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            
            //MARK: - Station Details
            VStack(alignment: .leading) {
                HStack {
                    Text(station.id ?? "ID not found.")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Text(station.name ?? "Station not found.")
                    .font(.body)
                    .lineLimit(1)
                
            }
            .padding(.leading, 10)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        .onAppear {
            switch station.line {
            case "bts":
                image_name = "bts-logo"
            case "mrt":
                image_name = "mrt-logo"
            case "arl":
                image_name = "arl-logo"
            default:
                image_name = "questionmark-logo"
            }
        }
        
    }
}