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
