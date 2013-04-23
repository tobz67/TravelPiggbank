//
//  AuthenticateUserService.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "AuthenticateUserService.h"
#import "RestKit.h"
#import "SessionHelper.h"
#import "ConfigHelper.h"

@implementation AuthenticateUserService

- (void)performRequest:(AuthenticateUserRequest *)req delegate:(id<WebServiceDelegate>)delegateIn {
    
    self.delegate = delegateIn;
    self.authenticateRequest = req;
    
    // tell the view the 
    [self.delegate serviceWillBegin:self];
    
    // fire away!
    [[RKObjectManager sharedManager] postObject:req
                         path:[NSString stringWithFormat:@"/membership/memberrest.svc/json/partner/%@/authenticateuser", [[ConfigHelper sharedHelper] partnerID]]
                   parameters:nil
                      success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                          
                          NSLog(@"sucess!");
                          NSLog(@"%@", operation.HTTPRequestOperation.responseString);
                          
                          AuthenticateUserResult *result = [mappingResult.array lastObject];
                          NSLog(@"Success: %i", result.Success);
                          
                          if (result.Success) {
                              self.authenticateResult = result;
                              [SessionHelper sharedHelper].authenticateUserResult = result;
                              [self.delegate serviceDidComplete:self];
                          } else {
                              [self.delegate serviceDidFail:self error:nil];
                          }
                      }
                      failure:^(RKObjectRequestOperation *operation, NSError *error) {
                          
                          NSLog(@"failure!");
                          NSString *body = [NSString stringWithUTF8String:[operation.HTTPRequestOperation.request.HTTPBody bytes]];
                          NSLog(@"%@", body);
                          [self.delegate serviceDidFail:self error:nil];
                      }];
}

@end


@implementation AuthenticateUserRequest
@end


@implementation AuthenticateUserResult
@end
