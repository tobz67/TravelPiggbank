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

@interface ICEFormViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray*formFields;
@property (nonatomic, retain) PMValidationManager *validationManager;
@property (nonatomic, strong) InvalidTooltipView *toolTipView;

- (void)registerValidators;
- (void)keyboardDidShow:(NSNotification *)aNotification;
- (void)keyboardDidlHide:(NSNotification *)aNotification;

@end
