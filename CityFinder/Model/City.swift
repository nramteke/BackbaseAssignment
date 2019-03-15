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
}

struct Coord: Codable {
    let lon: CLLocationDegrees
    let lat: CLLocationDegrees
}
