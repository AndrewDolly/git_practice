//
//  VacationViewController.m
//  IntergalacticTravel
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "VacationViewController.h"

@interface VacationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *planetImageView;

@end

@implementation VacationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //ImageView is just a frame for an image, still need to tell it what to show
    self.planetImageView.image = self.planetImage;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
