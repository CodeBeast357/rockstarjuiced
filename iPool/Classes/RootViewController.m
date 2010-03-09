//
//  RootViewController.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "ViewTwoController.h"

@implementation RootViewController

@synthesize viewTwoController;

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
-(IBAction)switchPage:(id)sender
{
	mainDelegate = (NavAppAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate setBoxer1Name:boxer1Name.text];
	[mainDelegate setBoxer2Name:boxer2Name.text];
	[mainDelegate setJudge1Name:judge1Name.text];
	[mainDelegate setJudge2Name:judge2Name.text];
	[mainDelegate setJudge3Name:judge3Name.text];

	if(self.viewTwoController == nil)
	{
		ViewTwoController *viewTwo = [[ViewTwoController alloc]
									  initWithNibName:@"View2" bundle:[NSBundle mainBundle]];
		self.viewTwoController = viewTwo;
		
		
		[viewTwo release];
	
		[self.navigationController pushViewController:self.viewTwoController animated:YES];
		[viewTwo initializeFields];
	}
	
}

- (IBAction)judge1NameDoneEditing:(id)sender {
	
	[judge1Name resignFirstResponder];
	
}

- (IBAction)judge2NameDoneEditing:(id)sender {
	
	[judge2Name resignFirstResponder];
	
}

- (IBAction)judge3NameDoneEditing:(id)sender {
	
	[judge3Name resignFirstResponder];
	
}

- (IBAction)boxer1NameDoneEditing:(id)sender {
	
	[boxer1Name resignFirstResponder];
	
}

- (IBAction)boxer2NameDoneEditing:(id)sender {
	
	[boxer2Name resignFirstResponder];
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
