//
//  ConfigHelper.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigHelper : NSObject

@property (nonatomic, strong) NSDictionary *configDictionary;

+ (ConfigHelper *)sharedHelper;
- (NSString*)webServiceHostName;
- (NSString*)partnerID;
- (NSString*)wsAuthHeader;
- (void)configureRestKitServiceObjectMappings;

@end
