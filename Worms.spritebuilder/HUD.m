//
//  Level1.m
//  Worms
//
//  Created by usern on 11/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "HUD.h"
#import "Gameplay.h"
#import "bullet.h"

@implementation HUD {
    CCNode* _player;
    bool jumping;
    bool sleft;
    bool sright;
    bool wleft;
    bool wright;
    bool wuleft;
    bool wuright;
    OALSimpleAudio *audio;
    int shoottime;
    int jumptime;
    
    CCPhysicsNode* _pnode;
    Gameplay* gameplay;
}

- (id)init:(CCNode*) player {
    if (self = [super init]) {
        [self allFlagsFalse];
        sright = true;
        
        _player = player;
        joy = [[Joystick alloc]init];
        joy.scale = 0.6;
        [self addChild:joy z:10];
        
        // access audio object
        audio = [OALSimpleAudio sharedInstance];
        // play background sound


        [audio preloadEffect:@"gun.mp3"];
        shoottime = 0;
        jumptime = 0;
        
    }
    return self;
}

-(void)update:(CCTime)delta {
    // Comprueba el movimiento hacia la izquierda o derecha
    if ( joy.palanca.velocity.x >= 0.2 ) {
        if ( joy.palanca.velocity.y <= 0.3 && !wright){
            [self allFlagsFalse];
            wright = true;
            NSLog(@"Derecha: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"WalkRight"];
            [_player.physicsBody setVelocity:CGPointMake(100,0)];
        } else if (joy.palanca.velocity.y >= 0.6 && !jumping){
            [self allFlagsFalse];
            jumping = true;
            NSLog(@"Arriba: %f", joy.palanca.velocity.x);
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
        } else if(!wuright && joy.palanca.velocity.y > 0.3 && joy.palanca.velocity.y < 0.6){
            [self allFlagsFalse];
            wuright = true;
            NSLog(@"DiagArribaDerecha: %f", joy.palanca.velocity.x);
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
            [_player.animationManager runAnimationsForSequenceNamed:@"PointAngleRight"];
        }
        
    } else if ( joy.palanca.velocity.x <= -0.2 ) {
        if ( joy.palanca.velocity.y <= 0.3 && !wleft){
            [self allFlagsFalse];
            wleft = true;
            NSLog(@"Izquierda: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"WalkLeft"];
            [_player.physicsBody setVelocity:CGPointMake(-100,0)];
        } else if (joy.palanca.velocity.y >= 0.6 && !jumping){
            [self allFlagsFalse];
            jumping = true;
            NSLog(@"Arriba: %f", joy.palanca.velocity.x);
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
        } else if(!wuleft && joy.palanca.velocity.y > 0.3 && joy.palanca.velocity.y < 0.6){
            [self allFlagsFalse];
            wuleft = true;
            NSLog(@"DiagArribaIzquierda: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"PointAngleLeft"];
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
        }
    }else if(!jumping){
         if (joy.palanca.velocity.y >= 0.7){
             [self allFlagsFalse];
             jumping = true;
             NSLog(@"Arriba: %f", joy.palanca.velocity.x);
             [_player.physicsBody setVelocity:CGPointMake(0,0)];
         }
    }
    
    if ( joy.palanca.velocity.x < 0.2 && joy.palanca.velocity.x > -0.2 && joy.palanca.velocity.y < 0.2 && joy.palanca.velocity.y > -0.2){
        if(wleft || wuleft){
            [self allFlagsFalse];
            [_player.animationManager runAnimationsForSequenceNamed:@"StandLeft"];
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
            sleft = true;
        }
        if(wright || wuright){
            [self allFlagsFalse];
            [_player.animationManager runAnimationsForSequenceNamed:@"StandRight"];
            [_player.physicsBody setVelocity:CGPointMake(0,0)];
            sright = true;
        }
    }
    if(shoottime > 0){
        shoottime = shoottime-delta;
    }
    // Botón A
    if ( joy.botonA.touchInside ) {
        NSLog(@"%d", sleft);
        NSLog(@"%d", sright);
        if(shoottime <=0){
        
        if(wright || sright) {
            [_player.animationManager runAnimationsForSequenceNamed:@"ShootRight"];
            [self shoot:CGPointMake(1,0)];
        } else if (wuright) {
            [_player.animationManager runAnimationsForSequenceNamed:@"ShootAngleRight"];
            [self shoot:CGPointMake(0.5,0.5)];
        } else if (wleft || sleft) {
            [_player.animationManager runAnimationsForSequenceNamed:@"ShootLeft"];
            [self shoot:CGPointMake(-1,0)];
        } else if (wuleft) {
            [_player.animationManager runAnimationsForSequenceNamed:@"ShootAngleLeft"];
            [self shoot:CGPointMake(-0.5,0.5)];
        }
        [audio playEffect:@"gun.mp3"];
            shoottime = 15;
        }
    }
    
    if(jumptime > 0){
        jumptime = jumptime-delta;
    }
    // Botón B

    if ( joy.botonB.touchInside ) {
        if(jumptime <=0){
            if(wright || wuright || sright) {
                [_player.animationManager runAnimationsForSequenceNamed:@"JumpRight"];
                [_player.physicsBody setVelocity:CGPointMake(0,100)];
            } else if (wleft || wuleft || sleft) {
                [_player.animationManager runAnimationsForSequenceNamed:@"JumpLeft"];
                [_player.physicsBody setVelocity:CGPointMake(0,100)];
            }
            //Esto al valor de 60 funciona como deberia, se baja a 10 para testeo
            jumptime = 10;
        }
    }
}

-(void) allFlagsFalse{
    jumping = false;
    sleft = false;
    sright = false;
    wleft = false;
    wright = false;
    wuleft = false;
    wuright = false;
}

-(void) shoot:(CGPoint) p{
    int vel = 200;
    _pnode = (CCPhysicsNode*) [(Gameplay*) _parent physicsNode];
    gameplay = (Gameplay*) _parent;
    
    float rx = p.x;
    float ry = p.y;
    Bullet* bullet = (Bullet*)[CCBReader load:@"Bullet"];
    bullet.enemy = FALSE;
    [bullet setPosition: CGPointMake([gameplay player].position.x + 15, [gameplay player].position.y + 15)];
    float mod = sqrtf((rx*rx)+(ry*ry));
    [_parent addChild: bullet];
    CGPoint rvel = CGPointMake(vel*rx/mod,vel*ry/mod);
    [bullet.physicsBody setVelocity: rvel];
    
}

@end
