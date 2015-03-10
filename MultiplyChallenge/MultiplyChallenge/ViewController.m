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

@property NSString * fizz;
@property NSString * buzz;
@property NSString * fizzbuzz;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.multiplierLabel.text = @"3";
    self.fizz = @"fizz";
    self.buzz = @"buzz";
    self.fizzbuzz = @"fizzbuzz";
    self.slideTool.minimumValue = 1;
    self.slideTool.maximumValue = 10;
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



    if (result % 15  == 0)
    {
        self.answerLabel.text = self.fizzbuzz;
    }
    else if(result % 3  == 0)
    {
        self.answerLabel.text = self.fizz;
    }
    else if(result % 5  == 0)
    {
        self.answerLabel.text = self.buzz;
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }
}


@end
