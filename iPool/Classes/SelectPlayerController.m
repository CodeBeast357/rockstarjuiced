//
//  SelectPlayerController.m
//  NavApp
//
//  Created by Legault, Martin on 10-03-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SelectPlayerController.h"


@implementation SelectPlayerController

@synthesize
	tablePlayers,
	players;

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
	players = [[NSMutableArray alloc] init];
	[players addObject:@"Canadiens"];
	[players addObject:@"Maple Leafs"];
	[players addObject:@"Bruins"];
	[players addObject:@"Sabres"];
	[players addObject:@"Senators"];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[tablePlayers dealloc];
	[players dealloc];
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
	cell.textLabel.text = [players objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [players count];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}
/*
//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
	
	// Creation du controlleur pour la vue et de la bar de navigation
	SelectTeamController *selectPlayer = [[SelectTeamController alloc]
										  initWithNibName:@"SelectPlayer" bundle:[NSBundle mainBundle]];
	self.selectPlayerController = selectPlayer;
	
	UINavigationController *navController = [[UINavigationController alloc] 
											 initWithRootViewController:selectPlayer];
	
	//Change le style de la bar de navigation
	navController.navigationBar.barStyle = UIBarStyleBlack;
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController presentModalViewController:navController animated:YES];
	
	//On libère la mémoire
	[selectPlayer release];
	[navController release];
	
	
}*/

@end
