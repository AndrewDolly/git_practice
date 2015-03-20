//
//  ResultsViewController.m
//  WordPlay
//
//  Created by andrew dahle on 3/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "RootViewController.h"
#import "ResultsViewController.h"


@interface ResultsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultsTextView.text = [NSString stringWithFormat:@"One day, %@ was walking into Mobile Makers when he noticed how %@ his students were.", self.name, self.adjective];


    NSString *infoString = [NSString stringWithFormat:@"One day %@  sadfsd asdf asdf asd flooked out the window %@ and then then", self.name, self.adjective];
    NSRange range1 = [infoString rangeOfString:self.name];
    NSRange range2 = [infoString rangeOfString:self.adjective];

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:infoString];
    [attributedText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]} range: range1];
    [attributedText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]} range: range2];

    self.resultsTextView.attributedText = attributedText;
}

@end
