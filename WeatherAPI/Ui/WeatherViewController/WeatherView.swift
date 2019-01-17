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
            self.label?.text = Int(data.main.temp).description + "°"
            self.cloudsData?.text = data.clouds.all.description + "%"
            self.humidityData?.text = data.main.humidity.description + "%"
            self.windSpeedData?.text = data.wind.speed.description + "(m/s)"
            self.cityName?.text = data.name
        }
    }
}


