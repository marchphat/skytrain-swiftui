//
//  StationSearchBar.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import SwiftUI

struct StationSearchBar: View {
    @ObservedObject var stationViewModel = StationViewModel()
    @Binding var text: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray.opacity(0.5))
            
            TextField("Search", text: $text)
        }
        .frame(height: 40)
        .padding(.horizontal, 35)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(red: 118/255, green: 118/255, blue: 118/254, opacity: 12/100))
                .padding(.horizontal, 20)
        )
    }
}


