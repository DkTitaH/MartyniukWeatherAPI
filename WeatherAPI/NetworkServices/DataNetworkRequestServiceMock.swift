//
//  DataNetworkRequestService.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class DataNetworkRequestServiceMock: DataNetworkRequestServiceType {
    
    enum DataNetworkRequestServiceMockErrors: Error {
        
        case mockError
    }
    
    var needFailing: Bool
    
    init(needFailing: Bool = false) {
        self.needFailing = needFailing
    }
    
    func scheduledTask(url: URL, completion: @escaping CompletionType) -> NetworkTask {
        let task = NetworkTask(task: .init())
        
        if self.needFailing {
            completion(.failure(NetworkRequestServiceTypeErrors.failed))
            task.cancel()
        } else {
            completion(.success(Data()))
        }
        
        return task
    }
}
