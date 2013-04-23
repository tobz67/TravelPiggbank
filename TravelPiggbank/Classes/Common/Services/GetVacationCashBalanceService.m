//
//  GetVacationCashBalanceService.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "GetVacationCashBalanceService.h"
#import "RestKit.h"
#import "SessionHelper.h"

@implementation GetVacationCashBalanceService

- (void)performRequest:(id<WebServiceDelegate>)delegateIn {
    
    self.delegate = delegateIn;
    
    NSString *balancePath = [NSString stringWithFormat:@"/membership/transactionrest.svc/json/partner/%@/vacationcash/balance?token=%@",
                                [[ConfigHelper sharedHelper] partnerID],
                                [SessionHelper sharedHelper].authenticateUserResult.UserAccountToken];
    GetVacationCashBalanceResult *balanceResult = [GetVacationCashBalanceResult new];
    
    [self.delegate serviceWillBegin:self];
    
    [[RKObjectManager sharedManager] getObject:balanceResult path:balancePath parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
    
        NSLog(@"cash success");
        NSLog(@"%@", operation.HTTPRequestOperation.responseString);
        GetVacationCashBalanceResult *result = (GetVacationCashBalanceResult*) [mappingResult.array lastObject];

        if (result.Success) {
            self.vacationCashBalanceResult = result;
            [self.delegate serviceDidComplete:self];
        } else {
            [self.delegate serviceDidFail:self error:nil];
        }
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        NSLog(@"point failure");
        [self.delegate serviceDidFail:self error:nil];
    }];

}

@end


@implementation GetVacationCashBalanceResult
@end
