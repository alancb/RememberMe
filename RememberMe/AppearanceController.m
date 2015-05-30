//
//  AppearanceController.m
//  RememberMe
//
//  Created by Alan Barth on 5/26/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AppearanceController.h"

@import UIKit;

@implementation AppearanceController

+ (void)initializeAppearanceDefaults {
    
    UIColor *lightBlueColor = [UIColor colorWithRed:78/255.0 green:255/255.0 blue:239/255.0 alpha:1];
    UIColor *myGrayColor = [UIColor colorWithRed:137/255.0 green:144/255.0 blue:159/255.0 alpha:1];
    UIColor *lameLightBlueColor = [UIColor colorWithRed:155/255.0 green:189/255.0 blue:249/255.0 alpha:1];

    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:88/255.0 green:73/255.0 blue:130/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:88/255.0 green:73/255.0 blue:130/255.0 alpha:1]];
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:78/255.0 green:255/255.0 blue:239/255.0 alpha:1]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:78/255.0 green:255/255.0 blue:239/255.0 alpha:1]}];
//    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:78/255.0 green:255/255.0 blue:239/255.0 alpha:1]];
//    [[UIToolbar appearance] setBackgroundColor:[UIColor colorWithRed:137/255.0 green:144/255.0 blue:159/255.0 alpha:1]];
//    [[UIToolbar appearance] setTintColor:[UIColor colorWithRed:137/255.0 green:144/255.0 blue:159/255.0 alpha:1]];
    
    
    
    [[UINavigationBar appearance] setTitleTextAttributes: [ NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
  //  How do I make it not be so dominant?
  //  [[UIView appearance] setBackgroundColor:[UIColor greenColor]];
  //  [[UITextField appearance] setBackgroundColor:[UIColor blueColor]];
    

//    [[UITableViewCell appearance] setBackgroundColor:[UIColor colorWithRed:78/255.0 green:161/255.0 blue:255/255.0 alpha:1]];
//    [[UITableView appearance] setBackgroundColor:[UIColor colorWithRed:78/255.0 green:161/255.0 blue:255/255.0 alpha:1]];
//    [[UITableViewCell appearance] setBackgroundColor:[UIColor colorWithRed:155/255.0 green:189/255.0 blue:249/255.0 alpha:1]];
//    [[UITableView appearance] setBackgroundColor:[UIColor colorWithRed:155/255.0 green:189/255.0 blue:249/255.0 alpha:1]];


    
//    [[UIDatePicker appearance] setBackgroundColor:[UIColor grayColor]];
}

@end
