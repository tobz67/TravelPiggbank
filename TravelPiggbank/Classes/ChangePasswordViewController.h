//
//  ChangePasswordViewController.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEFormViewController.h"

@interface ChangePasswordViewController : ICEFormViewController

@property (weak, nonatomic) IBOutlet UITextField *tempPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIView *successMessageView;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;


- (IBAction)updateButtonTapped:(id)sender;
- (IBAction)continueButtonTapped:(id)sender;

@end
