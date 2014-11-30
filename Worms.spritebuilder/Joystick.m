//
//  Joystick.m
//  Worms
//
//  Created by usern on 11/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Joystick.h"

@implementation Joystick

@synthesize palanca;
@synthesize botonA;
@synthesize botonB;

-(id) init{
    if(self=[super init]){
        //Aca hago algo re loco
        SneakyJoystickSkinnedBase *baseJoy = [[SneakyJoystickSkinnedBase alloc] init];
        baseJoy.position = ccp(84,84);
        baseJoy.backgroundSprite = [CCSprite spriteWithImageNamed:(@"dpad.png")];
        baseJoy.thumbSprite = [CCSprite spriteWithImageNamed:(@"joystick.png")];
        baseJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0,0,128,128)];
        palanca = baseJoy.joystick;
        
        [self addChild:baseJoy z:0];
        CCButton *ba = [CCButton buttonWithTitle:@""
                                                  spriteFrame:[CCSpriteFrame frameWithImageNamed:@"botonA.png"]
                                       highlightedSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"botonA_presionado.png"]
                                          disabledSpriteFrame:nil];
        
        ba.userInteractionEnabled = TRUE;
        ba.position = ccp(630,60);
        botonA = ba;
        [self addChild:botonA z:0];
        
        CCButton *bb = [CCButton buttonWithTitle:@""
                                     spriteFrame:[CCSpriteFrame frameWithImageNamed:@"botonB.png"]
                          highlightedSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"botonB_presionado.png"]
                             disabledSpriteFrame:nil];
        
        bb.userInteractionEnabled = TRUE;
        bb.position = ccp(730,120);
        botonB = bb;
        [self addChild:botonB z:0];
        
        
        self.userInteractionEnabled = TRUE;
        self.multipleTouchEnabled = TRUE;
    }
    return self;
}



@end