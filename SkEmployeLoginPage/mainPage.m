//
//  mainPage.m
//  SkEmployeLoginPage
//
//  Created by Mac on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "mainPage.h"
#import "AppDelegate.h"
#import "departmentData.h"
#import "coustamtabbar.h"

@interface mainPage (){
    NSManagedObjectContext *context;
    NSArray *array;
    NSArray *arrayid;
    
}

@end

@implementation mainPage
@synthesize stringEmail,nameTextfield,addressTextfield;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    coustamtabbar *tabBar = (coustamtabbar *)self.tabBarController;
    stringEmail = [NSString stringWithFormat:@"%@",tabBar.newemail];
    
    
    NSLog(@"%@",stringEmail);
   
    AppDelegate *userdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
    self.tabBarController.delegate = self;
    [self fetchData];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[departmentData class]]){
        departmentData *svc = (departmentData *) viewController;
        svc.email = stringEmail;
        return TRUE;
    }
    return TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)fetchData{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"DepartmentInfo"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"emailid==%@",stringEmail];
    [fetchRequest setPredicate:predicate];
    array = [context executeFetchRequest:fetchRequest error:nil];
    NSManagedObject *obj = [[array objectAtIndex:0]valueForKeyPath:@"id"];
    NSFetchRequest *fetchAgain = [[NSFetchRequest alloc]initWithEntityName:@"PersonalInfo"];
    NSPredicate *predicateSecond = [NSPredicate predicateWithFormat:@"id==%@",obj];
    [fetchAgain setPredicate:predicateSecond];
    
    arrayid  = [context executeFetchRequest:fetchAgain error:nil];
    for (NSManagedObject *newObj in arrayid) {
        
        nameTextfield.text = [newObj valueForKey:@"name"];
        addressTextfield.text = [newObj valueForKey:@"address"];
        
    }
    
}
- (IBAction)logout:(id)sender {
    
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    
    
    [userdefault setObject:@"1" forKey:@"changePage"];
    [userdefault synchronize];
}
@end
