//
//  FilterDataManager.swift
//  LetsEat
//
//  Created by iOS16Programming on 30/09/2022.
//

import Foundation

class FilterDataManager: DataManager {
    func fetch() -> [FilterItem] {
        var filterItems: [FilterItem] = []
        for data in loadPlist(file: "FilterData") {
            filterItems.append(FilterItem(dict: data as! [String: String]))
        }
        return filterItems
    }
}
