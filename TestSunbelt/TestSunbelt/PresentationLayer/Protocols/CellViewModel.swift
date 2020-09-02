//
//  CellViewModel.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

protocol CellViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
