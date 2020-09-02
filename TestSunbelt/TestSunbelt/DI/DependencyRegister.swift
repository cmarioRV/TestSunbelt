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
            container.register(BreedsRepository.self) {_ in MockBreedsRepository()}
            container.register(BreedDetailRepository.self) {_ in MockBreedDetailRepository()}
        }
        else {
            container.register(BreedsRepository.self) {_ in RemoteBreedsRepository()}
            container.register(BreedDetailRepository.self) {_ in RemoteBreedDetailRepository()}
        }
        
        if (ProcessInfo.processInfo.environment["DEV"] != nil) {
            container.register(BaseApi.self) {_ in DevApi()}
        }
        else {
            container.register(BaseApi.self) {_ in PdnApi()}
        }
        
        container.register(BreedService.self) {r in BreedService(repository: r.resolve(BreedsRepository.self)!)}
        container.register(BreedDetailService.self) {r in BreedDetailService(repository: r.resolve(BreedDetailRepository.self)!)}
        
        container.register(BreedsViewModelType.self) {r in BreedsViewModel(breedService: r.resolve(BreedService.self)!)}
        container.register(BreedDetailViewModelType.self) {r in BreedDetailViewModel(breedDetailService: r.resolve(BreedDetailService.self)!)}
    }
}
