//
//  RootViewController.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewTwoController.h"
#import "NavAppAppDelegate.h"

@interface RootViewController : UIViewController {
	ViewTwoController *viewTwoController;
	NavAppAppDelegate *mainDelegate;

	IBOutlet UITextField *judge1Name;
    IBOutlet UITextField *judge2Name;
    IBOutlet UITextField *judge3Name;
	IBOutlet UITextField *boxer1Name;
	IBOutlet UITextField *boxer2Name;
}

@property (nonatomic, retain) UITextField *judge1Name;
@property (nonatomic, retain) UITextField *judge2Name;
@property (nonatomic, retain) UITextField *judge3Name;
@property (nonatomic, retain) UITextField *boxer1Name;
@property (nonatomic, retain) UITextField *boxer2Name;
@property (nonatomic, retain) ViewTwoController *viewTwoController;


-(IBAction)switchPage:(id)sender;
-(IBAction)judge1NameDoneEditing:(id)sender;
-(IBAction)judge2NameDoneEditing:(id)sender;
-(IBAction)judge3NameDoneEditing:(id)sender;
-(IBAction)boxer1NameDoneEditing:(id)sender;
-(IBAction)boxer2NameDoneEditing:(id)sender;



@end
