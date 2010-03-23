//
//  Pooler.h
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//


#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import "Skater.h"
#import "Goalie.h"

@interface Pooler: NSObject {
	NSString* poolerName;
	NSMutableArray *defencemenList;
	NSMutableArray *forwardsList;
	NSMutableArray *goaliesList;
}

@property (nonatomic, retain) NSString* poolerName;
-(NSMutableArray*) defencemenList;
-(NSMutableArray*) forwardsList;
-(NSMutableArray*) goaliesList;
-(void) addDefenceman: (Skater*) input;
-(void) addForward: (Skater*) input;
-(void) addGoalie: (Goalie*) input;
-(void) sortForwardsByLastName;
-(void) sortForwardsByFirstName;
-(void) sortForwardsByGoals;
-(void) sortForwardsByAssists;
-(void) sortForwardsByDifferential;
-(void) sortDefencemenByLastName;
-(void) sortDefencemenByFirstName;
-(void) sortDefencemenByGoals;
-(void) sortDefencemenByAssists;
-(void) sortDefencemenByDifferential;
-(void) sortGoaliesByLastName;
-(void) sortGoaliesByFirstName;
-(void) sortGoaliesByWins;
-(void) sortGoaliesByOvertimeLosses;
-(void) sortGoaliesByShutouts;
-(int) getPointsForGoalForward: (Skater*) s;
-(int) getPointsForAssistForward: (Skater*) s;
-(int) getPointsForDifferentialForward: (Skater*) s;
-(int) getPointsForGoalDefence: (Skater*) s;
-(int) getPointsForAssistDefence: (Skater*) s;
-(int) getPointsForDifferentialDefence: (Skater*) s;
-(int) getPointsForWinGoalie: (Goalie*) g;
-(int) getPointsForShutoutGoalie: (Goalie*) g;
-(int) getPointsForOTLossGoalie: (Goalie*) g;

@end