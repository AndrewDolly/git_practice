//
//  ViewController.m
//  MeetMeUp
//
//  Created by andrew dahle on 3/23/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *meetupTableView;
@property NSArray *meetupEvents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=477d1928246a4e162252547b766d3c6d"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data,
                                               NSError *connectionError) {
                               NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
                               self.meetupEvents = [dictionary objectForKey:@"results"];
                               NSLog(@"data Received");
                               [self.meetupTableView reloadData];
                           }];
    NSLog(@"data Requested");
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meetupEvents.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeetupID"];
    NSDictionary *event = self.meetupEvents[indexPath.row];
    cell.textLabel.text = [event valueForKey:@"name"];
    cell.detailTextLabel.text = [[event valueForKey:@"venue"] objectForKey:@"address_1"];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender
{
    //get the index path for the cell selected
    NSIndexPath* indexPath = [myTableView indexPathForCell:sender];
    NSDictionary *event = events[indexPath.row];

    //get a reference to the view controller to pass details
    EventDetailsViewController *viewController = segue.destinationViewController;
    viewController.view.backgroundColor = [UIColor whiteColor];

    //
    NSDictionary *group = event[@"group"];
    viewController.title = event[@"name"];
    viewController.rsvpCountTextField.text = [NSString stringWithFormat:@"%@",event[@"yes_rsvp_count"]];

    viewController.descriptionTextView.text = event[@"description"];
    viewController.eventHostingGroupTextView.text = group[@"name"];
    viewController.url = event[@"event_url"];
    viewController.urlName = group[@"urlname"];
    viewController.eventID = event[@"id"];

}


@end
