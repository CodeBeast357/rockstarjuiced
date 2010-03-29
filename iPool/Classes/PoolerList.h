//
//  PoolerList.h
//  NavApp
//
//  Created by Ian Bussières on 18/03/10.
//  Copyright 2010 iPool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSString.h>
#import "Pooler.h"

@interface PoolerList : NSObject {
        NSMutableArray *poolerList;
}

+ (PoolerList*)getInstance;
- (NSMutableArray*) poolerList;
- (void) addPooler: (Pooler*) input;
- (void) sortByTotalPoints;
- (void) resetList;
	

@property (nonatomic, retain)  NSMutableArray* poolerList;

@end