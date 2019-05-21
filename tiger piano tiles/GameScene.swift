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
    
    
    
    var scoreLabel: SKLabelNode!
    var counter = 0
    var gameStateIsInGame = true
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    var min: CGFloat = 3.0
    var max: CGFloat = 6.0
    
    var miny: CGFloat = 2.0
    var maxy: CGFloat = 3.0
    
    
    
    
    var tile: SKSpriteNode!
    var lucky: SKSpriteNode!
    var orange: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //TileMaker()
        
        print("hi")
        backgroundColor = UIColor.black
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(TileMaker),SKAction.wait(forDuration: 1.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(orangeTile),SKAction.wait(forDuration: 1.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(luckytile),SKAction.wait(forDuration: 1.0)])))
        
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: 100, y: 100)
        addChild(scoreLabel)
        
        physicsWorld.contactDelegate = self
        
        }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    
    
    

    

    
    func TileMaker(){
        tile = SKSpriteNode(imageNamed: "clc black")
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
        let actualDuration = CGFloat.random(in: min...max)
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
        let actualDuration = CGFloat.random(in: min...max)
        let actionMove = SKAction.move(to: CGPoint(x: orange.position.x, y: 0), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        orange.run(SKAction.sequence([actionMove, actionMoveDone]))
       
    }
    func luckytile(){
        lucky = SKSpriteNode(imageNamed: "tiger paw")
        lucky.name = "baboom3"
        lucky.position = CGPoint(x: random(min: 0, max: self.size.width), y:  self.size.height)
        lucky.physicsBody = SKPhysicsBody(rectangleOf: lucky.size)
        lucky.scale(to: CGSize(width: 93.441, height: 200))
        lucky.physicsBody?.affectedByGravity = false
        lucky.physicsBody?.isDynamic = true
        lucky.physicsBody?.restitution = 1
        lucky.physicsBody?.angularDamping = 0
        lucky.physicsBody?.angularVelocity = 0
        lucky.physicsBody?.friction = 0
        lucky.physicsBody?.allowsRotation = false
        self.addChild(lucky)
        let actualDuration = CGFloat.random(in: 5...6)
        let actionMove = SKAction.move(to: CGPoint(x: lucky.position.x, y: 0), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        lucky.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("hola")
        let touch = touches.first
        if let location = touch?.location(in: self){
            print("WOW")
            for node in self.nodes(at: location){
                print("ooga")
                let spriteNode = node as! SKSpriteNode
                if node.name == "baboom2" {
                    print ("nice")
                    node.removeFromParent()
                 
                    if ("baboom2" != nil){
                        score -= 60
                    }   
                }
               
                if node.name == "babooom"{
                  print("ok")
                    node.removeFromParent()
                    if ("babooom" != nil){
                        score += 1
                        
                    }
                   
                    }
                if node.name == "baboom3"{
                    node.removeFromParent()
                    if ("baboom3" != nil){
                        score += 100
                
                }
                
                }
            }
            
        }
       //change
        
        if score > 500{
            print("change speed")
             min = 2.5
             max = 5.5
        }else{ if score > 1000{
            min = 2.0
            max = 5.0
        }else{ if score > 1500{
            min = 1.5
            max = 4.5
        }else{
            if score > 2000{
                min = 1.0
                max = 4.0
            }else{
                if score > 2500{
                    min = 0.5
                    max = 3.5
                }else{
                    if score > 3000{
                        min = 0.25
                        max = 3.0
                    }else{
                        if score > 3500{
                            min = 0.125
                            max = 2.5
                        }else{
                            if score > 4000{
                                min = 0.0625
                                max = 2.0
                            }
                        }
                    }
                }
            }
            }
            
            }
            
        }
        
        
    }

    
    
    
    

    
    

}
