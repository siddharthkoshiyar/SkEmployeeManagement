//
//  coustamtabbar.m
//  SkEmployeLoginPage
//
//  Created by Mac on 21/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import "coustamtabbar.h"
#import "mainPage.h"
@interface coustamtabbar ()

@end

@implementation coustamtabbar


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ( ![[[NSUserDefaults standardUserDefaults] valueForKey:@"changePage"] isEqualToString:@"1"]) {
        _newemail = [[NSUserDefaults standardUserDefaults]
                     stringForKey:@"changePage"];

    }
    
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:_newemail forKey:@"changePage"];
    [userdefault synchronize];
    NSLog(@"%@",_newemail);
    
        
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

@end
