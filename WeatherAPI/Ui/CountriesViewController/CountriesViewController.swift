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
    
    private var countries: [Country]? {
        didSet {
            DispatchQueue.main.async {
                self.rootView?.table?.reloadData()
            }
        }
    }
    
    private(set) var countriesManager = CountriesManager()
    
    private let model = WeatherModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = self.rootView
        let table = rootView?.table
        let countriesManager = self.countriesManager
        
        countriesManager.getCountries()
        countriesManager.completion = { countries in
            self.countries = countries
        }
        
        table?.register(CountriesViewCell.self)
        table?.delegate = self
        table?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = toString(CountriesViewCell.self)
        let cell = cast(self.rootView?.table?.dequeueReusableCell(withIdentifier: cellName))
            ?? CountriesViewCell()
        
        self.model.country = self.countries?[indexPath.row]
        
        cell.fillCell(model: self.model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        let cityName = self.countries?[indexPath.row].capital
        
        cityName.do { weatherViewController.dataManager.getWeatherData(city: $0) }
        
        self.model.weather = weatherViewController.model.weather
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
