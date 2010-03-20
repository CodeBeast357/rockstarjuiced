//
//  SettingsController.h
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"
#import "Settings.h"

@interface SettingsController : UIViewController  {
	Delegate *mainDelegate;
	Settings *settings;
	
	IBOutlet UITextField *txtFieldPoolName;
	IBOutlet UITextField *txtFieldNumberOfPlayers;
	IBOutlet UISwitch *switchShowAdvanced;
}

@property (nonatomic, retain) Settings *settings;
@property (nonatomic, retain) UITextField *txtFieldPoolName;
@property (nonatomic, retain) UITextField *txtFieldNumberOfPlayers;
@property (nonatomic, retain) UISwitch *switchShowAdvanced;

- (IBAction) save: (id) sender;
- (IBAction) cancel: (id) sender;
- (IBAction) txtFieldDoneEditing: (id) sender;

@end
