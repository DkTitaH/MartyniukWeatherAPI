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

    private let id = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = self.rootView
        let table = rootView?.table
        
        self.rootView?.getCountries()
        table?.register(UITableViewCell.self, forCellReuseIdentifier: self.id)
        table?.delegate = self
        table?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rootView?.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.rootView?.table?.dequeueReusableCell(withIdentifier: self.id)
            ?? UITableViewCell()
        cell.textLabel?.text = self.rootView?.countries?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let city = self.rootView?.countries?[indexPath.row].capital else { return }
        self.rootView?.getWeather(city: city)
    }
}
