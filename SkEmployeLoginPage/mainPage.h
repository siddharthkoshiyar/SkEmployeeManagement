//
//  mainPage.h
//  SkEmployeLoginPage
//
//  Created by Mac on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainPage : UIViewController<UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *addressTextfield;
@property (weak, nonatomic) IBOutlet UILabel *nameTextfield;
- (IBAction)logout:(id)sender;

@property(nonatomic,strong)NSString *stringEmail;
@end
