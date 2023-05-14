//
//  RouteList.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 15/5/2566 BE.
//

import SwiftUI

struct RouteList: View {
    @Binding var routeStation: [Route]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(routeStation) { route in
                ZStack {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                    
                    RouteDetailsCell(route: route)
                }
                .padding(.vertical, 8)
            }
        }
    }
}
