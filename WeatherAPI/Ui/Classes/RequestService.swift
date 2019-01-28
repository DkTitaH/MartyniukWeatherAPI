//
//  Parser.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class RequestService<ModelType: Decodable> {
    
    public func loadData(url: URL, completion: @escaping F.Completion<(ModelType?, Error?)>) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = data.flatMap { try? JSONDecoder().decode(ModelType.self, from: $0) }
            completion((result,error))
        }.resume()
    }
}
