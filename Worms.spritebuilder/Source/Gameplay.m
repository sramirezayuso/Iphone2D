//
//  Gameplay.m
//  Worms
//
//  Created by Santiago Ramirez on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "HUD.h"
#import "Bullet.h"

@implementation Gameplay{

    HUD* _hud;
    CCPhysicsNode* _physicsNode;
    CCNode* _player;
    CCNode* _spawn1;
    
    CCNode* _spawn2;
    
    CCNode* _spawn3;
    
    CCNode* _ground;

    NSArray* spawnPoints;
    NSArray* spawned;
    int enemies;
}

int _enemieskilled;

// is called when CCB file has completed loading
- (void)didLoadFromCCB {
    CCLOG(@"Gameplay Started!");
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    _hud = [[HUD alloc] init: _player];
    [self addChild: _hud];
    enemies = 0;
    _enemieskilled = 0;
    spawnPoints = [NSArray arrayWithObjects:_spawn1, _spawn2, _spawn3, _ground, nil];
    
    spawned = [NSArray arrayWithObjects: @FALSE, @FALSE, @FALSE, @FALSE, nil];
    
    
    [_physicsNode setCollisionDelegate:self];
}

-(void) update:(CCTime)delta{
    if(enemies<=0){
        [self spawnEnemies];
        enemies = 3;
    }
    
}

// called on every touch in this scene
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
}

// called on every touch in this scene
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

- (void)spawnEnemies {
    int i;
    for(i=0;i<3;i++){
        CCNode* enemy = [CCBReader load:@"Enemy"];
        [enemy setPosition: ((CCNode *) [spawnPoints objectAtIndex: i /*random*/]).position];
        [_physicsNode addChild: enemy];
    }
}

-(CGPoint)playerPos{
    return _player.position;
}

//Bala Enemigo
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bullet:(Bullet *)nodeA Enemy:(CCNode *)nodeB {
    NSLog(@"MUERTO %d",nodeA.enemy);
    if(nodeA.enemy){
        return NO;
    }
    [nodeB removeFromParent];
    [nodeA removeFromParent];
    enemies = enemies - 1;
    _enemieskilled = _enemieskilled+1;
    return NO;
}

//Bala Plataforma
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bullet:(CCNode *)nodeA Platform:(CCNode *)nodeB {
    return NO;
}

//Bala Pared
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bullet:(CCNode *)nodeA Wall:(CCNode *)nodeB {
    [nodeA removeFromParent];
    return NO;
}

//Bala Bala
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bullet:(CCNode *)nodeA Bullet:(CCNode *)nodeB {
    return NO;
}

//Bala PLayer
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Bullet:(Bullet *)nodeA Player:(CCNode *)nodeB {
    if(nodeA.enemy){
        [nodeB removeFromParent];
        CCScene *gameplayScene = [CCBReader loadAsScene:@"GameOver"];
        [[CCDirector sharedDirector] replaceScene:gameplayScene];
        
    }
    return NO;
}

//Enemy Player
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Player:(Bullet *)nodeA Enemy:(CCNode *)nodeB {
    return NO;
}
@end
