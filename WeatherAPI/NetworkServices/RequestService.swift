//
//  Request.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class RequestService {
    
    public func loadData(url: URL, completion: @escaping F.Completion<(Data?, Error?)>) {
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                completion((data,error))
            }
            .resume()
    }
}
