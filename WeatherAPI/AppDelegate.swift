//
//  AppDelegate.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool
    {
        let requestService = RequestService<[CountryJSON]>()
        let countriesManager = CountriesManager(requestService: requestService)
        
        let navigationController = UINavigationController(
            rootViewController: CountriesViewController(countriesManager: countriesManager)
        )
        
        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            return window
        }()

        return true
    }
}

