//
//  GetVacationCashBalanceService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class GetVacationCashBalanceResult;


@interface GetVacationCashBalanceService : WebServiceBase

@property (nonatomic, strong) GetVacationCashBalanceResult *vacationCashBalanceResult;

- (void)performRequest:(id<WebServiceDelegate>)delegateIn;

@end

@interface GetVacationCashBalanceResult : WebServiceResult

@property (strong, nonatomic) NSNumber *VacationCashBalance;

@end
