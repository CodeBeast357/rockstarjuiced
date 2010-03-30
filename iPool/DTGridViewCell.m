//
//  DTGridViewCell.m
//  GridViewTester
//
//  Created by Daniel Tull on 06.04.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTGridViewCell.h"
#import "ViewPoolerStatisticsController.h"

@implementation DTGridViewCell

@synthesize xPosition, yPosition, identifier, delegate, selected,button,myRow,myColumn;

@dynamic frame;

- (id)initWithReuseIdentifier:(NSString *)anIdentifier {
	
	if (![super initWithFrame:CGRectZero])
		return nil;
	
	//mainDelegate = (Delegate *)[[UIApplication sharedApplication] delegate];
	
	identifier = [anIdentifier copy];
	//myLabel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,100, 100)];
	//myLabel.titleLabel = @"test";
	//myLabel.
	//[self addSubview:myLabel];
	
	button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 50); // position in the parent view and set the size of the button
    [button setTitle:anIdentifier forState:UIControlStateNormal];
	
    // add targets and actions
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // add to a view
    [self addSubview:button];
	return self;
}

- (void)awakeFromNib {
	identifier = nil;
}

- (void)prepareForReuse {
	self.selected = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.delegate gridViewCellWasTouched:self];
	[self.nextResponder touchesBegan:touches withEvent:event];
}

- (void)dealloc {
	[identifier release];
    [super dealloc];
}

-(void)buttonClicked:(id)sender{
	
	if(myRow != 0 && myColumn == 0){
		[[NSNotificationCenter defaultCenter] postNotificationName:@"changePage" object:[NSString stringWithFormat:@"%d",myRow-1]];
		
	}
}

@end
