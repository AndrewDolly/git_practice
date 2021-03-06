//
//  CustomCity.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CustomCity.h"

@implementation CustomCity

-(instancetype)initWithName: (NSString *)name andStateProv:(NSString *)stateProv andImage:(UIImage *)image;
{
    self = [super init];
    self.name = name;
    self.stateProv = stateProv;
    self.image = [UIImage imageNamed:name];
    return self;
}

-(void)getWikipediaURL;
{
    [self.delegate wikipediaURLForCity:self.name];
}


@end
