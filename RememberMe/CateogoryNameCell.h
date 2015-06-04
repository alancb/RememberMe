//
//  categoryNameCell.h
//  RememberMe
//
//  Created by Alan Barth on 6/2/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CateogoryNameCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (copy, nonatomic) void (^didChangeText)(NSString *text);


@end
