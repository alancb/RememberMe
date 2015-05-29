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
                      birthPlace:(UISwitch *)birthplaceSwitch
                       birthDate:(UISwitch *)birthDateSwitch
                 interestingFact:(UISwitch *)interestingFactSwitch
                           email:(UISwitch *)emailSwitch
               phsyicalAttribute:(UISwitch *)physicalAttributeSwitch
                           photo:(UISwitch *)photoSwitch
                           major:(UISwitch *)majorSwitch
                     phoneNumber:(UISwitch *)phoneNumberSwitch
                            home:(UISwitch *)homeSwitch
                        location:(UISwitch *)locationSwitch
                            when:(UISwitch *)whenSwitch
                         hobbies:(UISwitch *)hobbiesSwitch
                            note:(UISwitch *)notesSwitch
                      occupation:(UISwitch *)occupationSwitch {
    Group *group = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    group.groupName = name;
    if (birthplaceSwitch.on) {
        group.birthplace = @1;
    }
    if (birthDateSwitch.on) {
        group.birthdate = @1;
    }
    if (interestingFactSwitch.on) {
        group.interestingFact = @1;
    }
    if (emailSwitch.on) {
        group.email = @1;
    }
    if (physicalAttributeSwitch.on) {
        group.physicalAttribute = @1;
    }
    if (photoSwitch.on) {
        group.photo = @1;
    }
    if (majorSwitch.on) {
        group.major = @1;
    }
    if (phoneNumberSwitch.on) {
        group.phoneNumber = @1;
    }
    if (homeSwitch.on) {
        group.home = @1;
    }
    if (locationSwitch.on) {
        group.location = @1;
    }
    if (whenSwitch.on) {
        group.when = @1;
    }
    if (occupationSwitch.on) {
        group.occupation = @1;
    }
    if (notesSwitch.on) {
        group.notes = @1;
    }
    if (hobbiesSwitch.on) {
        group.hobbies = @1;
    }
    
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
}


@end
