//
//  LocationItem.swift
//  LetsEat
//
//  Created by iOS16Programming on 27/09/2022.
//

import Foundation

struct LocationItem: Equatable {
    let city: String?
    let state: String?
}

extension LocationItem {
    init(dict: [String: String]) {
        self.city = dict["city"]
        self.state = dict["state"]
    }
    var cityAndState: String {
        guard let city = self.city, let state = self.state else {
            return ""
        }
        return "\(city), \(state)"
    }
}
