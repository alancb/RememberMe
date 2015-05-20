//
//  AddViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (weak, nonatomic) IBOutlet UITextField *birthplaceText;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *interestingFactText;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressText;
@property (weak, nonatomic) IBOutlet UITextField *physicallAttributeText;
@property (weak, nonatomic) IBOutlet UITextField *majorText;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumerText;
@property (weak, nonatomic) IBOutlet UITextField *homeText;
@property (weak, nonatomic) IBOutlet UITextField *locationText;

@property (weak, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *photoCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *birthPlaceCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *birthDateCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *interestingFactCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *emailCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *physicallAttributeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *majorCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *phoneNumberCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *homeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *locationCell;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateWithCategory:(NSString *)categoty {
    
}
- (void) updateViewWithCategory {
    Group *template = [CategoryController sharedInstance].groups;
    if (template.photo.boolValue == NO) {
        self.photoCell.hidden = YES;
    }
    if (template.birthplace.boolValue == NO) {
        self.birthPlaceCell.hidden = YES;
    }
    if (template.birthdate.boolValue == NO) {
        self.birthDateCell.hidden = YES;
    }
    if (template.interestingFact.boolValue == NO) {
        self.interestingFactCell.hidden = YES;
    }
    if (template.email.boolValue == NO) {
        self.emailCell.hidden = YES;
    }
    if (template.physicalAttribute.boolValue == NO) {
        self.physicallAttributeCell.hidden = YES;
    }
    if (template.major.boolValue == NO) {
        self.majorCell.hidden = YES;
    }
    if (template.phoneNumber.boolValue == NO) {
        self.phoneNumberCell.hidden = YES;
    }
    if (template.home.boolValue == NO) {
        self.homeCell.hidden = YES;
    }
    if (template.location.boolValue == NO) {
        self.locationCell.hidden = YES;
    }
}

- (IBAction)saveButton:(id)sender {
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *nameCell = [tableView dequeueReusableCellWithIdentifier:@"nameCell"];
//    UITableViewCell *photoCell = [tableView dequeueReusableCellWithIdentifier:@"photoCell"];
//    UITableViewCell *birthPlaceCell = [tableView dequeueReusableCellWithIdentifier:@"birthPlaceCell"];
//    UITableViewCell *birthDateCell = [tableView dequeueReusableCellWithIdentifier:@"birthDateCell"];
//    UITableViewCell *interestingFactCell = [tableView dequeueReusableCellWithIdentifier:@"interestingFactCell"];
//    UITableViewCell *emailCell = [tableView dequeueReusableCellWithIdentifier:@"emailCell"];
//    UITableViewCell *physicalAttributeCell = [tableView dequeueReusableCellWithIdentifier:@"physicalAttributeCell"];
//    UITableViewCell *majorCell = [tableView dequeueReusableCellWithIdentifier:@"majorCell"];
//    UITableViewCell *phoneNumberCell = [tableView dequeueReusableCellWithIdentifier:@"phoneNumberCell"];
//    UITableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
//    UITableViewCell *locationCell = [tableView dequeueReusableCellWithIdentifier:@"locationCell"];
//    
//    Group *template = [CategoryController sharedInstance].groups[indexPath.row];
//    if (template.photo.boolValue == YES) {
//        photoCell.hidden = YES;
//    }
//    if ([template.birthplace isEqualToNumber:0]) {
//        birthPlaceCell.hidden = YES;
//    }
//    if ([template.birthdate isEqualToNumber:0]) {
//        birthDateCell.hidden = YES;
//    }
//    if ([template.interestingFact isEqualToNumber:0]) {
//        interestingFactCell.hidden = YES;
//    }
//    if ([template.email isEqualToNumber:0]) {
//        emailCell.hidden = YES;
//    }
//    if ([template.physicalAttribute isEqualToNumber:0]) {
//        physicalAttributeCell.hidden = YES;
//    }
//    if ([template.major isEqualToNumber:0]) {
//        majorCell.hidden = YES;
//    }
//    if ([template.phoneNumber isEqualToNumber:0]) {
//        phoneNumberCell.hidden = YES;
//    }
//    if ([template.home isEqualToNumber:0]) {
//        homeCell.hidden = YES;
//    }
//    if ([template.location isEqualToNumber:0]) {
//        locationCell.hidden = YES;
//    }
//    
//    
//    return nameCell, photoCell, birthPlaceCell, birthDateCell, interestingFactCell, emailCell, physicalAttributeCell, majorCell, phoneNumberCell, homeCell,locationCell;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
