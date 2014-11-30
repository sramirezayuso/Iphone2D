//
//  Gameplay.m
//  Worms
//
//  Created by Santiago Ramirez on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay {
    CCNode *_player;
}

// is called when CCB file has completed loading
- (void)didLoadFromCCB {
    CCLOG(@"Gameplay Started!");
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
}

// called on every touch in this scene
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"It Tingles!");
    [_player.animationManager runAnimationsForSequenceNamed:@"WalkRight"];
}

// called on every touch in this scene
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    [_player.animationManager runAnimationsForSequenceNamed:@"StandRight"];
}

@end
