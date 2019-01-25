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
            dispatchOnMain { self.rootView?.table?.reloadData() }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = self.rootView
        let table = rootView?.table
        let countriesManager = self.countriesManager
        
        countriesManager.getCountries {
            self.models = $0.map { DataModel(country: $0) }
        }
        
        table?.register(CountriesViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withCellClass: CountriesViewCell.self) { cell in
            self.models.do { models in
                dispatchOnMain { cell.fillCell(model: models[indexPath.row]) }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        
        let index = indexPath.row
        let cityName = self.models?[index].country.capitalName
        
        cityName.do {
            weatherViewController.weatherManager.getWeatherData(city: $0) { weather in
                self.models?[index].weather = weather
                dispatchOnMain {
                    weatherViewController.rootView?.fillView(weather: weather)
                    self.rootView?.table?.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
                }

            }
        }
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
