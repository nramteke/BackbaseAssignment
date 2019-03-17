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
            let region = MKCoordinateRegion(center: centerCoordinates, span: MKCoordinateSpan(latitudeDelta: spamDelta, longitudeDelta: spamDelta))
            mapView.setRegion(region, animated: false)
            addAnnotation()
        }
    }
    
    
    /// Add annotation to Map View
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
    
    
    
    /// Update the mapview with city location
    fileprivate func updateMapView() {
        if let centerCoordinates = centerCoordinates {
            let region = MKCoordinateRegion(center: centerCoordinates, span: MKCoordinateSpan(latitudeDelta: spamDelta, longitudeDelta: spamDelta))
            mapView.setRegion(region, animated: false)
        }
    }
}


