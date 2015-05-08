//
//  Person.h
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * birthplace;
@property (nonatomic, retain) NSString * career;
@property (nonatomic, retain) NSString * interestingFact;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Person *category;

@end
