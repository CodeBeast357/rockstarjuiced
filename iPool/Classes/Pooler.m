//
//  Pooler.m
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//


#import "Pooler.h"
#import "Settings.h"

@implementation Pooler
@synthesize poolerName,defencemenList,forwardsList,goaliesList,totalPoint;

-(Pooler*) init{
	if (self = [super init]) {
		forwardsList= [[NSMutableArray alloc] init];
		defencemenList= [[NSMutableArray alloc] init];
		goaliesList=[[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void) addDefenceman: (Skater*)input
{
	[defencemenList addObject: input];
}


- (void) addForward: (Skater*)input
{
	[forwardsList addObject: input];
}


- (void) addGoalie: (Goalie*)input
{
	[goaliesList addObject: input];
}


- (void) sortForwardsByLastName
{
	NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
	[forwardsList sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
}


- (void) sortForwardsByFirstName
{
	NSSortDescriptor *firstNameSorter = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
	[forwardsList sortUsingDescriptors:[NSArray arrayWithObject:firstNameSorter]];
}


- (void) sortForwardsByGoals
{
	NSSortDescriptor *goalsSorter = [[NSSortDescriptor alloc] initWithKey:@"goals" ascending:YES];
	[forwardsList sortUsingDescriptors:[NSArray arrayWithObject:goalsSorter]];
}


- (void) sortForwardsByAssists
{
	NSSortDescriptor *assistsSorter = [[NSSortDescriptor alloc] initWithKey:@"assists" ascending:YES];
	[forwardsList sortUsingDescriptors:[NSArray arrayWithObject:assistsSorter]];
}


- (void) sortForwardsByDifferential
{
	NSSortDescriptor *differentialSorter = [[NSSortDescriptor alloc] initWithKey:@"differential" ascending:YES];
	[forwardsList sortUsingDescriptors:[NSArray arrayWithObject:differentialSorter]];
}


- (void) sortDefencemenByLastName
{
	NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
	[defencemenList sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
}


- (void) sortDefencemenByFirstName
{
	NSSortDescriptor *firstNameSorter = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
	[defencemenList sortUsingDescriptors:[NSArray arrayWithObject:firstNameSorter]];
}


- (void) sortDefencemenByGoals
{
	NSSortDescriptor *goalsSorter = [[NSSortDescriptor alloc] initWithKey:@"goals" ascending:YES];
	[defencemenList sortUsingDescriptors:[NSArray arrayWithObject:goalsSorter]];
}


- (void) sortDefencemenByAssists
{
	NSSortDescriptor *assistsSorter = [[NSSortDescriptor alloc] initWithKey:@"assists" ascending:YES];
	[defencemenList sortUsingDescriptors:[NSArray arrayWithObject:assistsSorter]];
}


- (void) sortDefencemenByDifferential
{
	NSSortDescriptor *differentialSorter = [[NSSortDescriptor alloc] initWithKey:@"differential" ascending:YES];
	[defencemenList sortUsingDescriptors:[NSArray arrayWithObject:differentialSorter]];
}


- (void) sortGoaliesByLastName
{
	NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
	[goaliesList sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
}


- (void) sortGoaliesByFirstName
{
	NSSortDescriptor *firstNameSorter = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
	[goaliesList sortUsingDescriptors:[NSArray arrayWithObject:firstNameSorter]];
}


- (void) sortGoalieByWins
{
	NSSortDescriptor *winsSorter = [[NSSortDescriptor alloc] initWithKey:@"wins" ascending:YES];
	[goaliesList sortUsingDescriptors:[NSArray arrayWithObject:winsSorter]];
}


- (void) sortGoalieByOvertimeLosses
{
	NSSortDescriptor *otLossSorter = [[NSSortDescriptor alloc] initWithKey:@"otLoss" ascending:YES];
	[goaliesList sortUsingDescriptors:[NSArray arrayWithObject:otLossSorter]];
}


- (void) sortGoalieByShutouts
{
	NSSortDescriptor *shutoutSorter = [[NSSortDescriptor alloc] initWithKey:@"shutout" ascending:YES];
	[goaliesList sortUsingDescriptors:[NSArray arrayWithObject:shutoutSorter]];
}


- (int) getPointsForGoalForward: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s goals] * [settings offencePointsPerGoal];
}


- (int) getPointsForAssistForward: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s assists] * [settings offencePointsPerAssist];
}


- (int) getPointsForDifferentialForward: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s differential] * [settings offenceDifferentialActivated] * [settings offenceDifferentialValue];
}


- (int) getPointsForGoalDefence: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s goals] * [settings defencePointsPerGoal];
}


- (int) getPointsForAssistDefence: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s assists] * [settings defencePointsPerAssist];
}


- (int) getPointsForDifferentialDefence: (Skater*) s
{
	Settings *settings = [Settings getInstance];
	return [s differential] * [settings defenceDifferentialActivated] * [settings defenceDifferentialValue];
}


- (int) getPointsForWinGoalie: (Goalie*) g
{
	Settings *settings = [Settings getInstance];
	return [g wins] * [settings goalerPointsPerWin];
}


- (int) getPointsForShutoutGoalie: (Goalie*) g
{
	Settings *settings = [Settings getInstance];
	return [g shutouts] * [settings goalerPointsPerShutout];
}


- (int) getPointsForShootoutOTLossGoalie: (Goalie*) g
{
	Settings *settings = [Settings getInstance];
	return [g overtimeLosses] * [settings goalerPointsPerOTLoss];
}

- (int) getTotalPoints
{
	int total=0;
	for(Skater *forward in forwardsList){
		total+=[self getPointsForGoalForward:forward] +[self getPointsForAssistForward:forward] + [self getPointsForDifferentialForward:forward];
	}
	
	for(Skater *defence in defencemenList){
		total+=[self getPointsForGoalDefence:defence] +[self getPointsForAssistDefence:defence] + [self getPointsForDifferentialDefence:defence];
	}
	
	for(Goalie *goalie in goaliesList){
		total+=[self getPointsForWinGoalie:goalie] +[self getPointsForShutoutGoalie:goalie] + [self getPointsForShootoutOTLossGoalie:goalie];
	}

	return  total;
}


- (void) dealloc
{
    [poolerName release];
	[forwardsList release];
    [defencemenList release];
    [goaliesList release];
    [super dealloc];
}

@end 