//
//  PizzaMap.m
//  ZaHunter
//
//  Created by andrew dahle on 3/25/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "PizzaMap.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property MKPointAnnotation *mobileMakersAnnotation;
@property CLLocationManager *locationManager;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    double lattitude = 41.89373984;
    double longitude = -87.63532979;
    self.mobileMakersAnnotation = [MKPointAnnotation new];
    self.mobileMakersAnnotation.coordinate = CLLocationCoordinate2DMake(lattitude, longitude);
    self.mobileMakersAnnotation.title = @"Mobile Makers";
    [self.mapView addAnnotation:self.mobileMakersAnnotation];
    [self geocodeLocation:@"Pizza shop"];
    [self displayUserLocation];

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if(![annotation isEqual:mapView.userLocation])
    {
        MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
        pin.image = [UIImage imageNamed:@"makersImage"];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return pin;
    }
    else
    {
        return nil;
    }
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

@end

@implementation PizzaMap

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
