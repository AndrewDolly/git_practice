//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "BikeStation.h"
#import "MapViewController.h"

@interface StationsListViewController () <UITabBarDelegate, UITableViewDataSource, CLLocationManagerDelegate>

#define urlToRetrieveBikeData @"http://www.bayareabikeshare.com/stations/json/"

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSMutableArray *stationListArray;
@property NSMutableArray *filteredListArray;
//create bike object and import CL data
@property CLLocationManager *locationManager;
@property CLLocation *currentLocation;


@end

@implementation StationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Bike Locator";
    self.stationListArray = [NSMutableArray array];
    self.filteredListArray = [NSMutableArray array];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    [self loadBikeJSON];
}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.searchBar.text.length !=0) {
    return self.filteredListArray.count;
    }
    else{
    return self.stationListArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultCell"];
    BikeStation *selectedStation;

    if(self.searchBar.text.length !=0) {
        selectedStation = self.filteredListArray[indexPath.row];
    }
    else {
        selectedStation = self.stationListArray[indexPath.row];
    }
    cell.textLabel.text = selectedStation.dictionary[@"stAddress1"];
    cell.detailTextLabel.text = [selectedStation.dictionary[@"availableDocks"] stringValue];
    return cell;
}



//Get JSON data flowing to tableview

- (void)loadBikeJSON
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlToRetrieveBikeData]];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               if (!connectionError) {
                                   NSDictionary *decodedJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                   for (NSDictionary *dictionary in decodedJSON[@"stationBeanList"]) {
                                       BikeStation *station = [[BikeStation alloc] initWithDictionary:dictionary];
                                       [self.stationListArray addObject:station];
                                   }

                                   [self.stationListArray sortUsingComparator:^NSComparisonResult(id object1, id object2) {
                                       BikeStation *station1 = (BikeStation *)object1;
                                       BikeStation *station2 = (BikeStation *)object2;
                                       CLLocation *location1 = [[CLLocation alloc] initWithLatitude:[station1.dictionary[@"latitude"] doubleValue]
                                                                                    longitude:[station1.dictionary[@"longitude"] doubleValue]];
                                       CLLocation *location2 = [[CLLocation alloc] initWithLatitude:[station2.dictionary[@"latitude"] doubleValue]
                                                                                          longitude:[station2.dictionary[@"longitude"] doubleValue]];
                                       
                                       NSNumber *distance1 = [NSNumber numberWithDouble:[self.currentLocation distanceFromLocation:location1]];
                                       NSNumber *distance2 = [NSNumber numberWithDouble:[self.currentLocation distanceFromLocation:location2]];
                                       return [distance1 compare:distance2];
                                   }];
                                   
                                   [self.myTableView reloadData];
                               } else {
                                   NSLog(@"Error loading JSON: %@", [connectionError localizedDescription]);
                               }
                           }];
}

//drop in segue to MapView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *vc = segue.destinationViewController;row];
    vc.selectedStation = [self.stationListArray objectAtIndex:[[self.tableView indexPathForCell:sender] row]];
    vc.currentLocation = self.currentLocation;
}






@end
