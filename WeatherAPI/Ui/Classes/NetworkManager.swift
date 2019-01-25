//
//  Parser.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class NetworkManager<ModelType>: ObservableObject<NetworkManager.State> where ModelType: Decodable {
    
    public enum State {
        case didStartLoading
        case didLoad
        case didFailWithError( _ error: Error?)
    }
    
    public func loadData(url: URL, completion: @escaping F.Completion<(ModelType?, Error?)>) {
        self.notify(.didStartLoading)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = data.flatMap { try? JSONDecoder().decode(ModelType.self, from: $0) }
            self.notify(.didLoad)
            completion((result,error))
        }.resume()
    }
}
