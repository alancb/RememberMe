//
//  CategoryOptionsViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryOptionsViewController.h"



@interface CategoryOptionsViewController () <UITextFieldDelegate, UITableViewDataSource, SwitchCellDelegate>


@property (strong, nonatomic) UISwitch* birthPlaceSwitch;
@property (strong, nonatomic) UISwitch* birthDateSwitch;
@property (strong, nonatomic) UISwitch* interestingFactSwitch;
@property (strong, nonatomic) UISwitch* emailSwitch;
@property (strong, nonatomic) UISwitch* physicalAttributeSwitch;
@property (strong, nonatomic) UISwitch* majorSwitch;
@property (strong, nonatomic) UISwitch* phoneNumberSwitch;
@property (strong, nonatomic) UISwitch* homeSwitch;
@property (strong, nonatomic) UISwitch* locationSwitch;
@property (strong, nonatomic) UISwitch* whenSwitch;
@property (strong, nonatomic) UISwitch* hobbiesSwitch;
@property (strong, nonatomic) UISwitch* notesSwitch;
@property (strong, nonatomic) UISwitch* occupationSwitch;
@property (strong, nonatomic) NSString *nameField;




@end

@implementation CategoryOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
  //  if (self.nameField.text && self.nameField.text.length > 0) {
        [[CategoryController sharedInstance] createGroupWithName:self.nameField
                                                      birthPlace:self.birthPlaceSwitch
                                                       birthDate:self.birthDateSwitch
                                                 interestingFact:self.interestingFactSwitch
                                                           email:self.emailSwitch
                                               phsyicalAttribute:self.physicalAttributeSwitch
                                                           major:self.majorSwitch
                                                     phoneNumber:self.phoneNumberSwitch
                                                            home:self.homeSwitch
                                                        location:self.locationSwitch
                                                            when:self.whenSwitch
                                                         hobbies:self.hobbiesSwitch
                                                            note:self.notesSwitch
                                                      occupation:self.occupationSwitch];
        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//else {
//        // TODO: Add popup to tell them to enter a name.
//    }
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
            cell.Label.text = @"Their BirthDate";
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
            self.locationSwitch = toggle;
            break;
        case 1:
            self.whenSwitch = toggle;
            break;
        case 2:
            self.occupationSwitch = toggle;
            break;
        case 3:
            self.majorSwitch = toggle;
            break;
        case 4:
            self.phoneNumberSwitch = toggle;
            break;
        case 5:
            self.emailSwitch = toggle;
            break;
        case 6:
            self.homeSwitch = toggle;
            break;
        case 7:
            self.physicalAttributeSwitch = toggle;
            break;
        case 8:
            self.birthDateSwitch = toggle;
            break;
        case 9:
            self.birthPlaceSwitch = toggle;
            break;
        case 10:
            self.interestingFactSwitch = toggle;
            break;
        case 11:
            self.hobbiesSwitch = toggle;
            break;
        case 12:
            self.notesSwitch = toggle;
            break;

        default:
            break;
    }
    
}





@end
