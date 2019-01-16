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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = self.rootView
        let table = rootView?.table
        
        self.rootView?.getCountries()
        table?.register(CountriesViewCell.self)
        table?.delegate = self
        table?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 47
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 47
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rootView?.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = toString(CountriesViewCell.self)
        let cell = cast(self.rootView?.table?.dequeueReusableCell(withIdentifier: cellName))
            ?? CountriesViewCell()
        
        let country = self.rootView?.countries?[indexPath.row]
        country.do { cell.fillCell(country: $0) }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        weatherViewController.foo(indexPath: indexPath, countriesViewController: self) { weather in
            weather.do {
                if let a = self.rootView?.table?.cellForRow(at: indexPath) as? CountriesViewCell {
                    a.date?.text = "DATE"
                    a.temperature?.text = String($0.temperature)
                }
                self.navigationController?.pushViewController($0, animated: true)
            }
        }
    }
}
