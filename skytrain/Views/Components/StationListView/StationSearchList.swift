//
//  StationSearchList.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 12/5/2566 BE.
//

import SwiftUI

struct StationSearchList: View {
    @Binding var selectedStation: [Station]
    @Binding var viewState: ViewState
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    @Binding var previousViewState: ViewState
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(selectedStation) { station in
                ZStack {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            switch viewState {
                            case .searchFromStation:
                                selectedFromStation = station
                                previousViewState = .searchFromStation
                            case .searchToStation:
                                selectedToStation = station
                                previousViewState = .searchToStation
                            default:
                                print("DEBUG: This view state does not exist.")
                            }

                            
                            withAnimation(.spring()) {
                                DispatchQueue.main.async {
                                    viewState = .home
                                }
                            }
                        }
                    
                    StationSearchCell(station: station)
                }
                .padding(.top, 8)
                Divider().padding(.horizontal, 20)
            }
        }
    }
}
