//
//  ViewController.m
//  SkEmployeLoginPage
//
//  Created by Felix ITs 04 on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "mainPage.h"
#import "coustamtabbar.h"

@interface ViewController (){
    NSManagedObjectContext *context;
    NSArray *checkNewArray;
}

@end

@implementation ViewController
@synthesize emailidTextfield,passwordTextfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *userdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:@"1" forKey:@"changePage"];
    [userdefault synchronize];
}
-(void)checkValidation{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DepartmentInfo" inManagedObjectContext:context];
    
    [request setEntity:entity];
    
    NSPredicate *predicateEmailid = [NSPredicate predicateWithFormat:(@"emailid==%@"),emailidTextfield.text];
    NSPredicate *predicatePassword = [NSPredicate predicateWithFormat:(@"password==%@"),passwordTextfield.text];
    [request setPredicate:predicateEmailid];
    [request setPredicate:predicatePassword];
    checkNewArray = [context executeFetchRequest:request error:nil];
    if (checkNewArray.count>0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Message" message:@"Hey!! You have SucsessFully LoggedIn" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self performSegueWithIdentifier:@"mainpage" sender:self];
            
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Somthing Wrong Value Entered By You" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
            
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"mainpage"]) {
        mainPage* p = ((coustamtabbar*)segue.destinationViewController).viewControllers[0];
        p.stringEmail = [emailidTextfield.text copy ];
        coustamtabbar *new = [segue destinationViewController];
        new.newemail = [emailidTextfield.text copy];
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(id)sender {
    [self checkValidation];
    
}

- (IBAction)signup:(id)sender {
    [self performSegueWithIdentifier:@"signup" sender:self];
}
@end
