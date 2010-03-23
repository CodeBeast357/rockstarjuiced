//
//  Player.m
//
//  Created by Ian BussiËres on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize lastName, firstName, position, gamePlay;
 
- (id) init
{
    if ( self = [super init] )
    {
        [self lastName:@"Ovechkin"];
		[self firstName:@"Alexander"];
        [self position:@"LW"];
		[self gamePlay:0];
    }
	
    return self;
}

- (void) dealloc
{
    [lastName release];
    [firstName release];
	[position release];
	[gamePlay release];
	
    [super dealloc];
}

@end