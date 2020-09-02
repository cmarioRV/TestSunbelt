//
//  MockBreedsRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class MockBreedsRepository: BreedsRepository {
    func getBreeds<T>(completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        
    }
}
