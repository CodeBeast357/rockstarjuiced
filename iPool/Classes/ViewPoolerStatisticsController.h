//
//  ViewPoolerStatisticsController.h
//  NavApp
//
//  Created by Monarque, François on 10-03-29.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PoolerList.h"
#import <Foundation/Foundation.h>
#import "DTGridViewController.h"
#import "Delegate.h"

@interface ViewPoolerStatisticsController :DTGridViewController {
	
	NSMutableArray *poolerList;
	NSMutableArray *defencemenList;
	NSMutableArray *forwardsList;
	NSMutableArray *goaliesList;
}

@property (nonatomic, retain) NSMutableArray *poolerList;
@property (nonatomic, retain) NSMutableArray *defencemenList;
@property (nonatomic, retain) NSMutableArray *forwardsList;
@property (nonatomic, retain) NSMutableArray *goaliesList;

@end
