/*
 *  skater.h
 *  
 *
 *  Created by Hébert Bussières, Ian-Paul on 10-03-15.
 *  Copyright 2010 iPool All rights reserved.
 *
 */

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import "Player.h"

@interface Skater: Player {
    int *goals;
    int *assists;
	int *differential;
    int *shootout;
}

-(Skater*) initWithFirstName: (NSString*) f 
					lastName: (NSString*) l 
					position: (NSString*) p 
					   goals: (int*) g 
					 assists: (int*) a
				differential: (int*) d
					shootout: (int*) s;
-(int*) goals;
-(int*) assists;
-(int*) overtimeLosses;
-(int*) differential;
-(void) setGoals: (int*) input;
-(void) setAssists: (int*) input;
-(void) setDifferential: (int*) input;
-(void) setShootout: (int*) input;
@end
