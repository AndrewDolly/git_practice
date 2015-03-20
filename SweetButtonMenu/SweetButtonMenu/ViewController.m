//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by andrew dahle on 3/19/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIButton *mainButton;
@property UIButton *menuButtonOne;
@property UIButton *menuButtonTwo;
@property UIButton *menuButtonThree;
@property UIDynamicAnimator *dynamicAnimator;
@property BOOL areButtonsFanned;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//initial setting for fanned position needs to be in viewDidLoad
    self.areButtonsFanned = NO;

//need to add properties for all of these things in purple text
    self.menuButtonOne = [self createButtonWithTitle:@"1"];
    self.menuButtonTwo = [self createButtonWithTitle:@"2"];
    self.menuButtonThree = [self createButtonWithTitle:@"3"];
    self.mainButton = [self createButtonWithTitle:@"P"];

    [self.mainButton addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];

//Need to add property for this thing with name being text in purple
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

}

//creating physical button via code (not actually adding button on storyboard here)
-(UIButton *)createButtonWithTitle:(NSString *)title
{
    CGRect frame = self.view.frame;
    //numbers go coordinates (from left, from top, then size H x W)
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height - 50, 50, 50)];
    button.layer.cornerRadius = button.bounds.size.width / 2;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor greenColor];
    self.menuButtonTwo.backgroundColor = [UIColor redColor];
    self.menuButtonThree.backgroundColor = [UIColor blueColor];
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];

    return button;
}



//creates animation for the button to 'fan' out from behind, showing menuButtonOne
-(void)fanButtons:(id)sender {

    [self.dynamicAnimator removeAllBehaviors];

    if (self.areButtonsFanned) {
        [self fanIn];
    } else {
        [self fanOut];
    }
    self.areButtonsFanned = !self.areButtonsFanned;

}



-(void) fanOut {
    CGPoint point;
    UISnapBehavior *snapBehavior;

    point = CGPointMake(self.mainButton.frame.origin.x - 100, self.mainButton.frame.origin.y + 20);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonOne snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x - 45, self.mainButton.frame.origin.y - 45);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonTwo snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x + 20, self.mainButton.frame.origin.y - 50);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonThree snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

}


-(void) fanIn {
//Don't need the CGPoint here bc we are going BACK to orignal button point location
    UISnapBehavior *snapBehavior;

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonOne snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonTwo snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonThree snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

}



@end
