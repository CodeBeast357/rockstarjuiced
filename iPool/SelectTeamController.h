//
//  SelectTeamController.h
//  NavApp
//
//  Created by Legault, Martin on 10-03-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"
#import "SelectPlayerController.h"
#import "TeamList.h"

@interface SelectTeamController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	Delegate *mainDelegate;
	SelectPlayerController* selectPlayerController;
	IBOutlet UITableView* tableTeams;
	NSMutableArray* teams;
	TeamList *teamList;
	
}

@property (nonatomic, retain) SelectPlayerController* selectPlayerController;
@property (nonatomic, retain) UITableView* tableTeams;
@property (nonatomic, retain) NSMutableArray* teams;


@end
