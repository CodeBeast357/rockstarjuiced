//
//  viewStatisticsController.h
//  NavApp
//
//  Created by Monarque, François on 10-03-15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//Source : http://www.iphonesdkarticles.com/2008/08/table-view-tutorial-tableview-cell.html

#import <UIKit/UIKit.h>
#import "Delegate.h"
#import "PoolerList.h"


@interface ViewStatisticsController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	Delegate *mainDelegate;
	
	IBOutlet UITableView* poolersStatitisticsTable;
	
	NSMutableArray *poolerList;
}

@property (nonatomic, retain) UITableView* poolersStatitisticsTable;
@property (nonatomic, retain) NSMutableArray *poolerList;

@end
