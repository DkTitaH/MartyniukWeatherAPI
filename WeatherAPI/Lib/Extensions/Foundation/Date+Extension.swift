//
//  Date.swift
//  WeatherAPI
//
//  Created by Student on 05.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

extension Date {
    
    public func string() -> String {
        return DateFormatter.shortUA.string(from: self)
    }
}
