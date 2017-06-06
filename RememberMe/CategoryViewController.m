//
//  CategoryViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryViewController.h"
//#import "StorePurchaseController.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>


@property (assign, nonatomic) BOOL inAppPurchaseUnlocked;

@property (strong, nonatomic) IBOutlet UITableView *categoryListTableView;
@property (strong ,nonatomic) Group *noGroup;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[CategoryController sharedInstance] checkAndCreateDefaultGroup];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.categoryListTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < [CategoryController sharedInstance].groups.count) {
        return [self groupCell:indexPath];
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

//-(UITableViewCell *) inAppPurchaseCell {
//    inAppPurchaseCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"inAppPurchaseCell"];
//    return cell;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CategoryController sharedInstance].groups.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Delete this category" message:@"Deleting this category will delete all people associated with it!" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Delete!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        Group *group = [CategoryController sharedInstance].groups[indexPath.row];
        [[CategoryController sharedInstance] deleteGroup:group];
        [tableView reloadData];
        NSLog(@"I was deleted");
    }]];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        Group *group = [CategoryController sharedInstance].groups[indexPath.row];
//        [[CategoryController sharedInstance] deleteGroup:group];
//        [tableView reloadData];

        [self presentViewController:alert animated:YES completion:nil];

    }
    

}
#pragma mark - In-App Purchase Notifications

//- (void) registerForNotifications {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inAppPurchaseEnabled) name: kInAppPurchaseCompletedNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inAppPurchaseEnabled) name:kInAppPurchaseRestoredNotification object:nil];
//}

//- (void)inAppPurchaseEnabled {
//    self.inAppPurchaseUnlocked = YES;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

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
