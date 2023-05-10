//
//  StationViewModel.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 9/5/2566 BE.
//

import Foundation

final class StationViewModel: ObservableObject {
    @Published var searchStation = ""
    @Published var selectedStations = [Station]()
    @Published var allStations = [Station]()
    
    init() {
        getStations()
    }
    
    private func getStations() {
        guard let url = Bundle.main.url(forResource: "Stations", withExtension: "json") else {
            print("DEBUG: JSON file not found")
            return
        }

        guard let data = try? Data(contentsOf: url) else {
            print("DEBUG: Failed to get data from URL -> \(url)")
            return
        }

        do {
            let stations = try JSONDecoder().decode([Station].self, from: data)
            self.allStations = stations
        } catch {
            print("DEBUG: Error decoding JSON data -> \(error.localizedDescription)")
        }
    }
    
    func search(_ input: String, with filterOption: Line) {
        guard input.isEmpty else {
            switch filterOption {
            case .all:
                self.selectedStations = self.allStations.filter { result in
                    result.name!.localizedCaseInsensitiveContains(input)
                }
            default:
                self.selectedStations = self.allStations.filter { result in
                    result.name!.localizedCaseInsensitiveContains(input) && result.line?.lowercased() == filterOption.rawValue
                }
            }
            return
        }
        
        self.selectedStations = self.allStations
        
    }
    
    func updateSearchText(with station: Station) {
        self.searchStation = station.name ?? "Unknown Station"
    }
    
    func filterStations(_ filterOption: Line) {
        switch filterOption {
        case .all:
            self.selectedStations = self.allStations
        default:
            self.selectedStations = self.allStations.filter { $0.line?.lowercased() == filterOption.rawValue }
        }
    
    }
    
}

