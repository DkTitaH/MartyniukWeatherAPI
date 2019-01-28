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
        
        _ = self.countriesManager.observer { countries, error in
            self.models = countries?.compactMap { DataModel(country: $0) }
            error.do { print($0) }
        }
        
        self.countriesManager.getCountries()
        
        self.rootView?.table?.register(CountriesViewCell.self)
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
        let weatherManager = weatherViewController.weatherManager
        let model = self.models?[indexPath.row]
        
        model.do { model in
            model.country.capitalName.do {
                weatherManager.getWeatherData(city: $0)
                _ = weatherManager.observer { weather, error in
                    model.weather = weather
                    error.do { print($0) }
                    dispatchOnMain {
                        tableView.reloadRows(
                            at: [indexPath],
                            with: UITableView.RowAnimation.none
                        )
                    }
                }
            }
        }
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
