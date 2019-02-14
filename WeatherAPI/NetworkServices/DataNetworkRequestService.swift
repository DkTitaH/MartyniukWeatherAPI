//
//  Request.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import Alamofire

class DataNetworkRequestService: DataNetworkRequestServiceType {

    public func scheduledTask(url: URL, completion: @escaping CompletionType) -> NetworkTask {
        
        let newRequest = request(url).response { response in
            completion § Result(
                value: response.data,
                error: response.error.map(ignoreInput § returnValue § .failed),
                default: .failed
            )
        }
        
        defer {
            newRequest.resume()
        }
        
        return newRequest.task.map(NetworkTask.init) ?? .canceled()
    }
}

//class DataNetworkRequestService: DataNetworkRequestServiceType {
//
//    public private(set) var session: URLSession
//
//    init(session: URLSession) {
//        self.session = session
//    }
//
//    public func scheduledTask(url: URL, completion: @escaping CompletionType) -> NetworkTask {
//
//        let task = self.session.dataTask(with: url) { (data, response, error) in
//            completion § Result(
//                value: data,
//                error: error.map(ignoreInput § returnValue § .failed),
//                default: .failed
//            )
//        }
//
//        defer { task.resume() }
//
//        return NetworkTask(task: task)
//    }
//}
