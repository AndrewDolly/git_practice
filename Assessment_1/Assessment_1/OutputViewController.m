//
//  OutputViewController.m
//  Assessment_1
//
//  Created by andrew dahle on 3/18/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "OutputViewController.h"

@interface OutputViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *addressBar;



@end

@implementation OutputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // not working, stuck on why:
    //    [self goToURLString:@"http://www.mobilemakers.co"];
    //    self.webView.delegate = self;

}



-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}




@end
