//
//  ViewController.m
//  HappyLunch
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "FoodTableViewCell.h"
#import "DrinkTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, FoodTableViewCellDelegate, DrinkTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *selectedFoodImageView;

@property (weak, nonatomic) IBOutlet UIImageView *selectedDrinkImageView;

@end



@implementation ViewController

NSString * const kFoodCell = @"FoodCell";
NSString * const kDrinkCell = @"DrinkCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFoodCell];
        cell.delegate = self;
        return cell;
    } else {
        DrinkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDrinkCell];
        cell.delegate = self;
        return cell;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


-(void)foodTableViewCell:(id)cell didTapButton:(UIButton *)button{
    self.selectedFoodImageView.image = button.imageView.image;
}

-(void)drinkTableViewCell:(id)cell didTapButton:(UIButton *)button{
    self.selectedDrinkImageView.image = button.imageView.image;
}

@end
