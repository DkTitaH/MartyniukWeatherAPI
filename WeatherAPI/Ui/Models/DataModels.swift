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

        case didUpdate(Country)
        case didRemove(Country)
        case didAppend(Country)
    }
    
    private var values = [Country]()
    
    public var count: Int {
        return self.values.count
    }
    
    subscript (index: Int) -> Wrapper<Country> {
        let wrapper = Wrapper(self.values[index])
        
        wrapper.observer {
            self.notify(.didUpdate($0))
        }
        
        return wrapper
    }
    
    public func append(country: Country) {
        self.values.append(country)
        self.notify(.didAppend(country))
    }
    
    public func remove(index: Int) {
        self.values.remove(at: index)
    }
}
