//
//  InternetViewController.m
//  SafariTNG
//
//  Created by andrew dahle on 3/11/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//
#import "InternetViewController.h"


@interface InternetViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation InternetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goToURLString:@"http://www.mobilemakers.co"];
    self.webView.delegate = self;
}

-(void)goToURLString:(NSString *)string {
    NSString *urlString = string;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [UIAlertView new];
    alert.delegate = self;
    alert.title = @"Loading Failed :(";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"Dismiss"];
    [alert addButtonWithTitle:@"Go Home"];
    [alert addButtonWithTitle:@"Go Ahead"];
    [alert show];
    [self.spinner stopAnimating];
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self goToURLString:@"http://www.mobilemakers.co"];
    }
    else if (buttonIndex == 2) {
        [self goToURLString:@"http://mambafitness.com"];
    }

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self goToURLString: textField.text];
    return true;
}


@end
