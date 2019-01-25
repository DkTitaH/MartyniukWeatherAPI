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
    
    private(set) var weatherManager = WeatherManager()
    
//    public var escapingHandler: F.Completion<WeatherJSON>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
