//
//  AddViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AddViewController.h"
#import "ListViewTableViewController.h"
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
#import "LastNameCell.h"

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
    ContactAttributePhysicalAttribute,
    ContactAttributeLastName
};

@interface AddViewController () <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, PhotoCellDelegate>

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

@property (strong, nonatomic) NSString *photoPath;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attributes = [NSMutableArray new];
    
    [self.attributes addObject:@(ContactAttributeName)];
    [self.attributes addObject:@(ContactAttributeLastName)];
    
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

- (void) updateViewWithCategory:(Group *)template {
    self.template = template;
}

- (void) updateWithPerson:(Person *)person andGroup:(Group *)group{
    self.person = person;
    self.template = group;
    
}

- (IBAction)saveButton:(id)sender {
    // TODO: get the photo to save correctly, the datepicker to save, and check on what to do with phone number.
    
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
                                                      group:self.template];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark TableView DataSource

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([self.attributes[indexPath.row] integerValue]) {
        case ContactAttributeInterestingFact:
            return [self cellForInterestingFact];
            break;
            
        case ContactAttributeName:
            return [self cellForPersonsName];
            break;
            
        case ContactAttributeLastName:
            return [self cellForLastName];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.attributes.count;
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
        case ContactAttributeLastName:
            return 44;
            break;
        default:
            NSLog(@"didn't find one");
            return 44;
    }
}

#pragma mark Custom Cells

- (UITableViewCell *)cellForInterestingFact {
    InterestingFactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"InterestingFact"];
    cell.didChangeText = ^(NSString *text) {
        NSLog(@"%@", text);
        self.interestingFact = text;
    };
    if (self.person.interestingFact) {
        cell.factField.text = self.person.interestingFact;
    }
    return cell;
}
- (UITableViewCell *)cellForPersonsName {
    PersonNameCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    cell.didChangeText = ^(NSString *text) {
        self.nameOfPerson = text;
    };
    if (self.person.name) {
        cell.nameTextField.text = self.person.name;
    }
    return cell;
}
- (UITableViewCell *)cellForLastName {
    LastNameCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"LastNameCell"];
    cell.didChangeText = ^(NSString *text) {
        self.lastName = text;
    };
    if (self.person.lastName) {
        cell.lastNameText.text = self.person.lastName;
    }
    return cell;
}
- (UITableViewCell *)cellForPhoto {
    PhotoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
    cell.delegate = self;
    cell.didChangePhoto = ^(NSData *data) {
        self.photo = data;
    };
// TODO: Set photo!
    return cell;
}
- (UITableViewCell *)cellForHome {
    HomeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    cell.didChangeText = ^(NSString *text) {
        self.home = text;
    };
    if (self.person.home) {
        cell.homeText.text = self.person.home;
    }
    return cell;
}

- (UITableViewCell *)cellforMajor {
    MajorCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MajorCell"];
    cell.didChangeText = ^(NSString *text) {
        self.major = text;
    };
    if (self.person.major) {
        cell.majorText.text = self.person.major;
    }
    return cell;
}

- (UITableViewCell *)cellForBirthDate {
    BirthDateCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthDateCell"];
    cell.didChangeDate = ^(NSDate *date) {
        self.birthDate = date;
    };
    if (self.person.birthdate) {
        cell.datePicker.date = self.person.birthdate;
    }
    return cell;
}

- (UITableViewCell *)cellforBirthPlace {
    BirthPlaceCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BirthPlaceCell"];
    cell.didChangeText = ^(NSString *text) {
        self.birthPlace = text;
    };
    if (self.person.birthplace) {
        cell.birthPlaceText.text = self.person.birthplace;
    }
    return cell;
}
- (UITableViewCell *)cellForLocation {
    LocationCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    cell.didChangeText = ^(NSString *text) {
        self.location = text;
    };
    if (self.person.location) {
        cell.locationText.text = self.person.location;
    }
    return cell;
}

- (UITableViewCell *)cellForEmail {
    EmailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"EmailCell"];
    cell.didChangeText = ^(NSString *text) {
        self.email = text;
    };
    if (self.person.email) {
        cell.emailText.text = self.person.email;
    }
    return cell;
}
- (UITableViewCell *)cellForPhysicalAttribute {
    PhysicalAttributeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhysicallAttributeCell"];
    cell.didChangeText = ^(NSString * text) {
        self.physicalAttribute = text;
    };
    if (self.person.physicalAttribute) {
        cell.physicalAttributeText.text = self.person.physicalAttribute;
    }
    return cell;
}

- (UITableViewCell *)cellforPhoneNumber {
    PhoneNumberCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhoneNumberCell"];
    cell.didChangeText= ^(NSString *text) {
        self.phoneNumber = text;
    };
    if (self.person.phoneNumber) {
        cell.phoneNumberText.text = self.person.phoneNumber;
    }
    return cell;
}

#pragma mark Photo Stuff

- (void)photoCellButtonTapped {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate.self;
    
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
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingString:name];
    [self.photo writeToFile:filePath atomically:YES];
    
    
    // make sure that the photo cell updates with the correct data (including the image)
    
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
