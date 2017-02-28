//
//  departmentData.h
//  SkEmployeLoginPage
//
//  Created by Mac on 21/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface departmentData : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *designation;
@property (weak, nonatomic) IBOutlet UILabel *department;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UILabel *emailid;
@property(nonatomic,strong)NSString *email;
- (IBAction)logout:(id)sender;
@end
