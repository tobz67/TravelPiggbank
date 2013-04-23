//
//  ICEFormViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/15/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "ICEFormViewController.h"
#import <UIKit/UIKit.h>


@interface ICEFormViewController ()

@end

@implementation ICEFormViewController

-(void)viewDidLoad {

    self.formFields = [[NSMutableDictionary alloc] init];
    self.validationManager = [PMValidationManager validationManager];
    
    self.toolTipView = [[InvalidTooltipView alloc] init];
    [self.toolTipView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.toolTipView];
    
    self.toolTipView.hidden = YES;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.toolTipView attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 36]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.toolTipView attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 298]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toolTipView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
}

- (void)registerValidators; {    
    NSLog(@"override this field in your subclass");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Register for keyboard notifications.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self registerValidators];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Register for keyboard notifications.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    for (NSDictionary *fieldDict in self.formFields) {
        id formField = (id)[fieldDict objectForKey:@"field"];
        // text fields
        if ([formField isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)textField;
            if (tf == textField && [tf isValid])
                return YES;
        }
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSEnumerator *enumerator = [self.formFields objectEnumerator];
    NSDictionary *dict;
    while ((dict = [enumerator nextObject]) != nil) {
        id formField = [dict objectForKey:@"field"];
        if ([formField isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)formField;
            if (tf == textField && [tf isValid]) {
                id nextObject = [enumerator nextObject];
                if (nextObject!=nil)
                    [[nextObject objectForKey:@"field"] becomeFirstResponder];
                else
                    [tf resignFirstResponder];
                return YES;
            }
        }
    }
    return NO;
}

-(void)doneEditing:(id)sender {
	[sender resignFirstResponder];
}

- (void)handleTap: (id)sender {
    
    UITapGestureRecognizer *recognizer = (UITapGestureRecognizer*)sender;
    
    if (recognizer.view.isHidden == NO) {
        UITextField* tf = (UITextField*)recognizer.view.superview;
        
        self.toolTipView.hidden = NO;
        
        // set the top position relative to the input field.
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toolTipView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:tf
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1
                                                               constant:28]];
//        self.toolTipView.text = @"Invalid input here";

//        PMValidationUnit *unit = [self.validationManager unitForIdentifier:@""];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardDidShow:(NSNotification *)aNotification {
}

- (void)keyboardDidHide:(NSNotification *)aNotification {
    [self.view scrollToY:0];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.view scrollToView:textField];
}

@end
