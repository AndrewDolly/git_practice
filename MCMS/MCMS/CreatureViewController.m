//
//  CreatureViewController.m
//  MCMS
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = self.creature.superPower;

}

//change creature details when edit tapped, turn edit to done
- (IBAction)onEditButtonTapped:(id)sender {
    if ([sender isEqualToString:@"Edit"])
    {
        sender = @"Done";
        self.label.hidden = false;
        [self.label becomeFirstResponder];
    }
    else
    {
        sender = @"Edit";

        if ([self.label.text length] > 0)
        {
            self.creature.superPower = self.label.text;
        }

        [self.label resignFirstResponder];

        self.label.hidden = true;
    }

}



@end
