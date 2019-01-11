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
        
        rootView?.getWeather()
        table?.register(UITableViewCell.self, forCellReuseIdentifier: self.id)
        table?.delegate = self
        table?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
//            self.rootView?.weathers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.rootView?.table?.dequeueReusableCell(withIdentifier: self.id)
            ?? UITableViewCell()
        cell.textLabel?.text = "\(self.rootView?.weathers?.name)"
//            self.rootView?.weathers?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(self.rootView?.weathers?[indexPath.row] ?? "")
    }
}
