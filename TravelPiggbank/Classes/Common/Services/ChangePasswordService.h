//
//  ChangePasswordService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class ChangePasswordRequest;
@class ChangePasswordResult;

@interface ChangePasswordService : WebServiceBase

@property (nonatomic, strong) ChangePasswordRequest *passwordRequest;
@property (nonatomic, strong) ChangePasswordResult *passwordResult;

- (void)performRequest:(ChangePasswordRequest *)req delegate:(id<WebServiceDelegate>)delegateIn;

@end


@interface ChangePasswordRequest : NSObject

//@property (nonatomic, strong) NSString *UserName;
//@property (nonatomic, strong) NSString *Password;

@end


@interface ChangePasswordResult : WebServiceResult

@end

