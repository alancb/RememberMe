//
//  CategoryViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryViewController.h"
#import "StorePurchaseController.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>


@property (assign, nonatomic) BOOL inAppPurchaseUnlocked;

@property (strong, nonatomic) IBOutlet UITableView *categoryListTableView;
@property (strong ,nonatomic) Group *noGroup;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.inAppPurchaseUnlocked == YES) {
        self.navigationController.toolbarHidden = NO;
    }
    
    [[CategoryController sharedInstance] checkAndCreateDefaultGroup];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.categoryListTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.inAppPurchaseUnlocked == YES) {
        return [self groupCell:indexPath];
    } else {
        if (indexPath.row < [CategoryController sharedInstance].groups.count) {
            return [self groupCell:indexPath];
        } else if (indexPath.row < [CategoryController sharedInstance].groups.count + 1) {
            return [self inAppPurchaseCell];
        } else {
            return nil;
        }
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
    return [CategoryController sharedInstance].groups.count + 1;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Group *group = [CategoryController sharedInstance].groups[indexPath.row];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Delete Category" message:@"Deleting this category will delete all the people associated with it!" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [[CategoryController sharedInstance] deleteGroup:group];
        }]];
        [tableView reloadData];
    }
}

#pragma mark - In-App Purchase Notifications

- (void) registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inAppPurchaseEnabled) name: kInAppPurchaseCompletedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inAppPurchaseEnabled) name:kInAppPurchaseRestoredNotification object:nil];
}

- (void)inAppPurchaseEnabled {
    self.inAppPurchaseUnlocked = YES;
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
