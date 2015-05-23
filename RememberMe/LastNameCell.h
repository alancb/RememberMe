//
//  LastNameCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/23/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastNameCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *lastNameText;

@property (copy, nonatomic) void (^didChangeText)(NSString *text);


@end
