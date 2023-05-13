//
//  StationViewModel.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import Foundation
import Alamofire

final class StationViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var searchStation = ""
    @Published var selectedStations = [Station]()
    @Published var allStations = [Station]()
    
    // MARK: - Initializer
    init() {
        fetchStations()
    }
    
    // MARK: - Private Methods
//    private func fetchStations() {
//        guard let url = Bundle.main.url(forResource: "Stations", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            print("JSON file not found or failed to get data from URL")
//            return
//        }
//
//        do {
//            let stations = try JSONDecoder().decode([Station].self, from: data)
//            allStations = stations
//        } catch {
//            print("Error decoding JSON data: \(error.localizedDescription)")
//        }
//    }
    
    private func fetchStations() {
        let url = "https://localhost:7191/api/Station"

        AF.request(url).validate().responseDecodable(of: [Station].self) { [weak self] response in
            guard let self = self else { return }

            switch response.result {
            case .success(let stations):
                self.allStations = stations
                print("เข้าแล้วโว้ย")

            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    private func isMatched(station: Station, selectedLine: StationLine, currentView: ViewState, selectedFromStation: Station?, selectedToStation: Station?) -> Bool {
        let lineMatch = selectedLine == .all || station.line?.lowercased() == selectedLine.rawValue
        var searchTextMatch = true
        
        if !searchStation.isEmpty {
            let nameMatch = station.name?.localizedCaseInsensitiveContains(searchStation) == true
            let idMatch = station.id?.localizedCaseInsensitiveContains(searchStation) == true
            searchTextMatch = nameMatch || idMatch
        }
        
        switch currentView {
        case .home:
            return false
        case .searchFromStation:
            return lineMatch && searchTextMatch && station != selectedToStation
        case .searchToStation:
            return lineMatch && searchTextMatch && station != selectedFromStation
        }
    }
    
    // MARK: - Public Methods
    func filterSelectedStations(selectedLine: StationLine, currentView: ViewState, selectedFromStation: Station?, selectedToStation: Station?) {
        selectedStations = allStations.filter { station in
            return isMatched(station: station,
                             selectedLine: selectedLine,
                             currentView: currentView,
                             selectedFromStation: selectedFromStation,
                             selectedToStation: selectedToStation)
        }
    }
    
}


