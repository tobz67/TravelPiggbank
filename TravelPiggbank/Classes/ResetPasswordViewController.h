//
//  ResetPasswordViewController.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/12/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEFormViewController.h"

@interface ResetPasswordViewController : ICEFormViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)resetButtonTapped:(id)sender;

@end
