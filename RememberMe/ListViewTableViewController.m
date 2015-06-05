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
#import "ResultsTableViewController.h"
#import "PurchasedDataController.h"

@interface ListViewTableViewController () <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate>

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *filteredList;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;
@property (strong, nonatomic) ResultsTableViewController *resultsTableController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *storeButton;

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
    
    self.resultsTableController = [ResultsTableViewController new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.scopeButtonTitles = @[@"First Name", @"Last Name"];
    self.searchController.searchBar.delegate = self;
    
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.resultsTableController.tableView.delegate = self;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
}

-(void)viewWillAppear:(BOOL)animated {
    self.title = @"People List";
    [self.tableView reloadData];
}

#pragma mark - Search Controller Methods

- (NSFetchRequest *)searchFetchRequest
{
    if (_searchFetchRequest != nil)
    {
        return _searchFetchRequest;
    }
    
    _searchFetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    [_searchFetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [_searchFetchRequest setSortDescriptors:sortDescriptors];
    
    return _searchFetchRequest;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self searchForText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
    [self.resultsTableController.tableView reloadData];
}

- (void)searchForText:(NSString *)searchText scope:(NSInteger)scopeOption
{

        NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
        NSString *searchAttribute = @"name";
        
        if (scopeOption == 1)
        {
            searchAttribute = @"lastName";
        }
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
        [self.searchFetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        self.filteredList = [[Stack sharedInstance].managedObjectContext executeFetchRequest:self.searchFetchRequest error:&error];
    self.resultsTableController.filteredList = self.filteredList;
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark - UITableView DataSource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        Person *person = [PersonController sharedInstance].people[indexPath.row];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
        
    if (person.name.length > 0 && person.lastName.length) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.name, person.lastName];
    } else if (person.name.length > 0 && person.lastName.length == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",person.name];
    } else if (person.name.length == 0 && person.lastName.length > 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", person.lastName];
    }
    
        return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return [PersonController sharedInstance].people.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Person *person = [PersonController sharedInstance].people[indexPath.row];
        [[PersonController sharedInstance] deletePerson:person];
        [tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    self.searchFetchRequest = nil;
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPersonFromList"]) {
        AddViewController *addView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Person *person = [PersonController sharedInstance].people[indexPath.row];
        [addView updateWithPerson:person andGroup:person.group];
    }
    
    self.title = @"";

}


@end
