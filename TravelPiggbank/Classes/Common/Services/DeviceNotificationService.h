//
//  DeviceNotificationService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class DeviceNotificationRequest;
@class DeviceNotificationResult;

@interface DeviceNotificationService : WebServiceBase

@property (nonatomic, strong) DeviceNotificationRequest *deviceRequest;
@property (nonatomic, strong) DeviceNotificationResult *deviceResult;

- (void)performRequest:(DeviceNotificationRequest *)req delegate:(id<WebServiceDelegate>)delegateIn;

@end


@interface DeviceNotificationRequest : WebServiceRequest

@property (nonatomic, strong) NSString *DeviceModel;
@property (nonatomic, strong) NSString *Platform;
@property (nonatomic, strong) NSString *PlatformVersion;
@property (nonatomic, strong) NSString *NotificationId;
@property (nonatomic, strong) NSString *Token;

@end


@interface DeviceNotificationResult : WebServiceResult
@end