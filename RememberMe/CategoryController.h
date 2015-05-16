//
//  CategoryController.h
//  RememberMe
//
//  Created by Alan Barth on 5/14/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "CategoryOptionsViewController.h"
#import "CategoryViewController.h"

@interface CategoryController : NSObject

@property (strong, nonatomic, readonly) NSArray *groups;


+ (CategoryController *) sharedInstance;

- (Group *) createGroupWithName:(NSString *)name
                     birthPlace:(UISwitch *)birthplaceSwitch
                      birthDate:(UISwitch *)birthDateSwitch
                interestingFact:(UISwitch *)interestingFactSwitch
                          email:(UISwitch *)emailSwitch
              phsyicalAttribute:(UISwitch *)physicalAttributeSwitch
                          photo:(UISwitch *)photoSwitch
                          major:(UISwitch *)majorSwitch
                    phoneNumber:(UISwitch *)phoneNumberSwitch
                           home:(UISwitch *)homeSwitch
                       location:(UISwitch *)locationSwitch;

@end
