//
//  MajorCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MajorCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *majorText;

@property (copy, nonatomic) void (^didChangeText)(NSString *text);

@end
