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
    
    var temperature = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.label?.text = String(self.temperature)
    }
}
