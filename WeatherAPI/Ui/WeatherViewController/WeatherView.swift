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
    
    func fillView(data: Weather) {
        DispatchQueue.main.async {
            self.label?.text = data.main?.temp.map { Int($0).description + UnitTemperature.celsius.symbol}
            self.cloudsData?.text = data.clouds?.all.map { $0.description + "%" }
            self.humidityData?.text = data.main?.humidity.map { $0.description + "%" }
            self.windSpeedData?.text = data.wind?.speed.map { $0.description + UnitSpeed.metersPerSecond.symbol }
            self.cityName?.text = data.name
        }
    }
}


