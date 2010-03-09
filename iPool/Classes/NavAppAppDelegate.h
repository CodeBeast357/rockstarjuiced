//
//  NavAppAppDelegate.h
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
	
	//variables globales
	NSString* boxer1Name;
	NSString* boxer2Name;
	NSString* judge1Name;
	NSString* judge2Name;
	NSString* judge3Name;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

-(void)setBoxer1Name:(NSString *)name;
-(void)setBoxer2Name:(NSString *)name;
-(void)setJudge1Name:(NSString *)name;
-(void)setJudge2Name:(NSString *)name;
-(void)setJudge3Name:(NSString *)name;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;


-(NSString *)getBoxer1Name;
-(NSString *)getBoxer2Name;
-(NSString *)getJudge1Name;
-(NSString *)getJudge2Name;
-(NSString *)getJudge3Name;

@end

