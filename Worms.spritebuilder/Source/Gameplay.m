//
//  Gameplay.m
//  Worms
//
//  Created by Santiago Ramirez on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "HUD.h"

@implementation Gameplay {
    CCNode* _player;
    HUD* _hud;
    CCPhysicsNode* _physicsNode;
}

// is called when CCB file has completed loading
- (void)didLoadFromCCB {
    CCLOG(@"Gameplay Started!");
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    _hud = [[HUD alloc] init: _player];
    [self addChild: _hud];
}

// called on every touch in this scene
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
}

// called on every touch in this scene
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

@end
