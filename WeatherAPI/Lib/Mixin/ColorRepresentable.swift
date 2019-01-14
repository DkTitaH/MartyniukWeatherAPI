//
//  ColorRepresentable.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

protocol ColorRepresentable {
    
    var opaque: UIColor { get }
    
    func alpha(_ alpha: CGFloat) -> UIColor
}

extension ColorRepresentable where Self: RawRepresentable, Self.RawValue == UInt32 {
    
    var opaque: UIColor {
        return .init(rgba: self.rawValue)
    }
    
    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.opaque.withAlphaComponent(alpha)
    }
}
