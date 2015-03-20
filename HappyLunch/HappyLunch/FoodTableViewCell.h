//
//  FoodTableViewCell.h
//  HappyLunch
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FoodTableViewCellDelegate <NSObject>

@optional

-(void)foodTableViewCell:(id)cell didTapButton:(UIButton *)button;

@end



@interface FoodTableViewCell : UITableViewCell

@property (nonatomic, assign) id<FoodTableViewCellDelegate> delegate;




@end
