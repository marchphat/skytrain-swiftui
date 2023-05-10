import SwiftUI

//struct Item: Identifiable {
//    let id = UUID()
//    let title: String
//}
//
//class SearchViewModel: ObservableObject {
//    
//    @Published var items: [Item] = []
//    @Published var searchText: String = ""
//    
//    init() {
//        loadItems()
//    }
//    
//    private func loadItems() {
//        // Load items from API or local storage
//        let item1 = Item(title: "Item 1")
//        let item2 = Item(title: "Item 2")
//        let item3 = Item(title: "Item 3")
//        items = [item1, item2, item3]
//    }
//}
//
//struct SearchBarView: View {
//    @ObservedObject var viewModel: SearchViewModel
//    
//    var body: some View {
//        TextField("Search", text: $viewModel.searchText)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//    }
//}
//
//struct MyView: View {
//    
//    @StateObject var viewModel1 = SearchViewModel()
//    @StateObject var viewModel2 = SearchViewModel()
//    @State private var selectedViewModel: SearchViewModel?
//    @State private var showDetail = false
//    
//    var filteredItems: [Item] {
//        if selectedViewModel?.searchText == nil {
//            return viewModel1.items + viewModel2.items
//        }
//        else if selectedViewModel?.searchText.isEmpty == true {
//            return selectedViewModel?.items ?? []
//        }
//        else {
//            return selectedViewModel?.items.filter { $0.title.lowercased().contains(selectedViewModel?.searchText.lowercased() ?? "") } ?? []
//        }
//    }
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                SearchBarView(viewModel: viewModel1)
//                    .onTapGesture {
//                        selectedViewModel = viewModel1
//                    }
//                
//                SearchBarView(viewModel: viewModel2)
//                    .onTapGesture {
//                        selectedViewModel = viewModel2
//                    }
//                
//                List(filteredItems) { item in
//                    Text(item.title)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .onTapGesture {
//                            selectedViewModel?.searchText = item.title
//                        }
//                }
//                
//                Button("Go to Detail View") {
//                    showDetail = true
//                }
//                .disabled(selectedViewModel == nil || selectedViewModel?.searchText.isEmpty == true)
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .padding()
//                .fullScreenCover(isPresented: $showDetail, content: {
//                    if let selectedItem = selectedViewModel?.items.first(where: { $0.title == selectedViewModel?.searchText }) {
//                        DetailView(item: selectedItem) {
//                            showDetail = false
//                        }
//                    }
//                })
//            }
//            .navigationTitle("My List")
//            .onAppear {
//                selectedViewModel = nil // Set selectedViewModel to nil to show all data when view appears
//            }
//        }
//    }
//}
//
//
//struct DetailView: View {
//    
//    let item: Item
//    let dismiss: () -> Void // Add a closure to dismiss the view
//    
//    var body: some View {
//        VStack {
//            Text(item.title)
//                .font(.largeTitle)
//                .padding()
//            Button("Back") {
//                dismiss() // Call the dismiss closure to go back to the previous view
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .cornerRadius(10)
//            .padding()
//        }
//    }
//}
//
