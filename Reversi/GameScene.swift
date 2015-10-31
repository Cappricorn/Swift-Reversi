//
//  GameScene.swift
//  Reversi
//
//  Created by Lukas Schramm on 31.10.15.
//  Copyright (c) 2015 Lukas Schramm. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.scaleMode = .ResizeFill
        
        // Draw the board
        drawBoard()
        // Add a game piece to the board
        if let square = squareWithName("b7") {
            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
            gamePiece.size = CGSizeMake(24, 24)
            square.addChild(gamePiece)
        }
        if let square = squareWithName("e3") {
            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
            gamePiece.size = CGSizeMake(24, 24)
            square.addChild(gamePiece)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    
    func drawBoard() {
        // Board parameters
        let numRows = 8
        let numCols = 8
        let squareSize = CGSizeMake(32, 32)
        let xOffset:CGFloat = 50
        let yOffset:CGFloat = 50
        // Column characters
        let alphas:String = "abcdefgh"
        // Used to alternate between white and black squares
        var toggle:Bool = false
        for row in 0...numRows-1 {
            for col in 0...numCols-1 {
                // Letter for this column
                let colChar = Array(alphas.characters)[col]
                // Determine the color of square
                let color = toggle ? SKColor.whiteColor() : SKColor.blackColor()
                let square = SKSpriteNode(color: color, size: squareSize)
                square.position = CGPointMake(CGFloat(col) * squareSize.width + xOffset,
                    CGFloat(row) * squareSize.height + yOffset)
                // Set sprite's name (e.g., a8, c5, d1)
                square.name = "\(colChar)\(8-row)"
                self.addChild(square)
                toggle = !toggle
            }
            toggle = !toggle
        }
    }
    
    func squareWithName(name:String) -> SKSpriteNode? {
        let square:SKSpriteNode? = self.childNodeWithName(name) as! SKSpriteNode?
        return square
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
