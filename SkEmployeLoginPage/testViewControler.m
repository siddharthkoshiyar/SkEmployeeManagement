//
//  testViewControler.m
//  SkEmployeLoginPage
//
//  Created by Mac on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "testViewControler.h"
#import "AppDelegate.h"

@interface testViewControler (){
    NSManagedObjectContext *context;
}

@end

@implementation testViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *userdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn:(id)sender {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"PersonalInfo"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name==%@",_textfieldCheck.text];
    [fetchRequest setPredicate:predicate];
    NSArray *newOne = [context executeFetchRequest:fetchRequest error:nil];
    NSManagedObject *obj = [[newOne objectAtIndex:0]valueForKeyPath:@"id"];
    
    NSFetchRequest *reQuestanother = [[NSFetchRequest alloc]initWithEntityName:@"DepartmentInfo"];
    NSPredicate *predicateDepartment = [NSPredicate predicateWithFormat:@"id==%@",obj];
    [reQuestanother setPredicate:predicateDepartment];
    NSArray *lastArray = [context executeFetchRequest:reQuestanother error:nil];
    for (NSManagedObject *new in lastArray) {
        NSLog(@"%@",[new valueForKey:@"departmentname"]);
        NSLog(@"%@",[new valueForKey:@"designation"]);
      
        NSLog(@"%@",[new valueForKey:@"emailid"]);
        NSLog(@"%@",[new valueForKey:@"password"]);
        
        
    }
    
    
    
    
    
   }
@end
