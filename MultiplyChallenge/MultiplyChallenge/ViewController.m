//
//  ViewController.m
//  MultiplyChallenge
//
//  Created by andrew dahle on 3/9/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *slideTool;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@property int numberValue;
@property int multValue;
@property int result;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.numberValue = 3;
    self.multValue = 5;
    self.multiplierLabel.text = @"3";
    self.slideTool.minimumValue = 0;
    self.slideTool.maximumValue = 10;
    self.slideTool.value = 5;
}

- (IBAction)multiplierLabel:(id)sender {

    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", (int)self.slideTool.value];
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    int numberValue = [self.numberTextField.text intValue];
    int multValue = [self.multiplierLabel.text intValue];
    int result = [self.answerLabel.text intValue];


    if (self.operatorSegmentControl.selectedSegmentIndex == 0)
    {
        int result = numberValue * multValue;
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }
    else if (self.operatorSegmentControl.selectedSegmentIndex == 1)
    {
        int result = numberValue / multValue;
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }


    if (result >= 20)
    {
    self.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
    self.view.backgroundColor = [UIColor whiteColor];
    }

    //dismiss the keyboard
    //[self.numberTextField resignFirstResponder];



    if (result % 3  == 0 && result % 5 == 0)
    {
        self.answerLabel.text = [NSString stringWithFormat:@"FizzBuzz"];
    }
    else if(result % 3  == 0)
    {
        self.answerLabel.text = [NSString stringWithFormat:@"Fizz"];
    }
    else if(result % 5  == 0)
    {
        self.answerLabel.text = [NSString stringWithFormat:@"Buzz"];
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }
}


@end
