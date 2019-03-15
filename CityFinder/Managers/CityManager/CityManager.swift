//
//  CityManager.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import Foundation

class CityManager {
    var cities: [City]
    var filteredCities = [City]()
    var currentFilter = ""

    init(with cities: [City]) {
        self.cities = cities
    }

    func getCities(for filter: String) -> [City] {
        let lowercasedFilter = filter.lowercased()
        if filter.isEmpty {
            currentFilter = filter
            return cities
        } else {
            if lowercasedFilter.prefix(currentFilter.count) != currentFilter {
                filteredCities = filteredCities.filter { $0.name.lowercased().prefix(lowercasedFilter.count) == lowercasedFilter }
            } else {
                filteredCities = cities.filter { $0.name.lowercased().prefix(lowercasedFilter.count) == lowercasedFilter }
            }
            return filteredCities
        }
    }
}
