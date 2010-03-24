//
//  SelectPlayerController.h
//  NavApp
//
//  Created by Legault, Martin on 10-03-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"

@interface SelectPlayerController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	Delegate *mainDelegate;
	IBOutlet UITableView* tablePlayers;
	NSMutableArray* players;
	
}

@property (nonatomic, retain) UITableView* tablePlayers;
@property (nonatomic, retain) NSMutableArray* players;

- (IBAction) done: (id) sender;
- (IBAction) cancel: (id) sender;

@end
