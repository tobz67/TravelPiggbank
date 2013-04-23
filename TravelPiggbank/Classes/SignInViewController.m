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

@property (nonatomic, retain) ValidationUnitStatusIndicatorVC *emailStatus;
@property (nonatomic, retain) ValidationUnitStatusIndicatorVC *passwordStatus;

@end

@implementation SignInViewController

NSArray const *stylesheets;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSArray *stylesheets = @[@"Blue", @"Piggy", @"Round", @"Route", @"SkyBlue", @"Switch"];
    
    self.styleSegmentedControl = [[UISegmentedControl alloc] initWithItems:stylesheets];
    
    self.navigationItem.title = @"Sign In";
    
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
    
//    [self.formFields setObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
//                                                                    [NSNumber numberWithInt:kTextFieldValueType_Email],
//                                                                    self.emailTextField,
//                                                                    nil]
//                                                           forKeys:[[NSArray arrayWithObjects:kFormKey_Type, kFormKey_Field, kFormKey_Status, nil] ]
//                        forKey:kFormKey_Email];
//    
//    [self.formFields addObject:]];
//    
//    [self.formFields addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
//                                                                           [NSNumber numberWithInt:kTextFieldValueType_Text],
//                                                                           self.passwordTextField,
//                                                                           nil]
//                                                                  forKeys:[NSArray arrayWithObjects:@"type", @"field", nil]]];

    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    // username
    PMValidationLengthType *valEmailLength = [PMValidationLengthType validator];
    valEmailLength.minimumCharacters = 4;
    valEmailLength.maximumCharacters = 12;
    PMValidationRegexType *valEmailRegEx = [PMValidationRegexType validator];
    valEmailRegEx.regexString = @"^[A-Z0-9a-z]+$"; // only letters and numbers.
    PMValidationUnit *emailUnit = [self.validationManager registerTextField:self.emailTextField
                                                          forValidationTypes:[NSSet setWithObjects:valEmailLength, valEmailRegEx, nil]
                                                                  identifier:kFormKey_Email];
    
    self.emailStatus = [[ValidationUnitStatusIndicatorVC alloc] init];
    self.emailTextField.rightView = self.emailStatus.view;
    [self.emailStatus registerWithValidationUnit:emailUnit];
    self.emailStatus.view.frame = CGRectMake(0, 0, self.emailStatus.indicatorIcon.frame.size.width, self.emailStatus.indicatorIcon.frame.size.height);
    self.emailTextField.rightViewMode = UITextFieldViewModeAlways;
    [self.emailTextField.rightView addGestureRecognizer:tapGesture];
    
    
    // password
    PMValidationLengthType *valPasswordLen = [PMValidationLengthType validator];
    valPasswordLen.minimumCharacters = 4;
    valPasswordLen.maximumCharacters = 12;
    PMValidationUnit *passwordUnit = [self.validationManager registerTextField:self.passwordTextField 
                                                          forValidationTypes:[NSSet setWithObjects:valPasswordLen, nil]
                                                                  identifier:kFormKey_Password];
    
    self.passwordStatus = [[ValidationUnitStatusIndicatorVC alloc] init];
    self.passwordTextField.rightView = self.passwordStatus.view;
    [self.passwordStatus registerWithValidationUnit:passwordUnit];
    self.passwordStatus.view.frame = CGRectMake(0, 0, self.passwordStatus.indicatorIcon.frame.size.width, self.passwordStatus.indicatorIcon.frame.size.height);
    self.passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    [self.passwordTextField.rightView addGestureRecognizer:tapGesture];

    
    
    // get validation status update
    [[NSNotificationCenter defaultCenter] addObserverForName:PMValidationStatusNotification object:self.validationManager queue:nil usingBlock:
     ^(NSNotification *notification) {
         BOOL is_valid = [(NSNumber *)[notification.userInfo objectForKey:kFormKey_Status] boolValue];
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
