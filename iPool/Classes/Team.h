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

@property (nonatomic, retain)  NSString* teamName;
@property (nonatomic, retain)  NSString* teamTown;
@property (nonatomic, retain)  NSString* townAbbreviation;
@property (nonatomic, retain)  NSMutableArray* skaterList;
@property (nonatomic, retain)  NSMutableArray* goalieList;
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
