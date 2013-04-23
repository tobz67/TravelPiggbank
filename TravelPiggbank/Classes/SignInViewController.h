//
//  LoginViewController
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/9/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceDelegate.h"
#import "ICEFormViewController.h"

@interface SignInViewController : ICEFormViewController <WebServiceDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UILabel *debugLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *styleSegmentedControl;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;

- (IBAction)signInButtonTapped:(id)sender;
- (IBAction)styleSegmentTapped:(id)sender;

@end
