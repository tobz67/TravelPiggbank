//
//  WebServiceBase.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceDelegate.h"
#import "RestKit.h"
#import "ConfigHelper.h"



@interface WebServiceBase : NSObject

@property (nonatomic, weak) id delegate;

@end


@interface WebServiceRequest : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *softwareVersion;

@end

@interface WebServiceResult: NSObject

@property (strong, nonatomic) NSString *ErrorMessage;
@property (assign, nonatomic) bool Success;

@end
