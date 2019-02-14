//
//  F.swift
//  Animation
//
//  Created by Student on 02.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

enum F {
    
    typealias VoidCompletion = () -> ()
    typealias Execute = () -> ()
    	
    typealias Completion<Value> = (Value) -> ()
}

func when<Result>(_ condition: Bool, execute: () -> Result?) -> Result? {
    return condition ? execute() : nil
}

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}

func toString(_ cls: AnyClass) -> String {
    return String(describing: cls)
}

func identity<Value>(_ value: Value) -> Value {
    return value
}

func ignoreInput<Value, Result>(_ action: @escaping () -> Result) -> (Value) -> Result {
    return { _ in
        action()
    }
}

func returnValue<Value>(_ value: Value) -> () -> Value {
    return { value }
}

func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in
        { f(a, $0) }
    }
}

func uncurry<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (A, B) -> C {
    return { f($0)($1) }
}

func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in
        { f($0)(b) }
    }
}

func performOnMain(execute: @escaping F.Execute) {
    DispatchQueue.main.async(execute: execute)
}

func stringWithPercent( _ value: CustomStringConvertible) -> String {
    return "\(value)%"
}

func stringWithCelsius( _ value: CustomStringConvertible) -> String {
    return "\(value)" + UnitTemperature.celsius.symbol
}

func stringWithMetersPerSecond( _ value: CustomStringConvertible) -> String {
    return "\(value)" + UnitSpeed.metersPerSecond.symbol
}
