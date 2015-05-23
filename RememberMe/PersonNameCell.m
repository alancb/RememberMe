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
    
    [self.nameTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textChanged {
    if (self.didChangeText) {
        self.didChangeText(self.nameTextField.text);
    }
}

@end
