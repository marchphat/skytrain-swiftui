//
//  RouteView.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 14/5/2566 BE.
//

import SwiftUI
import Drawer

struct RouteListView: View {
    @StateObject private var stationViewModel = StationViewModel()
    
    @State private var isRouteViewShow: Bool = false
    @State private var pointerStraightHeight: CGFloat = 15
    @State private var isLiked = false
    @State private var drawerHeights = drawerDefault
    
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    @Binding var currentView: ViewState

    
    var body: some View {
        Drawer {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(Color(.systemBackground))
                    .shadow(radius: 25)
                
                VStack {
                    Capsule()
                        .foregroundColor(Color(.systemGray4))
                        .frame(width: 50, height: 7)
                        .padding(.top, 10)
                        .padding(.bottom, 14)
                    
                    
                    CloseButton(currentView: $currentView)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("฿20")
                        
                        Text("·")
                        
                        Button(action: {
                            self.isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? .red : .gray)
                                .font(.system(size: 20))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Pointer(straightlineHeight: $pointerStraightHeight)
                        
                        VStack {
                            RouteViewHeader(selectedStation: $selectedFromStation, stationType: "selectedFromStation")
                            
                            RouteViewHeader(selectedStation: $selectedToStation, stationType: "selectedToStation")
                        }
                        .padding(.leading, 5)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    RouteList(routeStation: $stationViewModel.selectedRoutes)
                    
                    Spacer()
                    
                }
            }
            
        }
        .rest(at: $drawerHeights)
        .ignoresSafeArea()
    }
    
}
