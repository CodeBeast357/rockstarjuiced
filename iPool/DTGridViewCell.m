//
//  DTGridViewCell.m
//  GridViewTester
//
//  Created by Daniel Tull on 06.04.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTGridViewCell.h"

@implementation DTGridViewCell

@synthesize xPosition, yPosition, identifier, delegate, selected;

@dynamic frame;

- (id)initWithReuseIdentifier:(NSString *)anIdentifier {
	
	if (![super initWithFrame:CGRectZero])
		return nil;
	
	identifier = [anIdentifier copy];
	//myLabel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,100, 100)];
	//myLabel.titleLabel = @"test";
	//myLabel.
	//[self addSubview:myLabel];
	
	UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(0, 0, 100, 100); // position in the parent view and set the size of the button
    [myButton setTitle:@"Click Me!" forState:UIControlStateNormal];
    // add targets and actions
    //[myButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // add to a view
    [self addSubview:myButton];
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

@end
