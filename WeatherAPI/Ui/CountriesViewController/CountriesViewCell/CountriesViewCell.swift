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
    
    public func fillCell(model: Country) {
        let country = model
        let weather = model.weather
        
        self.countryName?.text = country.name
        self.capitalName?.text = country.capitalName
        self.temperature?.text = weather?.temperature.map { String($0) }
        self.date?.text = weather?.date.map { Date(timeIntervalSince1970: TimeInterval($0)).toString() }
    }
    

}

extension Date {
    
    func toString() -> String {
        return DateFormatter.shortDateFormatterUA.string(from: self)
    }
}

extension DateFormatter {
    
    static var shortDateFormatterUA: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ua_UA")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }
}
