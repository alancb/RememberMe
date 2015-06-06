//
//  CategoryController.m
//  RememberMe
//
//  Created by Alan Barth on 5/14/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryController.h"
#import "Stack.h"

@interface CategoryController()

@property (nonatomic, strong) NSArray *groups;

@end

@implementation CategoryController

+ (CategoryController *) sharedInstance {
    static CategoryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CategoryController new];
        [sharedInstance gatherGroups];
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
    [self gatherGroups];
    return group;
}

// Saves down to core data
- (void) saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

//Fetches the data from Core Date
- (void)gatherGroups {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Group"];
    NSArray *fetchObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    self.groups = fetchObjects;
}

- (void)checkAndCreateDefaultGroup {
    if (self.groups.count == 0) {
        [self createGroupWithName:@"No Category" birthPlace:YES birthDate:YES interestingFact:YES email:YES phsyicalAttribute:YES major:YES phoneNumber:YES home:YES location:YES when:YES hobbies:YES note:YES occupation:YES];
        [self gatherGroups];
        // Create the default groups and save it to Core Date and update the groups ([self gatherGroups])
    }
}

// Deletes Group
-(void) deleteGroup:(Group *) group {
    [group.managedObjectContext deleteObject:group];
    [self saveToPersistentStorage];
}


@end
