//
//  NetworkTask+Failed.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension NetworkTask {
    
    class func canceled() -> NetworkTask {
        let task = NetworkTask(task: .init())
        
        task.isCancelled = true
        
        return task
    }
}
