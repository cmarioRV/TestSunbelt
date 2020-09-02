//
//  BreedCell.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

class BreedCell: UITableViewCell, CellConfigurable {
    
    var viewModel: BreedCellViewModel?
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? BreedCellViewModel else { return }
        self.viewModel = viewModel
        self.textLabel?.text = viewModel.name
        self.detailTextLabel?.text = viewModel.id
    }
}
