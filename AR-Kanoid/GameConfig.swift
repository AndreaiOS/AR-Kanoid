//
//  GameConfig.swift
//  AR-Kanoid
//
//  Created by Andrea Murru on 10/07/2017.
//  Copyright © 2017 Andrea Murru. All rights reserved.
//

import Foundation

struct GameConfig {
    
    static let standard: GameConfig = GameConfig(width: 10, height: 20)
    
    let width: Int
    let height: Int
}
