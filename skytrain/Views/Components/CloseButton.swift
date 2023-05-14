//
//  StationSearchCloseButton.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 12/5/2566 BE.
//

import SwiftUI

struct CloseButton: View {
    @Binding var currentView: ViewState
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                DispatchQueue.main.async {
                    currentView = .home
                }
            }
        }) {
            switch currentView {
            case .searchFromStation, .searchToStation:
                ZStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(.secondarySystemBackground))
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(Color(.secondaryLabel))
                }
            case .getRoutes:
                Text("Done")
                    .foregroundColor(Color.blue)
                    .fontWeight(.semibold)
            default:
                Text("Done")
                    .foregroundColor(Color.blue)
                    .fontWeight(.semibold)
            }
        }
    }
}
