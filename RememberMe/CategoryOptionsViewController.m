//
//  CategoryOptionsViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryOptionsViewController.h"

@interface CategoryOptionsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *birthPlaceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *birthDateSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *interestingFactSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *emailSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *physicalAttributeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *photoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *majorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *phoneNumberSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *homeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *hobbiesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *whenSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *occupationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *notesSwitch;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;


@end

@implementation CategoryOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.birthPlaceSwitch.thumbTintColor = [UIColor blueColor];
    if (self.nameField.text.length == 0) {
        self.doneButton.enabled = NO;
    }
}
- (IBAction)doneButton:(id)sender {
    if (self.nameField.text && self.nameField.text.length > 0) {
        [[CategoryController sharedInstance] createGroupWithName:self.nameField.text
                                                      birthPlace:self.birthPlaceSwitch
                                                       birthDate:self.birthDateSwitch
                                                 interestingFact:self.interestingFactSwitch
                                                           email:self.emailSwitch
                                               phsyicalAttribute:self.physicalAttributeSwitch
                                                           photo:self.photoSwitch
                                                           major:self.majorSwitch
                                                     phoneNumber:self.phoneNumberSwitch
                                                            home:self.homeSwitch
                                                        location:self.locationSwitch
                                                            when:self.whenSwitch
                                                         hobbies:self.hobbiesSwitch
                                                            note:self.notesSwitch
                                                      occupation:self.occupationSwitch];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        // TODO: Add popup to tell them to enter a name.
    }
}
- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.nameField.text.length >0 ) {
        self.doneButton.enabled = YES;
    } else {
        self.doneButton.enabled = NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell;
//    
//    if (indexPath.section == 0) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"categoryOptionsCell"];
//    }
//    else if (indexPath.section == 1)
//    {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"categoryOptionsCell2"];
//    }
//    return cell;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
