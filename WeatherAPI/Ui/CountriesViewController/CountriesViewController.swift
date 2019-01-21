//
//  CountriesViewController.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RootViewRepresentable {
    
    typealias RootView = CountriesView
    
    private let countriesManager = CountriesManager()
    
    private var models: [DataModel]? {
        didSet {
            DispatchQueue.main.async {
                self.rootView?.table?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = self.rootView
        let table = rootView?.table
        let countriesManager = self.countriesManager
        
        countriesManager.getCountries()
        countriesManager.completion = { countries in
            self.models = countries.map { DataModel(country: $0) }
        }
        
        table?.register(CountriesViewCell.self)
        table?.delegate = self
        table?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = toString(CountriesViewCell.self)
        let cell = cast(self.rootView?.table?.dequeueReusableCell(withIdentifier: cellName))
            ?? CountriesViewCell()
        
        self.models.do { cell.fillCell(model: $0[indexPath.row]) }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        
        let index = indexPath.row
        let cityName = self.models?[index].country.capital
        
        cityName.do { weatherViewController.weatherManager.getWeatherData(city: $0) }
        
        weatherViewController.escapingHandler = { weather in
            self.models?[index].weather = weather
            DispatchQueue.main.async {
                self.rootView?.table?.reloadData()
            }
        }
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
