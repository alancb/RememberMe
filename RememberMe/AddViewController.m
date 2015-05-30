//
//  AddViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AddViewController.h"
#import "ListViewTableViewController.h"
#import "PhotoCell.h"

#import "BirthDateCell.h"

#import "TextFieldCell.h"
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, ContactAttribute) {
    ContactAttributeBirthDate = 0,
    ContactAttributeMajorText,
    ContactAttributeLocation,
    ContactAttributeInterestingFact,
    ContactAttributeName,
 //   ContactAttributePhoto,
    ContactAttributeHome,
    ContactAttributeBirthPlace,
    ContactAttributeEmail,
    ContactAttributePhoneNumber,
    ContactAttributePhysicalAttribute,
  //  ContactAttributeLastName,
    ContactAttributeWhen,
    ContactAttributeNotes,
    ContactAttributeOccupation,
    ContactAttributeHobbies
};

@interface AddViewController () <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PhotoCellDelegate>

@property (strong, nonatomic) Group *template;
@property (strong, nonatomic) Person *person;

@property (strong, nonatomic) NSMutableArray *attributes;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (strong, nonatomic) NSString *nameOfPerson;
@property (strong, nonatomic) NSString *lastName;
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
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSDate *when;
@property (strong, nonatomic) NSString *occupation;
@property (strong, nonatomic) NSString *hobbies;


@property (strong, nonatomic) NSString *photoPath;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attributes = [NSMutableArray new];
    
    [self.attributes addObject:@(ContactAttributeName)];
 //   [self.attributes addObject:@(ContactAttributeLastName)];
 //   [self.attributes addObject:@(ContactAttributePhoto)];
    if (self.template.location.boolValue) {
        [self.attributes addObject:@(ContactAttributeLocation)];
    }
    if (self.template.when.boolValue) {
        [self.attributes addObject:@(ContactAttributeWhen)];
    }
    if (self.template.occupation.boolValue) {
        [self.attributes addObject:@(ContactAttributeOccupation)];
    }
    if (self.template.major.boolValue) {
        [self.attributes addObject:@(ContactAttributeMajorText)];
    }
    if (self.template.phoneNumber.boolValue) {
        [self.attributes addObject:@(ContactAttributePhoneNumber)];
    }
    if (self.template.email.boolValue) {
        [self.attributes addObject:@(ContactAttributeEmail)];
    }
    if (self.template.home.boolValue) {
        [self.attributes addObject:@(ContactAttributeHome)];
    }
    if (self.template.physicalAttribute.boolValue) {
        [self.attributes addObject:@(ContactAttributePhysicalAttribute)];
    }
    if (self.template.birthdate.boolValue) {
        [self.attributes addObject:@(ContactAttributeBirthDate)];
    }
    if (self.template.birthplace.boolValue) {
        [self.attributes addObject:@(ContactAttributeBirthPlace)];
    }
    if (self.template.interestingFact.boolValue) {
        [self.attributes addObject:@(ContactAttributeInterestingFact)];
    }
    if (self.template.hobbies.boolValue) {
        [self.attributes addObject:@(ContactAttributeHobbies)];
    }
    if (self.template.notes.boolValue) {
        [self.attributes addObject:@(ContactAttributeNotes)];
    }
}

- (void) updateViewWithCategory:(Group *)template {
    self.template = template;
}

- (void) updateWithPerson:(Person *)person andGroup:(Group *)group{
    self.person = person;
    self.template = group;
}

- (IBAction)saveButton:(id)sender {
    if (self.person) {
//        if (self.person.name != self.nameOfPerson) {
//            self.person.name = self.nameOfPerson;
//        } else {
//            self.nameOfPerson = self.person.name;
//        }
        self.person.name = self.nameOfPerson;
        self.person.photo = self.photoPath;
        self.person.birthplace = self.birthPlace;
        self.person.birthdate = self.birthDate;
        self.person.interestingFact = self.interestingFact;
        self.person.email = self.email;
        self.person.physicalAttribute = self.physicalAttribute;
        self.person.major = self.major;
        self.person.phoneNumber = self.phoneNumber;
        self.person.home = self.home;
        self.person.location = self.location;
        self.person.lastName = self.lastName;
        self.person.hobbies = self.hobbies;
        self.person.notes = self.notes;
        self.person.when = self.when;
        self.person.occupation = self.occupation;
        [[PersonController sharedInstance] saveToPersistentStorage];
    } else {
        [[PersonController sharedInstance] createPersonWithName:self.nameOfPerson
                                                     birthPlace:self.birthPlace
                                                      birthDate:self.birthDate
                                                interestingFact:self.interestingFact
                                                          email:self.email
                                              physicalAttribute:self.physicalAttribute
                                                          photo:self.photoPath
                                                          major:self.major
                                                    phoneNumber:self.phoneNumber
                                                           home:self.home
                                                       location:self.location
                                                       lastName:self.lastName
                                                           when:self.when
                                                     occupation:self.occupation
                                                        hobbies:self.hobbies
                                                          notes:self.notes
                                                          group:self.template];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark TableView DataSource

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([self.attributes[indexPath.row] integerValue]) {
        case ContactAttributeInterestingFact:
            return [self cellForInterestingFact];
            break;
            
        case ContactAttributeName:
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
            
        case ContactAttributeWhen:
            return [self cellForWhen];
            break;
            
        case ContactAttributeNotes:
            return [self cellForNotes];
            break;
            
        case ContactAttributeOccupation:
            return [self cellForOccupation];
            break;
            
        case ContactAttributeHobbies:
            return [self cellForHobbies];
            break;
            
        default: NSLog(@"didn't find one");
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.attributes.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([self.attributes[indexPath.row] integerValue]) {
        case ContactAttributeInterestingFact:
            return 60;
            break;
        case ContactAttributeName:
            return 120;
            break;
        case ContactAttributeMajorText:
            return 60;
            break;
        case ContactAttributeHome:
            return 60;
            break;
        case ContactAttributeBirthDate:
            return 224;
            break;
        case ContactAttributeBirthPlace:
            return 60;
            break;
        case ContactAttributeLocation:
            return 60;
            break;
        case ContactAttributeEmail:
            return 60;
            break;
        case ContactAttributePhoneNumber:
            return 60;
            break;
        case ContactAttributePhysicalAttribute:
            return 60;
            break;
        case ContactAttributeNotes:
            return 60;
            break;
        case ContactAttributeOccupation:
            return 60;
            break;
        case ContactAttributeHobbies:
            return 60;
            break;
        case ContactAttributeWhen:
            return 224;
            break;
        default:
            NSLog(@"didn't find one");
            return 44;
    }
}

#pragma mark Custom Cells

- (UITableViewCell *)cellForPhoto {
    PhotoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
    cell.delegate = self;
    
    //First Name stuff
    cell.didChangeText = ^(NSString *text) {
        self.nameOfPerson = text;
    };
    if (self.person.name) {
        cell.firstNameField.text = self.person.name;
        self.nameOfPerson = self.person.name;
    } else {
        cell.firstNameField.text = nil;
    }
    
    //Last Name stuff
    cell.didChangeLastNameText = ^(NSString *text) {
        self.lastName = text;
    };
    if (self.person.lastName) {
        cell.lastNameField.text = self.person.lastName;
        self.lastName = self.person.lastName;
    } else {
        cell.lastNameField.text = nil;
    }
    
    //Photo Stuff
    
    UIImage *profileImage;
    if (self.person.photo) {
        profileImage = [UIImage imageWithContentsOfFile:[self documentsPathForFileName:self.person.photo]];
        
    } else {
        [cell.button setTitle:@"Add Photo" forState:UIControlStateNormal];
        profileImage = [UIImage imageWithData:self.photo];
    }
    
    [cell.button setImage:profileImage forState:UIControlStateNormal];

    [cell.button setBackgroundColor:[UIColor colorWithRed:137/255.0 green:144/255.0 blue:159/255.0 alpha:1]];
    return cell;
}

- (UITableViewCell *)cellForBirthDate {
    BirthDateCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthDateCell"];
    cell.didChangeDate = ^(NSDate *date) {
        self.birthDate = date;
    };
    cell.label.text = @"When were they born?";
    if (self.person.birthdate) {
        cell.datePicker.date = self.person.birthdate;
        self.birthDate = self.person.birthdate;
    } else {
        cell.datePicker.date = [NSDate date];
    }
    return cell;
}

-(UITableViewCell *)cellForWhen {
    BirthDateCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthDateCell"];
    cell.didChangeDate = ^(NSDate *date) {
        self.when = date;
    };
    cell.label.text = @"When did you meet them?";
    if (self.person.when) {
        cell.datePicker.date = self.person.when;
        self.when = self.person.when;
    } else {
        cell.datePicker.date = [NSDate date];
    }
    return cell;
}

- (UITableViewCell *)cellForHome {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.home = text;
    };
    cell.textField.placeholder = @"Where do they live?";
    cell.label.text = @"Current Residence:";
    if (self.person.home) {
        cell.textField.text = self.person.home;
        self.home = self.person.home;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellForInterestingFact {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.interestingFact = text;
    };
    cell.textField.placeholder = @"What is an interesting fact about them?";
    cell.label.text = @"Interesting Fact:";
    if (self.person.interestingFact) {
        cell.textField.text = self.person.interestingFact;
        self.interestingFact = self.person.interestingFact;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellforMajor {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.major = text;
    };
    cell.textField.placeholder = @"What is their major?";
    cell.label.text = @"Major:";
    if (self.person.major) {
        cell.textField.text = self.person.major;
        self.major = self.person.major;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellforBirthPlace {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.birthPlace = text;
    };
    cell.textField.placeholder = @"Where were they born?";
    cell.label.text = @"Home Town:";
    if (self.person.birthplace) {
        cell.textField.text = self.person.birthplace;
        self.birthPlace = self.person.birthplace;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}
- (UITableViewCell *)cellForLocation {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.location = text;
    };
    cell.textField.placeholder = @"Where did you meet them?";
    cell.label.text = @"Meeting Location:";
    if (self.person.location) {
        cell.textField.text = self.person.location;
        self.location = self.person.location;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellForEmail {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.email = text;
    };
    cell.textField.placeholder = @"What is their email?";
    cell.label.text = @"Email:";
    cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
    if (self.person.email) {
        cell.textField.text = self.person.email;
        self.email = self.person.email;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}
- (UITableViewCell *)cellForPhysicalAttribute {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString * text) {
        self.physicalAttribute = text;
    };
    cell.textField.placeholder = @"What is a physical attribute?";
    cell.label.text = @"Physical Attribute:";
    if (self.person.physicalAttribute) {
        cell.textField.text = self.person.physicalAttribute;
        self.physicalAttribute = self.person.physicalAttribute;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellforPhoneNumber {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText= ^(NSString *text) {
        self.phoneNumber = text;
    };
    cell.textField.placeholder = @"What is their phoneNumber?";
    cell.label.text = @"Phone Number:";
    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
    if (self.person.phoneNumber) {
        cell.textField.text = self.person.phoneNumber;
        self.phoneNumber = self.person.phoneNumber;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

- (UITableViewCell *)cellForNotes {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.notes = text;
    };
    cell.textField.placeholder = @"Notes about the person";
    cell.label.text = @"Notes:";
    if (self.person.notes) {
        cell.textField.text = self.person.notes;
        self.notes = self.person.notes;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

-(UITableViewCell *) cellForOccupation {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.occupation = text;
    };
    cell.textField.placeholder = @"What is their occupation?";
    cell.label.text = @"Occupation:";
    if (self.person.occupation) {
        cell.textField.text = self.person.occupation;
        self.occupation = self.person.occupation;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}

-(UITableViewCell *)cellForHobbies {
    TextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
    cell.didChangeText = ^(NSString *text) {
        self.hobbies = text;
    };
    cell.textField.placeholder = @"What is one of their hobbies?";
    cell.label.text = @"Hobby";
    if (self.person.hobbies) {
        cell.textField.text = self.person.hobbies;
        self.hobbies = self.person.hobbies;
    } else {
        cell.textField.text = nil;
    }
    return cell;
}
#pragma mark Photo Stuff

- (void)photoCellButtonTapped {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    UIAlertController *photoActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraRollAction = [UIAlertAction actionWithTitle:@"From Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    [photoActionSheet addAction:cameraRollAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [photoActionSheet addAction:cancelAction];
    
    UIAlertAction *takePictureAction = [UIAlertAction actionWithTitle:@"Take Picture" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            imagePicker.allowsEditing = YES;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Not Available on Device" message:@"This device does not have a camera option. Please choose photo from library." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:dismissAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    [photoActionSheet addAction:takePictureAction];
    
    [self presentViewController:photoActionSheet animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.photo = UIImageJPEGRepresentation(image, 0.8);
    
    [self.tableView reloadData];
    
    NSDate *currentDate = [NSDate date];
    NSString *name= [NSString stringWithFormat:@"%@", currentDate];
    self.photoPath = name;
    
    [self.photo writeToFile:[self documentsPathForFileName:name] atomically:YES];
}

- (NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:name];
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
