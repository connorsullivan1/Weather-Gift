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
    
    func getData() {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkykey)/\(coordinates)"
        
        print("we are accessing the URL \(urlString)")
        //Create URL
        guard let url = URL(string: urlString) else {
            print("ERROR: COuldnt Not Create a URL from \(urlString)")
            return
        }
        
        //Create Session
        let session = URLSession.shared
        
        // Get data with .dataTask Method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            } catch {
                print("JSON ERROR:\(error.localizedDescription)")
            }
        }
        task.resume()
    }
}


