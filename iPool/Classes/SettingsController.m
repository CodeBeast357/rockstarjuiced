//
//  SettingsController.m
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController
@synthesize 
settingsView,
scrollView,
settings,
txtFieldPoolName,
txtFieldNumberOfPlayers,
switchShowAdvanced,
txtFieldNumberOfFwd,
txtFieldPointPerGoalFwd,
txtFieldPointPerAssistFwd,
switchPlusMinusFwd,
txtFieldNumberOfDef,
txtFieldPointPerGoalDef,
txtFieldPointPerAssistDef,
switchPlusMinusDef,
txtFieldNumberOfGoalie,
txtFieldPointPerWin,
txtFieldPointPerOT,
txtFieldPointPerShoutout,
lblNumberOfFwd,
lblPointPerGoalFwd,
lblPointPerAssistFwd,
lblPlusMinusFwd,
lblNumberOfDef,
lblPointPerGoalDef,
lblPointPerAssistDef,
lblPlusMinusDef,
lblNumberOfGoalie,
lblPointPerWin,
lblPointPerOT,
lblPointPerShoutout;


//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Pool Settings";
	
	scrollView.contentSize = CGSizeMake(320,1150);
	advancedSettingsHidden = YES;
	
	settings = [Settings getInstance];
	if (settings.saved) {
		txtFieldPoolName.enabled = NO;
		txtFieldNumberOfPlayers.enabled = NO;
		txtFieldNumberOfFwd.enabled = NO;
		txtFieldPointPerGoalFwd.enabled = NO;
		txtFieldPointPerAssistFwd.enabled = NO;
		txtFieldNumberOfDef.enabled = NO;
		txtFieldPointPerGoalDef.enabled = NO;
		txtFieldPointPerAssistDef.enabled = NO;
		txtFieldNumberOfGoalie.enabled = NO;
		txtFieldPointPerWin.enabled = NO;
		txtFieldPointPerOT.enabled = NO;
		txtFieldPointPerShoutout.enabled = NO;
		
		imgInvalidNumberOfFwd.hidden = YES;
		imgInvalidPointPerGoalFwd.hidden = YES;
		imgInvalidPointPerAssistFwd.hidden = YES;
		imgInvalidNumberOfDef.hidden = YES;
		imgInvalidPointPerGoalDef.hidden = YES;
		imgInvalidPointPerAssistDef.hidden = YES;
		imgInvalidNumberOfGoalie.hidden = YES;
		imgInvalidPointPerWin.hidden = YES;
		imgInvalidPointPerOT.hidden = YES;
		imgInvalidPointPerShoutout.hidden = YES;
		
		imgValidNumberOfFwd.hidden = YES;
		imgValidPointPerGoalFwd.hidden = YES;
		imgValidPointPerAssistFwd.hidden = YES;
		imgValidNumberOfDef.hidden = YES;
		imgValidPointPerGoalDef.hidden = YES;
		imgValidPointPerAssistDef.hidden = YES;
		imgValidNumberOfGoalie.hidden = YES;
		imgValidPointPerWin.hidden = YES;
		imgValidPointPerOT.hidden = YES;
		imgValidPointPerShoutout.hidden = YES;
	} else {
		//Création des boutons Save et Cancel
		self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
												  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  
												  target:self 
												  action:@selector(cancel:)] autorelease]; 
		
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
												   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
												   target:self 
												   action:@selector(save:)] autorelease];
	}
		
	//Initialize text fields
	[self initTxtFields];
	
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction) save: (id) sender{
	if (imgInvalidPoolName.hidden &&
		imgInvalidNumberOfPlayers.hidden &&
		imgInvalidNumberOfFwd.hidden &&
		imgInvalidPointPerGoalFwd.hidden &&
		imgInvalidPointPerAssistFwd.hidden &&
		imgInvalidNumberOfDef.hidden &&
		imgInvalidPointPerGoalDef.hidden &&
		imgInvalidPointPerAssistDef.hidden &&
		imgInvalidNumberOfGoalie.hidden &&
		imgInvalidPointPerOT.hidden &&
		imgInvalidPointPerShoutout.hidden) {
		settings.poolName = txtFieldPoolName.text;
		settings.numberOfPlayers = [txtFieldNumberOfPlayers.text intValue];
		settings.offencePlayerTotal = [txtFieldNumberOfFwd.text intValue];
		settings.offencePointsPerGoal = [txtFieldPointPerGoalFwd.text intValue];
		settings.offencePointsPerAssist = [txtFieldPointPerAssistFwd.text intValue];
		settings.offenceDifferentialActivated = switchPlusMinusFwd.on;
		settings.defencePlayerTotal = [txtFieldNumberOfDef.text intValue];
		settings.defencePointsPerGoal = [txtFieldPointPerGoalDef.text intValue];
		settings.defencePointsPerAssist = [txtFieldPointPerAssistDef.text intValue];
		settings.defenceDifferentialActivated = switchPlusMinusDef.on;
		settings.goaliePlayerTotal = [txtFieldNumberOfGoalie.text intValue];
		settings.goalerPointsPerWin = [txtFieldPointPerWin.text intValue];
		settings.goalerPointsPerOTLoss = [txtFieldPointPerOT.text intValue];
		settings.goalerPointsPerShoutout = [txtFieldPointPerShoutout.text intValue];
		
		settings.saved = YES;
		
		[self dismissModalViewControllerAnimated:YES];
		NSLog(@"nombre de joueur attaquant:%d",settings.offencePlayerTotal);
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Settings error(s)" 
														message:@"Please verify settings values."
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
	}

}

- (IBAction) cancel: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) txtFieldDoneEditing: (id) sender{
	int nbPlayers = 0;
	
	if([txtFieldNumberOfFwd.text intValue] > 0){
		nbPlayers += [txtFieldNumberOfFwd.text intValue];
		txtFieldPointPerGoalFwd.enabled = YES;
		txtFieldPointPerAssistFwd.enabled = YES;
		switchPlusMinusFwd.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalFwd.enabled = NO;
		txtFieldPointPerAssistFwd.enabled = NO;
		switchPlusMinusFwd.enabled = NO;
		
		txtFieldPointPerGoalFwd.text = @"0";
		txtFieldPointPerAssistFwd.text = @"0";
	}
	
	if([txtFieldNumberOfDef.text intValue] > 0){
		nbPlayers += [txtFieldNumberOfDef.text intValue];
		txtFieldPointPerGoalDef.enabled = YES;
		txtFieldPointPerAssistDef.enabled = YES;
		switchPlusMinusDef.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalDef.enabled = NO;
		txtFieldPointPerAssistDef.enabled = NO;
		switchPlusMinusDef.enabled = NO;
		
		txtFieldPointPerGoalDef.text = @"0";
		txtFieldPointPerAssistDef.text = @"0";
	}
	
	if([txtFieldNumberOfGoalie.text intValue] > 0){
		nbPlayers += [txtFieldNumberOfGoalie.text intValue];
		txtFieldPointPerWin.enabled = YES;
		txtFieldPointPerOT.enabled = YES;
		txtFieldPointPerShoutout.enabled = YES;
	}
	else{
		
		txtFieldPointPerWin.enabled = NO;
		txtFieldPointPerOT.enabled = NO;
		txtFieldPointPerShoutout.enabled = NO;
		
		txtFieldPointPerWin.text = @"0";
		txtFieldPointPerOT.text = @"0";
		txtFieldPointPerShoutout.text = @"0";
	}
	
	if (advancedSettingsHidden) {
		txtFieldNumberOfFwd.text = txtFieldNumberOfPlayers.text;
		txtFieldNumberOfDef.text = @"0";
		txtFieldNumberOfGoalie.text = @"0";
	} else {
		txtFieldNumberOfPlayers.text = [NSString stringWithFormat:@"%d",nbPlayers];
	}


	
	[sender resignFirstResponder];
}

/*----The following methods are used to resize the scroll view when the keyboard show up---*/

/*
 *Before the view appear, we register events for
 *when the keyboard will show.
 */
- (void) viewWillAppear: (BOOL)animated {
	
	[super viewWillAppear:animated];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:)
												 name:UIKeyboardDidShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:)
												 name:UIKeyboardDidHideNotification object:nil];
	
	keyboardVisible = NO;
}

/*
 *Before the view disappear, we unregister events for
 *when the keyboard.
 */
- (void) keyboardViewWilldisappear: (BOOL)animated { 
	
	//Will remove every observers we have
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) keyboardDidShow: (NSNotification*) notif{
	
	if(!keyboardVisible)
	{
		NSDictionary* info = [notif userInfo];
		
		NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];  
		
		CGSize keyboardSize = [aValue CGRectValue].size; 
		
		CGRect viewFrame = self.view.frame; 
		viewFrame.size.height -= keyboardSize.height;
		
		scrollView.frame = viewFrame;  
		keyboardVisible = YES;
	}
}

- (void) keyboardDidHide: (NSNotification*) notif{
	
	if(keyboardVisible)
	{
		NSDictionary* info = [notif userInfo];
		
		NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];  
		
		CGSize keyboardSize = [aValue CGRectValue].size;
		
		CGRect viewFrame = self.view.frame; 
		viewFrame.size.height += keyboardSize.height;
		
		scrollView.frame = viewFrame;  
		keyboardVisible = NO;
	}
}

- (IBAction) showAdvancedSettings: (id) sender{
	advancedSettingsHidden = !switchShowAdvanced.on;
	
	if(advancedSettingsHidden){		
		txtFieldNumberOfFwd.hidden = YES;
		txtFieldPointPerGoalFwd.hidden = YES;
		txtFieldPointPerAssistFwd.hidden = YES;
		switchPlusMinusFwd.hidden = YES;
		txtFieldNumberOfDef.hidden = YES;
		txtFieldPointPerGoalDef.hidden = YES;
		txtFieldPointPerAssistDef.hidden = YES;
		switchPlusMinusDef.hidden = YES;
		txtFieldNumberOfGoalie.hidden = YES;
		txtFieldPointPerWin.hidden = YES;
		txtFieldPointPerOT.hidden = YES;
		txtFieldPointPerShoutout.hidden = YES;
		lblNumberOfFwd.hidden = YES;
		lblPointPerGoalFwd.hidden = YES;
		lblPointPerAssistFwd.hidden = YES;
		lblPlusMinusFwd.hidden = YES;
		lblNumberOfDef.hidden = YES;
		lblPointPerGoalDef.hidden = YES;
		lblPointPerAssistDef.hidden = YES;
		lblPlusMinusDef.hidden = YES;
		lblNumberOfGoalie.hidden = YES;
		lblPointPerWin.hidden = YES;
		lblPointPerOT.hidden = YES;
		lblPointPerShoutout.hidden = YES;
		
		imgValidNumberOfFwd.hidden = YES;
		imgHelpNumberOfFwd.hidden = YES;
		imgValidPointPerGoalFwd.hidden = YES;
		imgHelpPointPerGoalFwd.hidden = YES;
		imgValidPointPerAssistFwd.hidden = YES;
		imgHelpPointPerAssistFwd.hidden = YES;
		imgValidNumberOfDef.hidden = YES;
		imgHelpNumberOfDef.hidden = YES;
		imgValidPointPerGoalDef.hidden = YES;
		imgHelpPointPerGoalDef.hidden = YES;
		imgValidPointPerAssistDef.hidden = YES;
		imgHelpPointPerAssistDef.hidden = YES;
		imgValidNumberOfGoalie.hidden = YES;
		imgHelpNumberOfGoalie.hidden = YES;
		imgValidPointPerWin.hidden = YES;
		imgHelpPointPerWin.hidden = YES;
		imgValidPointPerOT.hidden = YES;
		imgHelpPointPerOT.hidden = YES;
		imgValidPointPerShoutout.hidden = YES;
		imgHelpPointPerShoutout.hidden = YES;
		imgHelpPLusMinusDef.hidden = YES;
		imgHelpPLusMinusFwd.hidden= YES;
		
		txtFieldNumberOfPlayers.enabled = YES;
	} else{
		txtFieldNumberOfPlayers.enabled = NO;
		
		txtFieldNumberOfFwd.text = txtFieldNumberOfPlayers.text;
		txtFieldPointPerGoalFwd.text = @"0";
		txtFieldPointPerAssistFwd.text = @"0";
		txtFieldNumberOfDef.text = @"0";
		txtFieldPointPerGoalDef.text = @"0";
		txtFieldPointPerAssistDef.text = @"0";
		txtFieldNumberOfGoalie.text = @"0";
		txtFieldPointPerWin.text = @"0";
		txtFieldPointPerOT.text = @"0";
		txtFieldPointPerShoutout.text = @"0";		
		
		txtFieldNumberOfFwd.hidden = NO;
		txtFieldPointPerGoalFwd.hidden = NO;
		txtFieldPointPerAssistFwd.hidden = NO;
		switchPlusMinusFwd.hidden = NO;
		txtFieldNumberOfDef.hidden = NO;
		txtFieldPointPerGoalDef.hidden = NO;
		txtFieldPointPerAssistDef.hidden = NO;
		switchPlusMinusDef.hidden = NO;
		txtFieldNumberOfGoalie.hidden = NO;
		txtFieldPointPerWin.hidden = NO;
		txtFieldPointPerOT.hidden = NO;
		txtFieldPointPerShoutout.hidden = NO;
		lblNumberOfFwd.hidden = NO;
		lblPointPerGoalFwd.hidden = NO;
		lblPointPerAssistFwd.hidden = NO;
		lblPlusMinusFwd.hidden = NO;
		lblNumberOfDef.hidden = NO;
		lblPointPerGoalDef.hidden = NO;
		lblPointPerAssistDef.hidden = NO;
		lblPlusMinusDef.hidden = NO;
		lblNumberOfGoalie.hidden = NO;
		lblPointPerWin.hidden = NO;
		lblPointPerOT.hidden = NO;
		lblPointPerShoutout.hidden = NO;
		
		imgValidNumberOfFwd.hidden = NO;
		imgHelpNumberOfFwd.hidden = NO;
		imgValidPointPerGoalFwd.hidden = NO;
		imgHelpPointPerGoalFwd.hidden = NO;
		imgValidPointPerAssistFwd.hidden = NO;
		imgHelpPointPerAssistFwd.hidden = NO;
		imgValidNumberOfDef.hidden = NO;
		imgHelpNumberOfDef.hidden = NO;
		imgValidPointPerGoalDef.hidden = NO;
		imgHelpPointPerGoalDef.hidden = NO;
		imgValidPointPerAssistDef.hidden = NO;
		imgHelpPointPerAssistDef.hidden = NO;
		imgValidNumberOfGoalie.hidden = NO;
		imgHelpNumberOfGoalie.hidden = NO;
		imgValidPointPerWin.hidden = NO;
		imgHelpPointPerWin.hidden = NO;
		imgValidPointPerOT.hidden = NO;
		imgHelpPointPerOT.hidden = NO;
		imgValidPointPerShoutout.hidden = NO;
		imgHelpPointPerShoutout.hidden = NO;
		imgHelpPLusMinusDef.hidden = NO;
		imgHelpPLusMinusFwd.hidden = NO;
	}
	
}

- (void) initTxtFields{
	
	txtFieldPoolName.text = [settings poolName];
	
	
	txtFieldNumberOfPlayers.text = [NSString stringWithFormat:@"%d",[settings numberOfPlayers]];

	txtFieldNumberOfFwd.text = [NSString stringWithFormat:@"%d",[settings offencePlayerTotal]];

	txtFieldPointPerGoalFwd.text = [NSString stringWithFormat:@"%d",[settings offencePointsPerGoal]];

	txtFieldPointPerAssistFwd.text = [NSString stringWithFormat:@"%d",[settings offencePointsPerAssist]];


	txtFieldNumberOfDef.text = [NSString stringWithFormat:@"%d",[settings defencePlayerTotal]];

	txtFieldPointPerGoalDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerGoal]];

	txtFieldPointPerAssistDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerAssist]];


	txtFieldNumberOfGoalie.text = [NSString stringWithFormat:@"%d",[settings goaliePlayerTotal]];

	txtFieldPointPerShoutout.text = [NSString stringWithFormat:@"%d",[settings goalerPointsPerShoutout]];

	txtFieldPointPerWin.text = [NSString stringWithFormat:@"%d",[settings goalerPointsPerWin]];

	txtFieldPointPerOT.text = [NSString stringWithFormat:@"%d",[settings goalerPointsPerOTLoss]];
	
	switchPlusMinusFwd.on = [settings offenceDifferentialActivated];
	switchPlusMinusDef.on = [settings defenceDifferentialActivated];
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	//Button NO
	if (buttonIndex == 0){
		
	}
	//Button YES
	else if(buttonIndex == 1){
		
	}
	
}

- (IBAction) txtFieldEditing: (UITextField*) sender{
	if (sender == txtFieldPoolName) {
		if ([mainDelegate validateMessageInput:sender.text] == 1) {
			imgInvalidPoolName.hidden = YES;
			imgValidPoolName.hidden = NO;
		} else {
			imgValidPoolName.hidden = YES;
			imgInvalidPoolName.hidden = NO;
		}

	} else {
		int valid = [mainDelegate validateNumericInput:sender.text];
		if (sender == txtFieldNumberOfPlayers) {
			if (valid==1) {
				imgInvalidNumberOfPlayers.hidden = YES;
				imgValidNumberOfPlayers.hidden = NO;
			} else {
				imgValidNumberOfPlayers.hidden = YES;
				imgInvalidNumberOfPlayers.hidden = NO;
			}
		} else if (sender == txtFieldNumberOfFwd) {
			if (valid==1) {
				imgInvalidNumberOfFwd.hidden = YES;
				imgValidNumberOfFwd.hidden = NO;
			} else {
				imgValidNumberOfFwd.hidden = YES;
				imgInvalidNumberOfFwd.hidden = NO;
			}
		} else if (sender == txtFieldPointPerGoalFwd) {
			if (valid==1) {
				imgInvalidPointPerGoalFwd.hidden = YES;
				imgValidPointPerGoalFwd.hidden = NO;
			} else {
				imgValidPointPerGoalFwd.hidden = YES;
				imgInvalidPointPerGoalFwd.hidden = NO;
			}
		} else if (sender == txtFieldPointPerAssistFwd) {
			if (valid==1) {
				imgInvalidPointPerAssistFwd.hidden = YES;
				imgValidPointPerAssistFwd.hidden = NO;
			} else {
				imgValidPointPerAssistFwd.hidden = YES;
				imgInvalidPointPerAssistFwd.hidden = NO;
			}
		} else if (sender == txtFieldNumberOfDef) {
			if (valid==1) {
				imgInvalidNumberOfDef.hidden = YES;
				imgValidNumberOfDef.hidden = NO;
			} else {
				imgValidNumberOfDef.hidden = YES;
				imgInvalidNumberOfDef.hidden = NO;
			}
		} else if (sender == txtFieldPointPerGoalDef) {
			if (valid==1) {
				imgInvalidPointPerGoalDef.hidden = YES;
				imgValidPointPerGoalDef.hidden = NO;
			} else {
				imgValidPointPerGoalDef.hidden = YES;
				imgInvalidPointPerGoalDef.hidden = NO;
			}
		} else if (sender == txtFieldPointPerAssistDef) {
			if (valid==1) {
				imgInvalidPointPerAssistDef.hidden = YES;
				imgValidPointPerAssistDef.hidden = NO;
			} else {
				imgValidPointPerAssistDef.hidden = YES;
				imgInvalidPointPerAssistDef.hidden = NO;
			}
		} else if (sender == txtFieldNumberOfGoalie) {
			if (valid==1) {
				imgInvalidNumberOfGoalie.hidden = YES;
				imgValidNumberOfGoalie.hidden = NO;
			} else {
				imgValidNumberOfGoalie.hidden = YES;
				imgInvalidNumberOfGoalie.hidden = NO;
			}
		} else if (sender == txtFieldPointPerWin) {
			if (valid==1) {
				imgInvalidPointPerWin.hidden = YES;
				imgValidPointPerWin.hidden = NO;
			} else {
				imgValidPointPerWin.hidden = YES;
				imgInvalidPointPerWin.hidden = NO;
			}
		} else if (sender == txtFieldPointPerOT) {
			if (valid==1) {
				imgInvalidPointPerOT.hidden = YES;
				imgValidPointPerOT.hidden = NO;
			} else {
				imgValidPointPerOT.hidden = YES;
				imgInvalidPointPerOT.hidden = NO;
			}
		} else if (sender == txtFieldPointPerShoutout) {
			if (valid==1) {
				imgInvalidPointPerShoutout.hidden = YES;
				imgValidPointPerShoutout.hidden = NO;
			} else {
				imgValidPointPerShoutout.hidden = YES;
				imgInvalidPointPerShoutout.hidden = NO;
			}
		}
	}
}

- (IBAction) showHelp: (id) sender{
	NSMutableString* message = [[NSMutableString alloc] init];
	if (sender == imgHelpPoolName) {
		[message appendString:@"Name of your pool. Do not exceed 15 characters."];
	} else if (sender == imgHelpNumberOfPlayers) {
		[message appendString:@"Total number of players in your pool. Do not excess 50 players."];
	} else if (sender == imgHelpNumberOfFwd) {
		[message appendString:@"Total number of forward players in your pool. Do not excess 50 forward players."];
	} else if (sender == imgHelpPointPerGoalFwd) {
		[message appendString:@"Total number of points per goal made by a forward player. Do not excess 50 points."];
	} else if (sender == imgHelpPointPerAssistFwd) {
		[message appendString:@"Total number of points per assist made by a forward player. Do not excess 50 points."];
	} else if (sender == imgHelpPLusMinusFwd) {
		[message appendString:@"Calculate plus or minus statistics for forward players. Example: If a forward player have a statistic of \"-2\", his total of point will be reduce by 2."];
	} else if (sender == imgHelpNumberOfDef) {
		[message appendString:@"Total number of defence players in your pool. Do not excess 50 defence players."];
	} else if (sender == imgHelpPointPerGoalDef) {
		[message appendString:@"Total number of points per goal made by a defence player. Do not excess 50 points."];
	} else if (sender == imgHelpPointPerAssistDef) {
		[message appendString:@"Total number of points per assist made by a defence player. Do not excess 50 points."];
	} else if (sender == imgHelpPLusMinusDef) {
		[message appendString:@"Calculate plus or minus statistics for defence players. Example: If a defence player have a statistic of \"-2\", his total of point will be reduce by 2."];
	} else if (sender == imgHelpNumberOfGoalie) {
		[message appendString:@"Total number of goalers in your pool. Do not excess 50 players."];
	} else if (sender == imgHelpPointPerWin) {
		[message appendString:@"Total number of points per games won. Do not excess 50 points."];
	} else if (sender == imgHelpPointPerOT) {
		[message appendString:@"Total number of points per overtime of games lost. Do not excess 50 points."];
	} else if (sender == imgHelpPointPerShoutout) {
		[message appendString:@"Total number of points per shootout. Do not excess 50 points."];
	}
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Help topic" 
													message:message
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
	[message release];
}

@end
