//
//  PoolerList.m
//  NavApp
//
//  Created by Ian Bussières on 18/03/10.
//  Copyright 2010 iPool. All rights reserved.
//

#import "PoolerList.h"

static PoolerList *instance = nil;


@implementation PoolerList
@synthesize poolerList;

+ (PoolerList*) getInstance {
        @synchronized(self) {
                if (instance == nil) {
                        instance = [[PoolerList alloc] init];
                }
        }
        return instance;
}
- (PoolerList*)init {
	if (self = [super init]) {
		
		poolerList = [[NSMutableArray alloc] init];
		
	}
	return self;
}

- (NSMutableArray*) poolerList {
        return poolerList;
}

- (void) addPooler: (Pooler*) input
{
        [poolerList addObject: input];
}

- (void) sortByTotalPoints
{
	for( Pooler *pooler in poolerList){
		pooler.sortableTotalPoints = [pooler getSortableTotalPoints];
	}
	NSSortDescriptor *totalPointsSorter = [[NSSortDescriptor alloc] initWithKey:@"totalPoint" ascending:YES];
	[poolerList sortUsingDescriptors:[NSArray arrayWithObject:totalPointsSorter]];
}

- (void) resetList
{
	[poolerList removeAllObjects];
}


@end