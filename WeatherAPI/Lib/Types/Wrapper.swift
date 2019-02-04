//
//  Wrapper.swift
//  WeatherAPI
//
//  Created by Student on 29.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Wrapper<Value>: ObservableObject<Value> {
    
    private(set) var value: Value
    
    init(_ value: Value) {
        self.value = value
    }
    
    public func update(completion: F.Completion<Value>) {
        let value = self.value
        completion(value)
        self.notify(value)
    }
}
