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
    
    public func fillCell(country: Country) {
        let weather = country.weather
        
        self.countryName?.text = country.name
        self.capitalName?.text = country.capitalName
        self.temperature?.text = weather?.temperature.map(stringWithCelsius)
        self.date?.text = weather?.date.map { Date(timeIntervalSince1970: TimeInterval($0)).string() }
    }
}
