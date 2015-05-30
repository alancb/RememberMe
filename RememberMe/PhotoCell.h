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

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

@property (weak, nonatomic) id<PhotoCellDelegate> delegate;

@property (copy, nonatomic) void (^didChangeText)(NSString *text);

@property (copy, nonatomic) void (^didChangeLastNameText)(NSString *text);



@end

@protocol PhotoCellDelegate <NSObject>

- (void)photoCellButtonTapped;

@end