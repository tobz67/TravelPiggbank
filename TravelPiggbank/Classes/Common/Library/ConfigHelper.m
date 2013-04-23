//
//  ConfigHelper.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "ConfigHelper.h"
#import "Utilities.h"
#import "RestKit.h"
#import "AuthenticateUserService.h"
#import "DeviceNotificationService.h"
#import "GetPointsBalanceService.h"
#import "GetVacationCashBalanceService.h"
#import "SendInvitationService.h"

@implementation ConfigHelper

// authentication
#define kWSUserName @"mobile.user"
#define kWSPassword @"kR54eEh1eIgi"
// ws parameters
#define kConfig_HostNameKey @"HostName"
#define kConfig_PartnerIDKey @"PartnerID"

#pragma mark Singleton Goodness

static ConfigHelper *sharedHelper = nil;

+ (ConfigHelper *) sharedHelper {
	@synchronized(self) {
        if (sharedHelper == nil) {
           sharedHelper = [[self alloc] init];
           sharedHelper.configDictionary = [Utilities loadPlistNamed:@"Config"];
        }
	}
	return sharedHelper;
}

- (NSString*)webServiceHostName {
    NSString *host = [self.configDictionary objectForKey:kConfig_HostNameKey];
    NSAssert((host!=nil), @"Hostname not found in config!");
    return host;
   
}

- (NSString*)partnerID {
    NSString *partner = [self.configDictionary objectForKey:kConfig_PartnerIDKey];
    NSAssert((partner!=nil), @"PartnerID not found in config!");
    return partner;
}

- (NSString*)wsAuthHeader {
    return (NSString*)[NSString stringWithFormat:@"KeyAuthToken %@:%@", kWSUserName, kWSPassword];
}

- (void)configureRestKitServiceObjectMappings {
    
    // Default stuff
    NSURL *baseURL = [NSURL URLWithString: [[ConfigHelper sharedHelper] webServiceHostName]];
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    [objectManager.HTTPClient setDefaultHeader:@"Authorization" value:[self wsAuthHeader]];
    [objectManager.HTTPClient setDefaultHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    
    
    // ************** AuthenticateUserService *************************
    // *
    // request mapping
    RKObjectMapping* requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:@{
         @"UserName":   @"UserName",
         @"Password":   @"Password",
     }];
    
    // request descriptor
    RKRequestDescriptor *auRequestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping objectClass:[AuthenticateUserRequest class] rootKeyPath:nil];
    [[RKObjectManager sharedManager] addRequestDescriptor:auRequestDescriptor];
    
    // response mapping
    RKObjectMapping *auResponseMapping = [RKObjectMapping mappingForClass:[AuthenticateUserResult class]];
    [auResponseMapping addAttributeMappingsFromDictionary:@{
         @"ErrorMessage":       @"ErrorMessage",
         @"Success":            @"Success",
         @"EmailAddress":       @"EmailAddress",
         @"MemberId":           @"MemberId",
         @"ThirdPartyId":       @"ThirdPartyId",
         @"UserAccountToken":   @"UserAccountToken",
         @"UserName":           @"UserName"
     }];
    
    // response descriptor
    RKResponseDescriptor *auResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:auResponseMapping pathPattern:nil keyPath:@"AuthenticateUserResult" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [[RKObjectManager sharedManager] addResponseDescriptor:auResponseDescriptor];
    
    
    
    // ************** DeviceNotificationService *************************
    // *
    // request mapping
    RKObjectMapping* dnRequestMapping = [RKObjectMapping requestMapping];
    [dnRequestMapping addAttributeMappingsFromDictionary:@{
         @"DeviceModel":        @"DeviceModel",
         @"Platform":           @"Platform",
         @"PlatformVersion":    @"PlatformVersion",
         @"NotificationId":     @"NotificationId",
         @"Token":              @"Token"
     }];
    
    // request descriptor
    RKRequestDescriptor *dnRequestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:dnRequestMapping objectClass:[DeviceNotificationRequest class] rootKeyPath:nil];
    [[RKObjectManager sharedManager] addRequestDescriptor:dnRequestDescriptor];
    
    // response mapping
    RKObjectMapping *dnResponseMapping = [RKObjectMapping mappingForClass:[DeviceNotificationResult class]];
    [dnResponseMapping addAttributeMappingsFromDictionary:@{
         @"ErrorMessage":       @"ErrorMessage",
         @"Success":            @"Success"
     }];
    
    // response descriptor
    RKResponseDescriptor *dnResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dnResponseMapping pathPattern:nil keyPath:@"DeviceNotificationResult" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [[RKObjectManager sharedManager] addResponseDescriptor:dnResponseDescriptor];
    
    
    
    // ************** GetPointsBalanceService *************************
    // *
    RKObjectMapping* gpbMapping = [RKObjectMapping mappingForClass:[GetPointsBalanceResult class]];
    [gpbMapping addAttributeMappingsFromDictionary:@{
         @"ErrorMessage":       @"ErrorMessage",
         @"Success":            @"Success",
         @"PointsBalance":       @"PointsBalance"
     }];
    
    RKResponseDescriptor *gpbResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:gpbMapping pathPattern:nil keyPath:@"GetPointsBalanceResult" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [[RKObjectManager sharedManager] addResponseDescriptor:gpbResponseDescriptor];
    
    
    
    // ************** GetVacationCashBalanceService *************************
    // *
    // response mapping
    RKObjectMapping* gvcbMapping = [RKObjectMapping mappingForClass:[GetVacationCashBalanceResult class]];
    [gvcbMapping addAttributeMappingsFromDictionary:@{
         @"ErrorMessage":           @"ErrorMessage",
         @"Success":                @"Success",
         @"VacationCashBalance":    @"VacationCashBalance"
     }];
    
    // response descriptor
    RKResponseDescriptor *gvcbResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:gvcbMapping pathPattern:nil keyPath:@"GetVacationCashBalanceResult" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [[RKObjectManager sharedManager] addResponseDescriptor:gvcbResponseDescriptor];
    
    
    
    // ************** SendInvitationService *************************
    // *
    // request mapping
    RKObjectMapping* siMapping = [RKObjectMapping requestMapping];
    [siMapping addAttributeMappingsFromDictionary:@{
         @"ReferralName":   @"ReferralName",
         @"ReferralEmail":  @"ReferralEmail",
         @"Token":          @"Token"
     }];
    
    // request descriptor
    RKRequestDescriptor *siRequestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:siMapping objectClass:[SendInvitationRequest class] rootKeyPath:nil];
    [[RKObjectManager sharedManager] addRequestDescriptor:siRequestDescriptor];
    
    // response mapping
    RKObjectMapping *siResponseMapping = [RKObjectMapping mappingForClass:[SendInvitationResult class]];
    [siResponseMapping addAttributeMappingsFromDictionary:@{
         @"ErrorMessage":       @"ErrorMessage",
         @"Success":            @"Success",
     }];
    
    // response descriptor
    RKResponseDescriptor *siResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:siResponseMapping pathPattern:nil keyPath:@"SendInvitationResult" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [[RKObjectManager sharedManager] addResponseDescriptor:siResponseDescriptor];
    
    

    // ************** ResetPasswordService *************************
    // *
    
    
    // ************** ChangePasswordService *************************
    // *
}


@end
