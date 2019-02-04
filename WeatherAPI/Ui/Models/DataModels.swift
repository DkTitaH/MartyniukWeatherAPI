//
//  DataModels.swift
//  WeatherAPI
//
//  Created by Student on 29.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class DataModels: ObservableObject<DataModels.DataModelEvents> {
    
    enum DataModelEvents {

        case didUpdate(DataModels)
        case didRemove(DataModels)
        case didAppend(DataModels)
    }
    
    private(set) var values = [Country]()
    
    subscript (index: Int) -> Wrapper<Country> {
        let wrapper = Wrapper(self.values[index])
        
        wrapper.observer {_ in 
            self.update()
        }
        
        return wrapper
    }
    
    public func append(country: Country) {
        self.values.append(country)
        self.notify(.didAppend(self))
    }
    
    public func remove(index: Int) {
        self.values.remove(at: index)
    }
    
    public func update() {
        self.notify(.didUpdate(self))
    }
    
//    private func prepareNotifications() {
//        self.values.forEach {
//            $0.weather
//        }
//        self.values.forEach { [weak self] model in
//            (self?.notify).do { _ = model.observer(handler: $0) }
//        }
//    }
}
