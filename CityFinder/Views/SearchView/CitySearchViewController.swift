//
//  MasterViewController.swift
//  CityFinder
//
//  Created by Nilesh Ramteke on 16/03/19.
//  Copyright © 2019 Nilesh Ramteke. All rights reserved.
//

import UIKit
import CoreLocation

class CitySearchViewController: UITableViewController,UISearchResultsUpdating {

    var detailViewController: MapViewController? = nil
    var cities = [City]()
    private var filteredCities: [City]?
    private var citySearchManager: CityManager?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cities = CityManager.getAllCities()
        citySearchManager = CityManager(with: cities)
        
        addSearchToNavigationBar()
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? MapViewController
        }
    }

    
    /// Add Search Controller to navigation bar
    fileprivate func addSearchToNavigationBar() {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Enter City"
        search.searchResultsUpdater = self
        search.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = search
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var city: CityInfoViewModel
                if let filteredCities = filteredCities {
                    city = CityInfoViewModel(with: filteredCities[indexPath.row])
                } else {
                    city = CityInfoViewModel(with: cities[indexPath.row])
                }

                let controller = (segue.destination as! UINavigationController).topViewController as! MapViewController
                controller.loadView()
                controller.cityName = city.displayName
                controller.centerCoordinates = city.coord
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let filteredCities = filteredCities {
            return filteredCities.count
        } else {
            return cities.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityInfoTableViewCell
        if let filteredCities = filteredCities {
            cell.configure(with: filteredCities[indexPath.row])
        } else {
            cell.configure(with: cities[indexPath.row])
        }
        return cell
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let aboutViewController = AboutViewController()
        let presenter = Presenter(view: aboutViewController as? AboutView, model: Model())
        aboutViewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: aboutViewController)
        self.navigationController?.pushViewController(navigationController, animated: true)
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            filteredCities = citySearchManager?.getCities(for: text)
        } else {
            filteredCities = nil
        }
        tableView.reloadData()
    }
    
}

