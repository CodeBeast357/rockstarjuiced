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
	int *gamePlay;
}

-(NSString*) lastName;
-(NSString*) firstName;
-(NSString*) position;
-(int*) gamePlay;
-(void) setGamePlay: (int*) input;
-(void) setLastName: (NSString*) input;
-(void) setFirstName: (NSString*) input;
-(void) setPosition: (NSString*) input;
@end
