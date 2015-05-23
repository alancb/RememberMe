//
//  Group.h
//  RememberMe
//
//  Created by Alan Barth on 5/23/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSNumber * birthdate;
@property (nonatomic, retain) NSNumber * birthplace;
@property (nonatomic, retain) NSNumber * email;
@property (nonatomic, retain) NSString * groupName;
@property (nonatomic, retain) NSNumber * home;
@property (nonatomic, retain) NSNumber * interestingFact;
@property (nonatomic, retain) NSNumber * location;
@property (nonatomic, retain) NSNumber * major;
@property (nonatomic, retain) NSNumber * personName;
@property (nonatomic, retain) NSNumber * phoneNumber;
@property (nonatomic, retain) NSNumber * photo;
@property (nonatomic, retain) NSNumber * physicalAttribute;
@property (nonatomic, retain) NSNumber * lastName;
@property (nonatomic, retain) NSSet *people;
@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addPeopleObject:(Person *)value;
- (void)removePeopleObject:(Person *)value;
- (void)addPeople:(NSSet *)values;
- (void)removePeople:(NSSet *)values;

@end
