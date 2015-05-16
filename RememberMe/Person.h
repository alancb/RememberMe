//
//  Person.h
//  RememberMe
//
//  Created by Alan Barth on 5/14/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * birthplace;
@property (nonatomic, retain) NSString * major;
@property (nonatomic, retain) NSString * interestingFact;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * phoneNumber;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * home;
@property (nonatomic, retain) NSNumber * birthdate;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * physicalAttribute;
@property (nonatomic, retain) Person *category;

@end
