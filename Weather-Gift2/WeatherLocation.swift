//
//  WeatherLocation.swift
//  Weather-Gift
//
//  Created by Connor on 3/23/20.
//  Copyright © 2020 Connor Sullivan. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}


