//
//  ViewController.m
//  IWannaBeBlue
//
//  Created by andrew dahle on 3/9/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colorLabel.text = @"I sooo wanna be blue!";
}
- (IBAction)onChangeColorButtonPressed:(UIButton *)button {
    self.colorLabel.text = @"yeah i'm BLUE!";
    self.colorLabel.backgroundColor = [UIColor blueColor];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
