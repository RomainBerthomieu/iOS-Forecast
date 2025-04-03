//
//  ForecastItem.swift
//  App
//
//

import Foundation
import UIKit

struct ForecastItem {
    var id = UUID()
    let day: String
    let description: String
    let sunrise, sunset: Int
    let chanceRain: Double
    let high, low: Int
    let type: UIImage
    
    init(
        day: String,
        description: String,
        sunrise: Int,
        sunset: Int,
        chanceRain: Double,
        high: Int,
        low: Int,
        type: String
    ) {
        self.day = day
        self.description = description
        self.sunrise = sunrise
        self.sunset = sunset
        self.chanceRain = chanceRain
        self.high = high
        self.low = low
        self.type = UIImage(named: type) ?? UIImage()
    }
    
    init(fromDTO itemDTO: ForecastItemDTO) {
        self.day = itemDTO.day
        self.description = itemDTO.description
        self.sunrise = itemDTO.sunrise
        self.sunset = itemDTO.sunset
        self.chanceRain = itemDTO.chanceRain
        self.high = itemDTO.high
        self.low = itemDTO.low
        self.type = UIImage(named: itemDTO.type) ?? UIImage()
    }
}

typealias ForecastItems = [ForecastItem]
