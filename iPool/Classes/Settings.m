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

- (Settings*)init {
	if (self = [super init]) {
		// Initialisation
	}
	return self;
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

- (NSString*)poolName {
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

- (void)setPoolName:(NSString*)newName {
	poolName = newName;
}

- (void)setOffencePlayerTotal:(int)nOff {
	offencePlayerTotal = nOff;
}

- (void)setDefencePlayerTotal:(int)nDef {
	defencePlayerTotal = nDef;
}

- (void)setGoaliePlayerTotal:(int)nGoal {
	goaliePlayerTotal = nGoal;
}

/*
- (int)setNumberOfPlayers:(int)nPlay {
}*/
- (void)setOffencePointsPerGoal:(int)nOff {
	offencePointsPerGoal = nOff;
}

- (void)setOffencePointsPerAssist:(int)nOff {
	offencePointsPerAssist = nOff;
}

- (void)setOffenceDifferentialActivated:(int)nOff {
	offenceDifferentialActivated = nOff;
}

- (void)setDefencePointsPerGoal:(int)nDef {
	defencePointsPerGoal = nDef;
}

- (void)setDefencePointsPerAssist:(int)nDef {
	defencePointsPerAssist = nDef;
}

- (void)setDefenceDifferentialActivated:(int)nDef {
	defenceDifferentialActivated = nDef;
}

- (void)setGoalerPointsPerWin:(int)nGoal {
	goalerPointsPerWin = nGoal;
}

- (void)setGoalerPointsPerOTLoss:(int)nGoal {
	goalerPointsPerOTLoss = nGoal;
}

@end
