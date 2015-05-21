//
//  InterestingFactCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/20/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestingFactCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *factField;
@property (copy, nonatomic) void (^didChangeText)(NSString *text);

@end
