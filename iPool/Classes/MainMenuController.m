//
//  ViewTwoController.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import "MainMenuController.h"

@implementation MainMenuController

@synthesize settingsController;

//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(IBAction)switchPageSettings:(id)sender
{
	mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
	
	
	if(self.settingsController == nil)
	{
		SettingsController *settings = [[SettingsController alloc]
										initWithNibName:@"Settings" bundle:[NSBundle mainBundle]];
		self.settingsController = settings;
		
		
		[settings release];
		
		[self.navigationController pushViewController:self.settingsController animated:YES];
	}
	
}




@end
