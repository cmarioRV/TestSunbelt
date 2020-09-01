//
//  ApiErrors.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

enum ApiErrors: Error {
    case urlError
    case jsonDecodingError
    case forbidden
    case unauthorized
    case timeout
    case internalServer
    case unknown
}
