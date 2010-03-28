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
	tablePlayers, players;


//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		players = [[NSMutableArray alloc] init];
		NSLog(@"nombre de joueur ajoute: %d",[players count]);
		
    }
    return self;
}

- (void)viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Select a Player";
	
	//Initialisation de la table des joueurs
	teamList = [TeamList getInstance];
	teams= [teamList listOfTeam];
	teamSelected= mainDelegate.teamSelected;
	team= [teams objectAtIndex:teamSelected];
	
	switch (mainDelegate.playerTypeTmp) {
		case 0:
			pos=@"f";
			for(Skater *player in team.skaterList){
				if([player.position isEqualToString:pos]){
						NSLog(@"dans forward");
						[players addObject:player];
						NSLog(@"nombre de joueur ajoute: %d",[players count]);
				}
			}
			break;
		case 1:
			pos=@"d";
			for(Skater *player in team.skaterList){
				if([player.position isEqualToString:pos]){
					NSLog(@"dans defence");
					[players addObject: player];
				}
			}
			break;
		case 2:
			players = team.goalieList;
			break;
		default:
			break;
	}
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {

    [super dealloc];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString* identifier = @"origin";
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] init] autorelease];
	}
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [[[[players objectAtIndex:indexPath.row] firstName] stringByAppendingString:@" "] stringByAppendingString:[[players objectAtIndex:indexPath.row] lastName]];
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [players count];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"playerChanged" object:[players objectAtIndex:indexPath.row]];
	  
	[self.navigationController popToRootViewControllerAnimated:YES];	
	
}


@end
