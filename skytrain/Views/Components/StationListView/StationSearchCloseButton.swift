//
//  StationSearchCloseButton.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 12/5/2566 BE.
//

import SwiftUI

struct StationSearchCloseButton: View {
    @Binding var currentView: ViewState
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                DispatchQueue.main.async {
                    currentView = .home
                }
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
    }
}
