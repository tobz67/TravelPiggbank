//
//  Utils.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+(NSDictionary*)loadPlistNamed:(NSString*)fileName;
+(BOOL)copyResourceFile:(NSString*)resourceFile toDocumentsDirectoryWithDestinationName:(NSString*)destName;

@end
