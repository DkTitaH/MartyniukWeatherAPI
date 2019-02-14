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
    
    private let country: Country
    private let weatherManager: WeatherNetworkService
    private let countryObserver = CancellableProperty()
    private var task: NetworkTask?
    
    init(country: Country, weatherNetworkService: WeatherNetworkService) {
        self.weatherManager = weatherNetworkService
        self.country = country
        
        super.init(nibName: nil, bundle: nil)
        
        self.getWeather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareView(with: self.country.weather)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getWeather() {
        let country = self.country
        
        self.countryObserver.value = country.observer { [weak self] state in
            switch state {
            case .didChangeWeather(let weather):
                self?.prepareView(with: weather)
            }	
        }
        
        self.task = self.weatherManager.scheduledTask(country: country)
    }
    
    private func prepareView(with weather: Weather?) {
        performOnMain {
            self.rootView?.fillView(weather: weather)
        }
    }
}
