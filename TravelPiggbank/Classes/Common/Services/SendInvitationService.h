//
//  SendInvitationService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"

@class SendInvitationRequest;
@class SendInvitationResult;

@interface SendInvitationService : WebServiceBase

@property (nonatomic, strong) SendInvitationRequest *invitationRequest;
@property (nonatomic, strong) SendInvitationResult *invitationResult;

- (void)performRequest:(SendInvitationRequest *)req delegate:(id<WebServiceDelegate>)delegateIn;

@end


@interface SendInvitationRequest : WebServiceRequest

@property (nonatomic, strong) NSString *ReferralName;
@property (nonatomic, strong) NSString *ReferralEmail;
@property (nonatomic, strong) NSString *Token;

@end


@interface SendInvitationResult : WebServiceResult
@end