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
    
    public func fillCell(model: DataModel) {
        let country = model.country
        
        self.countryName?.text = country.name
        self.capitalName?.text = country.capitalName
        
//        if let weather = model.weather {
            self.temperature?.text = model.weather?.temperature?.description
        self.date?.text = model.weather?.date?.description
//            self.date?.text = model.weather.
//                weather.main?.temp?.rounded().description
//            weather.dt.do { self.date?.text =
//                self.dateUTCtoString(date: Date(timeIntervalSince1970: TimeInterval($0))) }
//        } else {
//            self.temperature?.text = nil
//            self.date?.text = nil
//        }
    }
    
    private func dateUTCtoString(date: Date) -> String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ua_UA")
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            
            return formatter
        }()
        
        return dateFormatter.string(from: date)
    }
}
