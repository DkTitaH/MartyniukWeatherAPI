//
//  Date.swift
//  WeatherAPI
//
//  Created by Student on 05.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var shortUA: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ua_UA")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }
}
