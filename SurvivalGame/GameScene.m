//
//  GameScene.m
//  SurvivalGame
//
//  Created by Maitland Marshall on 1/11/2015.
//  Copyright (c) 2015 MMarshall. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    
    return self;
}

- (void) centerOnNode:(SKNode*)node
{
    CGPoint posInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - posInScene.x, node.parent.position.y - posInScene.y);
}

-(void)didMoveToView:(SKView *)view {
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    self.worldNode = [SKNode new];
    self.cameraNode = [SKNode new];
    [self.worldNode addChild:self.cameraNode];
    
    SKShapeNode* shape = [SKShapeNode shapeNodeWithCircleOfRadius:100];
    shape.fillColor = [UIColor redColor];
    
    [self.worldNode addChild:shape];
    shape.position = CGPointMake(50, 50);
    
    [self addChild:self.worldNode];
    self.worldNode.position = CGPointMake(0,0);
    self.cameraNode.position = shape.position;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)didSimulatePhysics {
    [super didSimulatePhysics];
    [self centerOnNode:self.cameraNode];
}

@end
