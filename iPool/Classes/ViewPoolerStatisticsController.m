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
	NSLog(@"pooler:%d", delegate.cellRow);
	Pooler *pooler= [poolerList objectAtIndex:delegate.cellRow];
	
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
	return [forwardsList count]+[defencemenList count]+[goaliesList count]+6;
}
- (NSInteger)numberOfColumnsInGridView:(DTGridView *)gridView forRowWithIndex:(NSInteger)index {
	return 6;
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
	
	DTGridViewCell *view = [[DTGridViewCell alloc] initWithReuseIdentifier:@""];
	
	view = [[DTGridViewCell alloc] initWithReuseIdentifier:@""];
	
	
	//TITLE FORWARD
	if(rowIndex==0 && columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"FORWARD"];
	}

	//TITLE DEFENSE
	else if(rowIndex==[forwardsList count]+2 && columnIndex==0){
		view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"DEFENSE"];
	}
	
	//TITLE GOALIE
	else if(rowIndex==[forwardsList count]+[defencemenList count]+4 && columnIndex==0){
		view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GOALIE"];
	}
	
	//LABEL FORWARD
	else if(rowIndex==1 ){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"FIRST"];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"LAST"];
		}
		else if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GOALS"];
		}
		else if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"ASSITS"];
		}
		else if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"+/-"];
		}
		else if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GAMEPLAY"];
		}
		
	}
	//LABEL DEFENCE
	else if(rowIndex==[forwardsList count]+3  ){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"FIRST"];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"LAST"];
		}
		else if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GOALS"];
		}
		else if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"ASSITS"];
		}
		else if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"+/-"];
		}
		else if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GP"];
		}
		
	}
	
	//LABEL GOALIE 
	else if(rowIndex==[forwardsList count]+[defencemenList count]+5){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"FIRST"];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"LAST"];
		}
		else if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"WIN"];
		}
		else if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"OTL"];
		}
		else if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"SO"];
		}
		else if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:@"GP"];
		}
	}
	
	//FORWARD DATA
	else if(rowIndex>1 && rowIndex<[forwardsList count]+2){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[forwardsList objectAtIndex:rowIndex-2] firstName]]];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[forwardsList objectAtIndex:rowIndex-2] lastName]]];
		}
		if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-2] goals]]];
		}
		if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-2] assists]]];
		}
		if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-2] differential]]];
		}		
		if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[forwardsList objectAtIndex:rowIndex-2] gamePlay]]];
		}
	}
			
	//DEFENCE DATA
	else if(rowIndex>[forwardsList count]+3 && rowIndex<[forwardsList count]+[defencemenList count]+4){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4) ] firstName]]];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4)] lastName]]];
		}
		if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4)] goals]]];
		}
		if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4)] assists]]];
		}
		if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4)] differential]]];
		}		
		if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[defencemenList objectAtIndex:rowIndex-([forwardsList count]+4)] gamePlay]]];
		}
	}
	
	//GOALIE DATA
	else if(rowIndex>[forwardsList count]+[defencemenList count]+5){
		if(columnIndex==0){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] firstName]]];
		}
		if(columnIndex==1){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%@",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] lastName]]];
		}
		if(columnIndex==2){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] wins]]];
		}
		if(columnIndex==3){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] overtimeLosses]]];
		}
		if(columnIndex==4){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] shutouts]]];
		}
		if(columnIndex==5){
			view = [[DTGridViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"%d",[[goaliesList objectAtIndex:rowIndex-([forwardsList count]+[defencemenList count]+6)] gamePlay]]];
		}

	}

	
	
	//COLOR
	if((rowIndex==0)|| (rowIndex==[forwardsList count]+2) || (rowIndex==[forwardsList count]+[defencemenList count]+4)){
		view.button.titleLabel.backgroundColor=[UIColor blueColor];
		//view.backgroundColor=[UIColor blueColor];
	}
	else if((rowIndex==1) || (rowIndex==[forwardsList count]+3) || (rowIndex==[forwardsList count]+[defencemenList count]+5) ){
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
