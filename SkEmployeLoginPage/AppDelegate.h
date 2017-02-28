//
//  AppDelegate.h
//  SkEmployeLoginPage
//
//  Created by Felix ITs 04 on 20/02/17.
//  Copyright © 2017 Felix Its. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIStoryboard *story;
    UINavigationController *nav;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

