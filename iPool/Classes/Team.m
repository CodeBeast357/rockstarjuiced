//
//  Team.m
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Team.h"

@implementation Team
@synthesize teamName, teamTown, townAbbreviation, goalieList, skaterList;


- (Team*)init {
	if (self = [super init]) {
		
		// Initialisation
		skaterList = [[NSMutableArray alloc] init];
		goalieList = [[NSMutableArray alloc] init];
		
	}
	return self;
}

- (void) addSkater: (Skater*)input
{
	[skaterList addObject: input];
}

- (void) addGoalie: (Goalie*)input
{
	[goalieList addObject: input];
}

- (void) sortSkaterByLastName
{
	NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
}

- (void) sortSkaterByFirstName
{
	NSSortDescriptor *firstNameSorter = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:firstNameSorter]];
}

- (void) sortSkaterByGoals
{
	NSSortDescriptor *goalsSorter = [[NSSortDescriptor alloc] initWithKey:@"goals" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:goalsSorter]];
}

- (void) sortSkaterByAssists
{
	NSSortDescriptor *assistsSorter = [[NSSortDescriptor alloc] initWithKey:@"assists" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:assistsSorter]];
}

- (void) sortSkaterByDifferential
{
	NSSortDescriptor *differentialSorter = [[NSSortDescriptor alloc] initWithKey:@"differential" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:differentialSorter]];
}

- (void) sortSkaterByShootout
{
	NSSortDescriptor *shootoutSorter = [[NSSortDescriptor alloc] initWithKey:@"shootout" ascending:YES];
	[skaterList sortUsingDescriptors:[NSArray arrayWithObject:shootoutSorter]];
}

- (void) sortGoalieByShootoutSaves
{
	NSSortDescriptor *shootoutSavesSorter = [[NSSortDescriptor alloc] initWithKey:@"shootoutSaves" ascending:YES];
	[goalieList sortUsingDescriptors:[NSArray arrayWithObject:shootoutSavesSorter]];
}

- (void) sortGoalieByWins
{
	NSSortDescriptor *winsSorter = [[NSSortDescriptor alloc] initWithKey:@"wins" ascending:YES];
	[goalieList sortUsingDescriptors:[NSArray arrayWithObject:winsSorter]];
}

- (void) sortGoalieByOvertimeLosses
{
	NSSortDescriptor *otLossSorter = [[NSSortDescriptor alloc] initWithKey:@"otLoss" ascending:YES];
	[goalieList sortUsingDescriptors:[NSArray arrayWithObject:otLossSorter]];
}

- (void) sortGoalieByShutouts
{
	NSSortDescriptor *shutoutSorter = [[NSSortDescriptor alloc] initWithKey:@"shutout" ascending:YES];
	[goalieList sortUsingDescriptors:[NSArray arrayWithObject:shutoutSorter]];
}

- (id) initWithTeamName: (NSString*) tn
			   teamTown: (NSString*) tt
		townAbbrevation: (NSString*) ta{
    if ( self = [super init] )
    {
        [self setTeamName:@"Canadiens"];
        [self setTeamTown:@"Montreal"];
		[self setTownAbbreviation:@"MTL"];
		// Ian says : init array lists necessary? I believe not. If bug exists, this may be an issue.
    }
	
    return self;
}


- (void) dealloc
{
    [teamName release];
    [teamTown release];
	[townAbbreviation release];
	[skaterList release];
	[goalieList release];
	
    [super dealloc];
}

@end