//
//  Request.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

protocol RequestServiceType {
    
    var task: URLSessionTask? { get }
    
    func loadData(url: URL, completion: @escaping F.Completion<(Data?, Error?)>)
}

class RequestService: RequestServiceType {
    
    var task: URLSessionTask? // TO-DO: Canceling on rewriting
    
    init() {
        //self.status = .idle
    }
    
    public func loadData(url: URL, completion: @escaping F.Completion<(Data?, Error?)>) {
        //self.inLoad
        self.task = URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                //self.status = .didLoad
                completion((data,error))
            }
        
        self.task?.resume()
    }
    
    func cancel() {
        //self.status = .canceled
    }
}
