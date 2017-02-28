//
//  signuppage.m
//  SkEmployeLoginPage
//
//  Created by Felix ITs 04 on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "signuppage.h"
#import "AppDelegate.h"
@interface signuppage (){
    NSManagedObjectContext *context;
    NSArray *array;
    NSArray *newArray;
    NSString *UUID;
    NSArray *checkEmailArray;
   }

@end

@implementation signuppage
@synthesize nameTextfield,addressTextview,emailIdTextfield,passwordTextfield,departmentTextfield,designationTextfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *userdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveinfo:(id)sender {
    
    UUID = [[NSUUID UUID] UUIDString];
    
    
    if ([sender tag] == 1){
        [self tofetchProperEmailId];
             if (([self validateEmail:emailIdTextfield.text])&&(!([checkEmailArray count] >0))) {
                  [self toSaveData];
             }else{
                 if (![self validateEmail:emailIdTextfield.text]) {
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"This EmailId Is Not in ProperFormat" preferredStyle:UIAlertControllerStyleAlert];
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                         [alert dismissViewControllerAnimated:YES completion:nil];
                     }];
                     [alert addAction:ok];
                     [self presentViewController:alert animated:YES completion:nil];
                     
                 }else{
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"This EmailId Is Already In Used" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    }];
                 [alert addAction:ok];
                 [self presentViewController:alert animated:YES completion:nil];
                 }
             }
        
       }else{
        
        [self performSegueWithIdentifier:@"pass" sender:self];
    }

    
  }
-(void)toSaveData{
    
    //////.....save context Personal Info.......////////////
    
    NSEntityDescription *entityPersonalInfo = [NSEntityDescription entityForName:@"PersonalInfo" inManagedObjectContext:context];
    NSManagedObject *manageObj = [[NSManagedObject alloc]initWithEntity:entityPersonalInfo insertIntoManagedObjectContext:context];
    [manageObj setValue:nameTextfield.text forKey:@"name"];
    [manageObj setValue:addressTextview.text forKey:@"address"];
    [manageObj setValue:UUID forKey:@"id"];
    
    NSEntityDescription *entityDepartmentInfo = [NSEntityDescription entityForName:@"DepartmentInfo" inManagedObjectContext:context];
    NSManagedObject *objDepartment = [[NSManagedObject alloc]initWithEntity:entityDepartmentInfo insertIntoManagedObjectContext:context];
    [objDepartment setValue:emailIdTextfield.text forKey:@"emailid"];
    [objDepartment setValue:passwordTextfield.text forKey:@"password"];
    [objDepartment setValue:departmentTextfield.text forKey:@"departmentname"];
    [objDepartment setValue:designationTextfield.text forKey:@"designation"];
    [objDepartment setValue:UUID forKey:@"id"];
    [context save:nil];
    
}
-(void)tofetchProperEmailId{
    
    NSFetchRequest *fetchEmail = [[NSFetchRequest alloc]initWithEntityName:@"DepartmentInfo"];
    NSPredicate *predicateEmail = [NSPredicate predicateWithFormat:@"emailid==%@",emailIdTextfield.text];
    [fetchEmail setPredicate:predicateEmail];
    checkEmailArray = [context executeFetchRequest:fetchEmail error:nil];
    
    
    
}
@end
