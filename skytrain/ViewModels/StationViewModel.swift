//
//  StationViewModel.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import Foundation

final class StationViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var searchStation = ""
    @Published var selectedStations = [Station]()
    @Published var allStations = [Station]()
    
    // MARK: - Initializer
    init() {
        getStations()
    }
    
    // MARK: - Private Methods
    private func getStations() {
        guard let url = Bundle.main.url(forResource: "Stations", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("JSON file not found or failed to get data from URL")
            return
        }
        
        do {
            let stations = try JSONDecoder().decode([Station].self, from: data)
            allStations = stations
        } catch {
            print("Error decoding JSON data: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Public Methods
    func filterSelectedStation(_ stationLine: Line, viewState: ViewState, selectedFromStation: Station?, selectedToStation: Station?) {
        selectedStations = allStations.filter { station in
            let lineMatch = stationLine == .all || station.line?.lowercased() == stationLine.rawValue
            var searchTextMatch = true
            
            if !searchStation.isEmpty {
                let nameMatch = station.name?.localizedCaseInsensitiveContains(searchStation) == true
                let idMatch = station.id?.localizedCaseInsensitiveContains(searchStation) == true
                searchTextMatch = nameMatch || idMatch
            }
            
            switch viewState {
            case .home:
                return false
            case .searchFromStation:
                return lineMatch && searchTextMatch && station != selectedToStation
            case .searchToStation:
                return lineMatch && searchTextMatch && station != selectedFromStation
            }
        }
    }
    
}
