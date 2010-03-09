//
//  Settings.m
//  NavApp
//
//  Created by Legault, Martin on 10-03-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"


@implementation Settings

static Settings *instance = nil;

- (id)init {
	//Initialisation
	return self;
}

+ (id)getInstance {
	if (instance == nil) {
		instance = [Settings init];
	}
	return instance;
}


@end
