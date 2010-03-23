//
//  SettingsController.h
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"

@interface AddPoolerController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
	Delegate *mainDelegate;
	IBOutlet UITableView* tableView;
	NSArray* offencePlayers;
	NSArray* defencePlayers;
	NSArray* goalies;
}

@property (nonatomic, retain) UITableView* tableView;
@property (nonatomic, retain) NSArray* offencePlayers;
@property (nonatomic, retain) NSArray* defencePlayers;
@property (nonatomic, retain) NSArray* goalies;

- (IBAction) done: (id) sender;
- (IBAction) cancel: (id) sender;
- (IBAction) txtFieldDoneEditing: (id) sender;

@end
