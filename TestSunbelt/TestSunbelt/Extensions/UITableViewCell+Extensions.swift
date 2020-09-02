//
//  UITableViewCell+Extensions.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell
{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
