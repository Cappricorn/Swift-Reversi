//
//  Reversi.swift
//  Reversi
//
//  Created by Lukas Schramm on 30.10.15.
//  Copyright © 2015 Lukas Schramm. All rights reserved.
//

import Foundation

class Reversi {
    var board = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: 0))
    var currPlayer = 1
    init() {
        for var y=0;y<8;y++ {
            for var x=0;x<8;x++ {
                board[x][y] = 0
            }
        }
        board[3][3] = 1
        board[4][4] = 1
        board[3][4] = 2
        board[4][3] = 2
        play()
    }
    
    func play() {
        setStone(currPlayer, x:5, y:3)
        setStone(currPlayer, x:5, y:4)
        setStone(currPlayer, x:3, y:5)
        /*setStone(currPlayer, x:5, y:2)
        setStone(currPlayer, x:7, y:7)
        setStone(currPlayer, x:6, y:7)
        setStone(currPlayer, x:5, y:7)*/
    }
    
    func setStone(color:Int, x:Int, y:Int) {
        if board[x][y] == 0 {
            board[x][y] = color
            reverseStones(color, x:x, y:y)
            printBoard()
        } else {
            print("KLINGER")
        }
        changeCurrPlayer()
    }
    
    func printBoard() {
        for var y=0;y<8;y++ {
            for var x=0;x<8;x++ {
                print(board[x][y], terminator:" ")
            }
            print("")
        }
        print("=================")
    }
    
    func reverseStones(color:Int, x:Int, y:Int) {
        let xDirArr = [-1, 0, 1]
        let yDirArr = [-1, 0, 1]
        
        for dirY in yDirArr {
            for dirX in xDirArr {
                var tempX = x
                var tempY = y
                var inbounds = true
                var keeprunning = true
                
                repeat{
                    tempX += dirX
                    tempY += dirY
                    if tempX < 0 || tempX > 7 || tempY < 0 || tempY > 7 {
                        inbounds = false
                    } else if !(board[tempX][tempY] != currPlayer && board[tempX][tempY] != 0) {
                        keeprunning = false
                    }
                } while keeprunning && inbounds
                
                if inbounds {
                    if board[tempX][tempY]==currPlayer {
                        tempX -= dirX
                        tempY -= dirY
                        
                        repeat{
                            board[tempX][tempY]=currPlayer;
                            tempX -= dirX
                            tempY -= dirY
                        } while board[tempX][tempY] != currPlayer && board[tempX][tempY] != 0
                    }
                }
            }
        }
    }
    
    func getOtherPlayer() -> Int {
        if currPlayer == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    func changeCurrPlayer() {
        if currPlayer == 1 {
            currPlayer = 2
        } else {
            currPlayer = 1
        }
    }
}