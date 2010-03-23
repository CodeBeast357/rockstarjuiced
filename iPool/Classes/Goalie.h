/*
 *  goalie.h
 *  
 *
 *  Created by Hébert Bussières, Ian-Paul on 10-03-15.
 *  Copyright 2010 iPool All rights reserved.
 *
 */

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import "Player.h"


@interface Goalie: Player {
    int wins;
	int overtimeLosses;
    int shutouts;
}

-(Goalie*) initWithFirstName: (NSString*) f 
					lastName: (NSString*) l 
					position: (NSString*) p 
						wins: (int) w 
			  overtimeLosses: (int) o
					shutouts: (int) s
					gamePlay: (int) gp;

@property (nonatomic, assign) int wins;
@property (nonatomic, assign) int overtimeLosses;
@property (nonatomic, assign) int shutouts;

@end
