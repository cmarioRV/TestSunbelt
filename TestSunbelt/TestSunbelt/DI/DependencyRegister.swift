//
//  DependencyRegister.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

class DependencyRegister {
    static func registerTypes(container: Container) {
        
        if (ProcessInfo.processInfo.environment["MOCKS"] != nil) {
            
        }
        else {
            
        }
        
        if (ProcessInfo.processInfo.environment["DEV"] != nil) {
            container.register(BaseApi.self) {_ in DevApi()}
        }
        else {
            container.register(BaseApi.self) {_ in PdnApi()}
        }
    }
}
