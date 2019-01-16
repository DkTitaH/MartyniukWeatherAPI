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
    var wind = 0.0
    var humidity = 0
    var clouds = 0
    var cityName = ""

    func foo(indexPath: IndexPath, countriesViewController: CountriesViewController, completion: @escaping (WeatherViewController?) -> ()) {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
        let mertic = "&units=metric"
        let apiKey = "&APPID=b581214660a55dc1348f6e109cac1104"
        
        let networkManager = NetworkManager<Weather>()
        
        guard let city = countriesViewController.rootView?.countries?[indexPath.row].capital else { return }
        let stringUrl = baseUrl + city + mertic + apiKey
        guard let convertUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        if let url = URL(string: convertUrl) {
            networkManager.loadData(url: url)
        }

        self.cityName = city
        
        _ = networkManager.observer { state in
            switch state {
            case .didLoad:
                networkManager.model.do { weather in
                    let main = weather.main
                    main?["temp"].do { self.temperature = Int($0) }
                    main?["humidity"].do { self.humidity = Int($0) }
                    weather.clouds?["all"].do { self.clouds = $0 }
                    weather.wind?["speed"].do { self.wind = $0 }
                }
                completion(self)
            default:
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.label?.text = "\(self.temperature)°"
        self.rootView?.cloudsData?.text = "\(self.clouds)%"
        self.rootView?.humidityData?.text = "\(self.humidity)%"
        self.rootView?.windSpeedData?.text = "\(self.wind)(m/s)"
        self.rootView?.cityName?.text = self.cityName
    }
}
