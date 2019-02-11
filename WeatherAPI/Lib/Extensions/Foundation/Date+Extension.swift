//
//  Date.swift
//  WeatherAPI
//
//  Created by Student on 05.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

public enum LocaleIndentificators: String {
    
    case ua = "ua_UA"
}

extension Date {
    
    public func string(locale identifier: LocaleIndentificators) -> String {
        let dateFormatter = DateFormatter.short
        dateFormatter.locale = Locale(identifier: identifier.rawValue)
        
        return dateFormatter.string(from: self)
    }
}
