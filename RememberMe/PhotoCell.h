//
//  PhotoCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PhotoCellDelegate;

@interface PhotoCell : UITableViewCell

@property (copy, nonatomic) void (^didChangePhoto)(NSData *data);

@property (weak, nonatomic) id<PhotoCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@protocol PhotoCellDelegate <NSObject>

- (void)photoCellButtonTapped;

@end