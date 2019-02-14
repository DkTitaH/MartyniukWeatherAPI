//
//  Result.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

public enum NoError: Error { }

public func lift<Value, Error: Swift.Error>(_ value: Value) -> Result<Value, Error> {
    return .success(value)
}

public func lift<Value, Error: Swift.Error>(_ error: Error) -> Result<Value, Error> {
    return .failure(error)
}

public enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
    
    public var value: Value? {
        return self.analysis(
            success: identity,
            failure: ignoreInput § returnValue § nil
        )
    }
    	
    public var error: Error? {
        return self.analysis(
            success: ignoreInput § returnValue § nil,
            failure: identity
        )
    }

    init(value: Value?, error: Error?, `default`: Error) {
        self = value.map(lift)
            ?? error.map(lift)
            ?? .failure(`default`)
    }
    
    public func analysis<ReturnType>(success: (Value) -> ReturnType, failure: (Error) -> ReturnType) -> ReturnType {
        switch self {
        case let .success(wrapped): return success(wrapped)
        case let .failure(wrapped): return failure(wrapped)
        }
    }
    
    public func bimap<NewValue, NewError>( success: (Value) -> NewValue, failure: (Error) -> NewError) -> Result<NewValue, NewError> {
        return withoutActuallyEscaping(success) { success in
            withoutActuallyEscaping(failure) { failure in
                self.analysis(success: success • lift, failure: failure • lift)
            }
        }
    }
    
    public func mapValue<NewValue>(_ tranform: (Value) -> NewValue) -> Result<NewValue, Error> {
        return self.bimap(success: tranform, failure: identity)
    }
    
    public func mapError<NewError>(_ tranform: (Error) -> NewError) -> Result<Value, NewError> {
        return self.bimap(success: identity, failure: tranform)
    }
    
    public func biflatMap(success: (Value) -> Result, failure: (Error) -> Result) -> Result {
        return self.analysis(success: success, failure: failure)
    }
    
    public func flatMapValue(_ tranform: (Value) -> Result) -> Result {
        return self.biflatMap(success: tranform, failure: lift)
    }
    
    public func flatMapError(_ tranform: (Error) -> Result) -> Result {
        return self.biflatMap(success: lift, failure: tranform)
    }
}
