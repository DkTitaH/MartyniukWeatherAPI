//
//  WeatherViewController.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = WeatherView
    
    let weatherManager = WeatherManager()
    
    private var model: DataModel?
    
    func fill(with model: DataModel?) {
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = self.weatherManager.observer { weather, error in
            weather.do { value in
                self.prepareView(with: value)
                self.model?.weather.value = value
            }
            error.do { print($0) }
        }
        self.weatherManager.getWeatherData(city: self.model?.country.value.capitalName ?? "")
    }
    
    private func prepareView(with weather: Weather) {
        dispatchOnMain {
            self.rootView?.fillView(weather: weather)
        }
    }
}
