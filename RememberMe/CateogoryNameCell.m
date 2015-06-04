//
//  categoryNameCell.m
//  RememberMe
//
//  Created by Alan Barth on 6/2/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CateogoryNameCell.h"
#import "CategoryOptionsViewController.h"

@interface CateogoryNameCell () <UITextFieldDelegate>


@end

@implementation CateogoryNameCell

-(void)awakeFromNib {
    [self.nameField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];

}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if (self.nameField.text.length > 0 ) {
//        [CategoryOptionsViewController saveButton.enabled:YES];
//    } else {
//        [CategoryOptionsViewController saveButton.enabled:NO];
//    }
//}

- (void)textChanged {
    if (self.didChangeText) {
        self.didChangeText(self.nameField.text);
    }
}

@end
