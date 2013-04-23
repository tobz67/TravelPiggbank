//
//  SendInvitationViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "SendInvitationViewController.h"
#import "BalancesViewController.h"

@interface SendInvitationViewController ()

@end

@implementation SendInvitationViewController

- (IBAction)sendButtonTapped:(id)sender {
    
    self.nameTextField.hidden = YES;
    self.emailTextField.hidden = YES;
    self.sendButton.hidden = YES;
    self.sucessMessageView.hidden = NO;
}

- (IBAction)continueButtonTapped:(id)sender {
    
    NSArray *vcArray = self.navigationController.viewControllers;
    for (UIViewController *vc in vcArray) {
        if ([vc isKindOfClass:[BalancesViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Refer a friend!";
    
    self.nameTextField.delegate = self;
    self.emailTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
