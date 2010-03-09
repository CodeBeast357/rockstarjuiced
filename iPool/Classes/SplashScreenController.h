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

@interface SplashScreenController : UIViewController {
	MainMenuController *viewTwoController;
	Delegate *mainDelegate;
	
}

@property (nonatomic, retain) MainMenuController *viewTwoController;

-(IBAction)switchPage:(id)sender;

@end
