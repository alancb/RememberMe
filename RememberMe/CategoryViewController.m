//
//  CategoryViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *categoryListTableView;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.toolbarHidden = NO;

}

-(void)viewWillAppear:(BOOL)animated {
    [self.categoryListTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Group *group = [CategoryController sharedInstance].groups [indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell"];
    cell.textLabel.text = group.groupName;
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
