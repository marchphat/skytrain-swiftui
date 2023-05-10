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
            print("JSON file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let stations = try? JSONDecoder().decode([Station].self, from: data!)
        self.allStations = stations!
    }
    
    func search(_ input: String, with filterOption: ServiceType) {
        guard input.isEmpty else {
            switch filterOption {
            case .all:
                self.selectedStations = self.allStations.filter { result in
                    result.name!.localizedCaseInsensitiveContains(input)
                }
            default:
                self.selectedStations = self.allStations.filter { result in
                    result.name!.localizedCaseInsensitiveContains(input) && result.serviceType == filterOption.rawValue
                }
            }
            return
        }
        
        self.selectedStations = self.allStations
        
    }
    
    func updateSearchText(with station: Station) {
        self.searchStation = station.name ?? "Unknown Station"
    }
    
    func filterStations(_ filterOption: ServiceType) {
        switch filterOption {
        case .all:
            self.selectedStations = self.allStations
        default:
            self.selectedStations = self.allStations.filter { $0.serviceType == filterOption.rawValue }
        }
    
    }
    
}

