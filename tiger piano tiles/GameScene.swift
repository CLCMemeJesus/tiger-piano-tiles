//
//  GameScene.swift
//  tiger piano tiles
//
//  Created by OWEN WILLIAMS on 4/26/19.
//  Copyright © 2019 clc.williams. All rights reserved.


//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
//size: W186.882, H334.946
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    override func didMove(to view: SKView) {
        
        
        backgroundColor = UIColor.black
        
        TileMaker()
        
        }
    
    func TileMaker(){
        var tile = SKSpriteNode(imageNamed: "baboom")
        tile.position = CGPoint(x: self.size.width, y: self.size.height)
        tile.physicsBody = SKPhysicsBody(rectangleOf: tile.size)
        tile.physicsBody?.pinned = true
        
        
        
        addChild(tile)
    }
    
    
    
}
