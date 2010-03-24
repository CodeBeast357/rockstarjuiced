//
//  SettingsController.h
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"
#import "SelectTeamController.h"

@interface AddPoolerController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
	Delegate *mainDelegate;
	SelectTeamController* selectTeamController;
	IBOutlet UITableView* tablePooler;
	NSMutableArray* offencePlayers;
	NSMutableArray* defencePlayers;
	NSMutableArray* goalies;
}

@property (nonatomic, retain) SelectTeamController* selectTeamController;
@property (nonatomic, retain) UITableView* tablePooler;
@property (nonatomic, retain) NSArray* offencePlayers;
@property (nonatomic, retain) NSArray* defencePlayers;
@property (nonatomic, retain) NSArray* goalies;

- (IBAction) done: (id) sender;
- (IBAction) cancel: (id) sender;
- (IBAction) txtFieldDoneEditing: (id) sender;

@end
