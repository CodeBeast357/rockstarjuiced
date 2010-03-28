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
#import "Pooler.h"
#import "PoolerList.h"

@interface AddPoolerController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
	Delegate *mainDelegate;
	SelectTeamController* selectTeamController;
	IBOutlet UITableView* tablePooler;
	Pooler* pooler;
	
	IBOutlet UIImageView* imgValidPoolName;
	IBOutlet UIImageView* imgInvalidPoolName;
	IBOutlet UIButton* imgHelpPoolName;
	IBOutlet UITextField* poolerName;
}

@property (nonatomic, retain) SelectTeamController* selectTeamController;
@property (nonatomic, retain) UITableView* tablePooler;
@property (nonatomic, retain) UIImageView* imgValidPoolName;
@property (nonatomic, retain) UIImageView* imgInvalidPoolName;
@property (nonatomic, retain) UIButton* imgHelpPoolName;
@property (nonatomic, retain) UITextField* poolerName;

- (IBAction) done: (id) sender;
- (IBAction) cancel: (id) sender;
- (IBAction) txtFieldDoneEditing: (id) sender;
- (IBAction) txtFieldPoolNameEditing: (id) sender;

- (IBAction) showHelp: (id) sender;

@end
