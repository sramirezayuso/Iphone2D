//
//  Joystick.h
//  Worms
//
//  Created by usern on 11/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#ifndef Worms_Joystick_h
#define Worms_Joystick_h

#import "cocos2d.h"
#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystickSkinnedBase.h"

@interface Joystick : CCNode{
    SneakyJoystick *palanca;
    CCButton *botonA;
    CCButton *botonB;
    
    //userInteractionEnabled = YES;
    //multipleTouchEnabled = YES;
    //contentSizeType = CCContentSizeTypeNormalized;
    //contentSize = CGSizeMake(1, 1);
    //[self addChild:touchNode];
}

@property (nonatomic, retain) SneakyJoystick *palanca;
@property (nonatomic, retain) CCButton *botonA;
@property (nonatomic, retain) CCButton *botonB;

-(id) init: (CCDirector*) dir;

@end

#endif
