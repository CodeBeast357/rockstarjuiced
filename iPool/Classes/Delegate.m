//
//  NavAppAppDelegate.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Delegate.h"

@implementation Delegate

@synthesize window;
@synthesize navigationController;
@synthesize teamSelected;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
}

- (void)dealloc {
	[navigationController release];
    [window release];
    [super dealloc];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
exit(0);
}

@end
