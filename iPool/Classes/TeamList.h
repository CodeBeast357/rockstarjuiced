//
//  TeamList.h
//  NavApp
//
//  Created by alex on 18/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "Goalie.h"
#import "Skater.h"
#import <Foundation/NSString.h>

@interface TeamList : NSObject {
	NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;


+ (TeamList*)getInstance;
-(NSMutableArray*) listOfTeam;
-(void) addTeam: (Team*) input;
- (void) addGoalieByTeam: (Goalie*)inputGoalie team:(NSString *)inputTeam;
- (void) addSkaterByTeam: (Skater*)inputPlayer team:(NSString *)inputTeam;
- (void) sortByTeamName;
@end
