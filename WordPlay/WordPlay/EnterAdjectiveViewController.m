//
//  EnterAdjectiveViewController.m
//  WordPlay
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "EnterAdjectiveViewController.h"
#import "ResultsViewController.h"

@interface EnterAdjectiveViewController ()

@property (weak, nonatomic) IBOutlet UITextField *adjectiveTextField;


@end

@implementation EnterAdjectiveViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultsViewController *stinkymonkey = segue.destinationViewController;
    stinkymonkey.name = self.name;
    stinkymonkey.adjective = self.adjectiveTextField.text;
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([self.adjectiveTextField.text isEqualToString:@""])
    {
        return NO;
    } else {
        return YES;
    }
}


@end
