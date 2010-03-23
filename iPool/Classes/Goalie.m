//
//  Goalie.m
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Goalie.h"

@implementation Goalie : Player 
@synthesize wins, overtimeLosses, shutouts;

-(Goalie*) initWithFirstName: (NSString*) f 
				   lastName : (NSString*) l 
					position: (NSString*) p 
					    wins: (int) w
			  overtimeLosses: (int) o
					shutouts: (int) s 
					gamePlay: (int) gp{
    self = [super init];

    if ( self ) {
		   [firstName: f 
			 lastName: l 
			 position: p 
				 wins: w 
	   overtimeLosses: o 
			 shutouts: s
			 gamePlay: gp];
    }

    return self;
}


- (void) dealloc
{	
    [super dealloc];
}

@end