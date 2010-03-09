//
//  viewWinnerControler.m
//  NavApp
//
//  Created by Monarque, François on 10-02-01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ViewWinnerController.h"


@implementation ViewWinnerController
#define TOTAL_ROUND 12
#define TOTAL_JUDGE 3


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

//Source : http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		//Custom initialization
		
		//Get all judge and boxer name from the delegate
		mainDelegate = (NavAppAppDelegate *)[[UIApplication sharedApplication] delegate];
		int i=0;
		int j=0;
		int k=0;

		for(i=0;i<TOTAL_ROUND;i++){
			for(j=0;j<TOTAL_JUDGE;j++){
				for(k=0;k<2;k++){
					scoreSheet[i][j][k]= [mainDelegate getScore:i :j :k];
					NSLog([NSString stringWithFormat:@"%d", scoreSheet[i][j][k]]);
				}
			}
		}
		
		
		
		
		
    }
    return self;
}


@end
