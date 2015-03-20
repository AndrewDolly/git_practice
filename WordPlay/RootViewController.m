//
//  RootViewController.m
//  WordPlay
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"A segue happened");
}

- (IBAction)unWindFromResults: (UIStoryboardSegue *)segue
{

}


@end
