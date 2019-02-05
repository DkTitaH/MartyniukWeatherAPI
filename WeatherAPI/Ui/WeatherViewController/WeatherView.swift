//
//  View.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet var label: UILabel?
    @IBOutlet var cloudsData: UILabel?
    @IBOutlet var humidityData: UILabel?
    @IBOutlet var windSpeedData: UILabel?
    @IBOutlet var cityName: UILabel?
    
    public func fillView(weather: Weather?) {
        self.label?.text = weather?.temperature.map(stringWithCelsius)
        self.cloudsData?.text = weather?.clouds.map(stringWithPercent)
        self.humidityData?.text = weather?.humidity.map(stringWithPercent)
        self.windSpeedData?.text = weather?.windSpeed.map(stringWithMetersPerSecond)
        self.cityName?.text = weather?.cityName
    }
}


