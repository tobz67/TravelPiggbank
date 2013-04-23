//
//  GetPointsBalanceService.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "WebServiceBase.h"
#import "WebServiceDelegate.h"

@class GetPointsBalanceResult;


@interface GetPointsBalanceService : WebServiceBase

@property (nonatomic, strong) GetPointsBalanceResult *pointsBalanceResult;

- (void)performRequest:(id<WebServiceDelegate>)delegateIn;

@end

@interface GetPointsBalanceResult : WebServiceResult

@property (strong, nonatomic) NSNumber *PointsBalance;

@end