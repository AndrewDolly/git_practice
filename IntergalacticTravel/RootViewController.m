//
//  RootViewController.m
//  IntergalacticTravel
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "RootViewController.h"
#import "VacationViewController.h"

@interface RootViewController ()




@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VacationViewController * vc = segue.destinationViewController;
    if ([segue.identifier  isEqualToString:@"RedDwarfSegue"])
    {
        vc.title = @"Red Dwarf";
        vc.planetImage = [UIImage imageNamed: @"redDwarf"];
    }
    else if ([segue.identifier  isEqualToString:@"BlueDwarfSegue"])
    {
        vc.title = @"Blue Star";
        vc.planetImage = [UIImage imageNamed: @"blueStar"];
    }

}
-(IBAction)unwidFromVacation:(UIStoryboardSegue*)sender
    {

    }



@end
