//
//  RemoteCategoriesRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class RemoteCategoriesRepository: BaseRepository, CategoriesRepository {
    
    let endpoint = "categories"
    
    func userInfo<T>(completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let url = URL(string: getApiUrl() + endpoint) else {
            completionHandler(nil, ApiErrors.urlError)
            return
        }
        
        var request = createRequest(url: url, httpBody: nil, httpMethod: "GET")
        request.addValue("33a14455-7a53-4da1-bffe-570f824bfad3", forHTTPHeaderField: "x-api-key")
        execute(request, completionHandler: completionHandler)
    }
}
