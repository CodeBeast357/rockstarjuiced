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

}


+ (Settings*)getInstance;

@property (nonatomic, retain) NSString* poolName;
@property (nonatomic) int offencePlayerTotal;
@property (nonatomic) int defencePlayerTotal;
@property (nonatomic) int goaliePlayerTotal;
@property (nonatomic) int numberOfPlayers;
@property (nonatomic) int offencePointsPerGoal;
@property (nonatomic) int offencePointsPerAssist;
@property (nonatomic) BOOL offenceDifferentialActivated;
@property (nonatomic) int offenceDifferentialValue;
@property (nonatomic) int defencePointsPerGoal;
@property (nonatomic) int defencePointsPerAssist;
@property (nonatomic) int defenceDifferentialValue;
@property (nonatomic) BOOL defenceDifferentialActivated;
@property (nonatomic) int goalerPointsPerWin;
@property (nonatomic) int goalerPointsPerShutout;
@property (nonatomic) int goalerPointsPerShootoutSave;
@property (nonatomic) int goalerPointsPerOTLoss;
@property (nonatomic) int goalerPointsPerShoutout;

@end
