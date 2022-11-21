//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by iOS16Programming on 25/09/2022.
//

import Foundation

class LocationDataManager {
    
    private var locations: [String] = []
    
    private func loadData() -> [[String: String]] {
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),
           let locationsData = FileManager.default.contents(atPath: path),
           let locations = try? decoder.decode([[String: String]].self, from: locationsData) {
            return locations
        }
        return [[:]]
    }
    
    func fetch() {
        for location in loadData() {
            if let city = location["city"], let state = location["state"] {
                locations.append("\(city), \(state)")
            }
        }
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index: Int) -> String {
        locations[index]
    }
}
