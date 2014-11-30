//
//  Level1.m
//  Worms
//
//  Created by usern on 11/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "HUD.h"

@implementation HUD {
    CCNode* _player;
    bool jumping;
    bool wleft;
    bool wright;
    bool wuleft;
}

- (id)init:(CCNode*) player {
    if (self = [super init]) {
        _player = player;
        joy = [[Joystick alloc]init];
        joy.scale = 0.6;
        [self addChild:joy z:10];
        
    }
    return self;
}

-(void)update:(CCTime)delta {
    // Comprueba el movimiento hacia la izquierda o derecha
    if ( joy.palanca.velocity.x > 0.2 ) {
        if ( joy.palanca.velocity.y < 0.3 ){
            NSLog(@"Derecha: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"WalkRight"];
        } else if (joy.palanca.velocity.y > 0.7){
            NSLog(@"Arriba: %f", joy.palanca.velocity.x);
        } else{
            NSLog(@"DiagArribaDerecha: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"PointAngleRight"];
        }
        
    } else if ( joy.palanca.velocity.x < -0.2 ) {
        if ( joy.palanca.velocity.y < 0.3 ){
            NSLog(@"Izquierda: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"WalkLeft"];
        } else if (joy.palanca.velocity.y > 0.7){
            NSLog(@"Arriba: %f", joy.palanca.velocity.x);
        } else{
            NSLog(@"DiagArribaIzquierda: %f", joy.palanca.velocity.x);
            [_player.animationManager runAnimationsForSequenceNamed:@"PointAngleLeft"];
        }
    }else{
         if (joy.palanca.velocity.y > 0.7){
            NSLog(@"Arriba: %f", joy.palanca.velocity.x);
         }
    }
    

    
    // Botón A
    if ( joy.botonA.touchInside ) {
        NSLog(@"Botón A");
        [_player.animationManager runAnimationsForSequenceNamed:@"ShootRight"];
        int var = 2;
        bool shoot = false;
        
    }
    // Botón B
    if ( joy.botonB.touchInside ) {
        NSLog(@"Botón B");
        [_player.animationManager runAnimationsForSequenceNamed:@"JumpRight"];
    }
    NSLog(@"%f",delta);
    
}

@end
