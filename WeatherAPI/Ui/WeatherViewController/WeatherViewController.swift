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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.weatherManager.observer { weather, error in
            dispatchOnMain {
                weather.do { self.rootView?.fillView(weather: $0) }
                error.do { print($0) }
            }
        }
    }
}
