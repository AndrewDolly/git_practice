//
//  ViewController.m
//  GoToJail
//
//  Created by andrew dahle on 3/25/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property CLLocationManager *locationManager;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
    //if yellow appears to left, it is bc it is asking for us to add CLLoaciton delegate above first
    self.locationManager.delegate = self;
}

- (IBAction)startViolatingPrivacy:(UIButton *)sender {
    [self.locationManager startUpdatingLocation];
    self.myTextView.text = @"Location You";
}

//creating our own method called revereseGeocode - need to do in order to call down below
-(void) reverseGeocode: (CLLocation *)location {
    CLGeocoder *geoCoder = [CLGeocoder new];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = placemarks.firstObject;
        NSString *address = [NSString stringWithFormat:@"%@ %@\n%@",
                             placemark.subThoroughfare,
                             placemark.thoroughfare,
                             placemark.locality];
        self.myTextView.text = [NSString stringWithFormat:@"Found you: %@", address];
        [self findJailNear:placemark.location];
    }];
}

-(void) getDirectionsTo:(MKMapItem *)destinationItem {
    MKDirectionsRequest *request = [MKDirectionsRequest new];
    request.source = [MKMapItem mapItemForCurrentLocation];
    request.destination = destinationItem;
    request.transportType = MKDirectionsTransportTypeWalking;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error)
    {
        MKRoute *route = response.routes.firstObject;
        NSMutableString *directionsString = [NSMutableString new];
        int counter = 1;


        for (MKRouteStep *step in route.steps) {
            [directionsString appendFormat:@"%d: %@\n", counter, step.instructions];
            counter++;
        }
        self.myTextView.text = directionsString;
    }];
}

//Grab from google maps, trail of url shows lat / long coordinates:  41.89374, -87.63533

-(void)findJailNear:(CLLocation *)location {
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"correctional facility";
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1,1));
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        MKMapItem *mapItem = response.mapItems.firstObject;
        self.myTextView.text = [NSString stringWithFormat:@"You should go to %@", mapItem.name];
//create our own method called getDirections
        [self getDirectionsTo:mapItem];
    }];
}

 

#pragma mark - Location Manager Delegates

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    for (CLLocation *location in locations) {
        if(location.horizontalAccuracy < 100 && location.verticalAccuracy <1000) {
            self.myTextView.text = @"Location found, reverse Geocoding";
            [self.locationManager stopUpdatingLocation];
            [self reverseGeocode: location];
            break;

        }
    }
}


@end
