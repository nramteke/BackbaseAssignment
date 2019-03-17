//
//  CityInfoTableViewCell.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityCoordinates: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(with city: City) {
        cityName.text = "\(city.name), \(city.country)"
        cityCoordinates.text = "Coordinates: \(city.coord.lat), \(city.coord.lon)"
    }
    

}
