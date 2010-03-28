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
	switchShowAdvanced = NO;
	
	//Création des boutons Save et Cancel
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  
											  target:self 
											  action:@selector(cancel:)] autorelease]; 
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
											   target:self 
											   action:@selector(save:)] autorelease];
	
	settings = [Settings getInstance];
	
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
		[settings setPoolName:txtFieldPoolName.text];
		[settings setNumberOfPlayers:[txtFieldNumberOfPlayers.text intValue]];
		[settings setOffencePlayerTotal:[txtFieldNumberOfFwd.text intValue]];
		[settings setOffencePointsPerGoal:[txtFieldPointPerGoalFwd.text intValue]];
		[settings setOffencePointsPerAssist:[txtFieldPointPerAssistFwd.text intValue]];
		[settings setOffenceDifferentialActivated:switchPlusMinusFwd.on];
		[settings setDefencePlayerTotal:[txtFieldNumberOfDef.text intValue]];
		[settings setDefencePointsPerGoal:[txtFieldPointPerGoalDef.text intValue]];
		[settings setDefencePointsPerAssist:[txtFieldPointPerAssistDef.text intValue]];
		[settings setDefenceDifferentialActivated:switchPlusMinusDef.on];
		[settings setGoaliePlayerTotal:[txtFieldNumberOfGoalie.text intValue]];
		[settings setGoalerPointsPerWin:[txtFieldPointPerWin.text intValue]];
		[settings setGoalerPointsPerOTLoss:[txtFieldPointPerOT.text intValue]];
		[settings setGoalerPointsPerShoutout:[txtFieldPointPerShoutout.text intValue]];
			
		[self dismissModalViewControllerAnimated:YES];
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
	if([txtFieldNumberOfFwd.text intValue] > 0){
		
		txtFieldPointPerGoalFwd.enabled = YES;
		txtFieldPointPerAssistFwd.enabled = YES;
		switchPlusMinusFwd.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalFwd.enabled = NO;
		txtFieldPointPerAssistFwd.enabled = NO;
		switchPlusMinusFwd.enabled = NO;
		
		txtFieldPointPerGoalFwd.text = @"";
		txtFieldPointPerAssistFwd.text = @"";
	}
	
	if([txtFieldNumberOfDef.text intValue] > 0){
		
		txtFieldPointPerGoalDef.enabled = YES;
		txtFieldPointPerAssistDef.enabled = YES;
		switchPlusMinusDef.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalDef.enabled = NO;
		txtFieldPointPerAssistDef.enabled = NO;
		switchPlusMinusDef.enabled = NO;
		
		txtFieldPointPerGoalDef.text = @"";
		txtFieldPointPerAssistDef.text = @"";
	}
	
	if([txtFieldNumberOfGoalie.text intValue] > 0){
		
		txtFieldPointPerWin.enabled = YES;
		txtFieldPointPerOT.enabled = YES;
		txtFieldPointPerShoutout.enabled = YES;
	}
	else{
		
		txtFieldPointPerWin.enabled = NO;
		txtFieldPointPerOT.enabled = NO;
		txtFieldPointPerShoutout.enabled = NO;
		
		txtFieldPointPerWin.text = @"";
		txtFieldPointPerOT.text = @"";
		txtFieldPointPerShoutout.text = @"";
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
	/*
	//Source: http://www.neoos.ch/news/46-development/54-uikeyboardtypenumberpad-and-the-missing-return-key
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(keyboardWillShow:) 
												 name:UIKeyboardWillShowNotification 
											   object:nil];*/
}

/*
 *Before the view disappear, we unregister events for
 *when the keyboard.
 */
- (void) keyboardViewWilldisappear: (BOOL)animated { 
	
	//Will remove every observers we have
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	/*
	//Source: http://www.neoos.ch/news/46-development/54-uikeyboardtypenumberpad-and-the-missing-return-key
	[[NSNotificationCenter defaultCenter] removeObserver:self];*/
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

- (IBAction) showAdvancedSettings: (id) sender{/*
	BOOL hideAdvSettings = [switchShowAdvanced isOn];
	
	txtFieldNumberOfPlayers.enabled = !hideAdvSettings;
	
	txtFieldNumberOfFwd.hidden = hideAdvSettings;
	txtFieldPointPerGoalFwd.hidden = hideAdvSettings;
	txtFieldPointPerAssistFwd.hidden = hideAdvSettings;
	switchPlusMinusFwd.hidden = hideAdvSettings;
	txtFieldNumberOfDef.hidden = hideAdvSettings;
	txtFieldPointPerGoalDef.hidden = hideAdvSettings;
	txtFieldPointPerAssistDef.hidden = hideAdvSettings;
	switchPlusMinusDef.hidden = hideAdvSettings;
	txtFieldNumberOfGoalie.hidden = hideAdvSettings;
	txtFieldPointPerWin.hidden = hideAdvSettings;
	txtFieldPointPerOT.hidden = hideAdvSettings;
	txtFieldPointPerShoutout.hidden = hideAdvSettings;
	lblNumberOfFwd.hidden = hideAdvSettings;
	lblPointPerGoalFwd.hidden = hideAdvSettings;
	lblPointPerAssistFwd.hidden = hideAdvSettings;
	lblPlusMinusFwd.hidden = hideAdvSettings;
	lblNumberOfDef.hidden = hideAdvSettings;
	lblPointPerGoalDef.hidden = hideAdvSettings;
	lblPointPerAssistDef.hidden = hideAdvSettings;
	lblPlusMinusDef.hidden = hideAdvSettings;
	lblNumberOfGoalie.hidden = hideAdvSettings;
	lblPointPerWin.hidden = hideAdvSettings;
	lblPointPerOT.hidden = hideAdvSettings;
	lblPointPerShoutout.hidden = hideAdvSettings;
	
	imgValidNumberOfFwd.hidden = hideAdvSettings;
	imgHelpNumberOfFwd.hidden = hideAdvSettings;
	imgValidPointPerGoalFwd.hidden = hideAdvSettings;
	imgHelpPointPerGoalFwd.hidden = hideAdvSettings;
	imgValidPointPerAssistFwd.hidden = hideAdvSettings;
	imgHelpPointPerAssistFwd.hidden = hideAdvSettings;
	imgValidNumberOfDef.hidden = hideAdvSettings;
	imgHelpNumberOfDef.hidden = hideAdvSettings;
	imgValidPointPerGoalDef.hidden = hideAdvSettings;
	imgHelpPointPerGoalDef.hidden = hideAdvSettings;
	imgValidPointPerAssistDef.hidden = hideAdvSettings;
	imgHelpPointPerAssistDef.hidden = hideAdvSettings;
	imgValidNumberOfGoalie.hidden = hideAdvSettings;
	imgHelpNumberOfGoalie.hidden = hideAdvSettings;
	imgValidPointPerWin.hidden = hideAdvSettings;
	imgHelpPointPerWin.hidden = hideAdvSettings;
	imgValidPointPerOT.hidden = hideAdvSettings;
	imgHelpPointPerOT.hidden = hideAdvSettings;
	imgValidPointPerShoutout.hidden = hideAdvSettings;
	imgHelpPointPerShoutout.hidden = hideAdvSettings;
	imgHelpPLusMinusDef.hidden = hideAdvSettings;
	imgHelpPLusMinusFwd.hidden= hideAdvSettings;*/
	
	if(switchShowAdvanced){
		txtFieldNumberOfPlayers.enabled = YES;
		
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
		
		
		switchShowAdvanced = NO;
	}
	else{
		txtFieldNumberOfPlayers.enabled = NO;
		
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
		
		switchShowAdvanced = YES;
	}
	
}

- (void) initTxtFields{
	
	txtFieldPoolName.text = [settings poolName];
	
	if([settings numberOfPlayers] != 0)
		txtFieldNumberOfPlayers.text = [NSString stringWithFormat:@"%d",[settings numberOfPlayers]];
	if([settings offencePlayerTotal] != 0)
		txtFieldNumberOfFwd.text = [NSString stringWithFormat:@"%d",[settings offencePlayerTotal]];
	if([settings offencePointsPerGoal] != 0)
		txtFieldPointPerGoalFwd.text = [NSString stringWithFormat:@"%d",[settings offencePointsPerGoal]];
	if([settings offencePointsPerAssist] != 0)
		txtFieldPointPerAssistFwd.text = [NSString stringWithFormat:@"%d",[settings offencePointsPerAssist]];
	
	if([settings defencePlayerTotal] != 0)
		txtFieldNumberOfDef.text = [NSString stringWithFormat:@"%d",[settings defencePlayerTotal]];
	if([settings defencePointsPerGoal] != 0)
		txtFieldPointPerGoalDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerGoal]];
	if([settings defencePointsPerAssist] != 0)
		txtFieldPointPerAssistDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerAssist]];
	
	if([settings goaliePlayerTotal] != 0)
		txtFieldNumberOfGoalie.text = [NSString stringWithFormat:@"%d",[settings goaliePlayerTotal]];
	if([settings goalerPointsPerShoutout] != 0)
		txtFieldPointPerShoutout.text = [NSString stringWithFormat:@"%d",[settings goalerPointsPerShoutout]];
	if([settings goalerPointsPerWin] != 0)
		txtFieldPointPerWin.text = [NSString stringWithFormat:@"%d",[settings goalerPointsPerWin]];
	if([settings goalerPointsPerOTLoss] != 0)
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
	if ([sender.text length] == 0) {
		if (sender == txtFieldPoolName) {
			imgValidPoolName.hidden = YES;
			imgInvalidPoolName.hidden = NO;
		} else if (sender == txtFieldNumberOfPlayers) {
			imgValidNumberOfPlayers.hidden = YES;
			imgInvalidNumberOfPlayers.hidden = NO;
		} else if (sender == txtFieldNumberOfFwd) {
			imgValidNumberOfFwd.hidden = YES;
			imgInvalidNumberOfFwd.hidden = NO;
		} else if (sender == txtFieldPointPerGoalFwd) {
			imgValidPointPerGoalFwd.hidden = YES;
			imgInvalidPointPerGoalFwd.hidden = NO;
		} else if (sender == txtFieldPointPerAssistFwd) {
			imgValidPointPerAssistFwd.hidden = YES;
			imgInvalidPointPerAssistFwd.hidden = NO;
		} else if (sender == txtFieldNumberOfDef) {
			imgValidNumberOfDef.hidden = YES;
			imgInvalidNumberOfDef.hidden = NO;
		} else if (sender == txtFieldPointPerGoalDef) {
			imgValidPointPerGoalDef.hidden = YES;
			imgInvalidPointPerGoalDef.hidden = NO;
		} else if (sender == txtFieldPointPerAssistDef) {
			imgValidPointPerAssistDef.hidden = YES;
			imgInvalidPointPerAssistDef.hidden = NO;
		} else if (sender == txtFieldNumberOfGoalie) {
			imgValidNumberOfGoalie.hidden = YES;
			imgInvalidNumberOfGoalie.hidden = NO;
		} else if (sender == txtFieldPointPerWin) {
			imgValidPointPerWin.hidden = YES;
			imgInvalidPointPerWin.hidden = NO;
		} else if (sender == txtFieldPointPerOT) {
			imgValidPointPerOT.hidden = YES;
			imgInvalidPointPerOT.hidden = NO;
		} else if (sender == txtFieldPointPerShoutout) {
			imgValidPointPerShoutout.hidden = YES;
			imgInvalidPointPerShoutout.hidden = NO;
		}
	} else {
		if (sender == txtFieldPoolName) {
			imgInvalidPoolName.hidden = YES;
			imgValidPoolName.hidden = NO;
		} else if (sender == txtFieldNumberOfPlayers) {
			imgInvalidNumberOfPlayers.hidden = YES;
			imgValidNumberOfPlayers.hidden = NO;
		} else if (sender == txtFieldNumberOfFwd) {
			imgInvalidNumberOfFwd.hidden = YES;
			imgValidNumberOfFwd.hidden = NO;
		} else if (sender == txtFieldPointPerGoalFwd) {
			imgInvalidPointPerGoalFwd.hidden = YES;
			imgValidPointPerGoalFwd.hidden = NO;
		} else if (sender == txtFieldPointPerAssistFwd) {
			imgInvalidPointPerAssistFwd.hidden = YES;
			imgValidPointPerAssistFwd.hidden = NO;
		} else if (sender == txtFieldNumberOfDef) {
			imgInvalidNumberOfDef.hidden = YES;
			imgValidNumberOfDef.hidden = NO;
		} else if (sender == txtFieldPointPerGoalDef) {
			imgInvalidPointPerGoalDef.hidden = YES;
			imgValidPointPerGoalDef.hidden = NO;
		} else if (sender == txtFieldPointPerAssistDef) {
			imgInvalidPointPerAssistDef.hidden = YES;
			imgValidPointPerAssistDef.hidden = NO;
		} else if (sender == txtFieldNumberOfGoalie) {
			imgInvalidNumberOfGoalie.hidden = YES;
			imgValidNumberOfGoalie.hidden = NO;
		} else if (sender == txtFieldPointPerWin) {
			imgInvalidPointPerWin.hidden = YES;
			imgValidPointPerWin.hidden = NO;
		} else if (sender == txtFieldPointPerOT) {
			imgInvalidPointPerOT.hidden = YES;
			imgValidPointPerOT.hidden = NO;
		} else if (sender == txtFieldPointPerShoutout) {
			imgInvalidPointPerShoutout.hidden = YES;
			imgValidPointPerShoutout.hidden = NO;
		}
	}
}/*
//Source: http://www.neoos.ch/news/46-development/54-uikeyboardtypenumberpad-and-the-missing-return-key
- (void)keyboardWillShow:(NSNotification *)note {
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    if ([[[UIDevice currentDevice] systemVersion] hasPrefix:@"3"]) {
        [doneButton setImage:[UIImage imageNamed:@"DoneUp3.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"] forState:UIControlStateHighlighted];
    } else {        
        [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
    }
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
	
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        // keyboard view found; add the custom button to it
        if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
            [keyboard addSubview:doneButton];
    }
}

- (void)doneButton:(id)sender{
	[sender resignFirstResponder];
}*/

@end
