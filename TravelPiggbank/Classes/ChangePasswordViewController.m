//
//  ChangePasswordViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "BalancesViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (IBAction)updateButtonTapped:(id)sender {
    
    // make sure no fields are empty
    if ([self.tempPasswordTextField.text isEqualToString:@""]
        || [self.passwordTextField.text isEqualToString:@""]
        || [self.confirmPasswordTextField.text isEqualToString:@""]) {
        
        return;
    }
    
    // make sure passwords match
    if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        
        return;
    }
    
    self.tempPasswordTextField.hidden = YES;
    self.passwordTextField.hidden = YES;
    self.confirmPasswordTextField.hidden = YES;
    self.updateButton.hidden = YES;
    self.successMessageView.hidden = NO;
}

- (IBAction)continueButtonTapped:(id)sender {
    
    NSArray *vcArray = self.navigationController.viewControllers;
    for (UIViewController *vc in vcArray) {
        if ([vc isKindOfClass:[BalancesViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if (self.tempPasswordTextField == textField && [self.tempPasswordTextField isValid]) {
        return YES;
    } else if (self.passwordTextField == textField && [self.passwordTextField isValid]) {
        return YES;
    } else if (self.confirmPasswordTextField == textField && [self.confirmPasswordTextField isValid]) {
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.tempPasswordTextField == textField && [self.tempPasswordTextField isValid]) {
        [self.passwordTextField becomeFirstResponder];
        return YES;
    } else if (self.passwordTextField == textField && [self.tempPasswordTextField isValid]) {
        [self.confirmPasswordTextField becomeFirstResponder];
        return YES;
    } else if (self.confirmPasswordTextField == textField && [self.confirmPasswordTextField isValid]) {
        [self.confirmPasswordTextField resignFirstResponder];
        return YES;
    }
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Change Password";
    
    self.tempPasswordTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
