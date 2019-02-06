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
    
    private let country: ObservableWrapper<Country>
    private let weatherManager: WeatherNetworkService
    
    init(country: ObservableWrapper<Country>, weatherNetworkService: WeatherNetworkService) {
        self.weatherManager = weatherNetworkService
        self.country = country
        
        super.init(nibName: nil, bundle: nil)
        
        country.observer {
            self.prepareView(with: $0.weather)
        }
        
        self.weatherManager.getWeatherData(country: country)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareView(with weather: Weather?) {
        dispatchOnMain {
            self.rootView?.fillView(weather: weather)
        }
    }
}
