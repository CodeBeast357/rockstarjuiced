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

@interface SettingsController : UIViewController <UIAlertViewDelegate>  {
	Delegate *mainDelegate;
	Settings *settings;
	
	BOOL keyboardVisible;
	BOOL advancedSettingsHidden;
	
	IBOutlet UIView *settingsView;
	IBOutlet UIScrollView *scrollView;
	
	IBOutlet UITextField *txtFieldPoolName;
	IBOutlet UITextField *txtFieldNumberOfPlayers;
	IBOutlet UISwitch *switchShowAdvanced;
	
	IBOutlet UITextField* txtFieldNumberOfFwd;
	IBOutlet UITextField* txtFieldPointPerGoalFwd;
	IBOutlet UITextField* txtFieldPointPerAssistFwd;
	IBOutlet UISwitch* switchPlusMinusFwd;
	IBOutlet UITextField* txtFieldNumberOfDef;
	IBOutlet UITextField* txtFieldPointPerGoalDef;
	IBOutlet UITextField* txtFieldPointPerAssistDef;
	IBOutlet UISwitch* switchPlusMinusDef;
	IBOutlet UITextField* txtFieldNumberOfGoalie;
	IBOutlet UITextField* txtFieldPointPerWin;
	IBOutlet UITextField* txtFieldPointPerOT;
	IBOutlet UITextField* txtFieldPointPerShoutout;

	
	IBOutlet UILabel* lblNumberOfFwd;
	IBOutlet UILabel* lblPointPerGoalFwd;
	IBOutlet UILabel* lblPointPerAssistFwd;
	IBOutlet UILabel* lblPlusMinusFwd;
	IBOutlet UILabel* lblNumberOfDef;
	IBOutlet UILabel* lblPointPerGoalDef;
	IBOutlet UILabel* lblPointPerAssistDef;
	IBOutlet UILabel* lblPlusMinusDef;
	IBOutlet UILabel* lblNumberOfGoalie;
	IBOutlet UILabel* lblPointPerWin;
	IBOutlet UILabel* lblPointPerOT;
	IBOutlet UILabel* lblPointPerShoutout;

	//Boutons d'aide
	IBOutlet UIButton* imgHelpPoolName;
	IBOutlet UIButton* imgHelpNumberOfPlayers;
	IBOutlet UIButton* imgHelpNumberOfFwd;
	IBOutlet UIButton* imgHelpPointPerGoalFwd;
	IBOutlet UIButton* imgHelpPointPerAssistFwd;
	IBOutlet UIButton* imgHelpNumberOfDef;
	IBOutlet UIButton* imgHelpPointPerGoalDef;
	IBOutlet UIButton* imgHelpPointPerAssistDef;
	IBOutlet UIButton* imgHelpNumberOfGoalie;
	IBOutlet UIButton* imgHelpPointPerWin;
	IBOutlet UIButton* imgHelpPointPerOT;
	IBOutlet UIButton* imgHelpPointPerShoutout;
	IBOutlet UIButton* imgHelpPLusMinusFwd;
	IBOutlet UIButton* imgHelpPLusMinusDef;
	
	//Images
	IBOutlet UIImageView* imgValidPoolName;
	IBOutlet UIImageView* imgInvalidPoolName;
	IBOutlet UIImageView* imgValidNumberOfPlayers;
	IBOutlet UIImageView* imgInvalidNumberOfPlayers;
	IBOutlet UIImageView* imgValidNumberOfFwd;
	IBOutlet UIImageView* imgInvalidNumberOfFwd;
	IBOutlet UIImageView* imgValidPointPerGoalFwd;
	IBOutlet UIImageView* imgInvalidPointPerGoalFwd;
	IBOutlet UIImageView* imgValidPointPerAssistFwd;
	IBOutlet UIImageView* imgInvalidPointPerAssistFwd;
	IBOutlet UIImageView* imgValidNumberOfDef;
	IBOutlet UIImageView* imgInvalidNumberOfDef;
	IBOutlet UIImageView* imgValidPointPerGoalDef;
	IBOutlet UIImageView* imgInvalidPointPerGoalDef;
	IBOutlet UIImageView* imgValidPointPerAssistDef;
	IBOutlet UIImageView* imgInvalidPointPerAssistDef;
	IBOutlet UIImageView* imgValidNumberOfGoalie;
	IBOutlet UIImageView* imgInvalidNumberOfGoalie;
	IBOutlet UIImageView* imgValidPointPerWin;
	IBOutlet UIImageView* imgInvalidPointPerWin;
	IBOutlet UIImageView* imgValidPointPerOT;
	IBOutlet UIImageView* imgInvalidPointPerOT;
	IBOutlet UIImageView* imgValidPointPerShoutout;
	IBOutlet UIImageView* imgInvalidPointPerShoutout;

}

@property (nonatomic, retain) UIView *settingsView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) Settings *settings;
@property (nonatomic, retain) UITextField *txtFieldPoolName;
@property (nonatomic, retain) UITextField *txtFieldNumberOfPlayers;
@property (nonatomic, retain) UISwitch *switchShowAdvanced;
@property (nonatomic, retain) UITextField* txtFieldNumberOfFwd;
@property (nonatomic, retain) UITextField* txtFieldPointPerGoalFwd;
@property (nonatomic, retain) UITextField* txtFieldPointPerAssistFwd;
@property (nonatomic, retain) UISwitch* switchPlusMinusFwd;
@property (nonatomic, retain) UITextField* txtFieldNumberOfDef;
@property (nonatomic, retain) UITextField* txtFieldPointPerGoalDef;
@property (nonatomic, retain) UITextField* txtFieldPointPerAssistDef;
@property (nonatomic, retain) UISwitch* switchPlusMinusDef;
@property (nonatomic, retain) UITextField* txtFieldNumberOfGoalie;
@property (nonatomic, retain) UITextField* txtFieldPointPerWin;
@property (nonatomic, retain) UITextField* txtFieldPointPerOT;
@property (nonatomic, retain) UITextField* txtFieldPointPerShoutout;
@property (nonatomic, retain) UILabel* lblNumberOfFwd;
@property (nonatomic, retain) UILabel* lblPointPerGoalFwd;
@property (nonatomic, retain) UILabel* lblPointPerAssistFwd;
@property (nonatomic, retain) UILabel* lblPlusMinusFwd;
@property (nonatomic, retain) UILabel* lblNumberOfDef;
@property (nonatomic, retain) UILabel* lblPointPerGoalDef;
@property (nonatomic, retain) UILabel* lblPointPerAssistDef;
@property (nonatomic, retain) UILabel* lblPlusMinusDef;
@property (nonatomic, retain) UILabel* lblNumberOfGoalie;
@property (nonatomic, retain) UILabel* lblPointPerWin;
@property (nonatomic, retain) UILabel* lblPointPerOT;
@property (nonatomic, retain) UILabel* lblPointPerShoutout;


- (IBAction) save: (id) sender;
- (IBAction) cancel: (id) sender;
- (IBAction) txtFieldDoneEditing: (id) sender;
- (IBAction) showAdvancedSettings: (id) sender;
- (IBAction) txtFieldEditing: (id) sender;

- (void)keyboardDidShow: (NSNotification*) notif;
- (void)keyboardDidHide: (NSNotification*) notif;
- (void)initTxtFields;

- (IBAction) showHelp: (id) sender;

@end
