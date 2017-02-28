//
//  departmentData.m
//  SkEmployeLoginPage
//
//  Created by Mac on 21/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "departmentData.h"
#import "AppDelegate.h"
@interface departmentData (){
    NSManagedObjectContext *context;
    NSArray *array;
}

@end

@implementation departmentData
@synthesize email,emailid,password,department,designation;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *userdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
    NSLog(@"%@",emailid);
    [self fectDepartmentData];
}
-(void)fectDepartmentData{
    NSFetchRequest *fetchdepartment = [[NSFetchRequest alloc]initWithEntityName:@"DepartmentInfo"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"emailid==%@",email];
    [fetchdepartment setPredicate:predicate];
    array = [context executeFetchRequest:fetchdepartment error:nil];
    for (NSManagedObject *obj in array) {
        emailid.text = [obj valueForKey:@"emailid"];
        password.text = [obj valueForKey:@"password"];
        department.text = [obj valueForKey:@"departmentname"];
        designation.text = [obj valueForKey:@"designation"];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
    
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    
    
    [userdefault setObject:@"1" forKey:@"changePage"];
    [userdefault synchronize];
}
@end
