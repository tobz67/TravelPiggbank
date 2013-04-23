//
//  GetPointsBalanceService.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "GetPointsBalanceService.h"
#import "RestKit.h"
#import "SessionHelper.h"

@implementation GetPointsBalanceService

- (void)performRequest:(id<WebServiceDelegate>)delegateIn {
    
    self.delegate = delegateIn;

    NSString *balancePath = [NSString stringWithFormat:@"/membership/transactionrest.svc/json/partner/%@/points/balance?token=%@",
                                [[ConfigHelper sharedHelper] partnerID],
                                [SessionHelper sharedHelper].authenticateUserResult.UserAccountToken];
    
    GetPointsBalanceResult *balanceResult = [GetPointsBalanceResult new];
    
    [self.delegate serviceWillBegin:self];

    [[RKObjectManager sharedManager] getObject:balanceResult path:balancePath parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {

        NSLog(@"point success");
        NSLog(@"%@", operation.HTTPRequestOperation.responseString);
        GetPointsBalanceResult *result = (GetPointsBalanceResult*) [mappingResult.array lastObject];
        
        if (result.Success) {
            self.pointsBalanceResult = result;
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

@implementation GetPointsBalanceResult
@end