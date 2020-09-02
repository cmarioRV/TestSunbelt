//
//  RemoteBreedDetailRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class RemoteBreedDetailRepository: BaseRepository, BreedDetailRepository {
    let endpoint = "/breeds/search"
    
    func getBreed<T>(name: String, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let url = URL(string: getApiUrl() + "\(endpoint)?q=\(name)") else {
            completionHandler(nil, ApiErrors.urlError)
            return
        }
        
        var request = createRequest(url: url, httpBody: nil, httpMethod: "GET")
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        execute(request, completionHandler: completionHandler)
    }
}
