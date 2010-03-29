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
@synthesize poolerList;



- (id)init {
	if (![super init])
		return nil;
	
	mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
	[[PoolerList getInstance] sortByTotalPoints];
	poolerList= [[PoolerList getInstance] poolerList];
	
	colours = [[NSArray alloc] initWithObjects:
			   [UIColor redColor],
			   [UIColor blueColor],
			   [UIColor greenColor],
			   [UIColor magentaColor],
			   [UIColor yellowColor],
			   [UIColor whiteColor],
			   [UIColor grayColor],
			   [UIColor lightGrayColor],
			   [UIColor purpleColor],
			   [UIColor orangeColor],
			   nil];
	
	return self;
}


- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.title = @"Poolers Statistics";
	
	self.gridView.gridDelegate = self;
	self.gridView.dataSource = self;
	self.gridView.bounces = YES;
	
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
- (NSInteger)spacingBetweenRowsInGridView:(DTGridView *)gridView {
	return 7;
}

- (NSInteger)spacingBetweenColumnsInGridView:(DTGridView *)gridView {
	return 4;
}
- (NSInteger)numberOfRowsInGridView:(DTGridView *)gridView {
	return 10;
}
- (NSInteger)numberOfColumnsInGridView:(DTGridView *)gridView forRowWithIndex:(NSInteger)index {
	return 10;
}

- (CGFloat)gridView:(DTGridView *)gridView heightForRow:(NSInteger)rowIndex {
	return 100.0;
}
- (CGFloat)gridView:(DTGridView *)gridView widthForCellAtRow:(NSInteger)rowIndex column:(NSInteger)columnIndex {
	
	return 100.0;
	
	if (rowIndex == 0) {
		if (columnIndex == 0)
			return 120.0;
		else if (columnIndex == 1)
			return 200.0;
		else if (columnIndex == 2)
			return 20.0;
		else if (columnIndex == 3)
			return 60.0;
		else if (columnIndex == 4)
			return 100.0;
	} else if (rowIndex == 1){
		if (columnIndex == 0)
			return 30.0;
		else if (columnIndex == 1)
			return 170.0;
		else if (columnIndex == 2)
			return 200.0;
		else if (columnIndex == 3)
			return 40.0;
		else if (columnIndex == 4)
			return 60.0;
	} else if (rowIndex == 2){
		if (columnIndex == 0)
			return 30.0;
		else if (columnIndex == 1)
			return 160.0;
		else if (columnIndex == 2)
			return 110.0;
		else if (columnIndex == 3)
			return 70.0;
		else if (columnIndex == 4)
			return 130.0;
	} else if (rowIndex == 3) {
		if (columnIndex == 0)
			return 100.0;
		else if (columnIndex == 1)
			return 100.0;
		else if (columnIndex == 2)
			return 100.0;
		else if (columnIndex == 3)
			return 100.0;
		else if (columnIndex == 4)
			return 100.0;
	} else if (rowIndex == 4){
		if (columnIndex == 0)
			return 100.0;
		else if (columnIndex == 1)
			return 100.0;
		else if (columnIndex == 2)
			return 100.0;
		else if (columnIndex == 3)
			return 100.0;
		else if (columnIndex == 4)
			return 100.0;
	} else if (rowIndex == 5){
		if (columnIndex == 0)
			return 100.0;
		else if (columnIndex == 1)
			return 100.0;
		else if (columnIndex == 2)
			return 100.0;
		else if (columnIndex == 3)
			return 100.0;
		else if (columnIndex == 4)
			return 100.0;
	} else if (rowIndex == 6){
		if (columnIndex == 0)
			return 100.0;
		else if (columnIndex == 1)
			return 100.0;
		else if (columnIndex == 2)
			return 100.0;
		else if (columnIndex == 3)
			return 100.0;
		else if (columnIndex == 4)
			return 100.0;
	} else if (rowIndex == 7) {
		if (columnIndex == 0)
			return 100.0;
		else if (columnIndex == 1)
			return 100.0;
		else if (columnIndex == 2)
			return 100.0;
		else if (columnIndex == 3)
			return 100.0;
		else if (columnIndex == 4)
			return 100.0;
	}
	return 150.0;
}

//- (NSNumber *)gridView:(DTGridView *)gridView heightForRowAtIndex:(NSInteger)index;
- (DTGridViewCell *)gridView:(DTGridView *)gv viewForRow:(NSInteger)rowIndex column:(NSInteger)columnIndex {
	
	DTGridViewCell *view = [[gv dequeueReusableCellWithIdentifier:@"cell"] retain];
	
	if (!view) {
		view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"cell"];
	}
	
	if(rowIndex==0){
		view.backgroundColor= [UIColor blackColor];
	}
	else if(rowIndex%2==0){
		view.backgroundColor= [UIColor blueColor];
	}
	else{
		view.backgroundColor= [UIColor grayColor];
	}
	//[colours objectAtIndex:(random() % 10)];
	view.identifier=@"super";
	
	return [view autorelease];
}

- (void)gridView:(DTGridView *)gridView selectionMadeAtRow:(NSInteger)rowIndex column:(NSInteger)columnIndex {
	NSLog(@"%@:%s", self, _cmd);
}

- (void)gridView:(DTGridView *)gridView scrolledToEdge:(DTGridViewEdge)edge {
}


@end
