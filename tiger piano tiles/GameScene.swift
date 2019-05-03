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
    
    
    var tile = SKSpriteNode(imageNamed: "baboom")
    
    
    override func didMove(to view: SKView) {
        
        TileMaker()
        print("hi")
        backgroundColor = UIColor.black
        
        
        
        }
    
    func TileMaker(){
        
        tile.position = CGPoint(x: 200, y: 200)
        tile.physicsBody = SKPhysicsBody(rectangleOf: tile.size)
        tile.physicsBody?.pinned = true
        tile.physicsBody?.affectedByGravity = false
        
        
        addChild(tile)
    }
    
    
    
}
