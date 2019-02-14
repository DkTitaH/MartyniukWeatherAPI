//
//  PrecedenceGroups.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

precedencegroup LeftFunctionApplicationPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup RightFunctionApplicationPrecedence {
    associativity: right
    higherThan: LeftFunctionApplicationPrecedence
}

precedencegroup CompositionPrecedence {
    associativity: left
    
    // a • b • c
    // left : (a • b) • c
    // right: a • (b • c)
}
