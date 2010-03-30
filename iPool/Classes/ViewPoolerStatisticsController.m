//
//  ViewPoolerStatisticsController.m
//  NavApp
//
//  Created by Monarque, François on 10-03-29.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ViewPoolerStatisticsController.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)


@implementation ViewPoolerStatisticsController
@synthesize poolerList,forwardsList,defencemenList,goaliesList;

- (id)init {
	if (![super init])
		return nil;
	
	[[PoolerList getInstance] sortByTotalPoints];
	poolerList= [[PoolerList getInstance] poolerList];
	Delegate *delegate= (Delegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"pooler:%d", delegate.row);
	Pooler *pooler= [poolerList objectAtIndex:delegate.row];
	
	forwardsList= pooler.forwardsList;
	defencemenList= pooler.defencemenList;
	goaliesList= pooler.goaliesList;
	
	
	
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
	NSLog(@"count:%d",[poolerList count]);
	return [forwardsList count]+1;
}
- (NSInteger)numberOfColumnsInGridView:(DTGridView *)gridView forRowWithIndex:(NSInteger)index {
	return 4;
}

- (CGFloat)gridView:(DTGridView *)gridView heightForRow:(NSInteger)rowIndex {
	return 50.0;
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
	
	DTGridViewCell *view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"info"];
	
	view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"VIEW"];
	
	if(rowIndex==0){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"PLAYER"];
		}
		else if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GOALS"];
		}
		else if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"ASSITS"];
		}
		else if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"+/-"];
		}
		
	}
	else{
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[[forwardsList objectAtIndex:rowIndex-1] firstName]];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-1] goals]]];
		}
		if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-1] assists]]];
		}
		if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-1] differential]]];
		}
	}
	
	
	//COLOR
	if(rowIndex==0){
		view.backgroundColor= [UIColor blackColor];
	}
	else if(rowIndex%2==0){
		if(columnIndex%2==0){
			view.backgroundColor= [[UIColor alloc] initWithRed:0.54 green:0 blue:0 alpha:1];
		}
		else{
			view.backgroundColor= [[UIColor alloc] initWithRed:0.35 green:0 blue:0 alpha:1];
		}
	}
	else{
		if(columnIndex%2==0){
			view.backgroundColor= [[UIColor alloc] initWithRed:0.54 green:0.54 blue:0.54 alpha:1];
		}
		else{
			view.backgroundColor= [[UIColor alloc] initWithRed:0.35 green:0.35 blue:0.35 alpha:1];
		}
	}
	
	
	
	
	return [view autorelease];
}

- (void)gridView:(DTGridView *)gridView selectionMadeAtRow:(NSInteger)rowIndex column:(NSInteger)columnIndex {
	NSLog(@"%@:%s", self, _cmd);
}

- (void)gridView:(DTGridView *)gridView scrolledToEdge:(DTGridViewEdge)edge {
}


@end
