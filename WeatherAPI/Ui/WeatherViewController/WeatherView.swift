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
    
    func fillView(weather: Weather) {
        self.label?.text = weather.temperature?.description
        self.cloudsData?.text = weather.clouds?.description
        self.humidityData?.text = weather.humidity?.description
        self.windSpeedData?.text = weather.windSpeed?.description
        self.cityName?.text = weather.cityName?.description
//        DispatchQueue.main.async {
//            self.label?.text = weather.temperature/
//                data.main?.temp.map { Int($0).description + UnitTemperature.celsius.symbol}
//            self.cloudsData?.text = weather.clouds/
//                data.clouds?.all.map { $0.description + "%" }
//            self.humidityData?.text = weather.humidity/
//               data.main?.humidity.map { $0.description + "%" }
//            self.windSpeedData?.text = weather.windSpeed/
//                data.wind?.speed.map { $0.description + UnitSpeed.metersPerSecond.symbol }
//            self.cityName?.text = weather/
//                data.name
//        }
    }
}


