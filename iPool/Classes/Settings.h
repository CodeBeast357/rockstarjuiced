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

- (NSString*)poolName;
- (int)offencePlayerTotal;
- (int)defencePlayerTotal;
- (int)goaliePlayerTotal;
- (int)numberOfPlayers;
- (int)offencePointsPerGoal;
- (int)offencePointsPerAssist;
- (BOOL)offenceDifferentialActivated;
- (int)offenceDifferentialValue;
- (int)defencePointsPerGoal;
- (int)defencePointsPerAssist;
- (int)defenceDifferentialValue;
- (BOOL)defenceDifferentialActivated;
- (int)goalerPointsPerWin;
- (int)goalerPointsPerShutout;
- (int)goalerPointsPerShootoutSave;
- (int)goalerPointsPerOTLoss;
- (int) goalerPointsPerShoutout;

- (void)setPoolName:(NSString*)newName;
- (void)setOffencePlayerTotal:(int)nOff;
- (void)setDefencePlayerTotal:(int)nDef;
- (void)setGoaliePlayerTotal:(int)nGoal;
- (void)setNumberOfPlayers:(int)nPlay;
- (void)setOffencePointsPerGoal:(int)nOff;
- (void)setOffencePointsPerAssist:(int)nOff;
- (void)setOffenceDifferentialValue:(int)nOff; 
- (void)setOffenceDifferentialActivated:(BOOL)nOff;
- (void)setDefencePointsPerGoal:(int)nDef;
- (void)setDefencePointsPerAssist:(int)nDef;
- (void)setDefenceDifferentialValue:(int)nDef;
- (void)setDefenceDifferentialActivated:(BOOL)nDef;
- (void)setGoalerPointsPerWin:(int)nGoal;
- (void)setGoalerPointsPerShutout:(int)nGoal;
- (void)setGoalerPointsPerOTLoss:(int)nGoal;
- (void) setGoalerPointsPerShoutout:(int)nPts;

@end
