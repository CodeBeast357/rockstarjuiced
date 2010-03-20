//
//  SettingsController.m
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController

//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Pool Settings";
	
	//Création des boutons Save et Cancel
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
											 initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  
											 target:self 
											 action:@selector(cancel:)] autorelease]; 
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
											   target:self 
											   action:@selector(save:)] autorelease]; 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction) save: (id) sender{

	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender{
	
	[self dismissModalViewControllerAnimated:YES];
}


@end
