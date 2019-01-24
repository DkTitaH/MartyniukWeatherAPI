//
//  TableViewCell.swift
//  WeatherAPI
//
//  Created by Student on 16.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    override var reuseIdentifier: String? {
        return toString(type(of: self))
    }
}
