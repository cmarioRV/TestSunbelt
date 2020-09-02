//
//  BreedDetailViewModel.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

internal protocol BreedDetailViewModelInputs {
    func getBreedDetail(name: String)
}

internal protocol BreedDetailViewModelOutputs {
    var isBussy: Dynamic<Bool> { get }
    var errorStr: Dynamic<String> { get }
    var breedDetail: Dynamic<BreedDetail?> { get }
}

internal protocol BreedDetailViewModelType {
    var inputs: BreedDetailViewModelInputs { get }
    var outputs: BreedDetailViewModelOutputs { get }
}

internal final class BreedDetailViewModel: BaseViewModel, BreedDetailViewModelType, BreedDetailViewModelInputs, BreedDetailViewModelOutputs
{
    var inputs: BreedDetailViewModelInputs { return self }
    var outputs: BreedDetailViewModelOutputs { return self }
    
    var isBussy = Dynamic(false)
    var errorStr = Dynamic("")
    var breedDetail: Dynamic<BreedDetail?>
    
    
    private let breedDetailService: BreedDetailService
    
    init(breedDetailService: BreedDetailService) {
        self.breedDetailService = breedDetailService
        self.breedDetail = Dynamic(nil)
        super.init()
    }
    
    func getBreedDetail(name: String) {
        
        if isBussy.value { return }
        isBussy.value = true
        
        breedDetailService.getBreedDetail(name: name) { [weak self] (breedDetails, error) in
            guard let weakSelf = self else { return }
            guard let breedDetails = breedDetails else {
                weakSelf.isBussy.value = false
                weakSelf.errorStr.value = weakSelf.handleError(error: error)
                return
            }
            
            weakSelf.isBussy.value = false
            self?.breedDetail.value = breedDetails.first
        }
    }
}
