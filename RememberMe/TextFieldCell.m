//
//  PersonNameCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/20/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "TextFieldCell.h"

@interface TextFieldCell () <UITextFieldDelegate>

@end

@implementation TextFieldCell

- (void)awakeFromNib {
    // Initialization code
    self.textField.delegate = self;
    
    [self.textField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)textChanged {
    if (self.didChangeText) {
        self.didChangeText(self.textField.text);
    }
}

@end
