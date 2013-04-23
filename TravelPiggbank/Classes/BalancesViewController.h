//
//  BalancesViewController.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/10/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceDelegate.h"

@interface BalancesViewController : UIViewController <WebServiceDelegate>

@property (assign, nonatomic) int requestIndex;

@property (weak, nonatomic) IBOutlet UILabel *pointsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *invitationTextLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *pointsSpinner;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *cashSpinner;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *deviceSpinner;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *invitationSpinner;
@property (weak, nonatomic) IBOutlet UIImageView *pointsImage;
@property (weak, nonatomic) IBOutlet UIImageView *cashImage;
@property (weak, nonatomic) IBOutlet UIImageView *deviceImage;
@property (weak, nonatomic) IBOutlet UIImageView *invitationImage;
@property (weak, nonatomic) IBOutlet UITextView *deviceTextArea;
@property (weak, nonatomic) IBOutlet UITextView *invitationTextArea;
@property (weak, nonatomic) IBOutlet UILabel *pointsText;
@property (weak, nonatomic) IBOutlet UILabel *pointsTitle;
@property (weak, nonatomic) IBOutlet UILabel *cashTitle;
@property (weak, nonatomic) IBOutlet UILabel *deviceTitle;
@property (weak, nonatomic) IBOutlet UILabel *invitationTitle;


@end
