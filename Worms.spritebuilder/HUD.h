//
//  Level1.h
//  Worms
//
//  Created by usern on 11/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Joystick.h"

@interface HUD : CCNode{
    Joystick *joy;
}

- (id)init:(CCNode*) player;

@end