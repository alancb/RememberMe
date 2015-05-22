//
//  PhotoCell.h
//  RememberMe
//
//  Created by Alan Barth on 5/21/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol PhotoDelegate <NSObject>

@interface PhotoCell : UITableViewCell

@property (copy, nonatomic) void (^didChangePhoto)(NSData *data);


@end

//@protocol PhotoDelegate <NSObject>
//
//<#methods#>
//
//@end
