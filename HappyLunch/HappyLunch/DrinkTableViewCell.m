//
//  DrinkTableViewCell.m
//  HappyLunch
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "DrinkTableViewCell.h"

@implementation DrinkTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)onDrinkItemTapped:(id)sender {
    [self.delegate drinkTableViewCell:self didTapButton:sender];
}

@end
