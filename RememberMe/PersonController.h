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
#import "ListViewTableViewController.h"
#import "Stack.h"


@interface PersonController : NSObject
@property (strong, nonatomic, readonly) NSArray *people;


+ (PersonController *) sharedInstance;

- (Person *) createPersonWithName:(NSString *)name
                       birthPlace:(NSString *)birthPlace
                        birthDate:(NSDate *)birthDate
                  interestingFact:(NSString *)interestingFact
                            email:(NSString *)email
                physicalAttribute:(NSString *)physicalAttribute
                            photo:(NSString *)photo
                            major:(NSString *)major
                      phoneNumber:(NSString *)phoneNumber
                             home:(NSString *)home
                         location:(NSString *)location
                         lastName:(NSString *)lastName
                             when:(NSDate *)when
                       occupation:(NSString *)occupation
                          hobbies:(NSString *)hobbies
                            notes:(NSString *)notes
                            group:(Group *)group ;

- (void) saveToPersistentStorage;
-(void) deletePerson:(Person *) person;


@end
