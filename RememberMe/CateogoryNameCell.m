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

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation CateogoryNameCell

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if (self.nameField.text.length > 0 ) {
//        [CategoryOptionsViewController saveButton.enabled:YES];
//    } else {
//        [CategoryOptionsViewController saveButton.enabled:NO];
//    }
//}

@end
