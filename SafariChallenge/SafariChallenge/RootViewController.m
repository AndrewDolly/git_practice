//
//  RootViewController.m
//  SafariChallenge
//
//  Created by andrew dahle on 3/11/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

<
UIWebViewDelegate,
UITextFieldDelegate,
UIAlertViewDelegate,
UIScrollViewDelegate
>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;

@end
@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goToURLString:@"http://www.mobilemakers.co"];
    self.webView.delegate = self;
    [self.backButton setEnabled:NO];
    [self.forwardButton setEnabled:NO];
    }

-(void)goToURLString:(NSString *)string
    {
        NSString *urlString = string;
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }

-(BOOL)textFieldShouldReturn:(UITextField *)textField
    {
    [self goToURLString: textField.text];
    [textField resignFirstResponder]; //hides keyboard
    return true;
    }






- (IBAction)onBackPressed:(id)sender
    {
    [self.webView goBack];
    }
- (IBAction)onForwardButtonPressed:(id)sender
    {
    [self.webView goForward];
    }
- (IBAction)onStoppedLoadingButtonPressed:(id)sender
    {
    [self.webView stopLoading];
    }
- (IBAction)onReloadButtonPressed:(id)sender
    {
    [self.webView reload];
    }
- (IBAction)onAddButtonPressed:(id)sender {
    UIAlertView *alertView = [[[UIAlertView alloc]] initWithTitle:@"title"
                                                        message:@"message"
                                                       delegate:self
                              ]





-(void)webViewDidStartLoad:(UIWebView *)webView
    {
    [self.spinner startAnimating];
    }
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    }







@end
