//
//  viewStatisticsController.h
//  NavApp
//
//  Created by Monarque, François on 10-03-15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//Source : http://www.iphonesdkarticles.com/2008/08/table-view-tutorial-tableview-cell.html

#import "Delegate.h"
#import "PoolerList.h"
#import <Foundation/Foundation.h>
#import "DTGridViewController.h"


@interface ViewStatisticsController :DTGridViewController {
	Delegate *mainDelegate;
	NSMutableArray *poolerList;
	NSArray *colours;
}

@property (nonatomic, retain) NSMutableArray *poolerList;

@end
