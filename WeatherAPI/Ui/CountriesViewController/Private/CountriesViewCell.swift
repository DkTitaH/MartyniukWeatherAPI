//
//  CountriesViewCell.swift
//  WeatherAPI
//
//  Created by Student on 16.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

enum CountriesViewCellEvents {
    
    case needUpdateCell
}

class CountriesViewCell: TableViewCell {
   
    @IBOutlet var countryName: UILabel?
    @IBOutlet var capitalName: UILabel?
    @IBOutlet var date: UILabel?
    @IBOutlet var temperature: UILabel?
    
    public var country: Country? {
        didSet {
            self.fill()
            
            self.prepareObserver()
        }
    }
    
    public var events: F.Completion<CountriesViewCellEvents>?
    
    private let countryContainer = CancellableProperty()
    
    private func fill() {
        let country = self.country
        let weather = country?.weather
        
        let date = weather?.date.map { Date(timeIntervalSince1970: TimeInterval($0)) }
        
        self.countryName?.text = country?.name
        self.capitalName?.text = country?.capitalName
        self.temperature?.text = weather?.temperature.map(stringWithCelsius)
        self.date?.text = date?.string(locale: .ua)
    }
    
    private func prepareObserver() {
        self.countryContainer.value = self.country?.observer { events in
            switch events {
            case .didChangeWeather(_):
                dispatchOnMain {
                    self.fill()
                    
                    self.events?(.needUpdateCell)
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.countryContainer.value?.cancel()
    }
}
