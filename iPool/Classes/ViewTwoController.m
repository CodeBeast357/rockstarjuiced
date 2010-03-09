//
//  ViewTwoController.m
//  NavApp
//
//  Created by Wess Cope on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import "ViewTwoController.h"

#define TOTAL_ROUND 12
#define TOTAL_JUDGE 3
#define DEFAULT_SCORE 10



//Initiate all label for round 1 and judge 1
int redScoreInt= 0;
int blueScoreInt= 0;
int roundInt=1;
int redFaultJudge1Int=0;
int redFaultJudge2Int=0;
int redFaultJudge3Int=0;
int blueFaultJudge1Int=0;
int blueFaultJudge2Int=0;
int blueFaultJudge3Int=0;
int redCumulJudge1Int=0;
int redCumulJudge2Int=0;
int redCumulJudge3Int=0;
int blueCumulJudge1Int=0;
int blueCumulJudge2Int=0;
int blueCumulJudge3Int=0;
int judgeInt=1;



@implementation ViewTwoController


//Source: http://stackoverflow.com/questions/772182/iphone-uiviewcontroller-init-method-not-being-called
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		//Custom initialization
		
		//Get all judge and boxer name from the delegate
		mainDelegate = (NavAppAppDelegate *)[[UIApplication sharedApplication] delegate];
		boxer1Name = [mainDelegate getBoxer1Name];
		boxer2Name = [mainDelegate getBoxer2Name];
		judge1Name = [mainDelegate getJudge1Name];
		judge2Name = [mainDelegate getJudge2Name];
		judge3Name = [mainDelegate getJudge3Name];
		
    }
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)blueScoreDoneEditing:(id)sender {
	
	[ blueScore resignFirstResponder];
	
}

- (IBAction)redScoreDoneEditing:(id)sender {
	
	[ redScore resignFirstResponder];
	
}

-(void)initializeFields{
	
	//(cast int to string)
	roundNumber.text= [NSString stringWithFormat:@"%d", roundInt];
	currentJudge.text= judge1Name;
	redBoxerName.text= boxer1Name;
	blueBoxerName.text= boxer2Name;
	redScore.text= [NSString stringWithFormat:@"%d", DEFAULT_SCORE];
	blueScore.text= [NSString stringWithFormat:@"%d", DEFAULT_SCORE];
	redCumul.text= @"0";
	blueCumul.text= @"0";
	redFault.text= @"0";
	blueFault.text= @"0";
	
}

-(IBAction)nextAction:(id)sender{
	//get the score
	redScoreInt= [redScore.text integerValue];
	blueScoreInt= [blueScore.text integerValue];
	
	//reset current score
	redScore.text= [NSString stringWithFormat:@"%d", DEFAULT_SCORE];
	blueScore.text= [NSString stringWithFormat:@"%d", DEFAULT_SCORE];
	
	if(judgeInt==1){
		currentJudge.text=judge2Name;
		redCumulJudge1Int+=redScoreInt;
		blueCumulJudge1Int+=blueScoreInt;
		
		redCumul.text= [NSString stringWithFormat:@"%d", redCumulJudge2Int];
		blueCumul.text= [NSString stringWithFormat:@"%d", blueCumulJudge2Int];
		
		redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge2Int];
		blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge2Int];
		
		judgeInt=2;
	}
	else if(judgeInt==2){
		if(roundInt==12){
			//changer caption pour voir resultat
			[nextJudgeButton setTitle:@"Show results" forState:UIControlStateNormal];
		}
		else {
			[nextJudgeButton setTitle:@"Next Round" forState:UIControlStateNormal];
		}
		
		currentJudge.text=judge3Name;
		
		redCumulJudge2Int+=redScoreInt;
		blueCumulJudge2Int+=blueScoreInt;
		
		redCumul.text= [NSString stringWithFormat:@"%d", redCumulJudge3Int];
		blueCumul.text= [NSString stringWithFormat:@"%d", blueCumulJudge3Int];
		
		redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge3Int];
		blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge3Int];

		judgeInt=3;
	}
	else if(judgeInt==3){
		
		redCumulJudge3Int+=redScoreInt;
		blueCumulJudge3Int+=blueScoreInt;
		
		redCumul.text= [NSString stringWithFormat:@"%d", redCumulJudge1Int];
		blueCumul.text= [NSString stringWithFormat:@"%d", blueCumulJudge1Int];
		
		redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge1Int];
		blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge1Int];
		
		
		if(roundInt!=12){
			[nextJudgeButton setTitle:@"Next Judge" forState:UIControlStateNormal];
			roundInt++;
			roundNumber.text= [NSString stringWithFormat:@"%d", roundInt];
			currentJudge.text=judge1Name;
			
		}
		else {
			int blueWin=0;
			int redWin=0;
			int null=0;
			if(redCumulJudge1Int>blueCumulJudge1Int){
				redWin++;
			}
			else if(redCumulJudge1Int<blueCumulJudge1Int){
				blueWin++;
			}
			else{
				null++;
			}
			
			if(redCumulJudge2Int>blueCumulJudge2Int){
				redWin++;
			}
			else if(redCumulJudge2Int<blueCumulJudge2Int){
				blueWin++;
			}
			else{
				null++;
			}
			
			if(redCumulJudge3Int>blueCumulJudge3Int){
				redWin++;
			}
			else if(redCumulJudge3Int<blueCumulJudge3Int){
				blueWin++;
			}
			else{
				null++;
			}
			
			
			if(redWin==3){
				//Rouge gagne par décision unanime
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by unanimous decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else if(blueWin==3){
				//Bleu gagne par décision unanime
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by unanimous decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			
			else if(blueWin==2 && null==1){
				//Bleu gagne par décision majoritaire
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by majority decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else if(redWin==2 && null==1){
				//Rouge gagne par décision majoritaire
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by majority decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else if(blueWin==2 && redWin==1){
				//Bleu gagne par décision partagée
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by split decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else if(redWin==2 && blueWin==1){
				//Rouge gagne par décision partagée
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by split decision!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else{
				//Combat nul
				UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:@"draw fight!" delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			
			
		}

		judgeInt=1;
	}
	
}


-(IBAction)addRedFault:(id)sender{
	if(judgeInt==1){
		if(redFaultJudge1Int!=2){
			redFaultJudge1Int++;
			redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge1Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			
		}
		
	}
	else if(judgeInt==2){
		if(redFaultJudge2Int!=2){
			redFaultJudge2Int++;
			redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge2Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
		}

	}
	else if(judgeInt==3){
		if(redFaultJudge3Int!=2){
			redFaultJudge3Int++;
			redFault.text= [NSString stringWithFormat:@"%d", redFaultJudge3Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			
		}

	}
}

-(IBAction)addBlueFault:(id)sender{
	if(judgeInt==1){
		if(blueFaultJudge1Int!=2){
			blueFaultJudge1Int++;
			blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge1Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			
		}
		
	}
	else if(judgeInt==2){
		if(blueFaultJudge2Int!=2){
			blueFaultJudge2Int++;
			blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge2Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
		}
		
	}
	else if(judgeInt==3){
		if(blueFaultJudge3Int!=2){
			blueFaultJudge3Int++;
			blueFault.text= [NSString stringWithFormat:@"%d", blueFaultJudge3Int];
		}
		
		else{
			UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by disqualification!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			
		}
		
	}
}
-(IBAction)redIsKo:(id)sender{
	UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer2Name stringByAppendingString:@" won by KO!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

-(IBAction)blueIsKo:(id)sender{
	UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Decision" message:[boxer1Name stringByAppendingString:@" won by KO!"] delegate:mainDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

-(IBAction)showCurrentScores:(id)sender{
	
	UIAlertView *alert= [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Current score at round %d", roundInt] 
										     message:[NSString stringWithFormat:@"\n%@ \n%@ : %d		%@ : %d \n\n%@ \n%@ : %d		%@ : %d \n\n%@ \n%@ : %d		%@ : %d\n", judge1Name,boxer1Name,redCumulJudge1Int,boxer2Name,blueCumulJudge1Int,judge2Name,boxer1Name,redCumulJudge2Int,boxer2Name,blueCumulJudge2Int,judge3Name,boxer1Name,redCumulJudge3Int,boxer2Name,blueCumulJudge3Int] 
											 delegate:nil 
										     cancelButtonTitle:@"Return to main screen" 
										     otherButtonTitles:nil];
	[alert show];
}

@end
