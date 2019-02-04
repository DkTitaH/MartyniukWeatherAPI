//
//  DataModel.swift
//  WeatherAPI
//
//  Created by Student on 21.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

//class DataModel: ObservableObject<DataModel.DataModelEvents> {
//
//    enum DataModelEvents {
//
//        case weatherDidChanged(Weather?)
//        case countryDidChanged(Country?)
//    }
//
//    public var weather: Wrapper<Weather?>
//    public var country: Wrapper<Country>
//
//    init(country: Country, weather: Weather? = nil) {
//        self.country = Wrapper(country)
//        self.weather = Wrapper(weather)
//
//        super.init()
//
//        self.prepareNotifications()
//    }
//
//    private func prepareNotifications() {
//        _ = self.country.observer { country in
//            self.notify(.countryDidChanged(country))
//        }
//
//        _ = self.weather.observer { weather in
//            self.notify(.weatherDidChanged(weather))
//        }
//    }
//}
