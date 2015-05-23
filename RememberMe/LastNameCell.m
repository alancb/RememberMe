//
//  LastNameCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/23/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "LastNameCell.h"

@implementation LastNameCell

- (void)awakeFromNib {
    // Initialization code
    [self.lastNameText addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)textChanged {
    if (self.didChangeText) {
        self.didChangeText(self.lastNameText.text);
    }
}

@end
