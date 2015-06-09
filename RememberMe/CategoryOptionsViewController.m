//
//  CategoryOptionsViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryOptionsViewController.h"

@interface CategoryOptionsViewController () <UITextFieldDelegate, UITableViewDataSource, SwitchCellDelegate>


@property (assign, nonatomic) BOOL birthPlace;
@property (assign, nonatomic) BOOL birthDate;
@property (assign, nonatomic) BOOL interestingFact;
@property (assign, nonatomic) BOOL email;
@property (assign, nonatomic) BOOL physicalAttribute;
@property (assign, nonatomic) BOOL major;
@property (assign, nonatomic) BOOL phoneNumber;
@property (assign, nonatomic) BOOL home;
@property (assign, nonatomic) BOOL location;
@property (assign, nonatomic) BOOL when;
@property (assign, nonatomic) BOOL hobbies;
@property (assign, nonatomic) BOOL notes;
@property (assign, nonatomic) BOOL occupation;
@property (strong, nonatomic) NSString *nameField;

@end

@implementation CategoryOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.birthPlace = YES;
    self.birthDate = YES;
    self.interestingFact = YES;
    self.email = YES;
    self.physicalAttribute = YES;
    self.phoneNumber = YES;
    self.home = YES;
    self.location = YES;
    self.when = YES;
    self.hobbies = YES;
    self.notes = YES;
    self.occupation = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    if (self.nameField.text.length == 0) {
//        self.saveButton.enabled = NO;
//    }
}
- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)saveButton:(id)sender {
    if (!self.nameField) {
        // alert for not having a name.
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Unable to save" message:@"Please enter a name for your category" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
    [[CategoryController sharedInstance] createGroupWithName:self.nameField
                                                  birthPlace:self.birthPlace
                                                   birthDate:self.birthDate
                                             interestingFact:self.interestingFact
                                                       email:self.email
                                           phsyicalAttribute:self.physicalAttribute
                                                       major:self.major
                                                 phoneNumber:self.phoneNumber
                                                        home:self.home
                                                    location:self.location
                                                        when:self.when
                                                     hobbies:self.hobbies
                                                        note:self.notes
                                                  occupation:self.occupation];
    [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 13;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"What is the name of the Category?";
    }
    if (section == 1) {
        return @"Select what attributes for the Category:";
    }
    else {
        return @"";
    }
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return [self cellForCategoryName];
    } else {
        return [self cellForSwitch:indexPath];
    }

}

- (UITableViewCell *) cellForCategoryName {
    CateogoryNameCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"nameCell"];
    cell.didChangeText = ^(NSString *text) {
        self.nameField = text;
    };

    
    return cell;
}

- (UITableViewCell *) cellForSwitch:(NSIndexPath *)indexPath {
    CategorySwitchCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"switchCell"];
    cell.delegate = self;
    switch (indexPath.row) {
        case 0:
            cell.Label.text = @"Where you met them";
            break;
        case 1:
            cell.Label.text = @"When you met them";
            break;
        case 2:
            cell.Label.text = @"Their Occupation";
            break;
        case 3:
            cell.Label.text = @"Their Major";
            break;
        case 4:
            cell.Label.text = @"Their Phone Number";
            break;
        case 5:
            cell.Label.text = @"Their Email";
            break;
        case 6:
            cell.Label.text = @"Where they live";
            break;
        case 7:
            cell.Label.text = @"A Unique Characteristic";
            break;
        case 8:
            cell.Label.text = @"Their Birth date";
            break;
        case 9:
            cell.Label.text = @"Where they were born";
            break;
        case 10:
            cell.Label.text = @"An Interesting Fact";
            break;
        case 11:
            cell.Label.text = @"Their Hobbies";
            break;
        case 12:
            cell.Label.text = @"Notes";
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)toggle:(UISwitch *)toggle toggledFromSender:(CategorySwitchCell *)sender {
    NSIndexPath *path = [self.tableView indexPathForCell:sender];
    switch (path.row) {
        case 0:
            self.location = toggle.on;
            break;
        case 1:
            self.when = toggle.on;
            break;
        case 2:
            self.occupation = toggle.on;
            break;
        case 3:
            self.major = toggle.on;
            break;
        case 4:
            self.phoneNumber = toggle.on;
            break;
        case 5:
            self.email = toggle.on;
            break;
        case 6:
            self.home = toggle.on;
            break;
        case 7:
            self.physicalAttribute = toggle.on;
            break;
        case 8:
            self.birthDate = toggle.on;
            break;
        case 9:
            self.birthPlace = toggle.on;
            break;
        case 10:
            self.interestingFact = toggle.on;
            break;
        case 11:
            self.hobbies = toggle.on;
            break;
        case 12:
            self.notes = toggle.on;
            break;

        default:
            break;
    }
    
}





@end
