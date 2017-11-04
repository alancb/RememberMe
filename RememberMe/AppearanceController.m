//
//  AppearanceController.m
//  RememberMe
//
//  Created by Alan Barth on 5/26/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AppearanceController.h"
#import "UIColor+AppColors.h"

@import UIKit;

@implementation AppearanceController

+ (void)initializeAppearanceDefaults {


    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], nil] setTintColor:[UIColor primaryAppColor]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    if (@available(iOS 11.0, *)) {
        [[UINavigationBar appearance] setLargeTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    } else {
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    }
    
    
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor primaryAppColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor primaryAppColor]];
    
    [[UISwitch appearance] setOnTintColor:[UIColor primaryAppColor]];
    [[UISwitch appearance] setTintColor:[UIColor primaryAppColor]];

}

@end
