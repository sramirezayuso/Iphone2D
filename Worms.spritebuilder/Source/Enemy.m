//
//  Enemy.m
//  Worms
//
//  Created by usern on 12/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Cocos2d.h"
#import "Enemy.h"
#import "Gameplay.h"
#import "Bullet.h"

@implementation Enemy{
    int shoottimer;
    CCNode* _player;
    CCPhysicsNode* _pnode;
    Gameplay* gameplay;
    OALSimpleAudio* audio;
}

- (id)init {
    self = [super init];
    
    
    if (self) {
        CCLOG(@"Enemy created");
        shoottimer = 100;
    }
    
    audio = [OALSimpleAudio sharedInstance];
    // play background sound
    
    
    [audio preloadEffect:@"gun.mp3"];
    
    return self;
}

-(void) update:(CCTime)delta{
    if(shoottimer>0){
        shoottimer = shoottimer - delta;
    }
    if(shoottimer<=0){
        [self shoot];
        int r = arc4random_uniform(40);
        shoottimer = 80 + r;
    }
}

-(void) shoot{
    int vel = 150;
    _pnode = (CCPhysicsNode*) _parent;
    gameplay = (Gameplay*)[_pnode parent];
    _player = [gameplay player];
    
    float rx = _player.position.x - self.position.x;
    float ry = _player.position.y - self.position.y;
    Bullet* bullet = (Bullet*)[CCBReader load:@"Bullet"];
    bullet.enemy = TRUE;
    [bullet setPosition: CGPointMake(self.position.x + 15, self.position.y + 15)];
    float mod = sqrtf((rx*rx)+(ry*ry));
    //[((Gameplay*)[self parent]).physicsNode addChild: bullet];
    [_parent addChild: bullet];
    CGPoint rvel = CGPointMake(vel*rx/mod,vel*ry/mod);
    [bullet.physicsBody setVelocity: rvel];
    [audio playEffect:@"gun.mp3"];
    if(rx<0){
        [self.animationManager runAnimationsForSequenceNamed:@"ShootLeft"];
    }else{
        [self.animationManager runAnimationsForSequenceNamed:@"ShootRight"];
    }

    
}

@end
