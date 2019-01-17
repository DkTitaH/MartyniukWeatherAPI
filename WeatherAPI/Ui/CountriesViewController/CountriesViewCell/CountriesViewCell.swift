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
    
    func fillCell(model: WeatherModel) {
        self.countryName?.text = model.country?.name
        self.capitalName?.text = model.country?.capital
        self.date?.text = "asadasd"
        self.temperature?.text = model.weather?.main.temp.description
    }
}
