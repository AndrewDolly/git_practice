//
//  ViewController.m
//  Assessment_1
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "OutputViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

//add properties for buttons and objects

@property (weak, nonatomic) IBOutlet UITextField *numOne;
@property (weak, nonatomic) IBOutlet UITextField *numTwo;
@property (weak, nonatomic) IBOutlet UINavigationItem *answerOutput;
//Couldn't get 'Answer' to change so I used a label for time being
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *outputButton;
//unclear if this should be UINav or some kind of textField:


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.addressBar.title = @"Test title"];

}


//surprising this appears to work, although unclear as to how to clear text when you want to type in that textField
- (IBAction)onButtonPressed:(id)sender
    {
    int firstNum = [self.numOne.text intValue];
    int secondNum = [self.numTwo.text intValue];
    int answer = firstNum * secondNum;
    self.resultLabel.text = [NSString stringWithFormat:@"%d",answer];

    if (answer % 5 != 0)
    {
        _outputButton.enabled = NO;
        }else{
        _outputButton.enabled = YES;
        }
    }



//unsure if you need this part but I believe that the title of the new page should equal the title of the resultLabel
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
    UIViewController *vc = segue.destinationViewController;
    vc.title = self.resultLabel.text;
    }


@end
