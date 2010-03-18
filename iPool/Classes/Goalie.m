//
//  Goalie.m
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Goalie.h"

@implementation Goalie : Player 
-(Goalie*) initWithFirstName: (NSString*) f 
				   lastName : (NSString*) l 
					position: (NSString*) p 
					    wins: (int) w
			  overtimeLosses: (int) o
					shutouts: (int) s {
    self = [super init];

    if ( self ) {
		   [firstName: f 
			 lastName: l 
			 position: p 
				 wins: w 
	   overtimeLosses: o 
			 shutouts: s];
    }

    return self;
}

- (int) wins {
    return wins;
}

- (int) overtimeLosses {
    return overtimeLosses;
}

- (int) shutouts {
    return shutouts;
}

- (void) setWins: (int) w
{
    wins = w;
}

- (void) setOvertimeLosses: (int) o
{
    overtimeLosses = o;
}

- (void) setShutouts: (int) s
{
    shutouts = s;
}


- (void) dealloc
{
    [super dealloc];
}

@end