//
//  PersonController.h
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "AddViewController.h"
#import "ListViewController.h"
#import "SettingsViewController.h"


@interface PersonController : NSObject

+ (PersonController *) sharedInstance;

@end
