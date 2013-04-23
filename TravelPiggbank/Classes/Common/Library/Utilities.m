//
//  Utilities
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(NSDictionary*)loadPlistNamed:(NSString*)fileName {
    
	NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:fileName ofType:@"plist"];
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return dict;
}

+(BOOL)copyResourceFile:(NSString*)resourceFile toDocumentsDirectoryWithDestinationName:(NSString*)destName {
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError       *error;
    NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString      *documentsDirectory = [paths objectAtIndex:0];
    NSString      *writablePath = [documentsDirectory stringByAppendingPathComponent:destName];

    success = [fileManager fileExistsAtPath:writablePath];
    if (success) {
        [fileManager removeItemAtPath:writablePath error:&error];
        if (error!=nil) {
            NSLog(@"%@", [error description]);
        }
    }
    
    NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:resourceFile];
    success = [fileManager copyItemAtPath:resourcePath toPath:writablePath error:&error];
    
    if (error!=nil) {
        NSLog(@"%@", [error description]);
    }
    
    return success;
}


@end
