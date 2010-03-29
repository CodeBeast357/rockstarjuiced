//
//  viewStatisticsController.m
//  NavApp
//
//  Created by Monarque, François on 10-03-15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//Source : http://www.iphonesdkarticles.com/2008/08/table-view-tutorial-tableview-cell.html

#import "ViewStatisticsController.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)

@implementation ViewStatisticsController
@synthesize poolersStatitisticsTable,poolerList,poolerStatisticsController;



//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
		
    }
    return self;
}

- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Poolers Statistics";
	
	[[PoolerList getInstance] sortByTotalPoints];
	poolerList= [[PoolerList getInstance] poolerList];

	
	UILabel *headerLabel = [[[UILabel alloc] initWithFrame: CGRectMake(0, 0, 320, 50)] autorelease];
	headerLabel.font = [UIFont fontWithName:@"Courier New" size:20];
	headerLabel.backgroundColor = [UIColor blackColor];
	headerLabel.textColor = [UIColor whiteColor];
	headerLabel.text = @" RNK Pooler Name   Points";
	poolersStatitisticsTable.tableHeaderView = headerLabel;
	
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{

	
	return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString* identifier = @"origin";
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] init] autorelease];
	}
	
	cell.font=[UIFont fontWithName:@"Courier New" size:20];
	
	//RANK
	NSString *rank= [NSString stringWithFormat:@"%d",indexPath.row+1];
	NSString *shortRank= rank;
	//minimize
	if(rank.length > 3){
		shortRank= [rank substringToIndex:3];
	}
	//padding
	while(shortRank.length!=3){
		shortRank= [shortRank stringByAppendingString:@" "];
	}
	
	//POOLER NAME
	Pooler *pooler= [poolerList objectAtIndex:indexPath.row];
	NSString *poolerName= pooler.poolerName;
	
	NSString *shortName= poolerName;
	//minimize
	if(poolerName.length > 13){
		shortName= [poolerName substringToIndex:13];
	}
	//padding
	while(shortName.length!=13){
		shortName= [shortName stringByAppendingString:@" "];
	}
	
	//TOTAL POINT
	NSString *totalPoint= [NSString stringWithFormat:@"%d",pooler.totalPoint];
	NSString *shortTotalPoint= totalPoint;
	//minimize
	if(totalPoint.length > 6){
		shortTotalPoint= [totalPoint substringToIndex:6];
	}
	//padding
	while(shortTotalPoint.length!=6){
		shortTotalPoint= [shortTotalPoint stringByAppendingString:@" "];
	}
	
	
	
	
	//"%3d Pooler Name   Points";
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@",shortRank,shortName,shortTotalPoint];
	
	return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [poolerList count];
}

 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

//Source : http://www.iphonedevsdk.com/forum/iphone-sdk-development/2769-digging-how-pass-values-between-views.html
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	PoolerStatisticsController *poolerStatistics = [[PoolerStatisticsController alloc]
													initWithNibName:@"PoolerStatistics" bundle:[NSBundle mainBundle]];
	self.poolerStatisticsController = poolerStatistics;
	
	
	[poolerStatistics release];
	
	
	[self.navigationController pushViewController:self.poolerStatisticsController animated:YES];
	
}

-(IBAction)switchPagePoolerStatistics:(id)sender{
	
	

	
	
}

/*
//http://www.iphonedevsdk.com/forum/iphone-sdk-development/5172-font-size-color-tableview-header.html									  
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
	{
		// create the parent view that will hold header Label
		UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
		
		// create the button object
		UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		headerLabel.backgroundColor = [UIColor clearColor];
		headerLabel.opaque = NO;
		headerLabel.textColor = [UIColor blackColor];
		headerLabel.highlightedTextColor = [UIColor whiteColor];
		headerLabel.font = [UIFont boldSystemFontOfSize:20];
		headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
		
		// If you want to align the header text as centered
		// headerLabel.frame = CGRectMake(150.0, 0.0, 300.0, 44.0);
		
		headerLabel.text = @"RNK Pooler Name    -Points";
		[customView addSubview:headerLabel];
		
		return customView;
	}
 */


//Source: http://stackoverflow.com/questions/356882/how-can-i-display-one-uiview-in-landscape
/*- (void) viewWillAppear:(BOOL)animated{
	
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	      
	if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
		
		[UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480, 320);
		
		/*
		self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
		self.navigationController.navigationBar.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
		self.navigationController.navigationBar.bounds = CGRectMake(0.0, 0.0, 480, 50);
		self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(150, 100);
		 */

		
	//}
	//[UIView commitAnimations];
	

//}


@end
