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
    fileprivate var currentFilter = ""

    init(with cities: [City]) {
        self.cities = cities
    }
    
    
    class func getAllCities() -> [City] {
        return sortedCities()
    }
    
    class func sortedCities() -> [City] {
        guard var sortedCities = try? JSONDecoder().decode([City].self, from: JsonFileManager.readCitiesDataFromJson()) else {
            print("Error: Couldn't decode data into Blog")
            return [City]()
        }
        sortedCities.sort { $0.name < $1.name && $0.country < $1.country }
        return sortedCities
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
