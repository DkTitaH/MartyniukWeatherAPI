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
        case didFailedWithError(_ error: Error?)
    }
    
    public var model: ModelType?
    
    public func loadData(url: URL) {
        self.notify(.didStartLoading)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = data.flatMap { try? JSONDecoder().decode(ModelType.self, from: $0) }
            result.do {
                self.model = $0
                self.notify(.didLoad)
            }
            error.do { self.notify(.didFailedWithError($0)) }
        }.resume()
    }
}
