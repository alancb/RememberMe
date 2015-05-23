//
//  PhysicalAttributeCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PhysicalAttributeCell.h"

@interface PhysicalAttributeCell () <UITextFieldDelegate>

@end

@implementation PhysicalAttributeCell

- (void)awakeFromNib {
    // Initialization code
    self.physicalAttributeText.delegate = self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.physicalAttributeText.text);
    }
    return YES;
}

@end
