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


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.mapView removeAnnotations:self.mapView.annotations];

    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = CLLocationCoordinate2DMake([self.selectedStation.dictionary[@"latitude"] doubleValue], [self.selectedStation.dictionary[@"longitude"] doubleValue]);
    annotation.title = self.selectedStation.dictionary[@"stAddress1"];
    [self.mapView addAnnotation:annotation];

    self.currentLocationAnnotation = [MKPointAnnotation new];
    self.currentLocationAnnotation.coordinate = CLLocationCoordinate2DMake(self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);
    [self.mapView addAnnotation:annotation];
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
    self.mapView.userLocation.title = @"";
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




//
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    if(![annotation isEqual:mapView.userLocation])
//    {
//        MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
//        pin.image = [UIImage imageNamed:@"makersImage"];
//        pin.canShowCallout = YES;
//        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        return pin;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//
//
//-(void)geocodeLocation :(NSString *)addressString
//{
//    NSString *address = addressString;
//    CLGeocoder *geocoder = [CLGeocoder new];
//    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error)
//     {
//         for (CLPlacemark *place in placemarks)
//         {
//             MKPointAnnotation *annotation = [MKPointAnnotation new];
//             annotation.coordinate = place.location.coordinate;
//             annotation.title = place.name;
//             [self.mapView addAnnotation:annotation];
//             NSLog(@"%@", annotation.description);
//         }
//     }];
//}
//
//


@end
