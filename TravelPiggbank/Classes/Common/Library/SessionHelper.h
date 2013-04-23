//
//  SessionHelper.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthenticateUserService.h"

@interface SessionHelper : NSObject

@property (nonatomic, strong) AuthenticateUserResult *authenticateUserResult;

+ (SessionHelper *) sharedHelper;

@end
