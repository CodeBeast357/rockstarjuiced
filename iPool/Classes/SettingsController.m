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
 txtFieldPlusMinusFwd,
 txtFieldNumberOfDef,
 txtFieldPointPerGoalDef,
 txtFieldPointPerAssistDef,
 txtFieldPlusMinusDef,
 txtFieldNumberOfGoalie,
 txtFieldPointPerWin,
 txtFieldPointPerOT,
 txtFieldPointPerShoutout,
 txtFieldShoutoutPts,
 txtFieldPointPerPts,
 txtFieldProlongationPts,
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
 lblPointPerShoutout,
 lblShoutoutPts,
 lblPointPerPts,
lblProlongationPts;

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
	
	scrollView.contentSize = CGSizeMake(320,1300);
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
	
	[settings setPoolName:txtFieldPoolName.text];
	[settings setNumberOfPlayers:[txtFieldNumberOfPlayers.text intValue]];
	[settings setOffencePlayerTotal:[txtFieldNumberOfFwd.text intValue]];
	[settings setOffencePointsPerGoal:[txtFieldPointPerGoalFwd.text intValue]];
	[settings setOffencePointsPerAssist:[txtFieldPointPerAssistFwd.text intValue]];
	[settings setOffenceDifferentialActivated:[txtFieldPlusMinusFwd.text intValue]];
	[settings setDefencePlayerTotal:[txtFieldNumberOfDef.text intValue]];
	[settings setDefencePointsPerGoal:[txtFieldPointPerGoalDef.text intValue]];
	[settings setDefencePointsPerAssist:[txtFieldPointPerAssistDef.text intValue]];
	[settings setDefenceDifferentialActivated:[txtFieldPlusMinusDef.text intValue]];
	
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) txtFieldDoneEditing: (id) sender{
	
	if([txtFieldNumberOfFwd.text intValue] > 0){
		
		txtFieldPointPerGoalFwd.enabled = YES;
		txtFieldPointPerAssistFwd.enabled = YES;
		txtFieldPlusMinusFwd.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalFwd.enabled = NO;
		txtFieldPointPerAssistFwd.enabled = NO;
		txtFieldPlusMinusFwd.enabled = NO;
		
		txtFieldPointPerGoalFwd.text = @"";
		txtFieldPointPerAssistFwd.text = @"";
		txtFieldPlusMinusFwd.text = @"";
	}
	
	if([txtFieldNumberOfDef.text intValue] > 0){
		
		txtFieldPointPerGoalDef.enabled = YES;
		txtFieldPointPerAssistDef.enabled = YES;
		txtFieldPlusMinusDef.enabled = YES;
	}
	else{
		
		txtFieldPointPerGoalDef.enabled = NO;
		txtFieldPointPerAssistDef.enabled = NO;
		txtFieldPlusMinusDef.enabled = NO;
		
		txtFieldPointPerGoalDef.text = @"";
		txtFieldPointPerAssistDef.text = @"";
		txtFieldPlusMinusDef.text = @"";
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

/*----The fallowing methods are used to resize the scroll view when the keyboard show up---*/

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
	
	if(keyboardVisible == NO)
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
	
	if(switchShowAdvanced){
		
		txtFieldNumberOfFwd.hidden = YES;
		txtFieldPointPerGoalFwd.hidden = YES;
		txtFieldPointPerAssistFwd.hidden = YES;
		txtFieldPlusMinusFwd.hidden = YES;
		txtFieldNumberOfDef.hidden = YES;
		txtFieldPointPerGoalDef.hidden = YES;
		txtFieldPointPerAssistDef.hidden = YES;
		txtFieldPlusMinusDef.hidden = YES;
		txtFieldNumberOfGoalie.hidden = YES;
		txtFieldPointPerWin.hidden = YES;
		txtFieldPointPerOT.hidden = YES;
		txtFieldPointPerShoutout.hidden = YES;
		txtFieldShoutoutPts.hidden = YES;
		txtFieldPointPerPts.hidden = YES;
		txtFieldProlongationPts.hidden = YES;
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
		lblShoutoutPts.hidden = YES;
		lblPointPerPts.hidden = YES;
		lblProlongationPts.hidden = YES;
		
		switchShowAdvanced = NO;
		
	}
	else{
		
		txtFieldNumberOfFwd.hidden = NO;
		txtFieldPointPerGoalFwd.hidden = NO;
		txtFieldPointPerAssistFwd.hidden = NO;
		txtFieldPlusMinusFwd.hidden = NO;
		txtFieldNumberOfDef.hidden = NO;
		txtFieldPointPerGoalDef.hidden = NO;
		txtFieldPointPerAssistDef.hidden = NO;
		txtFieldPlusMinusDef.hidden = NO;
		txtFieldNumberOfGoalie.hidden = NO;
		txtFieldPointPerWin.hidden = NO;
		txtFieldPointPerOT.hidden = NO;
		txtFieldPointPerShoutout.hidden = NO;
		txtFieldShoutoutPts.hidden = NO;
		txtFieldPointPerPts.hidden = NO;
		txtFieldProlongationPts.hidden = NO;
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
		lblShoutoutPts.hidden = NO;
		lblPointPerPts.hidden = NO;
		lblProlongationPts.hidden = NO;
		
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
	if([settings offenceDifferentialActivated] != 0)
		txtFieldPlusMinusFwd.text = [NSString stringWithFormat:@"%d",[settings offenceDifferentialActivated]];
	if([settings defencePlayerTotal] != 0)
		txtFieldNumberOfDef.text = [NSString stringWithFormat:@"%d",[settings defencePlayerTotal]];
	if([settings defencePointsPerGoal] != 0)
		txtFieldPointPerGoalDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerGoal]];
	if([settings defencePointsPerAssist] != 0)
		txtFieldPointPerAssistDef.text = [NSString stringWithFormat:@"%d",[settings defencePointsPerAssist]];
	if([settings defenceDifferentialActivated] != 0)
		txtFieldPlusMinusDef.text = [NSString stringWithFormat:@"%d",[settings defenceDifferentialActivated]];
	
}


@end
