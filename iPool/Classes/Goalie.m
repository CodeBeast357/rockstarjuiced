//
//  Goalie.m
//
//  Created by Ian Bussières on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Goalie.h"

@implementation Goalie : Player 
-(Goalie*) initWithFirstName: (NSString*) f 
				   lastName : (NSString*) l 
					position: (NSString*) p 
			   shootoutSaves: (int) ss
					    wins: (int) w
			  overtimeLosses: (int) o
					shutouts: (int) s {
    self = [super init];

    if ( self ) {
		   [firstName: f 
			 lastName: l 
			 position: p 
		shootoutSaves: ss 
				 wins: w 
	   overtimeLosses: o 
			 shutouts: s];
    }

    return self;
}

- (int) shootoutSaves {
    return shootoutSaves;
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

- (void) setShootoutSaves: (int) ss
{
    shootoutSaves = ss;
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

- (id) init
{
    if ( self = [super init] )
    {
		[self setShootoutSaves: 0];
		[self setWins: 0];
		[self setOvertimeLosses: 0];
		[self setShutouts: 0];
    }
	
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

@end