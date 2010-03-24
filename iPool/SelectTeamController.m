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
	
	//Création des boutons Save et Cancel
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  
											  target:self 
											  action:@selector(cancel:)] autorelease]; 
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
											   target:self 
											   action:@selector(done:)] autorelease]; 
	//Initialisation de la table des équipes
	teams = [[NSMutableArray alloc] init];
	[teams addObject:@"Canadiens"];
	[teams addObject:@"Maple Leafs"];
	[teams addObject:@"Bruins"];
	[teams addObject:@"Sabres"];
	[teams addObject:@"Senators"];
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

- (IBAction) done: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString* identifier = @"origin";
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] init] autorelease];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [teams objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

@end
