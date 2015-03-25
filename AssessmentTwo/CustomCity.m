//
//  CustomCity.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CustomCity.h"

@interface CustomCity ()

@property NSString *name;
@property NSString *stateProv;
@property UIImage *image;

@end


@implementation CustomCity

-(instancetype)initWithName:(NSString *)name stateProv:(NSString *)stateProv image:(UIImage *)image;
{
    self.name = name;
    self.stateProv = stateProv;
    self.image = [UIImage imageNamed:name];
    return self;
}




@end
