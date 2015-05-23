//
//  AddViewController.h
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"
#import "CategoryController.h"

@interface AddViewController : UITableViewController

- (void) updateViewWithCategory:(Group *)template;
- (void) updateWithPerson:(Person *)person andGroup:(Group *)group;

@end
