//
//  ResetPasswordViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

- (IBAction)resetButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"updatePasswordSegue" sender:nil];
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if (self.emailTextField == textField && [self.emailTextField isValid]) {
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.emailTextField == textField && [self.emailTextField isValid]) {
        [self.emailTextField resignFirstResponder];
        return YES;
    }
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"Password Reset";
    
    self.emailTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
