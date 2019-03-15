//
//  City.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import Foundation
import CoreLocation

/// City Model
struct City: Codable {
    let country: String
    let name: String
    let _id: Int
    let coord: Coord
    
    init(id: Int, country: String, name: String, coord: Coord) {
        self._id = id
        self.country = country
        self.name = name
        self.coord =  coord
    }
}

struct Coord: Codable {
    let lat: CLLocationDegrees
    let lon: CLLocationDegrees
    
    init(coord : CLLocationCoordinate2D) {
        self.lat = coord.latitude
        self.lon = coord.longitude
    }
}
