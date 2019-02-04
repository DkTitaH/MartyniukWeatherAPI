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
    private let requestService: RequestService<[CountryJSON]>
    
    private let model = DataModels()
    
    init(requestService: RequestService<[CountryJSON]>) {
        self.requestService = requestService
        self.countriesManager = CountriesManager(requestService: requestService)
        
        super.init(nibName: nil, bundle: nil)
        
        self.cancellableObserver.value = self.model.observer { state in
            switch state {
                
            case .didUpdate(_):
                <#code#>
            case .didRemove(_):
                self.reloadData()
            case .didAppend(_):
                self.reloadData()
            }
        }
        
        self.countriesManager.getCountries(model: self.model)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.table?.register(CountriesViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withCellClass: CountriesViewCell.self) { cell in
            cell.fillCell(model: self.model.values[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requestService = RequestService<WeatherJSON>()
        let manager = WeatherManager(requestService: requestService)
        let weatherViewController = WeatherViewController(weatherManager: manager)
    
        weatherViewController.fill(with: self.model[indexPath.row])
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    private func reloadData() {
        dispatchOnMain {
            self.rootView?.table?.reloadData()
        }
    }
}


