//
//  PhoneNumberCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PhoneNumberCell.h"

@interface PhoneNumberCell () <UITextFieldDelegate>

@end

@implementation PhoneNumberCell

- (void)awakeFromNib {
    // Initialization code
    self.phoneNumberText.delegate = self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.phoneNumberText.text);
    }
    return YES;
}

@end
