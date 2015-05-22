//
//  BirthPlaceCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirthPlaceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *birthPlaceText;

@property (copy, nonatomic) void (^didChangeText)(NSString *text);


@end
