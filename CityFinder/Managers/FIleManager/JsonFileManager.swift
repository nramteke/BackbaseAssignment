//
//  FileManager.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import Foundation

public final class JsonFileManager {
    
    public static func readCitiesDataFromJson() -> Data {
        guard let path = Bundle.main.path(forResource: AppConstants.jsonFilename, ofType: AppConstants.type, inDirectory: "") else { return Data() }
        
        if let dataString = try? String(contentsOfFile: path), let jsonData = dataString.data(using: String.Encoding.utf8) {
            return jsonData
        } else {
            return Data()
        }
    }
}
