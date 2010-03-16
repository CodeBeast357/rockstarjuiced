/*
 *  team.h
 *  
 *
 *  Created by Hébert Bussières, Ian-Paul on 10-03-15.
 *  Copyright 2010 iPool All rights reserved.
 *
 */

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import "Skater.h"
#import "Goalie.h"

@interface Team: NSObject {
    NSString *teamName;
    NSString *teamTown;
	NSString *townAbbreviation;
	NSMutableArray *skaterList;
	NSMutableArray *goalieList;
}

-(NSString*) teamName;
-(NSString*) teamTown;
-(NSString*) townAbbreviation;
-(NSMutableArray*) skaterList;
-(NSMutableArray*) goalieList;
-(void) setTeamName: (NSString*) input;
-(void) setTeamTown: (NSString*) input;
-(void) setTownAbbreviation: (NSString*) input;
-(void) addSkater: (Skater*) input;
-(void) addGoalie: (Goalie*) input;
-(void) sortSkaterByLastName;
-(void) sortSkaterByFirstName;
-(void) sortSkaterByGoals;
-(void) sortSkaterByDifferential;
-(void) sortGoalieByOvertimeLosses;
-(void) sortGoalieByShootoutSaves;
-(void) sortGoalieByWins;
-(void) sortGoalieByShutouts;
@end
