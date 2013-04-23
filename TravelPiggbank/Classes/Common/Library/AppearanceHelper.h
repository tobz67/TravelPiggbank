//
//  AppearanceHelper.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/11/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppearanceHelper : NSObject

@property (nonatomic, strong) NSDictionary *masterStyleDictionary;

+ (AppearanceHelper *)sharedHelper;

@end
