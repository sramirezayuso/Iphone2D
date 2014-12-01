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

    HUD* _hud;
    CCPhysicsNode* _physicsNode;
    CCNode* _player;    
    CCNode* _spawn1;
    
    CCNode* _spawn2;
    
    CCNode* _spawn3;
    
    CCNode* _ground;
}

// is called when CCB file has completed loading
- (void)didLoadFromCCB {
    CCLOG(@"Gameplay Started!");
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    _hud = [[HUD alloc] init: _player];
    [self addChild: _hud];
    
    NSArray* spawnPoints = [NSArray arrayWithObjects:_spawn1, _spawn2, _spawn3, _ground, nil];
    
    NSArray* spawned = [NSArray arrayWithObjects: @FALSE, @FALSE, @FALSE, @FALSE, nil];
    
    for (int i = 0 ; i < 3; i++) {
        
        [self spawnEnemy:spawnPoints whenSpawned:spawned];
        
    }
}

// called on every touch in this scene
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
}

// called on every touch in this scene
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

- (void)spawnEnemy:(NSArray *)spawnPoints whenSpawned:(NSArray *)spawned {
    int random = 0; //Calculate random 0 to [spawnPoints count]-1
    while ([spawned objectAtIndex: random] == 0) {
        int random = 1; //Calculate random 0 to [spawnPoints count]-1
    }
    CCNode* enemy = [CCBReader load:@"Enemy"];
    [enemy setPosition: ((CCNode *) [spawnPoints objectAtIndex: 1 /*random*/]).position];
    [_physicsNode addChild: enemy];
    //Set spawned to true
}
@end
