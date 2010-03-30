//
//  DTGridViewCell.h
//  GridViewTester
//
//  Created by Daniel Tull on 06.04.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DTGridViewCellInfoProtocol.h"

@protocol DTGridViewCellDelegate;

/*!
 @class DTGridViewCell
 @abstract 
 @discussion 
*/
@interface DTGridViewCell : UIView <DTGridViewCellInfoProtocol> {
	//Delegate  *mainDelegate;
	
	NSInteger xPosition, yPosition;
	NSString *identifier;
	UIButton *button;
	int row;
	int column;
	
	BOOL selected;
	
	id<DTGridViewCellDelegate> delegate;
	
}


@property (nonatomic,assign) int row;
@property (nonatomic,assign) int column;
@property (assign) id delegate;
@property (copy) NSString *identifier;
@property (assign) BOOL selected;
@property (nonatomic, retain)  UIButton *button;
- (id)initWithReuseIdentifier:(NSString *)identifier;
- (void)prepareForReuse;
@end

@protocol DTGridViewCellDelegate

-(void)gridViewCellWasTouched:(DTGridViewCell *)gridViewCell;
-(void)buttonClicked:(id)sender;

@end
