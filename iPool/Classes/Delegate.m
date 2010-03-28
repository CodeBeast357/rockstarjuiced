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
@synthesize teamSelected, poolerTmp, playerTypeTmp, playerIndexTmp;


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

- (int)validateNumericInput:(NSString*) input{
	int valid=1;
	NSRange textRange;
	NSMutableArray *invalidCharlist;
	invalidCharlist = [[NSMutableArray alloc] init];
	[invalidCharlist addObject:@" "];
	[invalidCharlist addObject:@"-"];
	[invalidCharlist addObject:@"/"];
	[invalidCharlist addObject:@":"];
	[invalidCharlist addObject:@";"];
	[invalidCharlist addObject:@"("];
	[invalidCharlist addObject:@")"];
	[invalidCharlist addObject:@"$"];
	[invalidCharlist addObject:@"&"];
	[invalidCharlist addObject:@"@"];
	[invalidCharlist addObject:@"\""];
	[invalidCharlist addObject:@"."];
	[invalidCharlist addObject:@","];
	[invalidCharlist addObject:@"?"];
	[invalidCharlist addObject:@"!"];
	[invalidCharlist addObject:@"'"];
	[invalidCharlist addObject:@"["];
	[invalidCharlist addObject:@"]"];
	[invalidCharlist addObject:@"{"];
	[invalidCharlist addObject:@"}"];
	[invalidCharlist addObject:@"#"];
	[invalidCharlist addObject:@"%"];
	[invalidCharlist addObject:@"^"];
	[invalidCharlist addObject:@"*"];
	[invalidCharlist addObject:@"+"];
	[invalidCharlist addObject:@"="];
	[invalidCharlist addObject:@"_"];
	[invalidCharlist addObject:@"\\"];
	[invalidCharlist addObject:@"|"];
	[invalidCharlist addObject:@"~"];
	[invalidCharlist addObject:@"<"];
	[invalidCharlist addObject:@">"];
	
	[invalidCharlist addObject:@"a"];
	[invalidCharlist addObject:@"b"];
	[invalidCharlist addObject:@"c"];
	[invalidCharlist addObject:@"d"];
	[invalidCharlist addObject:@"e"];
	[invalidCharlist addObject:@"f"];
	[invalidCharlist addObject:@"g"];
	[invalidCharlist addObject:@"h"];
	[invalidCharlist addObject:@"i"];
	[invalidCharlist addObject:@"j"];
	[invalidCharlist addObject:@"k"];
	[invalidCharlist addObject:@"l"];
	[invalidCharlist addObject:@"m"];
	[invalidCharlist addObject:@"n"];
	[invalidCharlist addObject:@"o"];
	[invalidCharlist addObject:@"p"];
	[invalidCharlist addObject:@"q"];
	[invalidCharlist addObject:@"r"];
	[invalidCharlist addObject:@"s"];
	[invalidCharlist addObject:@"t"];
	[invalidCharlist addObject:@"u"];
	[invalidCharlist addObject:@"v"];
	[invalidCharlist addObject:@"w"];
	[invalidCharlist addObject:@"x"];
	[invalidCharlist addObject:@"y"];
	[invalidCharlist addObject:@"z"];

	
	
	for(NSString *substring in invalidCharlist){
		textRange =[input rangeOfString:substring];
		
		if(textRange.location != NSNotFound)
			
		{
			//Does contain the substring
			valid=0;
			
		}
	}
	
	if([input length]==0){
		valid=0;
	}
	
	if(valid==1){
		if([input intValue] >50){
			valid=0;
		}
	}
	
	return valid;
	
}
- (int)validateMessageInput:(NSString*) input{
	int valid=1;
	NSRange textRange;
	NSMutableArray *invalidCharlist;
	invalidCharlist = [[NSMutableArray alloc] init];
	[invalidCharlist addObject:@" "];
	[invalidCharlist addObject:@"-"];
	[invalidCharlist addObject:@"/"];
	[invalidCharlist addObject:@":"];
	[invalidCharlist addObject:@";"];
	[invalidCharlist addObject:@"("];
	[invalidCharlist addObject:@")"];
	[invalidCharlist addObject:@"$"];
	[invalidCharlist addObject:@"&"];
	[invalidCharlist addObject:@"@"];
	[invalidCharlist addObject:@"\""];
	[invalidCharlist addObject:@"."];
	[invalidCharlist addObject:@","];
	[invalidCharlist addObject:@"?"];
	[invalidCharlist addObject:@"!"];
	[invalidCharlist addObject:@"'"];
	[invalidCharlist addObject:@"["];
	[invalidCharlist addObject:@"]"];
	[invalidCharlist addObject:@"{"];
	[invalidCharlist addObject:@"}"];
	[invalidCharlist addObject:@"#"];
	[invalidCharlist addObject:@"%"];
	[invalidCharlist addObject:@"^"];
	[invalidCharlist addObject:@"*"];
	[invalidCharlist addObject:@"+"];
	[invalidCharlist addObject:@"="];
	[invalidCharlist addObject:@"_"];
	[invalidCharlist addObject:@"\\"];
	[invalidCharlist addObject:@"|"];
	[invalidCharlist addObject:@"~"];
	[invalidCharlist addObject:@"<"];
	[invalidCharlist addObject:@">"];
	
	
	for(NSString *substring in invalidCharlist){
		textRange =[input rangeOfString:substring];
		
		if(textRange.location != NSNotFound)
			
		{
			//Does contain the substring
			valid=0;
			
		}
	}
	
	if([input length]==0){
		valid=0;
	}
	
	return valid;
}

@end
