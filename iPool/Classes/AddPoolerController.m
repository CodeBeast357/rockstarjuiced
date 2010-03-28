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
	imgValidPoolName,
    imgInvalidPoolName,
	imgHelpPoolName,
	poolerName;

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
	
	mainDelegate.poolerTmp = [[Pooler alloc] init];
	
	//sinscrire pour recevoir changement de la page selectPlayer
	[[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(changePlayer:) name:@"playerChanged" object: nil];
	
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

	for (int n=0; n<config.offencePlayerTotal; ++n) {
		Skater *aSkater= [[Skater alloc] init]; 
		aSkater.firstName=@"Choose a forward player";
		[mainDelegate.poolerTmp addForward:aSkater];
	}
	for (int n=0; n<config.defencePlayerTotal; ++n) {
		Skater *aSkater= [[Skater alloc] init]; 
		aSkater.firstName=@"Choose a defense player";
		[mainDelegate.poolerTmp addDefenceman:aSkater];
	}
	for (int n=0; n<config.goaliePlayerTotal; ++n) {
		Goalie *aGoalie= [[Goalie alloc] init]; 
		aGoalie.firstName=@"Choose a goalie";
		[mainDelegate.poolerTmp addGoalie:aGoalie];
	}
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	
    [super dealloc];
}

- (IBAction) done: (id) sender{
	int validPlayer= 1;
	int validPoolerName= 1;
	
	for(Player *player in mainDelegate.poolerTmp.forwardsList ){
		if([player.lastName isEqualToString:@""]){
			validPlayer=0;
		}
	}
	
	for(Player *player in mainDelegate.poolerTmp.defencemenList ){
		if([player.lastName isEqualToString:@""]){
			validPlayer=0;
		}
	}
	
	for(Player *player in mainDelegate.poolerTmp.goaliesList ){
		if([player.lastName isEqualToString:@""]){
			validPlayer=0;
		}
	}
	
	if(imgValidPoolName.hidden==YES){
		validPoolerName= 0;
	}
	
	if(validPlayer==1 && validPoolerName==1 ){
		[[PoolerList getInstance] addPooler:mainDelegate.poolerTmp];
		[mainDelegate.poolerTmp release];
		[self dismissModalViewControllerAnimated:YES];
		
	}
	else{
		
		if(validPlayer==0){
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iPool" 
															message:@"Players selection is incomplete."														   delegate:nil 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
		
		else{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iPool" 
															message:@"Pooler Name is invalid."														   
														   delegate:nil 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
		
	}

}

- (IBAction) cancel: (id) sender{
	[mainDelegate.poolerTmp release];
	
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
			cell.textLabel.text = [[[[mainDelegate.poolerTmp.forwardsList objectAtIndex:indexPath.row] firstName] stringByAppendingString:@" "] stringByAppendingString:[[mainDelegate.poolerTmp.forwardsList objectAtIndex:indexPath.row] lastName]];
			break;
		case 1:
			cell.textLabel.text = [[[[mainDelegate.poolerTmp.defencemenList objectAtIndex:indexPath.row] firstName] stringByAppendingString:@" "] stringByAppendingString:[[mainDelegate.poolerTmp.defencemenList objectAtIndex:indexPath.row] lastName]];
			break;
		case 2:
			cell.textLabel.text = [[[[mainDelegate.poolerTmp.goaliesList objectAtIndex:indexPath.row] firstName] stringByAppendingString:@" "] stringByAppendingString:[[mainDelegate.poolerTmp.goaliesList objectAtIndex:indexPath.row] lastName]];
			break;
		default:
			break;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return [mainDelegate.poolerTmp.forwardsList count];
		case 1:
			return [mainDelegate.poolerTmp.defencemenList count];
		case 2:
			return [mainDelegate.poolerTmp.goaliesList count];
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
	
	mainDelegate.playerTypeTmp= indexPath.section;
	mainDelegate.playerIndexTmp= indexPath.row;
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController pushViewController:self.selectTeamController  animated:YES];
	
}

- (void) changePlayer:(NSNotification *)notify {
	switch (mainDelegate.playerTypeTmp) {
		case 0:
			[mainDelegate.poolerTmp.forwardsList replaceObjectAtIndex:mainDelegate.playerIndexTmp withObject:[notify object]];
			break;
		case 1:
			[mainDelegate.poolerTmp.defencemenList replaceObjectAtIndex:mainDelegate.playerIndexTmp withObject:[notify object]];
			break;
		case 2:
			[mainDelegate.poolerTmp.goaliesList replaceObjectAtIndex:mainDelegate.playerIndexTmp withObject:[notify object]];
			break;
		default:
			break;
	}
			
			[tablePooler reloadData];
}

- (IBAction) txtFieldPoolNameEditing: (id) sender{
	int valid= [mainDelegate validateMessageInput:poolerName.text];
	if (valid==1) {
		imgValidPoolName.hidden= NO;
		imgInvalidPoolName.hidden= YES;
	}
	else {
		imgValidPoolName.hidden= YES;
		imgInvalidPoolName.hidden= NO;
	}

}


- (IBAction) showHelp: (id) sender{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Help topic" 
													message:@"Name of your pooler profile. Do not excee 15 characters."
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
}

@end
