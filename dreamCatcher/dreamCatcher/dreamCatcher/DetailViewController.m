//
//  DetailViewController.m
//  dreamCatcher
//
//  Created by andrew dahle on 3/8/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    self.textView.text = self.descriptionString;
    // Do any additional setup after loading the view.
}


@end
