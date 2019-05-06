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
   // var tileorange = SKSpriteNode()  //wait on this
    
    override func didMove(to view: SKView) {
        
            TileMaker()
        
        print("hi")
        backgroundColor = UIColor.black
        
        
        
        }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func TileMaker(){
        
        tile.position = CGPoint(x: self.size.width, y: random(min: 0, max: self.size.height))
        tile.physicsBody = SKPhysicsBody(rectangleOf: tile.size)
        tile.physicsBody?.pinned = true
        tile.physicsBody?.affectedByGravity = false
        tile.scale(to: CGSize(width: 93.441, height: 200))
        
        addChild(tile)
        
    }
    
    
   /* func orangetile(){
        backgroundColor = UIColor.orange
        
        
        
    }
    */
    
    
    
    
    
    
    
}
