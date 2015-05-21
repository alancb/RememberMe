//
//  InterestingFactCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/20/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "InterestingFactCell.h"

@interface InterestingFactCell () <UITextFieldDelegate>

@end

@implementation InterestingFactCell

- (void)awakeFromNib {
    // Initialization code
    self.factField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.factField.text);
    }
    return YES;
}



@end
