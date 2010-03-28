//
//  PoolerList.m
//  NavApp
//
//  Created by Ian Bussi�res on 18/03/10.
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

- (NSMutableArray*) poolerList {
        return poolerList;
}

- (void) addPooler: (Pooler*) input
{
        [poolerList addObject: input];
}

@end