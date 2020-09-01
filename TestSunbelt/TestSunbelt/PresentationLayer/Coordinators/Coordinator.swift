//
//  AppCoordinator.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

class Coordinator {
    private var children: [Coordinator] = []
    
    func add(child: Coordinator) {
        guard !children.contains(where: { $0 === child }) else {
            return
        }
        
        children.append(child)
    }
    
    func remove(child: Coordinator) {
        guard let index = children.index(where: { $0 === child }) else {
            return
        }
        
        children.remove(at: index)
    }
    
    func removeAll() {
        children.removeAll()
    }
}
