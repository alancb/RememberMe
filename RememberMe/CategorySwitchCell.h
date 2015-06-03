//
//  CategorySwitchCell.h
//  RememberMe
//
//  Created by Alan Barth on 6/2/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwitchCellDelegate;

@interface CategorySwitchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *switchControl;
@property (weak, nonatomic) IBOutlet UILabel *Label;

@property (weak, nonatomic) id<SwitchCellDelegate> delegate;

@end

@protocol SwitchCellDelegate <NSObject>

- (void)toggle:(UISwitch *)toggle toggledFromSender:(CategorySwitchCell *)sender;

@end
