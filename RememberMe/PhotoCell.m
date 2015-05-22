//
//  PhotoCell.m
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark Image Picker Methods
- (IBAction)addPhotoButton:(id)sender {

    [self.delegate photoCellButtonTapped];
    
}


@end
