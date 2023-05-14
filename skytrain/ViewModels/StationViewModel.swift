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
    @Published var selectedRoutes = [Route]()
    
    private enum APIError: Error {
        case invalidParameters
        case invalidResponse
    }
    
    // MARK: - Initializer
    init() {
        fetchStations()
        fetchRoutes()
    }
    
    // MARK: - Private Methods
    private func fetchRoutes() {
        guard let url = Bundle.main.url(forResource: "Stations", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("JSON file not found or failed to get data from URL")
            return
        }
        
        do {
            let stations = try JSONDecoder().decode([Route].self, from: data)
            selectedRoutes = stations
        } catch {
            print("Error decoding JSON data: \(error.localizedDescription)", "yessssss")
        }
    }
    
    private func fetchStations() {
        let url = "http://127.0.0.1:5214/api/Station"
        
        AF.request(url).validate().responseDecodable(of: [Station].self) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let stations):
                self.allStations = stations
                
                //MARK: - Fetch arrival time for each station and update corresponding Station object
                stations.forEach { station in
                    self.fetchArriveTime(for: station.id) { result in
                        switch result {
                        case .success(let arriveTime):
                            DispatchQueue.main.async {
                                var updatedStation = station
                                updatedStation.arriveTime = arriveTime
                                
                                if let index = self.allStations.firstIndex(where: { $0.id == station.id }) {
                                    self.allStations[index] = updatedStation
                                }
                            }
                        case .failure(let error):
                            print("Error fetching arrival time for station \(station.id ?? ""): \(error.localizedDescription)")
                        }
                    }
                }
                
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchArriveTime(for stationId: String?, completion: @escaping (Result<String, Error>) -> Void) {
        guard let stationId = stationId else {
            completion(.failure(APIError.invalidParameters))
            return
        }
        
        let url = "http://localhost:5214/api/ArriveTime/\(stationId)"
        
        AF.request(url).validate().response { response in
            
            switch response.result {
            case .success(let data):
                if let data = data, let arriveTime = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "") {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm:ss.SSSSSSS"
                    if let date = formatter.date(from: arriveTime) {
                        let minuteSecondFormatter = DateFormatter()
                        minuteSecondFormatter.dateFormat = "mm:ss"
                        let minuteSecondString = minuteSecondFormatter.string(from: date)
                        completion(.success(minuteSecondString))
                        
                    } else {
                        completion(.failure(APIError.invalidResponse))
                    }
                    
                } else {
                    completion(.failure(APIError.invalidResponse))
                }
                
            case .failure(let error):
                completion(.failure(error))
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
        case .searchFromStation:
            return lineMatch && searchTextMatch && station != selectedToStation
        case .searchToStation:
            return lineMatch && searchTextMatch && station != selectedFromStation
        default:
            return false
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
