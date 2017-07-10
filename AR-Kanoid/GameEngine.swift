//
//  GameEngine.swift
//  AR-Kanoid
//
//  Created by Andrea Murru on 10/07/2017.
//  Copyright © 2017 Andrea Murru. All rights reserved.
//


import Foundation
import SceneKit

/** Game engine */
class GameEngine {
    
    let config: GameConfig
    let scene: GameScene
    
    init(_ config: GameConfig, _ scene: GameScene) {
        self.config = config
        self.scene = scene
    }
}
