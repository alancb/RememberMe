//
//  CategoryOptionsViewController.h
//  RememberMe
//
//  Created by Alan Barth on 5/13/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryController.h"
#import "CategorySwitchCell.h"
#import "CateogoryNameCell.h"

@interface CategoryOptionsViewController : UITableViewController

@property (strong, nonatomic) Group *group;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end
