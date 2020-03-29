//
//  HourlyCollectionViewCell.swift
//  Weather-Gift2
//
//  Created by Connor on 3/28/20.
//  Copyright © 2020 Connor Sullivan. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var hourlyTemperature: UILabel!
    @IBOutlet weak var hourlyPrecipProbability: UILabel!
    @IBOutlet weak var raindropImageView: UIImageView!
    
    var hourlyWeather: HourlyWeather! {
        didSet {
            hourLabel.text = hourlyWeather.hour
            iconImageView.image = getIconImage(iconName: hourlyWeather.hourlyIcon)
            hourlyTemperature.text = "\(hourlyWeather.hourlyTemperature)°"
            hourlyPrecipProbability.text = "\(hourlyWeather.hourlyPrecipProbability)%"
            if hourlyWeather.hourlyPrecipProbability >= 20 {
                hourlyPrecipProbability.isHidden = false
                raindropImageView.isHidden = false
            } else {
                hourlyPrecipProbability.isHidden = true
                raindropImageView.isHidden = true
            }
        }
    }
    
    func getIconImage(iconName: String) -> UIImage{
        switch iconName {
        case "clear-day": return UIImage(systemName: "sun.max") ?? UIImage()
        case "clear-night": return UIImage(systemName: "moon") ?? UIImage()
        case "rain": return UIImage(systemName: "cloud.rain") ?? UIImage()
        case "snow": return UIImage(systemName: "snow") ?? UIImage()
        case "sleet": return UIImage(systemName: "cloud.sleet") ?? UIImage()
        case "wind": return UIImage(systemName: "wind") ?? UIImage()
        case "fog": return UIImage(systemName: "cloud.fog") ?? UIImage()
        case "cloudy": return UIImage(systemName: "cloud") ?? UIImage()
        case "partly-cloudy-day": return UIImage(systemName: "cloud.sun") ?? UIImage()
        case "partly-cloudy-night": return UIImage(systemName: "cloud.moon") ?? UIImage()
        case "hail": return UIImage(systemName: "cloud.hail") ?? UIImage()
        case "thunderstorm": return UIImage(systemName: "cloud.bolt.rain") ?? UIImage()
        case "tornado": return UIImage(systemName: "tornado") ?? UIImage()
        default:
            return UIImage(systemName: "questionmark.diamond") ?? UIImage()
        }
    }
}
