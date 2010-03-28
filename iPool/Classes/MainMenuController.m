//
//  ViewTwoController.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import "MainMenuController.h"

@implementation MainMenuController

@synthesize
	settingsController,
	addPoolerController,
	viewStatisticsController,
	showConfigSettings,
	showAddPooler,
	showStats,
	resetSettings;

//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void) viewDidLoad{
		[super viewDidLoad];
	
	self.title = @"Main Menu";
	//sinscrire pour recevoir changement de la page selectPlayer
	[[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(changeOptionVisible:) name:@"settingsChanged" object: nil];
	
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController setNavigationBarHidden:FALSE];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(IBAction)switchPageSettings:(id)sender
{

	
	// Creation du controlleur pour la vue et de la bar de navigation
	SettingsController *settings = [[SettingsController alloc]
									initWithNibName:@"Settings" bundle:[NSBundle mainBundle]];
	self.settingsController = settings;
		
	UINavigationController *navController = [[UINavigationController alloc] 
											 initWithRootViewController:settings];
	
	//Change le style de la bar de navigation
	navController.navigationBar.barStyle = UIBarStyleBlack;
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController presentModalViewController:navController animated:YES];
	
	//On libère la mémoire
	[settings release];
	[navController release];
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(IBAction)switchPageAddPooler:(id)sender
{
	
	// Creation du controlleur pour la vue et de la bar de navigation
	AddPoolerController *addPooler = [[AddPoolerController alloc]
										initWithNibName:@"AddPooler" bundle:[NSBundle mainBundle]];
	self.addPoolerController = addPooler;
	
	UINavigationController *navController = [[UINavigationController alloc] 
											 initWithRootViewController:addPooler];
	
	//Change le style de la bar de navigation
	navController.navigationBar.barStyle = UIBarStyleBlack;
	
	//Affichage de la vue sous la forme d une modalView
	[self.navigationController presentModalViewController:navController animated:YES];
	
	//On libère la mémoire
	[addPooler release];
	[navController release];
	

}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(IBAction)switchPageViewStatistics:(id)sender
{
	
	
	if(self.viewStatisticsController == nil)
	{
		ViewStatisticsController *viewStatistics = [[ViewStatisticsController alloc]
										initWithNibName:@"ViewStatistics" bundle:[NSBundle mainBundle]];
		self.viewStatisticsController = viewStatistics;
		
		
		[viewStatistics release];
		
	}
		
	[self.navigationController pushViewController:self.viewStatisticsController animated:YES];
	
	
}

- (void) viewWillAppear:(BOOL)animated{
	[UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;
}

- (void) changeOptionVisible:(NSNotification *)notify {
	if ([Settings getInstance].saved) {
		showConfigSettings.titleLabel.text = @"Show Settings";
		showAddPooler.hidden = NO;
		resetSettings.hidden = NO;
	}
}


- (IBAction) changeSettings:(id)sender {
	NSLog(@"Allo");
}



@end
