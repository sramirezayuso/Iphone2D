//
//  GameOver.m
//  Worms
//
//  Created by usern on 12/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameOver.h"
#import "GamePlay.h"

@implementation GameOver{
    CCLabelTTF* _label;
}
- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    
}

-(void)backtomenu{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}
@end