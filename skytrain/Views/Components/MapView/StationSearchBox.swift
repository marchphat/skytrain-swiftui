//
//  StationSearchBox.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

struct StationSearchBox: View {
    @State private var paddingBottom: CGFloat = 20
    @State private var isShowingStationListView: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                //MARK: - Pointer
                VStack{
                    Circle()
                        .fill(.blue)
                        .frame(width: 10, height: 10)
                        .shadow(
                            color: .black.opacity(0.29),
                            radius: 4,x: 0, y: 4
                        )
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 2, height: 33)
                        .shadow(
                            color: .black.opacity(0.29),
                            radius: 4,x: 0, y: 4
                        )
                    
                    Rectangle()
                        .fill(.red)
                        .frame(width: 10, height: 10)
                        .shadow(
                            color: .black.opacity(0.29),
                            radius: 4,x: 0, y: 4
                        )
                }
                
                //MARK: - Search Box
                VStack (spacing: 10) {
                    HStack{
                        Text("From")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        
                        Text("Current Station")
                            .font(.system(size: 16))
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                self.isShowingStationListView = true
                            }
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .shadow(
                                color: .black.opacity(0.29),
                                radius: 4,x: 0, y: 4
                            )
                    )
                    
                    
                    HStack {
                        Text("To")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        
                        Text("Where to?")
                            .font(.system(size: 16))
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .shadow(
                                color: .black.opacity(0.29),
                                radius: 4,x: 0, y: 4
                            )
                    )
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.horizontal)
            
            
            //MARK: - Button for changing view
            Button {
                
            } label: {
                Text("Directions")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(14)
            .padding(.trailing, 15)
            .padding(.leading, 33)
            .padding(.top, 10)
            .shadow(
                color: .black.opacity(0.29),
                radius: 4,x: 0, y: 4
            )
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .onAppear(perform: {
            withAnimation(.default) {
                self.paddingBottom = 45
            }
        })
        .padding(.horizontal)
        .padding(.bottom, self.paddingBottom)
        .fullScreenCover(isPresented: self.$isShowingStationListView, content: {
            StationListView()
        })
    }
    
}
