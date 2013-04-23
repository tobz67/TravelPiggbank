//
//  ViewController.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/9/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "SignInViewController.h"
#import "RestKit.h"
#import "AuthenticateUserService.h"
#import "NUIAppearance.h"
#import "Utilities.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

NSArray const *stylesheets;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSArray *stylesheets = @[@"Blue", @"Piggy", @"Round", @"Route", @"SkyBlue", @"Switch"];
    
    self.styleSegmentedControl = [[UISegmentedControl alloc] initWithItems:stylesheets];
    
    self.navigationItem.title = @"Sign In";
    
    [self.formFields addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                           [NSNumber numberWithInt:kTextFieldValueType_Email],
                                                                           self.emailTextField,
                                                                           nil]
                                                                  forKeys:[NSArray arrayWithObjects:@"type", @"field", nil]]];
    
    [self.formFields addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                           [NSNumber numberWithInt:kTextFieldValueType_Text],
                                                                           self.passwordTextField,
                                                                           nil]
                                                                  forKeys:[NSArray arrayWithObjects:@"type", @"field", nil]]];
}

- (IBAction)signInButtonTapped:(id)sender {
    
    if ([self.emailTextField isValid] && [self.passwordTextField isValid]) {
        
        AuthenticateUserRequest *authentcateUserRequest = [AuthenticateUserRequest new];
        authentcateUserRequest.UserName = @"tambrose";
        authentcateUserRequest.Password = @"vacation1";
        
        AuthenticateUserService *service = [[AuthenticateUserService alloc] init];
        [service performRequest:authentcateUserRequest delegate:self];
        
    } else {
        
        
        
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.emailTextField resignFirstResponder];
	[self.passwordTextField resignFirstResponder];
    
    if (self.toolTipView != nil)
        self.toolTipView.hidden = YES;
    
}


- (void) registerValidators {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    // username
    PMValidationLengthType *valEmailLength = [PMValidationLengthType validator];
    valEmailLength.minimumCharacters = 4;
    valEmailLength.maximumCharacters = 12;
    PMValidationRegexType *valEmailRegEx = [PMValidationRegexType validator];
    valEmailRegEx.regexString = @"^[A-Z0-9a-z]+$"; // only letters and numbers.
    PMValidationUnit *emailUnit = [self.validationManager registerTextField:self.emailTextField
                                                          forValidationTypes:[NSSet setWithObjects:valEmailLength, valEmailRegEx, nil]
                                                                  identifier:@"email"];
    
    ValidationUnitStatusIndicatorVC *emailStatus = [[ValidationUnitStatusIndicatorVC alloc] init];
    self.emailTextField.rightView = emailStatus.view;
    [emailStatus registerWithValidationUnit:emailUnit];
    emailStatus.view.frame = CGRectMake(0, 0, emailStatus.indicatorIcon.frame.size.width, emailStatus.indicatorIcon.frame.size.height);
    self.emailTextField.rightViewMode = UITextFieldViewModeAlways;
    
    [self.emailTextField.rightView addGestureRecognizer:tapGesture];
    
    
    
    // password
    PMValidationEmailType *valPassword = [PMValidationEmailType validator];
    PMValidationUnit *passwordUnit = [self.validationManager registerTextField:self.passwordTextField
                                                          forValidationTypes:[NSSet setWithObjects:valPassword, nil]
                                                                  identifier:@"email"];
    
    
    // get validation status update
    [[NSNotificationCenter defaultCenter] addObserverForName:PMValidationStatusNotification object:self.validationManager queue:nil usingBlock:
     ^(NSNotification *notification) {
         BOOL is_valid = [(NSNumber *)[notification.userInfo objectForKey:@"status"] boolValue];
         if (is_valid) {
             self.signInButton.enabled = YES;
             
             
         } else {
             
             
             self.signInButton.enabled = NO;
         }
         NSLog(@"unit dict %@", notification.userInfo);
     }
     ];
    
    
}

- (IBAction)styleSegmentTapped:(id)sender {
    
    UISegmentedControl *seg = (UISegmentedControl*)sender;
    NSString *title = [seg titleForSegmentAtIndex:seg.selectedSegmentIndex];
    NSString *newBundleFilePath = [[NSBundle mainBundle] pathForResource:title ofType:@"nss"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *styleFilePath = [documentsDirectory stringByAppendingPathComponent:@"Style.nss"];
    
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfFile:newBundleFilePath encoding:NSASCIIStringEncoding error:&error];
    if (error!=nil) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    BOOL ok = [stringFromFileAtURL writeToFile:styleFilePath atomically:YES encoding:NSASCIIStringEncoding error:&error];
    
    NSLog(@"file updated: %i", ok);
    if (error!=nil) {
        NSLog(@"%@", [error localizedDescription]);
    }
}

- (void)serviceDidComplete:(id)service {
    
    [self.spinner stopAnimating];
    AuthenticateUserResult *result = ((AuthenticateUserService *)service).authenticateResult;
    self.debugLabel.text = result.UserAccountToken;
    
    [self performSegueWithIdentifier:@"balancesSegue" sender:nil];
    
}
- (void)serviceDidFail:(id)service error:(WebServiceError *)error {
    
    [self.spinner stopAnimating];
}

- (void)serviceWillBegin:(id)service {
    
    [self.spinner startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
