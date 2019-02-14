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

    private var countries: Countries {
        didSet {
            self.getCountries()
        }
    }
    
    private let countriesObserver = CancellableProperty()
    
    private let countriesNetworkService: CountriesNetworkService
    
    private var task = CancellableProperty()
    
    init(countries: Countries, countriesNetworkService: CountriesNetworkService) {
        self.countriesNetworkService = countriesNetworkService
        self.countries = countries
        
        super.init(nibName: nil, bundle: nil)
        
        self.getCountries()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.table?.register(CountriesViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withCellClass: CountriesViewCell.self) { cell in
            let country = self.countries[indexPath.row]
            
            cell.country = country
            cell.events = {
                cell.countryContainer.value?.cancel()
                switch $0 {
                case .needUpdateCell:
                    performOnMain {
                        tableView.reloadRows(at: [indexPath], with: .none)
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataNetworkRequestService = DataNetworkRequestService()
        let weatherNetworkService = WeatherNetworkService(requestService: dataNetworkRequestService)
        
        let weatherViewController = WeatherViewController(
            country: self.countries[indexPath.row],
            weatherNetworkService: weatherNetworkService
        )
        
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    private func getCountries() {
        self.countriesObserver.value = self.countries.observer { [weak self] state in
            let reloadData = self?.reloadData
            switch state {
            case .didRemove:
                reloadData?()
            case .didRewritedCountries:
                reloadData?()
            case .didAppendCountry:
                reloadData?()
            }
        }
        
        self.task.value = self.countriesNetworkService.scheduledTask(model: self.countries)
    }
    
    private func reloadData() {
        performOnMain {
            self.rootView?.table?.reloadData()
        }
    }
}
