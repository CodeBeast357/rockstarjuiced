//
//  Player.m
//
//  Created by Ian Bussières on 10-03-08.
//  Copyright 2010 iPool. All rights reserved.
//

#import "Player.h"

@implementation Player

- (NSString*) lastName {
    return lastName;
}

- (NSString*) firstName {
    return firstName;
}

- (NSString*) position {
    return position;
}

- (void) setLastName: (NSString*)input
{
    [lastName autorelease];
    lastName = [input retain];
}

- (void) setFirstName: (NSString*)input
{
    [firstName autorelease];
    firstName = [input retain];
}

- (void) setPosition: (NSString*)input
{
    [position autorelease];
    position = [input retain];
}

- (id) init
{
    if ( self = [super init] )
    {
        [self setLastName:@"Ovechkin"];
		[self setFirstName:@"Alexander"];
        [self setPosition:@"LW"];
    }
	
    return self;
}

- (void) dealloc
{
    [lastName release];
    [firstName release];
	[position release];
    [super dealloc];
}

@end