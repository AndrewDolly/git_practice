//
//  ViewController.m
//  ZaHunter
//
//  Created by andrew dahle on 3/25/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "PizzaMap.h"

@interface ViewController ()< CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    CLLocationManager* locationManager;
    float totalTravelTime;
}


@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property NSArray *pizzaSpots;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property MKPointAnnotation *mobileMakersAnnotation;
@property CLLocationManager *locationManager;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    locationManager.delegate = self;
}

//
//-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//    [locationManager stopUpdatingLocation];
//    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Location services failed, try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alertView show];
//    self.PizzaSpots = nil;
//}

//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//    for (CLLocation *location in locations)
//    {
//        if (location.verticalAccuracy < 1000 && location.horizontalAccuracy < 1000)
//        {
//            [self startReverseGeocode:location];
//            [locationManager stopUpdatingLocation];
//            break;
//
//        }
//    }
//}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PizzaCell"];
    MKMapItem *restaurant = self.pizzaSpots[indexPath.row];
    cell.textLabel.text = restaurant.name;
    float distance = [restaurant.placemark.location distanceFromLocation:locationManager.location];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Distance: %3.2f miles",[self convertMetersToMiles:distance]];
    return cell;}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSString*  travelTimeString = [NSString stringWithFormat:@"total travel time: %f minutes",totalTravelTime/60];
    return travelTimeString;
}


- (float)convertMetersToMiles:(float)meters {
    return meters * 0.00062137;
}
-(void)calculateTotalDistance
{
    [self calculateDistanceBetweenLocations:[MKMapItem mapItemForCurrentLocation] to:self.pizzaSpots.firstObject];

    for (int i = 0; i < self.pizzaSpots.count-1; i++)
    {
        [self calculateDistanceBetweenLocations:self.restaurants[i] to:self.restaurants[i+1]];
        //NSLog(@"i: %i  i+1: %i",i, i+1);
    }
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    PizzaMap *dvc = segue.destinationViewController;
    dvc. = [self.pizzaSpots objectAtIndex:[[self.tableView indexPathForCell:cell] row]];
}













-(void)geocodeLocation :(NSString *)addressString
{
    NSString *address = addressString;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error)
     {
         for (CLPlacemark *place in placemarks)
         {
             MKPointAnnotation *annotation = [MKPointAnnotation new];
             annotation.coordinate = place.location.coordinate;
             annotation.title = place.name;
             [self.mapView addAnnotation:annotation];
             NSLog(@"%@", annotation.description);
         }
     }];
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    CLLocationCoordinate2D centerCoordinate = view.annotation.coordinate;
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = .10;
    coordinateSpan.longitudeDelta = .10;
    MKCoordinateRegion region;
    region.center = centerCoordinate;
    region.span = coordinateSpan;
    [self.mapView regionThatFits:region];
    [self.mapView setRegion:region animated:YES];
}

-(void)displayUserLocation
{
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
}








//- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
//    int numberValue = [self.numberTextField.text intValue];
//    int multValue = [self.multiplierLabel.text intValue];
//    int result = [self.answerLabel.text intValue];
//
//
//    if (self.operatorSegmentControl.selectedSegmentIndex == 0)
//    {
//        int result = numberValue * multValue;
//        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
//    }
//    else if (self.operatorSegmentControl.selectedSegmentIndex == 1)
//    {
//        int result = numberValue / multValue;
//        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
//    }
//
//
//    if (result >= 20)
//    {
//        self.view.backgroundColor = [UIColor greenColor];
//    }
//    else
//    {
//        self.view.backgroundColor = [UIColor whiteColor];
//    }
//
//    //dismiss the keyboard
//    //[self.numberTextField resignFirstResponder];
//
//
//
//    if (result % 3  == 0 && result % 5 == 0)
//    {
//        self.answerLabel.text = [NSString stringWithFormat:@"FizzBuzz"];
//    }
//    else if(result % 3  == 0)
//    {
//        self.answerLabel.text = [NSString stringWithFormat:@"Fizz"];
//    }
//    else if(result % 5  == 0)
//    {
//        self.answerLabel.text = [NSString stringWithFormat:@"Buzz"];
//    }
//    else
//    {
//        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
//    }
//}

@end
