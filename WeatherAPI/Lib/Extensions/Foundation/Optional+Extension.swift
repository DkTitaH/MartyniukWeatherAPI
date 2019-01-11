//
//  Optional+Extension.swift
//  Animation
//
//  Created by Student on 02.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

extension Optional {
    
    func `do`(action: (Wrapped) -> ()) {
        self.map(action)
    }
}
