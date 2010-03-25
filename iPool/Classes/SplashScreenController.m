//
//  RootViewController.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenController.h"


@implementation SplashScreenController

@synthesize mainMenuController;

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(void)switchPage
{
	mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
	
	
	if(self.mainMenuController == nil)
	{
		MainMenuController *mainMenu = [[MainMenuController alloc]
										initWithNibName:@"MainMenu" bundle:[NSBundle mainBundle]];
		self.mainMenuController = mainMenu;
		
		
		[mainMenu release];
		
		[self.navigationController pushViewController:self.mainMenuController animated:YES];
	}
	
}

- (void) startMyThread {
	[NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

- (void) run {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[self loadAllPlayers];
	
	[self switchPage];
	
	[pool release];
} 


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadAllPlayers {
	
	//add all team to the team list of the nhl
	TeamList *teamList = [TeamList getInstance];
	int numberOfPlayerAdd=0;
	
	//http://www.iphonedevsdk.com/forum/iphone-sdk-development/36493-get-nsstring-text-html-page.html
	NSString *sourceOffenceStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://ca.sports.yahoo.com/nhl/stats/byposition?pos=C,RW,LW&conference=NHL&year=season_2009&qualified=1"]]; 
	NSString *sourceDeffenceStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://ca.sports.yahoo.com/nhl/stats/byposition?pos=D&conference=NHL&year=season_2009&qualified=1"]];
	NSString *sourceGoalieStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://ca.sports.yahoo.com/nhl/stats/byposition?pos=G&conference=NHL&year=season_2009&qualified=1"]];
	// Parse into an array
	// http://developer.apple.com/documentation/Cocoa/Conceptual/Strings/Articles/Scanners.html
	NSString *lineContent;
	NSCharacterSet *eol = [NSCharacterSet newlineCharacterSet];
	NSScanner *aScannerOffence = [NSScanner scannerWithString:sourceOffenceStr];
	NSScanner *aScannerDeffence = [NSScanner scannerWithString:sourceDeffenceStr];
	NSScanner *aScannerGoalie = [NSScanner scannerWithString:sourceGoalieStr];
	
	while ([aScannerOffence isAtEnd] == NO)
	{
		[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
		
		BOOL match = ([lineContent rangeOfString:@"/nhl/players/" options:NSCaseInsensitiveSearch].location != NSNotFound);
		if(match){
			NSString *firstname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 0];
			NSString *lastname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 1];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *team= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *gamePlay= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 1] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *goal= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *assist= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerOffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *differential= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			
			//Skater *aSkater= [[Skater alloc] initWithFirstName:firstname lastName:lastname position:forward goals:[goal intValue] assists:[assist intValue] differential:[differential intValue] gamePlay:[gamePlay intValue]]; 
			Skater *aSkater= [[Skater alloc] init]; 
			aSkater.firstName=firstname;
			aSkater.lastName=lastname;
			aSkater.position=@"f";
			aSkater.goals=[goal intValue];
			aSkater.assists=[assist intValue];
			aSkater.differential=[differential intValue];
			aSkater.gamePlay=[gamePlay intValue];
			
			
			[teamList addSkaterByTeam:aSkater team:team];
			[aSkater release];
			numberOfPlayerAdd++;
		}
		
	}
	
	while ([aScannerDeffence isAtEnd] == NO)
	{
		[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
		
		BOOL match = ([lineContent rangeOfString:@"/nhl/players/" options:NSCaseInsensitiveSearch].location != NSNotFound);
		if(match){
			NSString *firstname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 0];
			NSString *lastname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 1];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *team= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *gamePlay= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 1] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *goal= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *assist= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerDeffence scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *differential= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			
			Skater *aSkater= [[Skater alloc] init]; 
			aSkater.firstName= firstname;
			aSkater.lastName=lastname;
			aSkater.position=@"d";
			aSkater.goals=[goal intValue];
			aSkater.assists=[assist intValue];
			aSkater.differential=[differential intValue];
			aSkater.gamePlay=[gamePlay intValue];
			
			
			[teamList addSkaterByTeam:aSkater team:team];
			[aSkater release];
			numberOfPlayerAdd++;
			
		}
		
	}
	
	while ([aScannerGoalie isAtEnd] == NO)
	{
		[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
		
		BOOL match = ([lineContent rangeOfString:@"/nhl/players/" options:NSCaseInsensitiveSearch].location != NSNotFound);
		if(match){
			NSString *firstname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 0];
			NSString *lastname= [[[[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0] componentsSeparatedByString:@" "] objectAtIndex: 1];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *team= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 2] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *gamePlay= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 1] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *win= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 4] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *loss= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			NSString *otLoss= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			[aScannerGoalie scanUpToCharactersFromSet:eol intoString:&lineContent];
			
			NSString *shutouts= [[[[lineContent componentsSeparatedByString:@">"] objectAtIndex: 3] componentsSeparatedByString:@"<"] objectAtIndex: 0];
			
			
			Goalie *aGoalie= [[Goalie alloc] init]; 
			aGoalie.firstName= firstname;
			aGoalie.lastName=lastname;
			aGoalie.wins=[win intValue];;
			aGoalie.shutouts=[shutouts intValue];
			aGoalie.overtimeLosses=[otLoss intValue];
			aGoalie.position= @"g";
			aGoalie.gamePlay=[gamePlay intValue];
			
			
			[teamList addGoalieByTeam:aGoalie team:team];
			[aGoalie release];
			numberOfPlayerAdd++;
			
		}
		
	}
	/*
	NSLog(@"Number of player add:%d", numberOfPlayerAdd);
	NSMutableArray *list= [teamList listOfTeam];
	NSLog(@"Number of team add: %d", [list count]);
	for( Team *team in list){
		NSLog(team.teamName);
		for(Skater *aSkater in [team skaterList]){
			NSLog(@"firstname:%@ lastname:%@ position:%@ goals:%d assists:%d differential:%d gameplay:%d", aSkater.firstName,aSkater.lastName,aSkater.position,aSkater.goals,aSkater.assists,aSkater.differential,aSkater.gamePlay);
			
		}
		for(Goalie *aGoalie in [team goalieList]){
			NSLog(@"firstname:%@ lastname:%@ position:%@ wins:%d shutouts:%d ot:%d gameplay:%d", aGoalie.firstName,aGoalie.lastName,aGoalie.position,aGoalie.wins,aGoalie.shutouts,aGoalie.overtimeLosses,aGoalie.gamePlay);
			
		}
	}
	*/
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
	
	activityOutlet.hidden= FALSE;
	[activityOutlet startAnimating];
	
	[self startMyThread];
	
	NSLog(@"in viewDidLoad");
	
    //[self switchPage];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
