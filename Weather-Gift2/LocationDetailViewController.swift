//
//  LocationDetailViewController.swift
//  Weather-Gift2
//
//  Created by Connor on 3/23/20.
//  Copyright © 2020 Connor Sullivan. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var weatherLocation: WeatherLocation!
    var locationIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
    
    func updateUserInterface() {
        let pageViewController = UIApplication.shared.windows.first!.rootViewController as! PageViewController
        weatherLocation = pageViewController.weatherLocations[locationIndex]
        
        dateLabel.text = ""
        placeLabel.text = weatherLocation.name
        temperatureLabel.text = "--°"
        summaryLabel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! LocationListViewController
        let pageViewController = UIApplication.shared.windows.first!.rootViewController as! PageViewController
        destination.weatherLocations = pageViewController.weatherLocations
    }
    
    @IBAction func unwindFromLocationListViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! LocationListViewController
        locationIndex = source.selectedLocationIndex
        let pageViewController = UIApplication.shared.windows.first!.rootViewController as! PageViewController
        pageViewController.weatherLocations = source.weatherLocations

        pageViewController.setViewControllers([pageViewController.createLocationDetailViewController(forPage: locationIndex)], direction: .forward, animated: false, completion: nil)
    }
    
}
