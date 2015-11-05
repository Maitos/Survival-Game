//
//  Game.swift
//  SurvivalGame
//
//  Created by Maitland Marshall on 2/11/2015.
//  Copyright © 2015 MMarshall. All rights reserved.
//

import Foundation

public class Game: NSObject {
    static let sharedGame = Game()
    
    var gameScene : GameScene?
    var cameraControls : CameraControls?
}