//
//  SelectTeamController.m
//  NavApp
//
//  Created by Legault, Martin on 10-03-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SelectTeamController.h"


@implementation SelectTeamController

@synthesize
	selectPlayerController,
	tableTeams,
	teams;

//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"Select a team";
	
	//Initialisation de la table des équipes
	teamList = [TeamList getInstance];
	teams= [teamList listOfTeam];
	[teamList sortByTeamName];
	
}

- (void) viewWillAppear{
		
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[tableTeams dealloc];
	[teams dealloc];
    [super dealloc];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString* identifier = @"origin";
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] init] autorelease];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [[teams objectAtIndex:indexPath.row] teamName];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [teams count];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	SelectPlayerController *selectPlayer = [[SelectPlayerController alloc]
										initWithNibName:@"SelectPlayer" bundle:[NSBundle mainBundle]];
	self.selectPlayerController = selectPlayer;

	
	mainDelegate.teamSelected=indexPath.row;
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController pushViewController:self.selectPlayerController animated:YES];
	
	[selectPlayer release];
	
	
	
}

@end
