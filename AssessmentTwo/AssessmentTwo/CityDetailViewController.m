
//
//  CityDetailViewController.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CityDetailViewController.h"
#import "Wiki.h"

@interface CityDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cityLabel;
@property (weak, nonatomic) IBOutlet UITextField *stateLabel;

@property (weak, nonatomic) IBOutlet UILabel *webLink;
@property (weak, nonatomic) IBOutlet UIImageView *cityImage;

@end



@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


//importing info from selected city on VC
//remind me to ask how to deal w/ img name of actual location vs calling the image and having to name it exactly the same
self.cityLabel.text = self.city.name;
self.stateLabel.text = self.city.stateProv;
self.cityImage.image = self.city.image;
self.webLink.text = [NSString stringWithFormat:@"Wiki: %@", self.city.name];
    self.navigationItem.title = [NSString stringWithFormat:@"%@, %@", self.city.name, self.city.stateProv];

}







@end