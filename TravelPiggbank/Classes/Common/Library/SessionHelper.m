//
//  SessionHelper.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "SessionHelper.h"

@implementation SessionHelper

#pragma mark Singleton Goodness

static SessionHelper *sharedHelper = nil;

+ (SessionHelper *) sharedHelper {
	@synchronized(self) {
        if (sharedHelper == nil) {
            sharedHelper = [[self alloc] init];
        }
	}
	return sharedHelper;
}


@end
