//
//  MockCategoriesRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class MockCategoriesRepository: CategoriesRepository {
    func userInfo<T>(completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        
    }
}
