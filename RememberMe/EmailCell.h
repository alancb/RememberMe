//
//  EmailCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (copy, nonatomic) void (^didChangeText)(NSString *text);


@end
