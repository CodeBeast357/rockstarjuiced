//
//  ViewTwoController.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavAppAppDelegate.h"

@interface ViewTwoController : UIViewController {
	NavAppAppDelegate *mainDelegate;
	
	NSString *judge1Name;
	NSString *judge2Name;
	NSString *judge3Name;
	NSString *boxer1Name;
	NSString *boxer2Name;
	
	
	IBOutlet UILabel *roundNumber;
    IBOutlet UILabel *currentJudge;
    IBOutlet UILabel *redBoxerName;
	IBOutlet UILabel *blueBoxerName;
	IBOutlet UITextField *redScore;
	IBOutlet UITextField *blueScore;
	IBOutlet UILabel *redCumul;
	IBOutlet UILabel *blueCumul;
	IBOutlet UILabel *redFault;
	IBOutlet UILabel *blueFault;
	IBOutlet UIButton *nextJudgeButton;
	IBOutlet UIButton *currentScoreButton;
	
}

@property (nonatomic, retain) NSString *judge1Name;
@property (nonatomic, retain) NSString *judge2Name;
@property (nonatomic, retain) NSString *judge3Name;
@property (nonatomic, retain) NSString *boxer1Name;
@property (nonatomic, retain) NSString *boxer2Name;

-(IBAction)blueScoreDoneEditing:(id)sender;
-(IBAction)redScoreDoneEditing:(id)sender;
-(IBAction)nextAction:(id)sender;
-(IBAction)blueIsKo:(id)sender;
-(IBAction)redIsKo:(id)sender;
-(IBAction)addBlueFault:(id)sender;
-(IBAction)addRedFault:(id)sender;
-(IBAction)showCurrentScores:(id)sender;

-(void)initializeFields;

@end
