//
//  ICEFormViewController.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/15/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FormScroll.h"
#import "UITextField+ICE.h"
#import "PMValidationManager.h"
#import "PMValidationUnit.h"
#import "PMValidationEmailType.h"
#import "PMValidationLengthType.h"
#import "PMValidationUITextCompareType.h"
#import "PMValidationRegexType.h"
#import "ValidationUnitStatusIndicatorVC.h"
#import "InvalidTooltipView.h"


#define kFormKey_Type @"type"
#define kFormKey_Field @"field"
#define kFormKey_Status @"field"

#define kFormKey_Name @"name"
#define kFormKey_Email @"email"
#define kFormKey_Password @"password"
#define kFormKey_ConfirmPassword @"email"
#define kFormKey_Phone @"phone"

@interface ICEFormViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableDictionary *formFields;
@property (nonatomic, retain) PMValidationManager *validationManager;
@property (nonatomic, strong) InvalidTooltipView *toolTipView;

- (void)registerValidators;
- (void)keyboardDidShow:(NSNotification *)aNotification;
- (void)keyboardDidlHide:(NSNotification *)aNotification;

@end
