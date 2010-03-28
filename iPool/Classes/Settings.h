//
//  Settings.h
//  NavApp
//
//  Created by Legault, Martin on 10-03-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Settings : NSObject {
	
	NSString* poolName;
	int offencePlayerTotal;
	int defencePlayerTotal;
	int goaliePlayerTotal;
	int numberOfPlayers;
	int offencePointsPerGoal;
	int offencePointsPerAssist;
	int offenceDifferentialValue;
	BOOL offenceDifferentialActivated; // (<0 || >0)
	int defencePointsPerGoal;
	int defencePointsPerAssist;
	int defenceDifferentialValue;
	BOOL defenceDifferentialActivated; // (<0 || >0)
	int goalerPointsPerWin;
	int goalerPointsPerShutout;
	int goalerPointsPerShootoutSave;
	int goalerPointsPerOTLoss;
	int goalerPointsPerShoutout;
	BOOL saved;
}


+ (Settings*)getInstance;

@property (nonatomic, retain) NSString* poolName;
@property (nonatomic, assign) int offencePlayerTotal;
@property (nonatomic, assign) int defencePlayerTotal;
@property (nonatomic, assign) int goaliePlayerTotal;
@property (nonatomic, assign) int numberOfPlayers;
@property (nonatomic, assign) int offencePointsPerGoal;
@property (nonatomic, assign) int offencePointsPerAssist;
@property (nonatomic, assign) BOOL offenceDifferentialActivated;
@property (nonatomic, assign) int offenceDifferentialValue;
@property (nonatomic, assign) int defencePointsPerGoal;
@property (nonatomic, assign) int defencePointsPerAssist;
@property (nonatomic, assign) int defenceDifferentialValue;
@property (nonatomic, assign) BOOL defenceDifferentialActivated;
@property (nonatomic, assign) int goalerPointsPerWin;
@property (nonatomic, assign) int goalerPointsPerShutout;
@property (nonatomic, assign) int goalerPointsPerShootoutSave;
@property (nonatomic, assign) int goalerPointsPerOTLoss;
@property (nonatomic, assign) int goalerPointsPerShoutout;
@property (nonatomic, assign) BOOL saved;

@end
