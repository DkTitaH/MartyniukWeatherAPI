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

    private var cancellableObserver = CancellableProperty()
    
    private let countriesManager: CountriesManager
    
    private let countriesModel = DataModels()
    
    init(countriesManager: CountriesManager) {
        self.countriesManager = countriesManager
        
        super.init(nibName: nil, bundle: nil)
        
        self.cancellableObserver.value = self.countriesModel.observer { state in
            let reloadData = self.reloadData
            
            switch state {
            case .didUpdate(_):
                return
            case .didRemove(_):
                reloadData()
            case .didAppend(_):
                reloadData()
            }
        }
        
        self.countriesManager.getCountries(model: self.countriesModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView?.table?.register(CountriesViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withCellClass: CountriesViewCell.self) { cell in
            cell.fillCell(country: self.countriesModel[indexPath.row].value)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requestService = RequestService<WeatherJSON>()
        let manager = WeatherManager(requestService: requestService)
        let weatherViewController = WeatherViewController(weatherManager: manager)
        let country = self.countriesModel[indexPath.row]
        
        country.observer { _ in
            dispatchOnMain {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        weatherViewController.fill(with: country)
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    private func reloadData() {
        dispatchOnMain {
            self.rootView?.table?.reloadData()
        }
    }
}
