//
//  GameScene.swift
//  AR-Kanoid
//
//  Created by Andrea Murru on 10/07/2017.
//  Copyright © 2017 Andrea Murru. All rights reserved.
//

import Foundation
import SceneKit

class GameScene {
    
    private static let wallColor = UIColor(red:0, green:0, blue:0.5, alpha:0.5)
    private static let floorColor = UIColor(red:0, green:1.0, blue:0, alpha:1.0)
    
    private let cell: Float = 0.05
    
    private let config: GameConfig
    private let scene: SCNScene
    private let x: Float
    private let y: Float
    private let z: Float
    
    private var frame: SCNNode!
    
    init(_ config: GameConfig, _ scene: SCNScene, _ x: Float, _ y: Float, _ z: Float) {
        self.config = config
        self.scene = scene
        self.x = x
        self.y = y
        self.z = z
        self.frame = createWallFrame(config.width, config.height)
        scene.rootNode.addChildNode(self.frame)
    }
    
    private func createWallFrame(_ width: Int, _ height: Int) -> SCNNode {
        let node = SCNNode()
        for i in 1...width + 1 {
            addLine(to: node, 0.001, cell * Float(height + 3), 0.001, Float(i), 0, 0)
            addLine(to: node, 0.001, cell * Float(height + 3), 0.001, Float(i), 0, 1)
        }
        for i in 0...height + 3 {
            addLine(to: node, cell * Float(width), 0.001, 0.001, 1, Float(i), 0)
            addLine(to: node, cell * Float(width), 0.001, 0.001, 1, Float(i), 1)
        }
        for i in 1...width + 1 {
            for j in 0...height + 3 {
                addLine(to: node, 0.001, 0.001, cell, Float(i), Float(j), 1)
            }
        }
        return node
    }
    
    
    private func addLine(to node: SCNNode, _ w: Float, _ h: Float, _ l: Float, _ x: Float, _ y: Float, _ z: Float) {
        let line = SCNBox(width: cg(w), height: cg(h), length: cg(l), chamferRadius: 0)
        let matrix = SCNMatrix4Translate(translate(x - 0.5, y, z - 0.5), w / 2, h / 2, -l / 2)
        node.addChildNode(createNode(line, matrix, GameScene.wallColor))
    }
    
    
    private func createNode(_ geometry: SCNGeometry, _ matrix: SCNMatrix4, _ color: UIColor) -> SCNNode {
        let material = SCNMaterial()
        material.diffuse.contents = color
        // use the same material for all geometry elements
        geometry.firstMaterial = material
        let node = SCNNode(geometry: geometry)
        node.transform = matrix
        return node
    }
    
    private func translate(_ x: Float, _ y: Float, _ z: Float = 0) -> SCNMatrix4 {
        return SCNMatrix4MakeTranslation(self.x + x * cell, self.y + y * cell, self.z + z * cell)
    }
    
    private func cg(_ f: Float) -> CGFloat { return CGFloat(f) }
    
}

extension SCNMatrix4 {
    func scale(_ s: Float) -> SCNMatrix4 { return SCNMatrix4Scale(self, s, s, s) }
}

