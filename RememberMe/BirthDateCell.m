//
//  BirthDateCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "BirthDateCell.h"

@interface BirthDateCell () 

@end

@implementation BirthDateCell

- (void)awakeFromNib {
    // TODO: Move the if statement to somewhere that it will be called.
    if (self.didChangeDate) {
        self.didChangeDate(self.datePicker.date);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
