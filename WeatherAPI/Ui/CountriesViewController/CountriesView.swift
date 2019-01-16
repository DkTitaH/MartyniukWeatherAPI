//
//  CountriesView.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesView: UIView {
    
    @IBOutlet var table: UITableView?
    
    var countries: [Country]? {
        didSet {
            DispatchQueue.main.async {
                self.table?.reloadData()
            }
        }
    }
    
    func getCountries() {
        let baseUrl = URL(string: "https://restcountries.eu/rest/v2/all")
        guard let url = baseUrl else { return }
        let networkManager = NetworkManager<[Country]>()
        networkManager.loadData(url: url)
        _ = networkManager.observer { state in
            switch state {
            case .didLoad:
                self.countries = networkManager.model
            default:
                return
            }
        }
    }
}


