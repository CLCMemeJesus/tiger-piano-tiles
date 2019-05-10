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

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
   // var tileorange = SKSpriteNode()  //wait on this
    
    var tile: SKSpriteNode!
    
    var orange: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //TileMaker()
        
        print("hi")
        backgroundColor = UIColor.black
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(TileMaker),SKAction.wait(forDuration: 1.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(orangeTile),SKAction.wait(forDuration: 2.0)])))
       
        
        physicsWorld.contactDelegate = self
        
        }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    
    
    

    

    
    func TileMaker(){
        tile = SKSpriteNode(imageNamed: "baboom")
        tile.name = "babooom"
        tile.position = CGPoint(x: random(min: 0, max: self.size.width), y:  self.size.height)
        tile.physicsBody = SKPhysicsBody(rectangleOf: tile.size)
        //tile.physicsBody?.pinned = true
        //tile.physicsBody?.affectedByGravity = false
        tile.scale(to: CGSize(width: 93.441, height: 200))
        tile.physicsBody?.affectedByGravity = false
        tile.physicsBody?.isDynamic = true
        tile.physicsBody?.restitution = 1
        tile.physicsBody?.angularDamping = 0
        tile.physicsBody?.angularVelocity = 0
        tile.physicsBody?.friction = 0
        tile.physicsBody?.allowsRotation = false
        self.addChild(tile)
        let actualDuration = CGFloat.random(in: 2.0...4.0)
        let actionMove = SKAction.move(to: CGPoint(x: tile.position.x, y: 0), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        tile.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    
    func orangeTile(){
        
        orange = SKSpriteNode(imageNamed: "picture of an orange")
        orange.name = "baboom2"
        orange.position = CGPoint(x: random(min: 0, max: self.size.width), y:  self.size.height)
        orange.physicsBody = SKPhysicsBody(rectangleOf: orange.size)
        orange.scale(to: CGSize(width: 93.441, height: 200))
        orange.physicsBody?.affectedByGravity = false
        orange.physicsBody?.isDynamic = true
        orange.physicsBody?.restitution = 1
        orange.physicsBody?.angularDamping = 0
        orange.physicsBody?.angularVelocity = 0
        orange.physicsBody?.friction = 0
        orange.physicsBody?.allowsRotation = false
        self.addChild(orange)
    
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("hola")
        let touch = touches.first
        if let location = touch?.location(in: self){
            print("WOW")
            for node in self.nodes(at: location){
                print("ooga")
                let spriteNode = node as! SKSpriteNode
                if node.name == "babooom"{
                    print("ok")
                    node.removeFromParent()
                }
            }
        }
        
    }
                
    
    
    
    
   /* func orangetile(){
        backgroundColor = UIColor.orange
        
        
        
    }
    */
    
    
}
