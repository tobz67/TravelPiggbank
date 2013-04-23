//
//  SendInvitationViewController.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEFormViewController.h"

@interface SendInvitationViewController : ICEFormViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIView *sucessMessageView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)sendButtonTapped:(id)sender;
- (IBAction)continueButtonTapped:(id)sender;

@end
