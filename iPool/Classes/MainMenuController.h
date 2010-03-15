//
//  ViewTwoController.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"
#import "SettingsController.h"

@interface MainMenuController : UIViewController {
	SettingsController *settingsController;
	Delegate *mainDelegate;
}

-(IBAction)switchPageSettings:(id)sender;

@property (nonatomic, retain) SettingsController *settingsController;

@end
