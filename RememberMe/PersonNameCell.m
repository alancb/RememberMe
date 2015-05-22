//
//  PersonNameCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/20/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PersonNameCell.h"

@interface PersonNameCell () <UITextFieldDelegate>

@end

@implementation PersonNameCell

- (void)awakeFromNib {
    // Initialization code
    self.nameTextField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.nameTextField.text);
    }
    return YES;
}


@end
