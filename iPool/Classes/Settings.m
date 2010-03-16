//
//  Settings.m
//  NavApp
//
//  Created by Legault, Martin on 10-03-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"

/*
 http://stackoverflow.com/questions/145154/what-does-your-objective-c-singleton-look-like/145403#145403
 */

static Settings *instance = nil;

@implementation Settings

+ (Settings*)getInstance {
	@synchronized(self) {
		if (instance == nil) {
			instance = [[Settings alloc] init];
		}
	}
	return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

- (int)poolName {
	return poolName;
}

- (int)offencePlayerTotal {
	return offencePlayerTotal;
}

- (int)defencePlayerTotal {
	return defencePlayerTotal;
}

- (int)goaliePlayerTotal {
	return goaliePlayerTotal;
}

- (int)numberOfPlayers {
	return offencePlayerTotal + defencePlayerTotal + goaliePlayerTotal;
}

- (int)offencePointsPerGoal {
	return offencePointsPerGoal;
}

- (int)offencePointsPerAssist {
	return offencePointsPerAssist;
}

- (int)offenceDifferentialActivated {
	return offenceDifferentialActivated;
}

- (int)defencePointsPerGoal {
	return defencePointsPerGoal;
}

- (int)defencePointsPerAssist {
	return defencePointsPerAssist;
}

- (int)defenceDifferentialActivated {
	return defenceDifferentialActivated;
}

- (int)goalerPointsPerWin {
	return goalerPointsPerWin;
}

- (int)goalerPointsPerOTLoss {
	return goalerPointsPerOTLoss;
}

@end
