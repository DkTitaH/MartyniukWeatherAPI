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
    
    let weatherManager: WeatherManager
    
    private var model: Wrapper<Country>?
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fill(with model: Wrapper<Country>) {
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.model.do {
            self.weatherManager.getWeatherData(model: $0)
            $0.observer {
                self.prepareView(with: $0.weather)
            }
        }
    }
    
    private func prepareView(with weather: Weather?) {
        dispatchOnMain {
            self.rootView?.fillView(weather: weather)
        }
    }
}
