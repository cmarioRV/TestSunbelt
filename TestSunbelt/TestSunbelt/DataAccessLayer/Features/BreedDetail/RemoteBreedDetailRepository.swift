//
//  RemoteBreedDetailRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class RemoteBreedDetailRepository: BaseRepository, BreedDetailRepository {
        
    let searchBreedEndpoint = "/breeds/search"
    let searchImageEndpoint = "/images/search"
    
    func getBreed<T>(name: String, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let urlString = (getApiUrl() + "\(searchBreedEndpoint)?q=\(name)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            completionHandler(nil, ApiErrors.urlError)
            return
        }
        
        var request = createRequest(url: url, httpBody: nil, httpMethod: "GET")
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        execute(request, completionHandler: completionHandler)
    }
    
    func getImageUrl<T>(breeId: String, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let urlString = (getApiUrl() + "\(searchImageEndpoint)?breed_id=\(breeId)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            completionHandler(nil, ApiErrors.urlError)
            return
        }
        
        var request = createRequest(url: url, httpBody: nil, httpMethod: "GET")
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        execute(request, completionHandler: completionHandler)
    }
}
