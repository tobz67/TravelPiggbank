//
//  BalancesViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "BalancesViewController.h"
#import "WebServiceDelegate.h"
#import "GetPointsBalanceService.h"
#import "GetVacationCashBalanceService.h"
#import "DeviceNotificationService.h"
#import "SendInvitationService.h"
#import "SessionHelper.h"
#import "UIButton+NUI.h"

@implementation BalancesViewController

- (void)viewDidLoad {
    
    self.navigationItem.title = @"Piggy Bank";

    self.requestIndex = 0;
    [self performSelector:@selector(processNextRequest) withObject:nil afterDelay:1.0];
    
    self.pointsTitle.nuiClass = @"SmallLabel";
    self.cashTitle.nuiClass = @"SmallLabel";
    self.deviceTitle.nuiClass = @"SmallLabel";
    self.invitationTitle.nuiClass = @"SmallLabel";
    self.pointsTextLabel.nuiClass = @"SmallLabel";
    self.cashTextLabel.nuiClass = @"SmallLabel";
}

- (void)processNextRequest {
    
    switch (self.requestIndex) {
        case 0:
        {
            GetPointsBalanceService *service = [[GetPointsBalanceService alloc] init];
            [service performRequest:self];
            
        }
            break;
            
        case 1:
        {
            GetVacationCashBalanceService *service = [[GetVacationCashBalanceService alloc] init];
            [service performRequest:self];
            
        }
            break;
            
        case 2:
        {
            DeviceNotificationService *service = [[DeviceNotificationService alloc] init];
            DeviceNotificationRequest *request = [[DeviceNotificationRequest alloc] init];
            request.DeviceModel = @"iPhone 5";
            request.Platform = @"IOS";
            request.PlatformVersion = @"6.1.3";
            request.NotificationId = @"=MkJQVVE3MlJGME9KQ0ZTL1I4ZVlJcTB5alNRckJUUGltU1ovNk1vMDljbGw0eWl3Vk45U2N2K1ozWGpWRE5PM0pHbWxY";
            request.Token = [SessionHelper sharedHelper].authenticateUserResult.UserAccountToken;
            [service performRequest:request delegate:self];
            
        }
            break;
            
        case 3:
        {
            SendInvitationService *service = [[SendInvitationService alloc] init];
            SendInvitationRequest *request = [[SendInvitationRequest alloc] init];
            request.ReferralName = @"Barney Rubble";
            request.ReferralEmail = @"barney@rubble.gov";
            request.Token = [SessionHelper sharedHelper].authenticateUserResult.UserAccountToken;
            [service performRequest:request delegate:self];
            
        }
            break;
        default:
            break;
    }
    
    self.requestIndex++;
}

- (void)serviceDidComplete:(id)service {
    
    // points service
    if ([service isKindOfClass:[GetPointsBalanceService class]]) {
        
        [self.pointsSpinner stopAnimating];
        self.pointsImage.hidden = NO;
        GetPointsBalanceResult *result = ((GetPointsBalanceService*)service).pointsBalanceResult;
        self.pointsTextLabel.text = [result.PointsBalance stringValue];
        
    // cash service
    } else if ([service isKindOfClass:[GetVacationCashBalanceService class]]) {

        [self.cashSpinner stopAnimating];
        self.cashImage.hidden = NO;
        GetVacationCashBalanceResult *result = ((GetVacationCashBalanceService*)service).vacationCashBalanceResult;
        self.cashTextLabel.text = [result.VacationCashBalance stringValue];
    
    // device service
    } else if ([service isKindOfClass:[DeviceNotificationService class]]) {
        
        [self.deviceSpinner stopAnimating];
        self.deviceImage.hidden = NO;
        DeviceNotificationRequest *req = ((DeviceNotificationService*)service).deviceRequest;
        
        NSString *desc = [req.DeviceModel copy];
        desc = [desc stringByAppendingString:@" - "];
        desc = [desc stringByAppendingString:[req.Platform copy]];
        desc = [desc stringByAppendingString:@" - "];
        desc = [desc stringByAppendingString:[req.PlatformVersion copy]];
        desc = [desc stringByAppendingString:@" - "];
        desc = [desc stringByAppendingString:[req.NotificationId copy]];
        self.deviceTextArea.text = desc;
        
    // invitation service
    } else if ([service isKindOfClass:[SendInvitationService class]]) {
        
        [self.invitationSpinner stopAnimating];
        self.invitationImage.hidden = NO;
//        SendInvitationResult *result = ((SendInvitationService*)service).invitationResult;
        NSString *desc = [((SendInvitationService*)service).invitationRequest description];
        self.deviceTextArea.text = desc;
    }


    [self processNextRequest];
}

- (void)serviceDidFail:(id)service error:(WebServiceError *)error {

    // points service
    if ([service isKindOfClass:[GetPointsBalanceService class]]) {
        [self.pointsSpinner stopAnimating];
    }
    
    // cash service
    if ([service isKindOfClass:[GetVacationCashBalanceService class]]) {
        [self.cashSpinner stopAnimating];
    }
    
    // device service
    if ([service isKindOfClass:[DeviceNotificationService class]]) {
        [self.deviceSpinner stopAnimating];
        self.deviceTextArea.text = ((DeviceNotificationService*)service).deviceResult.ErrorMessage;
        self.deviceTextArea.textColor = [UIColor redColor];
    }
    
    // invitation service
    if ([service isKindOfClass:[SendInvitationService class]]) {
        [self.invitationSpinner stopAnimating];
        self.invitationTextArea.text = ((SendInvitationService*)service).invitationResult.ErrorMessage;
        self.invitationTextArea.textColor = [UIColor redColor];
    }
}

- (void)serviceWillBegin:(id)service {
    
    // points service
    if ([service isKindOfClass:[GetPointsBalanceService class]]) {
        [self.pointsSpinner startAnimating];
    }
    
    // cash service
    if ([service isKindOfClass:[GetVacationCashBalanceService class]]) {
        [self.cashSpinner startAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
