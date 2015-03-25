//
//  Wiki.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "Wiki.h"

@interface Wiki () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation Wiki

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
    self.spinner.hidden = YES;
}



@end
