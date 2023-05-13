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
    
    @Binding var currentView: ViewState
    @Binding var selectedFromStation: Station?
    @Binding var selectedToStation: Station?
    
    private var isInputCompleted: Bool  {
        return selectedFromStation == nil || selectedToStation == nil
    }
    
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
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        
                        Text(selectedFromStation?.name ?? "Starting Station")
                            .font(.system(size: 16))
                            .foregroundColor(selectedFromStation?.name == nil ? .gray.opacity(0.5) : .black)
                            .fontWeight(.medium)
                            .frame(height: 45)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .shadow(
                                color: .black.opacity(0.29),
                                radius: 4,x: 0, y: 4
                            )
                    )
                    .onTapGesture {
                        DispatchQueue.main.async {
                            currentView = .searchFromStation
                        }
                    }
                    
                    
                    HStack {
                        Text("To")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        
                        Text(selectedToStation?.name ?? "Where to?")
                            .font(.system(size: 16))
                            .foregroundColor(selectedToStation?.name == nil ? .gray.opacity(0.5) : .black)
                            .fontWeight(.medium)
                            .frame(height: 45)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .shadow(
                                color: .black.opacity(0.29),
                                radius: 4,x: 0, y: 4
                            )
                    )
                    .onTapGesture {
                        DispatchQueue.main.async {
                            currentView = .searchToStation
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.horizontal)
            
            
            //MARK: - Switching View Button
            Button {
                
            } label: {
                Text("Get directions")
                    .foregroundColor(isInputCompleted ? Color.blue : Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(isInputCompleted ? Color(red: 235/255, green: 235/255, blue: 235/255) : Color.blue)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            .padding(.top, 10)
            .shadow(
                color: .black.opacity(0.29),
                radius: 4,x: 0, y: 4
            )
            .disabled(isInputCompleted)
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .onAppear(perform: {
            withAnimation(.default) {
                paddingBottom = 40
            }
        })
        .padding(.horizontal)
        .padding(.bottom, paddingBottom)
    }
    
}

//struct SearchBox: View {
//    @Binding var selectedFromStation: Station?
//    @Binding var selectedToStation: Station?
//    @Binding var viewState: ViewState
//
//    var body: some View {
//        HStack {
//            PointerView()
//
//            Spacer()
//
//            VStack(spacing: 10) {
//                SearchFieldView(input: $selectedFromStation?.name ?? "Starting Station", inputType: "From") {
//                    viewState = .searchFromStation
//                }
//
//                SearchFieldView(input: $selectedFromStation?.name ?? "Where to?", inputType: "To") {
//                    viewState = .searchToStation
//                }
//            }
//        }
//    }
//}
//
//struct PointerView: View {
//    var body: some View {
//        VStack{
//            Circle()
//                .fill(.blue)
//                .frame(width: 10, height: 10)
//                .shadow(
//                    color: .black.opacity(0.29),
//                    radius: 4,x: 0, y: 4
//                )
//
//            Rectangle()
//                .fill(.black)
//                .frame(width: 2, height: 33)
//                .shadow(
//                    color: .black.opacity(0.29),
//                    radius: 4,x: 0, y: 4
//                )
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 10, height: 10)
//                .shadow(
//                    color: .black.opacity(0.29),
//                    radius: 4,x: 0, y: 4
//                )
//        }
//    }
//}
//
//
//
//struct SearchFieldView: View {
//    @Binding var input: String
//    var inputType: String
//
//    var body: some View {
//        HStack{
//            Text(inputType)
//                .font(.footnote)
//                .fontWeight(.semibold)
//                .foregroundColor(.gray)
//                .frame(width: 40, alignment: .leading)
//
//            Text(input)
//                .font(.system(size: 16))
//                .foregroundColor(input == "Starting Station" || input == "Where to?" ? .gray.opacity(0.5) : .black)
//                .fontWeight(.medium)
//                .frame(height: 45)
//                .frame(maxWidth: .infinity, alignment: .leading)
//        }
//        .padding(.horizontal)
//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .fill(.white)
//                .shadow(
//                    color: .black.opacity(0.29),
//                    radius: 4,x: 0, y: 4
//                )
//        )
//    }
//}
