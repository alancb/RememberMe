//
//  MajorCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "MajorCell.h"

@interface MajorCell () <UITextFieldDelegate>

@end

@implementation MajorCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.majorText.text);
    }
    return YES;
}

@end
