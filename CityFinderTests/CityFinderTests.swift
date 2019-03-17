//
//  CityFinderTests.swift
//  CityFinderTests
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import XCTest
@testable import CityFinder
import CoreLocation

class CityFinderTests: XCTestCase {

    /*
    * Alabama, US
    * Albuquerque, US
    * Anaheim, US
    * Arizona, US
    * Sydney, AU
 */
    
    
    let citiesManager = CityManager(with :[City.init(id: 1234, country: "US", name: "Alabama", coord:  Coord.init(coord:(CLLocationCoordinate2D(latitude: 44.549999, longitude: 34.283333)))),
                                    City.init(id: 1234, country: "US", name: "Albuquerque", coord:  Coord.init(coord:(CLLocationCoordinate2D(latitude: 44.549999, longitude: 34.283333)))),
                                    City.init(id: 1234, country: "US", name: "Anaheim", coord:  Coord.init(coord:(CLLocationCoordinate2D(latitude: 44.549999, longitude: 34.283333)))),
                                    City.init(id: 1234, country: "US", name: "Arizona", coord:  Coord.init(coord:(CLLocationCoordinate2D(latitude: 44.549999, longitude: 34.283333)))),
                                    City.init(id: 1234, country: "AU", name: "Sydney", coord:  Coord.init(coord:(CLLocationCoordinate2D(latitude: 44.549999, longitude: 34.283333))))
        
        ])
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadJsonData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(JsonFileManager.readCitiesDataFromJson())
    }

    func testEmptyFilter() {
        let result = citiesManager.getCities(for: "")
        XCTAssertTrue(result.count == 5)
    }
    
    
    func testSFilter() {
        let result = citiesManager.getCities(for: "S")
        XCTAssertTrue(result.count == 1)
    }
    
    func testALFilter() {
        let result = citiesManager.getCities(for: "AL")
        XCTAssertTrue(result.count == 2)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
