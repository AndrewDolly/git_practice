//
//  MapViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) MKPointAnnotation *currentLocationAnnotation;
@property MKUserLocation *userLocation;
@property CLLocationManager *locationManager;
@property MKMapItem *bikeMapItem;
@property NSString *directionsString;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.userLocation = [MKUserLocation new];
    self.bikeMapItem = [MKMapItem new];
    [self.mapView removeAnnotations:self.mapView.annotations];
    self.currentLocationAnnotation = [MKPointAnnotation new];
    self.currentLocationAnnotation.coordinate = CLLocationCoordinate2DMake([self.selectedStation.dictionary[@"latitude"] doubleValue], [self.selectedStation.dictionary[@"longitude"] doubleValue]);
    self.currentLocationAnnotation.title = self.selectedStation.dictionary[@"stAddress1"];
    [self.mapView addAnnotation:self.currentLocationAnnotation];

}

//set annotation coordinate to selected location
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
    {
    CLLocationCoordinate2D centerCoordinate = view.annotation.coordinate;
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = .05;
    coordinateSpan.longitudeDelta = .05;
    MKCoordinateRegion region;
    region.center = centerCoordinate;
    region.span = coordinateSpan;

    [self.mapView setRegion:region animated:YES];
    self.mapView.showsUserLocation = YES;
    self.mapView.userLocation.title = @"User";
}


-(void)displayUserLocation {
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestAlwaysAuthorization];
    self.mapView.showsUserLocation = YES;
}


//throw a nice bike image in there for location
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    if ([annotation isEqual:self.currentLocation]) {
        pin.image = [UIImage imageNamed:@"currentLocation"];
    } else {
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pin.image = [UIImage imageNamed:@"bikeImage"];
    }
    return pin;
}


//attempt directions again

- (void)getDirections {

    MKPlacemark *mkDest = [[MKPlacemark alloc]
                           initWithCoordinate:self.currentLocationAnnotation.coordinate
                           addressDictionary:nil];

    //Use current location as the origination source

    MKDirectionsRequest *request = [MKDirectionsRequest new];
    request.source = [MKMapItem mapItemForCurrentLocation];
    [request setDestination:[self.bikeMapItem initWithPlacemark:mkDest]];


    //Directions for request

    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error)
    {
        MKRoute *route = [response.routes firstObject];
        NSMutableString *directionsString = [NSMutableString new];
        int stepNumber = 1;

        for (MKRouteStep *step in route.steps) {
            [directionsString appendFormat:@"%d: %@\n", stepNumber, step.instructions];
            stepNumber++;
        }
        self.directionsString = directionsString;
    }];
}

- (UIAlertView *)alertView {

        UIAlertView *directionsAlert = [UIAlertView new];
        directionsAlert.delegate = self;
        directionsAlert.title = [NSString stringWithFormat:@"%@", self.directionsString];
        [directionsAlert addButtonWithTitle:@"Dismiss"];
        [directionsAlert show];
        return directionsAlert;
}





@end
