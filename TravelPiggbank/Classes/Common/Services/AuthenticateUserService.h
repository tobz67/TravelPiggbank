//
//  AuthenticateUserService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class AuthenticateUserRequest;
@class AuthenticateUserResult;

@interface AuthenticateUserService : WebServiceBase

@property (nonatomic, strong) AuthenticateUserRequest *authenticateRequest;
@property (nonatomic, strong) AuthenticateUserResult *authenticateResult;

- (void)performRequest:(AuthenticateUserRequest *)req delegate:(id<WebServiceDelegate>)delegateIn;

@end


@interface AuthenticateUserRequest : NSObject

@property (nonatomic, strong) NSString *UserName;
@property (nonatomic, strong) NSString *Password;

@end


@interface AuthenticateUserResult : WebServiceResult

@property (strong, nonatomic) NSString *EmailAddress;
@property (strong, nonatomic) NSString *MemberId;
@property (strong, nonatomic) NSString *ThirdPartyId;
@property (strong, nonatomic) NSString *UserAccountToken;
@property (strong, nonatomic) NSString *UserName;

@end