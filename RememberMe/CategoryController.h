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
                     birthPlace:(BOOL)birthplace
                      birthDate:(BOOL)birthDate
                interestingFact:(BOOL)interestingFact
                          email:(BOOL)email
              phsyicalAttribute:(BOOL)physicalAttribute
                          major:(BOOL)major
                    phoneNumber:(BOOL)phoneNumber
                           home:(BOOL)home
                       location:(BOOL)location
                           when:(BOOL)when
                        hobbies:(BOOL)hobbies
                           note:(BOOL)notes
                     occupation:(BOOL)occupation;
-(void) deleteGroup:(Group *) group;
- (void)gatherGroups;
- (void)checkAndCreateDefaultGroup;

@end
