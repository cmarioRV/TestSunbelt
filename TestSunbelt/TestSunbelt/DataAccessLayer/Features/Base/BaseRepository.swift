//
//  BaseRepository.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class BaseRepository {
    private let applicationJson = "application/json"
    private let headerContentType = "Content-Type"
    private let baseApi = AppDelegate.diContainer.resolve(BaseApi.self)
    
    func getApiUrl() -> String {
        return baseApi!.apiURL()
    }
    
    func createRequest(url: URL, httpBody: Data?, httpMethod: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue(applicationJson, forHTTPHeaderField: headerContentType)
        request.httpBody = httpBody
        
        return request
    }
    
    func execute<T: Decodable>(_ urlRequest: URLRequest, completionHandler: @escaping (T?, Error?) -> Void) {
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: urlRequest)  { data, response, error in
            
            guard let responseStatus = response as? HTTPURLResponse, responseStatus.isResponseOK() else {
                if let httpResponse = response as? HTTPURLResponse {
                    completionHandler(nil, self.handleError(response: httpResponse))
                    return
                }
                
                completionHandler(nil, ApiErrors.unknown)
                return
            }
            
            guard let data = data, error == nil else {
                completionHandler(nil, ApiErrors.unknown)
                return
            }
            
            var entityResponse: T?
            
            do {
                entityResponse = try JSONDecoder().decode(T.self, from: data)
            } catch {
                completionHandler(nil, ApiErrors.jsonDecodingError)
                return
            }
            
            completionHandler(entityResponse, nil)
        }
        
        dataTask.resume()
    }
    
    func handleError(response: HTTPURLResponse) -> ApiErrors {
        
        switch response.statusCode {
        case 500:
            return ApiErrors.internalServer
        case 504:
            return ApiErrors.timeout
        case 401:
            return ApiErrors.unauthorized
        case 403:
            return ApiErrors.forbidden
        default:
            return ApiErrors.unknown
        }
    }
}

extension HTTPURLResponse {
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}
