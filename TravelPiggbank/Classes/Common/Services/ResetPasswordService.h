//
//  ResetPasswordService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class ResetPasswordRequest;
@class ResetPasswordResult;

@interface ResetPasswordService : WebServiceBase

@property (nonatomic, strong) ResetPasswordRequest *passwordRequest;
@property (nonatomic, strong) ResetPasswordResult *passwordResult;

- (void)performRequest:(ResetPasswordRequest *)req delegate:(id<WebServiceDelegate>)delegateIn;

@end


@interface ResetPasswordRequest : NSObject

//@property (nonatomic, strong) NSString *UserName;
//@property (nonatomic, strong) NSString *Password;

@end


@interface ResetPasswordResult : WebServiceResult

@end
