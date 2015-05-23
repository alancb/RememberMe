//
//  ListViewTableViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "ListViewTableViewController.h"
#import "AddViewController.h"
#import "PersonController.h"

@interface ListViewTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *listViewTableView;

@end

@implementation ListViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.listViewTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Person *person = [PersonController sharedInstance].people[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.name, person.lastName];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PersonController sharedInstance].people.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPersonFromList"]) {
        AddViewController *addView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.listViewTableView indexPathForCell:sender];
        Person *person = [PersonController sharedInstance].people[indexPath.row];
        [addView updateWithPerson:person andGroup:person.group];
    }
}


@end
