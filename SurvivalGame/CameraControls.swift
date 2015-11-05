//
//  CameraControls.swift
//  SurvivalGame
//
//  Created by Maitland Marshall on 2/11/2015.
//  Copyright © 2015 MMarshall. All rights reserved.
//

import Foundation

public class CameraControls : NSObject {
    var _cameraBaseSize: CGSize?
    var _cameraLastPosition : CGPoint?
    var _cameraScale : Double = 1
    var _cameraLastLocation : CGPoint?
    
    override init() {
        super.init()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: "screenWasPinched:")
        let pan = UIPanGestureRecognizer(target: self, action: "screenWasPanned:")
        
        Game.sharedGame.gameScene?.view?.addGestureRecognizer(pinch)
        Game.sharedGame.gameScene?.view?.addGestureRecognizer(pan)
        
        _cameraBaseSize = Game.sharedGame.gameScene!.size
    }
    
    
    func screenWasPinched(pinch : UIPinchGestureRecognizer) {
        _ = pinch.scale
        
        switch pinch.state {
        case .Began:
            _cameraLastPosition = Game.sharedGame.gameScene?.worldNode.position
            pinch.scale = CGFloat(_cameraScale)
        case .Changed:
            _cameraScale = Double(pinch.scale)
            Game.sharedGame.gameScene?.size = CGSize(width: Double(_cameraBaseSize!.width) * _cameraScale, height: Double(_cameraBaseSize!.height) * _cameraScale)
        default: break
        }
    }
    
    func screenWasPanned(pan: UIPanGestureRecognizer) {
        let loc = pan.locationInView(Game.sharedGame.gameScene!.view)
        if(pan.state == UIGestureRecognizerState.Began) {
            _cameraLastLocation = loc
        }
        
        let xDiff = loc.x - _cameraLastLocation!.x,
        yDiff = loc.y - _cameraLastLocation!.y
        
        _cameraLastLocation = loc
        Game.sharedGame.gameScene!.cameraNode.position = CGPoint(x: Game.sharedGame.gameScene!.cameraNode.position.x - xDiff, y: Game.sharedGame.gameScene!.cameraNode.position.y + yDiff)
    }

}