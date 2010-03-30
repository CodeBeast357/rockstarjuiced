//
//  Settings.m
//  NavApp
//
//  Created by Legault, Martin on 10-03-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"
#import "PoolerList.h"

/*
 http://stackoverflow.com/questions/145154/what-does-your-objective-c-singleton-look-like/145403#145403
 */

static Settings *instance = nil;

@implementation Settings
@synthesize
	poolName,
	offencePlayerTotal,
	defencePlayerTotal,
	goaliePlayerTotal,
	numberOfPlayers,
	offencePointsPerGoal,
	offencePointsPerAssist,
	offenceDifferentialActivated,
	offenceDifferentialValue,
	defencePointsPerGoal,
	defencePointsPerAssist,
	defenceDifferentialValue,
	defenceDifferentialActivated,
	goalerPointsPerWin,
	goalerPointsPerShutout,
	goalerPointsPerShootoutSave,
	goalerPointsPerOTLoss,
	goalerPointsPerShoutout,
	saved;

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
		poolName = @"Default";
		numberOfPlayers = 2;
		
		offencePlayerTotal = 2;
		offencePointsPerGoal = 1;
		offencePointsPerAssist = 1;
		offenceDifferentialActivated = NO;
		
		defencePlayerTotal = 0;
		defencePointsPerGoal = 2;
		defencePointsPerAssist = 1;
		defenceDifferentialActivated = NO;
		
		goaliePlayerTotal = 0;
		goalerPointsPerWin = 2;
		goalerPointsPerOTLoss = 1;
		goalerPointsPerShoutout = 2;
		
		saved = NO;

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

- (void) resetPool {
	[self setSaved: NO];
	
	// Empty Poolers List
	PoolerList *poolers = [PoolerList getInstance];
	[poolers resetList];
	
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

- (void)setSaved:(BOOL)value{
	saved = value;
	if (saved) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"settingsChanged" object:nil];
	} else {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"settingsReset" object:nil];
		
		// Réinitialisation
		poolName = @"Default";
		numberOfPlayers = 2;
		
		offencePlayerTotal = 2;
		offencePointsPerGoal = 1;
		offencePointsPerAssist = 1;
		offenceDifferentialActivated = NO;
		
		defencePlayerTotal = 0;
		defencePointsPerGoal = 2;
		defencePointsPerAssist = 1;
		defenceDifferentialActivated = NO;
		
		goaliePlayerTotal = 0;
		goalerPointsPerWin = 2;
		goalerPointsPerOTLoss = 1;
		goalerPointsPerShoutout = 2;
	}

}

@end
