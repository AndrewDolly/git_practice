//
//  BikeStation.m
//  CodeChallenge3
//
//  Created by andrew dahle on 3/27/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "BikeStation.h"

@implementation BikeStation


//add initW/ for dictionary (both .h and .m)
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    self.dictionary = dictionary;
    return self;
}

@end
