//
//  Weather.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Weathers: Codable {
    let name: String
    let id: Int?
    let main: [String : Double]?
}
