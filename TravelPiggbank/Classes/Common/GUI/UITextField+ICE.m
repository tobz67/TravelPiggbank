//
//  UITextField+ICE.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/15/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "UITextField+ICE.h"
#import "UIView+NUI.h"

@implementation UITextField (ICE)

-(BOOL) isValid {
    
    if ([self.text isEqualToString:@""]) {
        self.nuiClass = @"Error";
        [self setErrorForTextField:self target:self action:@selector(handleTap:)];
        
//        if (self.errorImage == nil)
//            self.errorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error-48.png"]];
        
//        self.rightView = self.errorImage;
        [self resignFirstResponder];
        return NO;

    } 
    self.rightView = nil;
    self.nuiClass = @"";
    return YES;
}

- (void)setErrorForTextField:(UITextField *)textField target:(id)target action:(SEL)selector {
    
    CGRect frame = CGRectMake(0.0, 0.0, 24.0, 24.0);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[UIImage imageNamed:@"error-24.png"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
    [button addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];
    button.nuiClass = @"none";
    
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error-24.png"]];
//    imgView.frame = frame;
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    tapGesture.numberOfTapsRequired = 1;

    textField.rightView = button;
//    [self.rightView addGestureRecognizer:tapGesture];
    textField.rightViewMode = UITextFieldViewModeAlways;
}

 - (void)handleTap: (id)sender{

    self.text = @"Value required";
}

@end
