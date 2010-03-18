//
//  RootViewController.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 _MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuController.h"
#import "Delegate.h"
#import "TeamList.h"
#import "Team.h"
#import "Skater.h"
#import "Goalie.h"


@interface SplashScreenController : UIViewController {
	MainMenuController *mainMenuController;
	Delegate *mainDelegate;
	IBOutlet UIActivityIndicatorView *activityOutlet;
	IBOutlet UIImageView *imageOutlet;
	
}

@property (nonatomic, retain) MainMenuController *mainMenuController;

-(void)switchPage;
-(void)loadAllPlayers;
- (void)startMyThread;
- (void)run;

@end
