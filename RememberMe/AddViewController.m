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

@property (strong, nonatomic) Group *template;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (AddViewController *) sharedInstance {
    static AddViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AddViewController new];
    });
    return sharedInstance;
}
- (void)updateWithCategory:(NSString *)categoty {
    
}
- (void) updateViewWithCategory:(Group *)template {

    self.template = template;
}

- (IBAction)saveButton:(id)sender {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            if (self.template.personName.boolValue == NO) {
                return 0;
            } else {
                return 30;
            }
            break;
        case 1:
            if (self.template.photo.boolValue == NO) {
                return 0;
            } else {
                return 85;
            }
            break;
        case 2:
            if (self.template.birthplace.boolValue == NO) {
                return 0;
            } else {
                return 30;
            }
            break;
        case 3:
            if (self.template.birthdate.boolValue == NO) {
                return 0;
            } else {
                return 202;
            }
            break;
        case 4:
            if (self.template.interestingFact.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 5:
            if (self.template.email.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 6:
            if (self.template.physicalAttribute.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 7:
            if (self.template.major.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 8:
            if (self.template.phoneNumber.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 9:
            if (self.template.home.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 10:
            if (self.template.location.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        default:
            return 35;
            break;
    }
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
    return 11;
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
