//
//  HomeCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *homeText;

@end

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.didChangeText) {
        self.didChangeText(self.homeText.text);
    }
    return YES;
}

@end
