//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene{
    OALSimpleAudio *audio;
}
- (void)didLoadFromCCB {
    CCLOG(@"Gameplay Started!");
    
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    
    // access audio object
    audio = [OALSimpleAudio sharedInstance];
    // play background sound
    [audio playBg:@"menu.mp3" loop:TRUE];
    [audio preloadEffect:@"marco.mp3"];
    [audio preloadEffect:@"ok.mp3"];
    
    
}

-(void)button1{
    NSLog(@"Button1");
    [audio playEffect:@"marco.mp3"];
    [audio playEffect:@"ok.mp3"];
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Level1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
    [audio playBg:@"level.mp3" loop:TRUE];
}

-(void)button2{
    NSLog(@"Button2");
    [audio playEffect:@"marco.mp3"];
    [audio playEffect:@"ok.mp3"];
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Level2"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
    [audio playBg:@"level2.mp3" loop:TRUE];
}
@end
