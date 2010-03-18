//
//  Skater.m
//
//  Created by Ian Bussières on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Skater.h"

@implementation Skater : Player
-(Skater*) initWithFirstName: (NSString*) f
					lastName: (NSString*) l
					position: (NSString*) p
					   goals: (int*) g
					 assists: (int*) a
				differential: (int*) d{
    self = [super init];

    if ( self ) {
		[firstName: f 
		  lastName: l 
		  position: p 
			 goals: g 
		   assists: a 
	  differential: d];
    }

    return self;
}

- (int*) goals {
    return goals;
}

- (int*) assists {
    return assists;
}

- (int*) differential {
    return differential;
}

- (void) setGoals: (int*)input
{
    [goals autorelease];
    goals = [input retain];
}

- (void) setAssists: (int*)input
{
    [assists autorelease];
    assists = [input retain];
}

- (void) setDifferential: (int*)input
{
    [differential autorelease];
    differential = [input retain];
}

- (id) init
{
    if ( self = [super init] )
    {
		[self setGoals: 0];
		[self setAssists: 0];
		[self setDifferential: 0];
    }
	
    return self;
}

- (void) dealloc
{
	[goals release];
	[assists release];
	[differential release];
    [super dealloc];
}

@end