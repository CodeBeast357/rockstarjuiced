//
//  Skater.m
//
//  Created by Ian Bussières on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Skater.h"

@implementation Skater : Player
@synthesize goals, assists, differential;

-(Skater*) initWithFirstName: (NSString*) f
					lastName: (NSString*) l
					position: (NSString*) p
					   goals: (int) g
					 assists: (int) a
				differential: (int) d 
					gamePlay: (int) gp {
    self = [super init];

    if ( self ) {
		[firstName: f 
		  lastName: l 
		  position: p 
			 goals: g 
		   assists: a 
	  differential: d
		  gamePlay: gp];
    }

    return self;
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