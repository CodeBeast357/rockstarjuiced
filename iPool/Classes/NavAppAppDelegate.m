//
//  NavAppAppDelegate.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "NavAppAppDelegate.h"

@implementation NavAppAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

-(void)setBoxer1Name:(NSString *)name {
				
    boxer1Name = name;
}

-(void)setBoxer2Name:(NSString *)name {
	
    boxer2Name = name;
}

-(void)setJudge1Name:(NSString *)name {
	
    judge1Name = name;
}

-(void)setJudge2Name:(NSString *)name {
	
    judge2Name = name;
}

-(void)setJudge3Name:(NSString *)name {
	
    judge3Name = name;
}

-(NSString *)getBoxer1Name {
	
	return boxer1Name;
}


-(NSString *)getBoxer2Name {
	
	return boxer2Name;
}

-(NSString *)getJudge1Name {
	
	return judge1Name;
}

-(NSString *)getJudge2Name {
	
	return judge2Name;
}

-(NSString *)getJudge3Name {
	
	return judge3Name;
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
