//
//  FoodTableViewCell.m
//  HappyLunch
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "FoodTableViewCell.h"

@implementation FoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)onFoodItemTapped:(id)sender {
    [self.delegate foodTableViewCell:self didTapButton:sender];
}



@end
