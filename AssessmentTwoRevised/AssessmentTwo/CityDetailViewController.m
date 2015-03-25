
//
//  CityDetailViewController.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CityDetailViewController.h"
#import "Wiki.h"

@interface CityDetailViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cityNameText;
@property (weak, nonatomic) IBOutlet UITextField *stateNameText;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateProvLabel;

@property (weak, nonatomic) IBOutlet UILabel *webLink;
@property (weak, nonatomic) IBOutlet UIImageView *cityImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property NSString *url;

@end



@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

self.cityNameText.text = self.city.name;
self.stateNameText.text = self.city.stateProv;
self.cityImage.image = self.city.image;
self.webLink.text = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.city.name];
self.navigationItem.title = [NSString stringWithFormat:@"%@, %@", self.city.name, self.city.stateProv];

}
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";
        self.nameLabel.hidden = NO;
        self.stateProvLabel.hidden = NO;
    }else {
        sender.title = @"Edit";
        self.cityNameText.hidden = YES;
        self.stateNameText.hidden = YES;
    }
}


-(void)wikiPediaURLForCity:(NSString *)cityName
{
    self.url = [NSString stringWithFormat:@"http://en.wikipedia.orgl/wiki/%@", self.city.name];
}

-(IBAction)onWebLinkTapped:(UITapGestureRecognizer *)tapGestureRecongizer
{
    [self.city getWikipediaURL];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Wiki *wvc = segue.destinationViewController;
    wvc.urlString = self.url;
}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    Wiki *dvc = (Wiki *)segue.destinationViewController;
//    dvc.urlString = [NSString stringWithFormat: @"http://en.wikipedia.org/wiki/%@", self.city.name];
//    [self performSegueWithIdentifier:@"WikiSegue" sender:self];
//}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    Wiki *dvc = (Wiki *) segue.destinationViewController;
//    dvc.urlString = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.city.name];
//    [self performSegueWithIdentifier:@"WikipediaSegue" sender:self];
//}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
}






@end