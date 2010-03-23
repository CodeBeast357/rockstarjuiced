//
//  Skater.m
//
//  Created by Ian BussiËres on 10-03-08.
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
		self.goals=0;
		self.assists=0;
		self.differential=0;
    }
	
    return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end