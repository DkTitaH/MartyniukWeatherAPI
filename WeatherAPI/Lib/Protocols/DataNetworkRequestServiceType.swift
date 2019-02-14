//
//  DataNetworkRequestServiceType.swift
//  WeatherAPI
//
//  Created by Student on 13.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkRequestServiceTypeErrors: Error {
    case failed
}

protocol DataNetworkRequestServiceType {
    
    typealias CompletionType = F.Completion<Result<Data, NetworkRequestServiceTypeErrors>>
    
    func scheduledTask(url: URL, completion: @escaping CompletionType) -> NetworkTask
}
