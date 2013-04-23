//
//  main.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/9/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "NUIAppearance.h"
#import "Utilities.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        [NUISettings init];
        [Utilities copyResourceFile:@"Style.nss" toDocumentsDirectoryWithDestinationName:@"Style.nss"];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writablePath = [documentsDirectory stringByAppendingPathComponent:@"Style.nss"];
        [NUISettings setAutoUpdatePath:writablePath];
              
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}