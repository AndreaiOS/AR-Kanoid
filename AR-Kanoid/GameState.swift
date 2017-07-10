//
//  GameState.swift
//  AR-Kanoid
//
//  Created by Andrea Murru on 10/07/2017.
//  Copyright © 2017 Andrea Murru. All rights reserved.
//

import Foundation

/** Tetris game state: current tetromino and its position in the well */
class GameState {
    
    let index: Int
    let rotation: Int
    let x: Int
    let y: Int
    
    private init(_ index: Int, _ rotation: Int, _ x: Int, _ y: Int) {
        self.index = index
        self.rotation = rotation
        self.x = x
        self.y = y
    }
}
