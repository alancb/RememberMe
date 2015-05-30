//
//  PhotoCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PhotoCell.h"
#import <QuartzCore/QuartzCore.h>

@interface PhotoCell () <UITextFieldDelegate>

@end

@implementation PhotoCell

- (void)awakeFromNib {
    self.button.frame = CGRectMake(0,0,100,100);
    self.button.clipsToBounds = YES;
    self.button.layer.cornerRadius = 100/2.0f;
    self.button.layer.borderColor=[UIColor whiteColor].CGColor;
    self.button.layer.borderWidth=2.0f;
        
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    
    [self.firstNameField addTarget:self action:@selector(firstTextChanged) forControlEvents:UIControlEventEditingChanged];
    [self.lastNameField addTarget:self action:@selector(lastTextChanged) forControlEvents:UIControlEventEditingChanged];

}

- (void) firstTextChanged {
    if (self.didChangeText) {
        self.didChangeText(self.firstNameField.text);
    }
}
-(void) lastTextChanged {
    if (self.didChangeLastNameText) {
        self.didChangeLastNameText(self.lastNameField.text);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark Image Picker Methods
- (IBAction)buttonTapped:(id)sender {
    [self.delegate photoCellButtonTapped];
}




@end
