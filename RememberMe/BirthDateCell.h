//
//  BirthDateCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirthDateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (copy, nonatomic) void (^didChangeDate)(NSDate *date);


@end
