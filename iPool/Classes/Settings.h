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
	//int numberOfPlayers (= offence + defence + goalie)
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
- (int)numberOfPlayers; // (= offence + defence + goalie)
- (int)offencePointsPerGoal;
- (int)offencePointsPerAssist;
- (int)offenceDifferentialActivated; // (<0 || >0)
- (int)defencePointsPerGoal;
- (int)defencePointsPerAssist;
- (int)defenceDifferentialActivated; // (<0 || >0)
- (int)goalerPointsPerWin;
- (int)goalerPointsPerOTLoss;

@end
