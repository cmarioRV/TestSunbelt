//
//  BreedDetailService.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class BreedDetailService {
    let repository: BreedDetailRepository
    
    init(repository: BreedDetailRepository) {
        self.repository = repository
    }
    
    func getBreedDetail(name: String, completion: @escaping ([BreedDetail]?, Error?) -> Void) {
        repository.getBreed(name: name, completionHandler: completion)
    }
}
