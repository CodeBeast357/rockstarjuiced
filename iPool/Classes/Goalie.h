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
					shutouts: (int) s;
-(int) wins;
-(int) overtimeLosses;
-(int) shutouts;
-(void) setWins: (int) w;
-(void) setOvertimeLosses: (int) o;
-(void) setShutouts: (int) s;
@end
