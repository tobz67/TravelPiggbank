//
//  WebServiceDelegate.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceError.h"

@protocol WebServiceDelegate <NSObject>

- (void)serviceDidComplete:(id)service;
- (void)serviceDidFail:(id)service error:(WebServiceError *)error;

@optional

- (void)serviceWillBegin:(id)service;

@end
