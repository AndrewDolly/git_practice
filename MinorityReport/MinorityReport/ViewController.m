//
//  ViewController.m
//  MinorityReport
//
//  Created by andrew dahle on 3/12/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property IBOutlet UILabel *thePreCogsLabel;
@property CGPoint originalCenter;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenter = self.theFuture.center;


}



- (IBAction)panHandler:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
        //when gesture ends it starts back at center
    {
        [UIView animateWithDuration: 1.0 animations:^{
            self.theFuture.center = self.originalCenter;
        }];
    }
    else
        {
        CGPoint point = [gestureRecognizer locationInView:self.view];
        //give the location a view to contenxtualize the gesture
        self.theFuture.center = point;

        if (CGRectContainsPoint(self.thePreCogsLabel.frame, point))
        {
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text = @"A Fictitious incriminating future";
            [self.theFuture sizeToFit];
        }
    }
}

@end