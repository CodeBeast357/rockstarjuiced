//
//  SettingsController.m
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AddPoolerController.h"
#import "Settings.h"

@implementation AddPoolerController

@synthesize
	selectTeamController,
	tablePooler,
	offencePlayers,
	defencePlayers,
	goalies;

//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Add Pooler";
	
	//Création des boutons Save et Cancel
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  
											  target:self 
											  action:@selector(cancel:)] autorelease]; 
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
											   target:self 
											   action:@selector(done:)] autorelease]; 
	//Initialisation des tables de joueurs
	Settings* config = [Settings getInstance];
	offencePlayers = [[NSMutableArray alloc] init];
	for (int n=0; n<config.offencePlayerTotal; ++n) {
		[offencePlayers addObject:@"Choose a forward player"];
	}
	defencePlayers = [[NSMutableArray alloc] init];
	for (int n=0; n<config.defencePlayerTotal; ++n) {
		[defencePlayers addObject:@"Choose a defence player"];
	}
	goalies = [[NSMutableArray alloc] init];
	for (int n=0; n<config.goaliePlayerTotal; ++n) {
		[goalies addObject:@"Choose a goalie"];
	}
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[tablePooler release];
	[offencePlayers release];
	[defencePlayers release];
	[goalies release];
    [super dealloc];
}

- (IBAction) done: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction) txtFieldDoneEditing: (id) sender {
	[sender resignFirstResponder];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString* identifier = @"origin";
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] init] autorelease];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [offencePlayers objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.textLabel.text = [defencePlayers objectAtIndex:indexPath.row];
			break;
		case 2:
			cell.textLabel.text = [goalies objectAtIndex:indexPath.row];
			break;
		default:
			break;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return [offencePlayers count];
		case 1:
			return [defencePlayers count];
		case 2:
			return [goalies count];
		default:
			return 0;
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	switch (section) {
		case 0:
			return @"Offensive";
		case 1:
			return @"Defensive";
		case 2:
			return @"Goal";
		default:
			return @"Empty";
	}
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}


//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(self.selectTeamController == nil)
	{
	
	// Creation du controlleur pour la vue et de la bar de navigation
	SelectTeamController *selectTeam = [[SelectTeamController alloc]
									  initWithNibName:@"SelectTeam" bundle:[NSBundle mainBundle]];
	self.selectTeamController = selectTeam;
	
	//On libère la mémoire
	[selectTeam release];
		
	}
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController pushViewController:self.selectTeamController  animated:YES];
	
}

@end
