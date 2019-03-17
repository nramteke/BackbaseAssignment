//
//  DetailViewController.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var cityName: String?
    fileprivate let spamDelta = 0.1

    var centerCoordinates: CLLocationCoordinate2D? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    
    func configureView() {
        // Update the user interface for the city on map.
        
        self.title = cityName
        if let centerCoordinates = centerCoordinates {
            // With the region centered in the location (lat and lon) and delta spam of 0.1 to improve zoom closer over the city
            let region = MKCoordinateRegion(center: centerCoordinates, span: MKCoordinateSpan(latitudeDelta: spamDelta, longitudeDelta: spamDelta))
            mapView.setRegion(region, animated: false)
            addAnnotation()
        }
    }
    
    func addAnnotation()
    {
        let annotation = MKPointAnnotation()
        let centerCoordinate = centerCoordinates
        annotation.coordinate = centerCoordinate!
        annotation.title = cityName
        mapView.addAnnotation(annotation)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()

    }
    
    
    
    fileprivate func updateMapView() {
        if let centerCoordinates = centerCoordinates {
            // With the region centered in the location (lat and lon) and delta spam of 0.1 to improve zoom closer over the city
            let region = MKCoordinateRegion(center: centerCoordinates, span: MKCoordinateSpan(latitudeDelta: spamDelta, longitudeDelta: spamDelta))
            mapView.setRegion(region, animated: false)
        }
    }
}


