//
//  EnterNameViewController.m
//  WordPlay
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "EnterNameViewController.h"
#import "EnterAdjectiveViewController.h"



@interface EnterNameViewController ()


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;



@end

@implementation EnterNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EnterAdjectiveViewController *funkymonkey = segue.destinationViewController;
    funkymonkey.name = self.nameTextField.text;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([self.nameTextField.text isEqualToString:@""])
    {
        return NO;
    } else {
        return YES;
    }
}


@end
