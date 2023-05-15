//
//  FavoriteThumbnail.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 15/5/2566 BE.
//

import SwiftUI

struct FavoriteThumbnail: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal, 15)
                    .padding(.top, 15)

                Spacer()
            }

            Spacer()

            HStack {
                Text("Station Name")
                    .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)

                Spacer()
            }
        }
        .frame(width: (UIScreen.screenWidth - 60) / 2, height: 120)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
    }
}
