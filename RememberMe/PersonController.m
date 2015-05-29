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
                            group:(Group *)group {
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    if (name) {
        person.name = name;
    }
    if (lastName) {
        person.lastName = lastName;
    }
    if (birthPlace) {
        person.birthplace = birthPlace;
    }
    if (birthDate) {
        person.birthdate = birthDate;
    }
    if (interestingFact) {
        person.interestingFact = interestingFact;
    }
    if (email) {
        person.email = email;
    }
    if (physicalAttribute) {
        person.physicalAttribute = physicalAttribute;
    }
    if (photo) {
        person.photo = photo;
    }
    if (major) {
        person.major = major;
    }
    if (phoneNumber) {
        person.phoneNumber = phoneNumber;
    }
    if (location) {
        person.location = location;
    }
    if (when) {
        person.when = when;
    }
    if (hobbies) {
        person.hobbies = hobbies;
    }
    if (occupation) {
        person.occupation = occupation;
    }
    if (notes) {
        person.notes = notes;
    }
    if (group) {
        person.group = group;
    } else {
        NSLog(@"No Group");
    }

    [self saveToPersistentStorage];
    
    return person;
    
}

// Saves down to core data
- (void) saveToPersistentStorage {
    
    NSError *error;
    [[Stack sharedInstance].managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}

//Fetches the data from Core Date
- (NSArray *) people {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    fetchRequest.sortDescriptors  = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSArray *fetchObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchObjects;
}

// Deletes Person
-(void) deletePerson:(Person *) person {
    [person.managedObjectContext deleteObject:person];
    [self saveToPersistentStorage];
}

@end
