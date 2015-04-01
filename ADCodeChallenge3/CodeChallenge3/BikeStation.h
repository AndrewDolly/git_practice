//
//  BikeStation.h
//  ADCodeChallenge3
//
//  Created by andrew dahle on 3/27/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

//enable CL
#import <CoreLocation/CoreLocation.h>

//add initW/ for dictionary
@interface BikeStation : NSObject
-(id)initWithDictionary:(NSDictionary *) dictionary;
@property NSDictionary *dictionary;

@property NSNumber *availableBikes;


@end
