//
//  CategorySwitchCell.m
//  RememberMe
//
//  Created by Alan Barth on 6/2/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "CategorySwitchCell.h"

@interface CategorySwitchCell ()


@end

@implementation CategorySwitchCell

- (IBAction)switched:(id)sender {
    [self.delegate toggle:self.switchControl toggledFromSender:self];
}

@end
