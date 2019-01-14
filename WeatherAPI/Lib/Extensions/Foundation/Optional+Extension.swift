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
    
    func apply<Result>(_ transform: ((Wrapped) -> Result)?) -> Result? {
        return self.flatMap {
            transform?($0)
        }
    }
}
