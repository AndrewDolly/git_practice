//
//  MagicalCreature.m
//  MCMS
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

//setting up custom initializer
-(instancetype)initWithFullName:(NSString *)name andSuperPower:(NSString *)superPower {
    self = [super init];
    if(self)
    {
        self.name = name;
        self.superPower = superPower;
    }
    return self;
}

@end
