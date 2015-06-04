//
//  CategoryController.m
//  RememberMe
//
//  Created by Alan Barth on 5/14/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryController.h"
#import "Stack.h"

@implementation CategoryController

+ (CategoryController *) sharedInstance {
    static CategoryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CategoryController new];
    });
    return sharedInstance;
}

#pragma mark Core Data methods

// Puts into ManagesObjectContext, then saves down
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
                      occupation:(BOOL)occupation {
    Group *group = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    group.groupName = name;

    group.birthplace = @(birthplace);
    group.birthdate = @(birthDate);
    group.interestingFact = @(interestingFact);
    group.email = @(email);
    group.physicalAttribute = @(physicalAttribute);
    group.major = @(major);
    group.phoneNumber = @(phoneNumber);
    group.home = @(home);
    group.location = @(location);
    group.when = @(when);
    group.hobbies = @(hobbies);
    group.notes = @(notes);
    group.occupation = @(occupation);

    [self saveToPersistentStorage];
    return group;
}

// Saves down to core data
- (void) saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

//Fetches the data from Core Date
- (NSArray *) groups {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Group"];
    NSArray *fetchObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchObjects;
}

// Deletes Person
-(void) deleteEntry:(Group *) group {
    [group.managedObjectContext deleteObject:group];
    [self saveToPersistentStorage];
}


@end
