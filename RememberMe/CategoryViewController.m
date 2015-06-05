//
//  CategoryViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>

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
@property (assign, nonatomic) BOOL thereisANoCategory;

@property (strong, nonatomic) IBOutlet UITableView *categoryListTableView;
@property (strong ,nonatomic) Group *noGroup;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.nameField = @"No Category";
    self.navigationController.toolbarHidden = NO;
    
    NSArray *groups = [CategoryController sharedInstance].groups;

    for (Group *group in groups) {
        if (group.groupName == self.nameField) {
            self.thereisANoCategory = YES;
        } else {
            self.thereisANoCategory = NO;
        }
    }
    if (self.thereisANoCategory == NO) {
       self.noGroup = [[CategoryController sharedInstance] createGroupWithName:self.nameField birthPlace:self.birthPlace birthDate:self.birthDate interestingFact:self.interestingFact email:self.email phsyicalAttribute:self.physicalAttribute major:self.major phoneNumber:self.phoneNumber home:self.home location:self.location when:self.when hobbies:self.hobbies note:self.notes occupation:self.occupation];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [self.categoryListTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [CategoryController sharedInstance].groups.count - 1) {
        return [self groupCell:indexPath];
    } else if (indexPath.row < [CategoryController sharedInstance].groups.count) {
        return [self inAppPurchaseCell];
    } else {
        return nil;
    }
}

-(UITableViewCell *) groupCell:(NSIndexPath *) indexPath{
    Group *group = [CategoryController sharedInstance].groups [indexPath.row];
    GroupCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"categoryCell"];
    cell.textLabel.text = group.groupName;
    return cell;
}

-(UITableViewCell *) inAppPurchaseCell {
    inAppPurchaseCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"inAppPurchaseCell"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CategoryController sharedInstance].groups.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Group *group = [CategoryController sharedInstance].groups[indexPath.row];
        [[CategoryController sharedInstance] deleteEntry:group];
        [tableView reloadData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPersonFromCategory"]) {
        
        AddViewController *addView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.categoryListTableView indexPathForCell:sender];

        [addView updateViewWithCategory:[CategoryController sharedInstance].groups [indexPath.row]];

    }
    if ([segue.identifier isEqualToString:@"noCategoryToPerson"]) {

        AddViewController *addView = segue.destinationViewController;
        [addView updateViewWithCategory:self.noGroup];
    }
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
