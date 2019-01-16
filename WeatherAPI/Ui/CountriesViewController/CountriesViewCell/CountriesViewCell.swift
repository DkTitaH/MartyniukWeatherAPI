//
//  CountriesViewCell.swift
//  WeatherAPI
//
//  Created by Student on 16.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesViewCell: TableViewCell {
   
    @IBOutlet var countryName: UILabel?
    @IBOutlet var capitalName: UILabel?
    @IBOutlet var date: UILabel?
    @IBOutlet var temperature: UILabel?
    
    func fillCell(country: Country) {
        self.countryName?.text = country.name
        self.capitalName?.text = country.capital
        self.date?.text = nil
        self.temperature?.text = nil
    }
}
