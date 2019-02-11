//
//  NetworkStateable.swift
//  WeatherAPI
//
//  Created by Student on 11.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

enum NetworkState {
    case inLoad
    case didLoad
    case cancelled
    case idle
}

protocol NetworkStateable {
    
    var status: NetworkState { get }
}
