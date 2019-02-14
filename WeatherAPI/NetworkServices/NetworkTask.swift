//
//  NetworkTask.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import Alamofire

class NetworkTask: Cancellable, NetworkStateable {
    
    public var status = NetworkState.idle
    
    public var isCancelled = false
    
    private let task: URLSessionTask
    
    init(task: URLSessionTask) {
        self.task = task
    }
    
    public func cancel() {
        self.task.cancel()
        self.isCancelled = true
        self.status = .cancelled
    }
}
