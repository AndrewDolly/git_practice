//
//  DrinkTableViewCell.h
//  HappyLunch
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrinkTableViewCellDelegate <NSObject>

@optional

-(void)drinkTableViewCell:(id)cell didTapButton:(UIButton *)button;

@end



@interface DrinkTableViewCell : UITableViewCell

@property (nonatomic, assign) id<DrinkTableViewCellDelegate> delegate;


@end
