//
//  Gameplay.h
//  Worms
//
//  Created by Santiago Ramirez on 11/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"


@interface Gameplay : CCNode
-(CGPoint)playerPos;
@property CCNode* player;
@property CCPhysicsNode* physicsNode;
@property int enemieskilled;
@end
