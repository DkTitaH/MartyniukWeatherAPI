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
        case notWorking
        case didStartLoading
        case didLoad
        case didFailedWithError(_ error: Error?)
    }
    
    var model: ModelType?
    
    private(set) var state: State = .notWorking {
        didSet {
            DispatchQueue.main.async {
                self.notify(self.state)
            }
        }
    }
    
    func loadData(url: URL) {
        self.state = .didStartLoading
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = data.flatMap { try? JSONDecoder().decode(ModelType.self, from: $0) }
            if error == nil {
                self.model = result
                self.state = .didLoad
            } else {
                self.state = .didFailedWithError(error)
            }

        }.resume()
    }
}
