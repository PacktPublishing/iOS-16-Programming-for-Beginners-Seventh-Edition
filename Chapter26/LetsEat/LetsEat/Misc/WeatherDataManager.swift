//
//  WeatherDataManager.swift
//  LetsEat
//
//  Created by iOS16Programming on 08/10/2022.
//

import Foundation
import WeatherKit
import CoreLocation

struct WeatherDataManager {
    
    private let weatherService = WeatherService()
    
    func fetchWeather(at restaurantLocation: CLLocation) async -> (String, String) {
        
        let weather = try? await weatherService.weather(for: restaurantLocation)
        if let weather = weather {
            let temperature = weather.currentWeather.temperature
            let symbol = weather.currentWeather.symbolName
            return (symbol, temperature.formatted())
        }
        return ("square.dashed", "--°F")
    }
}
