//
//  Operators.swift
//  WeatherAPI
//
//  Created by Student on 12.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

infix operator •: CompositionPrecedence

public func •<A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> (C)) -> (A) -> C {
    return { g(f($0)) }
}

infix operator |>: LeftFunctionApplicationPrecedence

public func |> <A, B>(value: A, f: (A) -> B) -> B {
    return f § value
}

//f(x)
//f |> x

infix operator §: RightFunctionApplicationPrecedence

public func § <A, B>(f: (A) -> B, value: A) -> B {
    return f(value)
}

infix operator <|: RightFunctionApplicationPrecedence

public func <| <A, B>(f: (A) -> B, value: A) -> B {
    return f § value
}
