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
	int offenceDifferentialActivated; // (<0 || >0)
	int defencePointsPerGoal;
	int defencePointsPerAssist;
	int defenceDifferentialActivated; // (<0 || >0)
	int goalerPointsPerWin;
	int goalerPointsPerOTLoss;

}


+ (Settings*)getInstance;

- (NSString*)poolName;
- (int)offencePlayerTotal;
- (int)defencePlayerTotal;
- (int)goaliePlayerTotal;
- (int)numberOfPlayers;
- (int)offencePointsPerGoal;
- (int)offencePointsPerAssist;
- (int)offenceDifferentialActivated;
- (int)defencePointsPerGoal;
- (int)defencePointsPerAssist;
- (int)defenceDifferentialActivated;
- (int)goalerPointsPerWin;
- (int)goalerPointsPerOTLoss;

- (void)setPoolName:(NSString*)newName;
- (void)setOffencePlayerTotal:(int)nOff;
- (void)setDefencePlayerTotal:(int)nDef;
- (void)setGoaliePlayerTotal:(int)nGoal;
- (void)setNumberOfPlayers:(int)nPlay;
- (void)setOffencePointsPerGoal:(int)nOff;
- (void)setOffencePointsPerAssist:(int)nOff;
- (void)setOffenceDifferentialActivated:(int)nOff;
- (void)setDefencePointsPerGoal:(int)nDef;
- (void)setDefencePointsPerAssist:(int)nDef;
- (void)setDefenceDifferentialActivated:(int)nDef;
- (void)setGoalerPointsPerWin:(int)nGoal;
- (void)setGoalerPointsPerOTLoss:(int)nGoal;

@end
