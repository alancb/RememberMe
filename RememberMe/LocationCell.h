//
//  LocationCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *locationText;
@property (copy, nonatomic) void (^didChangeText)(NSString *text);

@end
