/*
 *  player.h
 *  
 *
 *  Created by Hébert Bussières, Ian-Paul on 10-03-15.
 *  Copyright 2010 iPool All rights reserved.
 *
 */

#import <Foundation/NSObject.h>

@interface Player: NSObject {
    NSString *lastName;
    NSString *firstName;
	NSString *position;
	int gamePlay;
}

@property (nonatomic, retain) NSString* lastName;
@property (nonatomic, retain) NSString* firstName;
@property (nonatomic, retain) NSString* position;
@property (nonatomic, assign) int gamePlay;

@end
