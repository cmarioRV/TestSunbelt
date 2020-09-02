//
//  BreedsRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

protocol BreedsRepository {
    func getBreeds<T: Decodable>(completionHandler: @escaping (T?, Error?) -> Void)
}
