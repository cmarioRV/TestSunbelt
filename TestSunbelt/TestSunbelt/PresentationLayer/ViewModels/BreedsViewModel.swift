//
//  BreedsViewModel.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

internal protocol BreedsViewModelInputs {
    func getBreeds()
}

internal protocol BreedsViewModelOutputs {
    var isBussy: Dynamic<Bool> { get }
    var cellViewModels: Dynamic<[BreedCellViewModel]> { get }
}

internal protocol BreedsViewModelType {
    var inputs: BreedsViewModelInputs { get }
    var outputs: BreedsViewModelOutputs { get }
}

internal final class BreedsViewModel: BaseViewModel, BreedsViewModelType, BreedsViewModelInputs, BreedsViewModelOutputs
{
    var inputs: BreedsViewModelInputs { return self }
    var outputs: BreedsViewModelOutputs { return self }
    
    var isBussy = Dynamic(false)
    var cellViewModels = Dynamic([BreedCellViewModel]())
    
    private let breedService: BreedService
    
    init(breedService: BreedService) {
        self.breedService = breedService
        super.init()
    }
    
    func getBreeds() {
        if isBussy.value { return }
        isBussy.value = true
        
        breedService.getBreeds {[weak self] (breeds, error) in
            guard let weakSelf = self else { return }
            guard let breeds = breeds else {
                weakSelf.isBussy.value = false
                return
            }
            
            weakSelf.isBussy.value = false
            weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(breeds: breeds)
        }
    }
    
    private func buildCellViewModels(breeds: [Breed]) -> [BreedCellViewModel] {
        var viewModels = [BreedCellViewModel]()
        
        for breed in breeds {
            let viewModel = BreedCellViewModel(id: breed.id ?? "", name: breed.name ?? "")
            viewModels.append(viewModel)
        }
        
        return viewModels
    }
}
