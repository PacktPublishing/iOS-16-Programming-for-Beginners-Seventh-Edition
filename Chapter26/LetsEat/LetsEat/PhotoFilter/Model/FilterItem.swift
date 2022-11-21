//
//  FilterItem.swift
//  LetsEat
//
//  Created by iOS16Programming on 30/09/2022.
//

import Foundation

struct FilterItem {
    let filter: String?
    let name: String?
    init(dict: [String: String]) {
        self.filter = dict["filter"]
        self.name = dict["name"]
    }
}
