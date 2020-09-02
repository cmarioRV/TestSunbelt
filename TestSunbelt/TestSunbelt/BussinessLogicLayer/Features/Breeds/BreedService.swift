//
//  BreedService.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class BreedService {
    let repository : BreedsRepository
    
    init(repository: BreedsRepository) {
        self.repository = repository
    }
    
    func getBreeds(completion: @escaping ([Breed]?, Error?) -> Void) {
        repository.getBreeds(completionHandler: completion)
    }
}
