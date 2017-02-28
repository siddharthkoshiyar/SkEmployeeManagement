//
//  ViewController.h
//  SkEmployeLoginPage
//
//  Created by Felix ITs 04 on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailidTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)login:(id)sender;
- (IBAction)signup:(id)sender;

@end

