//
//  UITextField+ICE.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/15/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kTextFieldValueType_Text=0,
    kTextFieldValueType_Email=1,
    kTextFieldValueType_Number=2
} TextFieldValueType;

@interface UITextField (ICE)

@property (nonatomic, strong) UIImageView *errorImage;

- (BOOL)isValid;
- (void)setErrorForTextField:(UITextField *)textField target:(id)target action:(SEL)selector;
- (void)handleTap: (id)sender;

@end
