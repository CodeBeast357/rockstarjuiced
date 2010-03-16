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
#import "AddPoolerController.h"
#import "ViewStatisticsController.h"

@interface MainMenuController : UIViewController {
	SettingsController *settingsController;
	AddPoolerController *addPoolerController;
	ViewStatisticsController *viewStatisticsController;
	Delegate *mainDelegate;
}

-(IBAction)switchPageSettings:(id)sender;
-(IBAction)switchPageAddPooler:(id)sender;
-(IBAction)switchPageViewStatistics:(id)sender;

@property (nonatomic, retain) SettingsController *settingsController;
@property (nonatomic, retain) AddPoolerController *addPoolerController;
@property (nonatomic, retain) ViewStatisticsController *viewStatisticsController;

@end
