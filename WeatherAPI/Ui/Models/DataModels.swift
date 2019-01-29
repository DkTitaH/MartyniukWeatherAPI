//
//  DataModels.swift
//  WeatherAPI
//
//  Created by Student on 29.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class DataModels: ObservableObject<DataModel.DataModelEvents> {
    
    typealias Models = [DataModel]
    
    private(set) var values: Models
    
    init(with models: Models) {
        self.values = models
        
        super.init()
        
        self.prepareNotifications()
    }
    
    private func prepareNotifications() {
        self.values.forEach { [weak self] model in
            (self?.notify).do { _ = model.observer(handler: $0) }
        }
    }
}
