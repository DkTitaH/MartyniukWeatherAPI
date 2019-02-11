
//
//  RootViewRepresentable.swift
//  Animation
//
//  Created by Student on 03.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

protocol RootViewRepresentable {
    
    associatedtype RootView: UIView
}

extension RootViewRepresentable where Self: UIViewController {
    
    var rootView: RootView? {
        return cast(self.viewIfLoaded)
    }
}
