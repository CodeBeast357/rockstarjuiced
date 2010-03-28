//
//  NavAppAppDelegate.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pooler.h"

@interface Delegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
	int teamSelected;
	Pooler* poolerTmp;
	int playerTypeTmp;
	int playerIndexTmp;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, assign) int teamSelected;
@property (nonatomic, retain) Pooler* poolerTmp;
@property (nonatomic, assign) int playerTypeTmp;
@property (nonatomic, assign) int playerIndexTmp;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
- (int)validateNumericInput:(NSString*) input;
- (int)validateMessageInput:(NSString*) input; 

@end

