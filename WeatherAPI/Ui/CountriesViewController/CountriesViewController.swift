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
    
    private var model: DataModels? {
        didSet {
            _ = model?.observer { state in
                switch state {
                case .weatherDidChanged(_):
                    dispatchOnMain {
                        self.rootView?.table?.reloadData()
                    }
                case .countryDidChanged(_):
                    return
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.countriesManager.observer { dataModel, error in
            dataModel.do { self.model = $0 }
            error.do { print($0) }
        }
        
        self.rootView?.table?.register(CountriesViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.values.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withCellClass: CountriesViewCell.self) { cell in
            self.model.do { model in
                dispatchOnMain { cell.fillCell(model: model.values[indexPath.row]) }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        let model = self.model?.values[indexPath.row]
        weatherViewController.fill(with: model)
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
