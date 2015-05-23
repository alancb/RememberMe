//
//  Person.h
//  RememberMe
//
//  Created by Alan Barth on 5/23/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Group;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSDate * birthdate;
@property (nonatomic, retain) NSString * birthplace;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * home;
@property (nonatomic, retain) NSString * interestingFact;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * major;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSString * physicalAttribute;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) Group *group;

@end
