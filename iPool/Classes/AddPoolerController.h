//
//  SettingsController.h
//  NavApp
//
//  Created by alex on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegate.h"

@interface AddPoolerController : UIViewController  {
	Delegate *mainDelegate;
}

- (IBAction) done: (id) sender;
- (IBAction) cancel: (id) sender;

@end
