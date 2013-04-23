//
//  SendInvitationService.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "SendInvitationService.h"

@implementation SendInvitationService

- (void)performRequest:(SendInvitationRequest *)req delegate:(id<WebServiceDelegate>)delegateIn {
    
    self.delegate = delegateIn;
    self.invitationRequest = req;
    
    // tell the view the
    [self.delegate serviceWillBegin:self];
    
    // fire away!
    [[RKObjectManager sharedManager] postObject:req
                         path:[NSString stringWithFormat:@"/membership/memberrest.svc/json/partner/%@/sendinvitation", [[ConfigHelper sharedHelper] partnerID]]
                   parameters:nil
                      success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                          
                          NSLog(@"sucess!");
                          NSLog(@"%@", operation.HTTPRequestOperation.responseString);
                          
                          SendInvitationResult *result = [mappingResult.array lastObject];
                          NSLog(@"Success: %i", result.Success);
                          
                          if (result.Success) {
                              self.invitationResult = result;
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


@implementation SendInvitationRequest
@end


@implementation SendInvitationResult
@end