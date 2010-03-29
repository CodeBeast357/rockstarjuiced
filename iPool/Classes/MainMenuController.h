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
	IBOutlet UIButton *showConfigSettings;
	IBOutlet UIButton *showAddPooler;
	IBOutlet UIButton *showStats;
	IBOutlet UIButton *resetSettings;
}

@property (nonatomic, retain) SettingsController *settingsController;
@property (nonatomic, retain) AddPoolerController *addPoolerController;
@property (nonatomic, retain) ViewStatisticsController *viewStatisticsController;
@property (nonatomic, retain) UIButton *showConfigSettings;
@property (nonatomic, retain) UIButton *showAddPooler;
@property (nonatomic, retain) UIButton *showStats;
@property (nonatomic, retain) UIButton *resetSettings;

-(IBAction)switchPageSettings:(id)sender;
-(IBAction)switchPageAddPooler:(id)sender;
-(IBAction)switchPageViewStatistics:(id)sender;
- (void) changeOptionVisible:(NSNotification *)notify;
- (IBAction) changeSettings:(id)sender;
- (IBAction) changeAllVisible:(NSNotification *)notify;
-(void) changeSettingsVisible:(NSNotification *)notify;

@end
