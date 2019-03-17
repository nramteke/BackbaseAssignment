//
//  File.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import Foundation
import CoreLocation

class CityInfoViewModel {
    let displayName: String
    let displayCordinate: String
    let coord: CLLocationCoordinate2D
    
    init(with city: City) {
        self.displayName = "\(city.name), \(city.country)"
        self.coord = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        self.displayCordinate = "\(city.coord.lat), \(city.coord.lon)"
    }
}
