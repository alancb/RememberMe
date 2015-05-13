//
//  PersonController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PersonController.h"


@implementation PersonController

+ (PersonController *) sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PersonController new];
    });
    return sharedInstance;
}

#pragma mark Core Data methods

// Puts into ManagesObjectContext, then saves down
- (Person *) createPersonWithName: (NSString *)name {
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    person.name = name;
    // TODO: Add the other attributes to the method
    [self saveToPersistentStorage];
    
    return person;
    
}

// Saves down to core data
- (void) saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

//Fetches the data from Core Date
- (NSArray *) people {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSArray *fetchObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchObjects;
}

// Deletes Person
-(void) deleteEntry:(Person *) person {
    [person.managedObjectContext deleteObject:person];
}

@end
