//
//  AddViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AddViewController.h"
#import "ListViewController.h"
#import "InterestingFactCell.h"
#import "PersonNameCell.h"
#import "PhotoCell.h"
#import "HomeCell.h"
#import "MajorCell.h"
#import "BirthDateCell.h"
#import "BirthPlaceCell.h"
#import "LocationCell.h"
#import "EmailCell.h"
#import "PhoneNumberCell.h"
#import "PhysicalAttributeCell.h"

typedef NS_ENUM(NSInteger, ContactAttribute) {
    ContactAttributeBirthDate = 0,
    ContactAttributeMajorText,
    ContactAttributeLocation,
    ContactAttributeInterestingFact,
    ContactAttributeName,
    ContactAttributePhoto,
    ContactAttributeHome,
    ContactAttributeBirthPlace,
    ContactAttributeEmail,
    ContactAttributePhoneNumber,
    ContactAttributePhysicalAttribute
};

@interface AddViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Group *template;

@property (strong, nonatomic) NSMutableArray *attributes;

@property (strong, nonatomic) NSString *nameOfPerson;
@property (strong, nonatomic) NSDate *birthDate;
@property (strong, nonatomic) NSString *major;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *interestingFact;
@property (strong, nonatomic) NSData *photo;
@property (strong, nonatomic) NSString *home;
@property (strong, nonatomic) NSString *birthPlace;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *physicalAttribute;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attributes = [NSMutableArray new];
    
    [self.attributes addObject:@(ContactAttributeName)];
    
    if (self.template.interestingFact.boolValue) {
        [self.attributes addObject:@(ContactAttributeInterestingFact)];
    }
    if (self.template.photo.boolValue) {
        [self.attributes addObject:@(ContactAttributePhoto)];
    }
    if (self.template.major.boolValue) {
        [self.attributes addObject:@(ContactAttributeMajorText)];
    }
    if (self.template.home.boolValue) {
        [self.attributes addObject:@(ContactAttributeHome)];
    }
    if (self.template.birthdate.boolValue) {
        [self.attributes addObject:@(ContactAttributeBirthDate)];
    }
    if (self.template.birthplace.boolValue) {
        [self.attributes addObject:@(ContactAttributeBirthPlace)];
    }
    if (self.template.location.boolValue) {
        [self.attributes addObject:@(ContactAttributeLocation)];
    }
    if (self.template.email.boolValue) {
        [self.attributes addObject:@(ContactAttributeEmail)];
    }
    if (self.template.physicalAttribute.boolValue) {
        [self.attributes addObject:@(ContactAttributePhysicalAttribute)];
    }
    if (self.template.phoneNumber.boolValue) {
        [self.attributes addObject:@(ContactAttributePhoneNumber)];
    }

}

+ (AddViewController *) sharedInstance {
    static AddViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AddViewController new];
    });
    return sharedInstance;
}
- (void) updateViewWithCategory:(Group *)template {
    self.template = template;
}

- (IBAction)saveButton:(id)sender {
    // TODO: get the photo to save correctly, the datepicker to save, and check on what to do with phone number.
    
    [[PersonController sharedInstance] createPersonWithName:self.nameOfPerson
                                                 birthPlace:self.birthPlace
                                                  birthDate:self.birthDate
                                            interestingFact:self.interestingFact
                                                      email:self.email
                                          physicalAttribute:self.physicalAttribute
                                                      photo:self.photo
                                                      major:self.major
                                                phoneNumber:self.phoneNumber
                                                       home:self.home
                                                   location:self.location];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([self.attributes[indexPath.row] integerValue]) {
        case ContactAttributeInterestingFact:
            NSLog(@"Was interesting fact");
            return [self cellForInterestingFact];
            break;
            
        case ContactAttributeName:
            NSLog(@"You have a name");
            return [self cellForPersonsName];
            break;
            
        case ContactAttributePhoto:
            return [self cellForPhoto];
            break;
            
        case ContactAttributeMajorText:
            return [self cellforMajor];
            break;
            
        case ContactAttributeHome:
            return [self cellForHome];
            break;
            
        case ContactAttributeBirthPlace:
            return [self cellforBirthPlace];
            break;
            
        case ContactAttributeBirthDate:
            return [self cellForBirthDate];
            break;
            
        case ContactAttributeLocation:
            return [self cellForLocation];
            break;
            
        case ContactAttributePhoneNumber:
            return [self cellforPhoneNumber];
            break;
        
        case ContactAttributePhysicalAttribute:
            return [self cellForPhysicalAttribute];
            break;
            
        case ContactAttributeEmail:
            return [self cellForEmail];
            break;
            
        default: NSLog(@"didn't find one");
            return nil;
    }
}

#define WeakSelf __weak typeof(self) weakSelf = self;

- (UITableViewCell *)cellForInterestingFact {
    InterestingFactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"InterestingFact"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.interestingFact = text;
    };
    return cell;
}
- (UITableViewCell *)cellForPersonsName {
    PersonNameCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.nameOfPerson = text;
    };
    return cell;
}
- (UITableViewCell *)cellForPhoto {
    PhotoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
    WeakSelf
    cell.didChangePhoto = ^(NSData *data) {
        self.photo = data;
    };
    return cell;
}
- (UITableViewCell *)cellForHome {
    HomeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.home = text;
    };
    return cell;
}

- (UITableViewCell *)cellforMajor {
    MajorCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MajorCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.major = text;
    };
    return cell;
}

- (UITableViewCell *)cellForBirthDate {
    BirthDateCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthDateCell"];
    WeakSelf
    cell.didChangeDate = ^(NSDate *date) {
        self.birthDate = date;
    };
    return cell;
}

- (UITableViewCell *)cellforBirthPlace {
    BirthPlaceCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthPlaceCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.birthPlace = text;
    };
    return cell;
}
- (UITableViewCell *)cellForLocation {
    LocationCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.location = text;
    };
    return cell;
}

- (UITableViewCell *)cellForEmail {
    EmailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"EmailCell"];
    WeakSelf
    cell.didChangeText = ^(NSString *text) {
        self.email = text;
    };
    return cell;
}
- (UITableViewCell *)cellForPhysicalAttribute {
    PhysicalAttributeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhysicallAttributeCell"];
    WeakSelf
    cell.didChangeText = ^(NSString * text) {
        self.physicalAttribute = text;
    };
    return cell;
}

- (UITableViewCell *)cellforPhoneNumber {
    PhoneNumberCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhoneNumberCell"];
    WeakSelf
    cell.didChangeText= ^(NSString *text) {
        self.phoneNumber = text;
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch ([self.attributes[indexPath.row] integerValue]) {
        case ContactAttributeInterestingFact:
            return 44;
            break;
        case ContactAttributeName:
            return 44;
            break;
        case ContactAttributeMajorText:
            return 44;
            break;
        case ContactAttributePhoto:
            return 111;
            break;
        case ContactAttributeHome:
            return 44;
            break;
        case ContactAttributeBirthDate:
            return 161;
            break;
        case ContactAttributeBirthPlace:
            return 44;
            break;
        case ContactAttributeLocation:
            return 44;
            break;
        case ContactAttributeEmail:
            return 44;
            break;
        case ContactAttributePhoneNumber:
            return 44;
            break;
        case ContactAttributePhysicalAttribute:
            return 44;
            break;
        default:
            NSLog(@"didn't find one");
            return 44;
    }

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.attributes.count;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
