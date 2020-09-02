//
//  BaseViewModel.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class BaseViewModel {
    func handleError(error: Error?) -> String
    {
        if error == nil {
            return "Error desconocido"
        }
        
        switch error {
        case is ApiErrors:
            return self.handleApiError(error: error as! ApiErrors)
        default:
            return "Error desconocido"
        }
    }
    
    func handleApiError(error: ApiErrors) -> String {
        switch error {
        case .jsonDecodingError:
            return "Error de formato JSON"
        case .urlError:
            return "Error en la URL"
        case .forbidden:
            return "Recurso no disponible"
        case .internalServer:
            return "Error en el servidor"
        case .timeout:
            return "Error de timeout"
        case .unauthorized:
            return "Recurso no disponible"
        case .unknown:
            return "Error desconocido"
        }
    }
}
