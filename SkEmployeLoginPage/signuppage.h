//
//  signuppage.h
//  SkEmployeLoginPage
//
//  Created by Felix ITs 04 on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signuppage : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextView *addressTextview;
@property (weak, nonatomic) IBOutlet UITextField *emailIdTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *departmentTextfield;
@property (weak, nonatomic) IBOutlet UITextField *designationTextfield;
- (IBAction)saveinfo:(id)sender;

@end
