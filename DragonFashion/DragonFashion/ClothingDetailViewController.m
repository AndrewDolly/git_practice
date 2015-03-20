//
//  ClothingDetailViewController.m
//  DragonFashion
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ClothingDetailViewController.h"

@interface ClothingDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *clothingLabel;

@end

@implementation ClothingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clothingLabel.text = self.dragon.signatureClothingItem;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
